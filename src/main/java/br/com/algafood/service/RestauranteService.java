package br.com.algafood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.algafood.exception.EntidadeEmUsoException;
import br.com.algafood.exception.EntidadeNaoEncontradaException;
import br.com.algafood.model.Restaurante;
import br.com.algafood.repository.RestauranteRepository;

@Service
public class RestauranteService {
	
	
	@Autowired
	private RestauranteRepository restauranteRepository;
	
	public List<Restaurante> listar(){
		
		return restauranteRepository.listar();
	}
	

	
	public Restaurante buscarPorId(Long id) {
		
		  Restaurante restaurante =	restauranteRepository.buscarPorId(id);
		  
		  return restaurante;
			
	}
	
	public void deletar(Long id) {
          try {
        	  restauranteRepository.deletar(id);
  		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException (
				  String.format("Não existe cadastro de restaurante com o código %d ", id));
		 }catch (DataIntegrityViolationException e) {
			
		  throw new EntidadeEmUsoException(
				  String.format("Restaurante com o código %d está em uso ", id));
		}
			

	}
	
	public Restaurante salvar(Restaurante restaurante) {
		
	
		 return restauranteRepository.salvar(restaurante);

	}


}
