package br.com.algafood.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import br.com.algafood.model.Restaurante;

public interface RestauranteRepository extends CrudRepository<Restaurante, Long> {


}
