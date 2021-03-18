package br.com.algafood.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import br.com.algafood.model.Cozinha;
import br.com.algafood.repository.CozinhaRepository;

@Component
public class CozinhaRepositoryImpl  {
	
	
	@Autowired
	private EntityManager manager;


	

}
