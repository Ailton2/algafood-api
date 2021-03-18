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
public class CozinhaRepositoryImpl implements CozinhaRepository {
	
	
	@Autowired
	private EntityManager manager;

	@Override
	public List<Cozinha> listar() {
		
		return manager.createQuery("from Cozinha",Cozinha.class).getResultList() ;
	}


	
	@Override
	public Cozinha buscarPorId(Long id) {
		
		return manager.find(Cozinha.class, id);
	}

	@Override
	@Transactional
	public void deletar(Long id) {

		Cozinha cozinha = buscarPorId(id);
		
		if(id == null) {
			throw new EmptyResultDataAccessException(1);
		}
		
		manager.remove(cozinha);
	}

	@Override
	@Transactional
	public Cozinha cozinhaSalva(Cozinha cozinha) {
		
		return manager.merge(cozinha);
	}
	
	

}
