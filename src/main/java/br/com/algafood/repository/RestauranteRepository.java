package br.com.algafood.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import br.com.algafood.model.Restaurante;

@Repository
public interface RestauranteRepository extends CustomJpaRepository<Restaurante, Long>,
RestauranteRepositoryQueries,JpaSpecificationExecutor<Restaurante> {

	
	
	List<Restaurante> consultaPorNome(String nome, @Param("id") Long id);
	
	

}
