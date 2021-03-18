package br.com.algafood.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.algafood.model.Restaurante;
import br.com.algafood.repository.RestauranteRepository;

@Repository
public class RestauranteRepositoryImpl{

	
	@Autowired
	 private EntityManager manager;
	

	

}
