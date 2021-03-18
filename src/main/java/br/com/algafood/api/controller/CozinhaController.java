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
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.com.algafood.exception.EntidadeEmUsoException;
import br.com.algafood.exception.EntidadeNaoEncontradaException;
import br.com.algafood.model.Cozinha;
import br.com.algafood.repository.CozinhaRepository;
import br.com.algafood.service.CozinhaService;


@RestController
@RequestMapping("/cozinhas")
public class CozinhaController {
	

	
	@Autowired
	private CozinhaService cozinhaService;
	
	@Autowired
	private CozinhaRepository cozinhaRepository;
	
	@GetMapping
	public List<Cozinha> listar(){
		
		return cozinhaService.listar();
		
	}
	
	@GetMapping(value = "/{id}")
	public ResponseEntity<Cozinha> buscarPorId(@PathVariable Long id) {
		
		Cozinha cozinha = cozinhaService.BuscarporId(id);
		if (cozinha != null) {
			return ResponseEntity.ok(cozinha);
		}
	return ResponseEntity.notFound().build();	
		
	}
	
	
	@PostMapping
	@ResponseStatus(value = HttpStatus.CREATED)
	public Cozinha salvar(@RequestBody Cozinha cozinha){
		
		return cozinhaService.salvar(cozinha);
		

	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Cozinha> atualizar(@PathVariable Long id,@RequestBody Cozinha cozinha) {
		
		
		 Cozinha cozinhasalva = cozinhaService.BuscarporId(id);
		 
	
		 
		 if(cozinhasalva != null) {
			 BeanUtils.copyProperties(cozinha, cozinhasalva,"id");
			 
			 cozinhaService.salvar(cozinhasalva);
			 return ResponseEntity.ok(cozinhasalva); 
		 }
		return ResponseEntity.noContent().build();
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Cozinha> deletar(@PathVariable Long id){
		try {
	   
		  		cozinhaService.deletar(id);
				
				return ResponseEntity.noContent().build();
		  	
		}catch(EntidadeNaoEncontradaException e){
			return ResponseEntity.notFound().build();
		} catch (EntidadeEmUsoException e) {
			return ResponseEntity.status(HttpStatus.CONFLICT).build();
		}
	
	}
}
