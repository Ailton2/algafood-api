package br.com.algafood.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.algafood.model.Cidade;

@Repository
public interface CidadeRepository  extends CrudRepository<Cidade, Long> {
	


}
