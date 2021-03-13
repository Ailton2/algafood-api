package br.com.algafood.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

import br.com.algafood.model.Cozinha;

@Component
public class CadastroCozinha {

	@PersistenceContext
	private EntityManager manager;
	
	public List<Cozinha> listar(){
		
	  return manager.createQuery("from Cozinha", Cozinha.class).getResultList();
	}
	
	@org.springframework.transaction.annotation.Transactional
	public Cozinha cozinhaSalva(Cozinha cozinha) {
		return manager.merge(cozinha);
		
	}
	
	public Cozinha burcarPorId(Long id) {
		
		return manager.find(Cozinha.class, id);
	}
	
	@org.springframework.transaction.annotation.Transactional
	public void deletar(Cozinha cozinha) {
		cozinha = burcarPorId(cozinha.getId());
		manager.remove(cozinha);
	}
}
