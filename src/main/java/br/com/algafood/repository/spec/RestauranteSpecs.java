package br.com.algafood.repository.spec;

import java.math.BigDecimal;

import org.springframework.data.jpa.domain.Specification;

import br.com.algafood.model.Restaurante;

public class RestauranteSpecs {
	
	public static Specification<Restaurante> comFreteGratis(){
		
		return (root,query,builder) ->
		 builder.equal(root.get("taxaFrete"), BigDecimal.ZERO);
		
	}
	
	public static Specification<Restaurante> ComNomeSemelhante(String nome){
		
		return (root,query,builder)->
		builder.like(root.get("nome"),"%" + nome +"%");
	}

}