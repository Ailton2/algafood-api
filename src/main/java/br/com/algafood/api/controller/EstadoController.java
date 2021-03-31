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
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

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
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id) {


			estadoService.deletar(id);
		

	}
	
	@GetMapping("/{id}")
	public Estado buscarPorId(@PathVariable Long id){
		
		  Estado estado = estadoService.buscarPorId(id);
		  

		  
		 return estado;
	}
	
	@PostMapping
	public ResponseEntity<Estado> salvar(@RequestBody Estado estado) {
		
		estadoService.salvar(estado);
		 
		 return ResponseEntity.ok(estado);
		
	}
	
	@PutMapping("/{id}")
	public Estado atualizar(@PathVariable Long id,@RequestBody Estado estado){
		
		   Estado estadonovo = estadoService.buscarPorId(id);
		   
            BeanUtils.copyProperties(estado, estadonovo,"id");
			return   estadoService.salvar(estadonovo);
			   
		   

	}

}
