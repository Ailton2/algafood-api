package br.com.algafood.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

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
		
		return (List<Restaurante>) restauranteRepository.findAll();
	}
	

	
	public Restaurante buscarPorId(Long id) {
		
		Optional<Restaurante> restaurante =	restauranteRepository.findById(id);
		  
		  return restaurante.get();
			
	}
	
	public void deletar(Long id) {
          try {
        	  restauranteRepository.deleteById(id);
  		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException (
				  String.format("Não existe cadastro de restaurante com o código %d ", id));
		 }catch (DataIntegrityViolationException e) {
			
		  throw new EntidadeEmUsoException(
				  String.format("Restaurante com o código %d está em uso ", id));
		}
			

	}
	
	public Restaurante salvar(Restaurante restaurante) {
		
	
		 return restauranteRepository.save(restaurante);

	}

	public List<Restaurante> buscarPorNome(String nome,Long id){
		
		return restauranteRepository.consultaPorNome(nome, id);
		
	}
	
	public List<Restaurante> Buscataxas(String nome,BigDecimal taxaFreteInicial,BigDecimal taxaFreteFinal){
		
		
		return restauranteRepository.find(nome,taxaFreteInicial,taxaFreteFinal);
		
		
	}
	public List<Restaurante> Buscataxas2(String nome,BigDecimal taxaFreteInicial,BigDecimal taxaFreteFinal){
		
		
		return restauranteRepository.find2(nome,taxaFreteInicial,taxaFreteFinal);
		
		
	}
	
	public List<Restaurante> BuscataxasCriteria(String nome,BigDecimal taxaFreteInicial,BigDecimal taxaFreteFinal){
		
		
		return restauranteRepository.findCriteria(nome, taxaFreteInicial, taxaFreteFinal);
		
		
	}

}
