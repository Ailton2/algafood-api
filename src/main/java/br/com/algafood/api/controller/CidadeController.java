package br.com.algafood.api.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.com.algafood.exception.EstadoNaoEncontradaException;
import br.com.algafood.exception.NegocioException;
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
	public Cidade buscarPorId(@PathVariable Long id){
		
		
			Cidade cidade = cidadeService.BuscarPorId(id);
	

		return cidade;
		
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void deletar(@PathVariable Long id){

		      cidadeService.deletar(id);
	}
	
	@PostMapping
	@ResponseStatus(value = HttpStatus.CREATED)
	public Cidade salvar(@RequestBody Cidade cidade){
		
		
            try {
					  return  cidadeService.salvar(cidade);
				} catch (EstadoNaoEncontradaException e) {
					throw new NegocioException(e.getMessage(),e);
				}
			
	
	}
	
	@PutMapping("/{id}")
	public Cidade atualizar(@RequestBody Cidade cidade,@PathVariable Long id){
		
		
			  Cidade cidadeAtual = cidadeService.BuscarPorId(id);
	
			  BeanUtils.copyProperties(cidade, cidadeAtual, "id");
			  try {
				  return  cidadeService.salvar(cidadeAtual);
			} catch (EstadoNaoEncontradaException e) {
				throw new NegocioException(e.getMessage(),e);
			}
			 
			     
	}
	

	
}
