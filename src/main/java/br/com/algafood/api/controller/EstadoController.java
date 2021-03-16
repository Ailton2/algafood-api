package br.com.algafood.api.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.algafood.exception.EntidadeEmUsoException;
import br.com.algafood.exception.EntidadeNaoEncontradaException;
import br.com.algafood.model.Estado;
import br.com.algafood.service.EstadoService;

@RestController
@RequestMapping(value = "/estados", produces = MediaType.APPLICATION_JSON_VALUE)
public class EstadoController {

	@Autowired
	private EstadoService estadoService;

	@GetMapping
	public List<Estado> listar() {

		return estadoService.listar();
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Estado> deletar(@PathVariable Long id) {

		try {
			estadoService.deletar(id);
			return ResponseEntity.noContent().build();
		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.notFound().build();
		}
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Estado> buscarPorId(@PathVariable Long id){
		
		  Estado estado = estadoService.buscarPorId(id);
		  
		  if(estado != null) {
			  return ResponseEntity.ok(estado);
		  }
		  
		 return ResponseEntity.notFound().build();
		
	}
	
	@PostMapping
	public ResponseEntity<Estado> salvar(@RequestBody Estado estado) {
		
		estadoService.salvar(estado);
		 
		 return ResponseEntity.ok(estado);
		
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Estado> atualizar(@PathVariable Long id,@RequestBody Estado estado){
		
		   Estado estadonovo = estadoService.buscarPorId(id);
		   
		   if(estadonovo != null) {
			   
			  // estadonovo.setNome(estado.getNome());
			   BeanUtils.copyProperties(estado, estadonovo,"id");
			   estadoService.salvar(estadonovo);
			   return ResponseEntity.status(HttpStatus.CREATED).build();
		   }
		   
		  return ResponseEntity.noContent().build();
		
	}

}
