package br.com.algafood.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import br.com.algafood.model.Estado;
import br.com.algafood.repository.EstadoRepository;

@Component
public class EstadoRepositoryImpl implements EstadoRepository {
	
	@Autowired
	private EntityManager entityManager;

	@Override
	public List<Estado> listar() {
		
		return entityManager.createQuery("from Estado",Estado.class).getResultList();
	}

	@Override
	@Transactional
	public void deletar(Long id) {
		  Estado estado =  buscarporId(id);
		if(id == null) {
			throw new EmptyResultDataAccessException(1);
		}
		 entityManager.remove(estado);
		
	}

	@Override
	public Estado buscarporId(Long id) {
		  
		
		return entityManager.find(Estado.class, id)  ;
	}

	@Override
	@Transactional
	public Estado salvar(Estado estado) {
		
		return entityManager.merge(estado);
	}
	
	

}
