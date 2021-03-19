package br.com.algafood.repository;

import java.math.BigDecimal;
import java.util.List;

import br.com.algafood.model.Restaurante;

public interface RestauranteRepositoryQueries {

	List<Restaurante> find(String nome, BigDecimal taxaFreteInicial, BigDecimal taxaFreteFinal);
	
	List<Restaurante> find2(String nome, BigDecimal taxaFreteInicial, BigDecimal taxaFreteFinal);
	
	public List<Restaurante> findCriteria(String nome, BigDecimal taxaFreteInicial, BigDecimal taxaFreteFinal);
	
	List<Restaurante> findComFreteGratis(String nome);
	
	

}