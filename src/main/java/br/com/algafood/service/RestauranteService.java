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
import br.com.algafood.exception.RestauranteNaoEncontradaException;
import br.com.algafood.model.Cozinha;
import br.com.algafood.model.Restaurante;
import br.com.algafood.repository.CozinhaRepository;
import br.com.algafood.repository.RestauranteRepository;

@Service
public class RestauranteService {
	
	
	private static final String MSG_RESTAURANTE_ESTÁ_EM_USO = "Restaurante com o código %d está em uso ";

	
	@Autowired
	private RestauranteRepository restauranteRepository;
	
	@Autowired
	private CozinhaService cozinhaService;
	
	public List<Restaurante> listar(){
		
		return (List<Restaurante>) restauranteRepository.findAll();
	}
	

	
	public Restaurante buscarPorId(Long id) {
		
		  return restauranteRepository.findById(id).orElseThrow(() -> new RestauranteNaoEncontradaException(id));
		  
		  
			
	}
	
	public void deletar(Long id) {
          try {
        	  restauranteRepository.deleteById(id);
  		} catch (EmptyResultDataAccessException e) {
			throw new RestauranteNaoEncontradaException(id);
		 }catch (DataIntegrityViolationException e) {
			
		  throw new EntidadeEmUsoException(
				  String.format(MSG_RESTAURANTE_ESTÁ_EM_USO, id));
		}
			

	}
	
	public Restaurante salvar(Restaurante restaurante) {

		Long idcozinha = restaurante.getCozinha().getId();
		
		Cozinha cozinha = cozinhaService.BuscarOrFalhar(idcozinha);
		
		restaurante.setCozinha(cozinha);
		
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
