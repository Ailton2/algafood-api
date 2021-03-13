package br.com.algafood.repository;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.algafood.model.Cozinha;

public class CozinhaRepositoryImpl implements CozinhaRepository {
	
	private EntityManager manager;

	@Override
	public List<Cozinha> listar() {
		
		return manager.createQuery("from Cozinha").getResultList() ;
	}

	@Override
	public Cozinha buscarPorId(Long id) {
		
		return manager.find(Cozinha.class, id);
	}

	@Override
	public void deletar(Cozinha cozinha) {
		
		manager.remove(cozinha);
		
	}

	@Override
	public Cozinha cozinhaSalva(Cozinha cozinha) {
		
		return manager.merge(cozinha);
	}
	
	

}
