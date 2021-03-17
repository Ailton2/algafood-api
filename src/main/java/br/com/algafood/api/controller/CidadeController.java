package br.com.algafood.api.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.algafood.exception.EntidadeNaoEncontradaException;
import br.com.algafood.model.Cidade;
import br.com.algafood.service.CidadeService;

@RestController
@RequestMapping(value = "/cidades")
public class CidadeController {
	
	
	@Autowired
	private CidadeService cidadeService;
	
	@GetMapping
	public List<Cidade> listar(){
		
	    List<Cidade> cidades = cidadeService.listar();
		  
        return cidades;
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Cidade> buscarPorId(@PathVariable Long id){
		
		
			Cidade cidade = cidadeService.BuscarPorId(id);
			if(cidade == null) {
				return ResponseEntity.notFound().build();
			}

		return ResponseEntity.ok(cidade);
		
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<?> deletar(@PathVariable Long id){
		
		     
		      if(id == null) {
		    	  return ResponseEntity.notFound().build();
		      }
		      cidadeService.deletar(id);
		      return ResponseEntity.noContent().build();
	}
	
	@PostMapping
	public ResponseEntity<Cidade> salvar(@RequestBody Cidade cidade){
	
			   cidadeService.salvar(cidade);
			   return ResponseEntity.status(HttpStatus.CREATED).build();
			
	
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Cidade> atualizar(@RequestBody Cidade cidade,@PathVariable Long id){
		
		try {
			  Cidade cidadeAtual = cidadeService.BuscarPorId(id);
			  if(cidadeAtual == null) {
				  return ResponseEntity.notFound().build();
			  }
			  BeanUtils.copyProperties(cidade, cidadeAtual, "id");
			  
			  cidadeService.salvar(cidadeAtual);
			  
			  return ResponseEntity.ok(cidadeAtual);
			
		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.notFound().build();
		}
	
		   
	}
	
}
