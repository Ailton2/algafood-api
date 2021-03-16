package br.com.algafood.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
		
		return ResponseEntity.ok(cidade);
		
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<?> deletar(@PathVariable Long id){
		
		      cidadeService.deletar(id);
		      
		      return ResponseEntity.noContent().build();
	}
	
}
