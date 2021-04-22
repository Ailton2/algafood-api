package br.com.algafood.repository.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import br.com.algafood.model.Restaurante;
import br.com.algafood.repository.RestauranteRepository;
import br.com.algafood.repository.RestauranteRepositoryQueries;
import br.com.algafood.repository.spec.RestauranteSpecs;

@Repository
public class RestauranteRepositoryImpl implements RestauranteRepositoryQueries{

	
	@PersistenceContext
	 private EntityManager manager;
	
	@Autowired @Lazy
	private RestauranteRepository restauranteRepository;
	
	@Override
	public List<Restaurante> find(String nome, BigDecimal taxaFreteInicial,BigDecimal taxaFreteFinal){
		
		
		String jpql = "from Restaurante where nome like :nome and taxa_frete between :taxaFreteInicial and :taxaFreteFinal";
		
		return manager.createQuery(jpql,Restaurante.class).setParameter("nome","%"+ nome +"%")
				                                           .setParameter("taxaFreteInicial", taxaFreteInicial)
				                                           .setParameter("taxaFreteFinal", taxaFreteFinal)
				                                           .getResultList();
				                                   
		
	}

	//consulta dinanmica com condiçoes
	@Override
	public List<Restaurante> find2(String nome, BigDecimal taxaFreteInicial, BigDecimal taxaFreteFinal) {
		
     StringBuilder jpql = new StringBuilder();
  	jpql.append( " from Restaurante where 0 = 0 ");
    HashMap<String, Object>	parametros = new HashMap<String,Object>();
  	
  	if(StringUtils.hasLength(nome)) {
  		jpql.append( " and nome like :nome ");
  		parametros.put("nome", "%"+ nome +"%");
  	}
  	
  	if(taxaFreteInicial != null) {
  	 	jpql.append( " and taxa_frete >= :taxaFreteInicial ");
  	 	parametros.put("taxaFreteInicial", taxaFreteInicial);
  	}
 	if(taxaFreteFinal != null) {
  	 	jpql.append( " and taxa_frete <= :taxaFreteFinal ");
  	 	parametros.put("taxaFreteFinal", taxaFreteFinal);
  	}
 
		
	TypedQuery<Restaurante> query= manager.createQuery(jpql.toString(),Restaurante.class);
	
	     parametros.forEach((chave,valor) -> query.setParameter(chave, valor) );
	   
		 return query.getResultList();

	
	}
	
	//consulta usando criteria
	@Override
	public List<Restaurante> findCriteria(String nome, BigDecimal taxaFreteInicial, BigDecimal taxaFreteFinal) {
		

		CriteriaBuilder builder = manager.getCriteriaBuilder();
		
		CriteriaQuery<Restaurante> criteria = builder.createQuery(Restaurante.class);
		Root<Restaurante>  root  = criteria.from(Restaurante.class);
		
		ArrayList<Predicate> predicates = new ArrayList<Predicate>();
		
		if(StringUtils.hasText(nome)) {
			predicates.add(builder.like(root.get("nome"), "%"+ nome +"%"));
		}
		if(taxaFreteInicial != null) {
			//nao pode ser o nome da coluna renomeada na @column
			predicates.add(builder.greaterThanOrEqualTo(root.get("taxaFrete"), taxaFreteInicial));
		}
	
		if(taxaFreteFinal != null) {
			predicates.add(builder.lessThanOrEqualTo(root.get("taxaFrete"), taxaFreteFinal));
		}
	
		
		criteria.where(predicates.toArray(new Predicate[0]));
		
		TypedQuery<Restaurante> query = manager.createQuery(criteria);
		return query.getResultList();
				
		
		
	
	}

	@Override
	public List<Restaurante> findComFreteGratis(String nome) {

		return restauranteRepository.findAll(RestauranteSpecs.comFreteGratis().and(RestauranteSpecs.ComNomeSemelhante(nome)));
		
	}
}
