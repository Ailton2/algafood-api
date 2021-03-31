package br.com.algafood.api.controller;

import java.util.List;

import javax.validation.Valid;

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
	public Cozinha buscarPorId(@PathVariable Long id) {
		
		return cozinhaService.BuscarOrFalhar(id);
	
		
	}
	
	
	@PostMapping
	@ResponseStatus(value = HttpStatus.CREATED)
	public Cozinha salvar(@RequestBody @Valid Cozinha cozinha){
		
		return cozinhaService.salvar(cozinha);
		

	}
	
	@PutMapping("/{id}")
	public Cozinha atualizar(@PathVariable Long id,@Valid @RequestBody Cozinha cozinha) {
		
		
		 Cozinha cozinhasalva = cozinhaService.BuscarOrFalhar(id);

			 BeanUtils.copyProperties(cozinha, cozinhasalva,"id");
			 
			 return	 cozinhaService.salvar(cozinhasalva);
			
		 
		
	}


	
	@DeleteMapping("/{id}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id){

		  		cozinhaService.deletar(id);


	
	}
}
