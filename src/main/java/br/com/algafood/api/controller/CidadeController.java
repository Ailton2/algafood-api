package br.com.algafood.api.controller;

import java.util.List;
import java.util.Optional;

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
import br.com.algafood.repository.CidadeRepository;
import br.com.algafood.service.CidadeService;

@RestController
@RequestMapping(value = "/cidades")
public class CidadeController {
	
	
	@Autowired
	private CidadeService cidadeService;
	
	@Autowired
	private CidadeRepository cidadeRepository;
	
	@GetMapping
	public List<Cidade> listar(){
		
	   return  (List<Cidade>) cidadeRepository.findAll();
		  
        
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Cidade> buscarPorId(@PathVariable Long id){
		
		
			Optional<Cidade> cidade = cidadeRepository.findById(id);
			if(cidade.isEmpty()) {
				return ResponseEntity.notFound().build();
			}

		return ResponseEntity.ok(cidade.get());
		
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Optional<?>> deletar(@PathVariable Long id){
		
		     
		      if(id == null) {
		    	  return ResponseEntity.notFound().build();
		      }
		      cidadeRepository.deleteById(id);
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
			 Optional<Cidade> cidadeAtual = cidadeRepository.findById(id);
			  if(cidadeAtual.isEmpty()) {
				  return ResponseEntity.notFound().build();
			  }
			  BeanUtils.copyProperties(cidade, cidadeAtual.get(), "id");
			  
			  cidadeRepository.save(cidadeAtual.get());
			  
			  return ResponseEntity.ok(cidadeAtual.get());
			
		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.notFound().build();
		}
	
		   
	}
	
}
