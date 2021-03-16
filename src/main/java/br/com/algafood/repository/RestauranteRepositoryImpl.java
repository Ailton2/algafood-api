package br.com.algafood.repository;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.algafood.model.Restaurante;

public class RestauranteRepositoryImpl implements RestauranteRepository {

	
	 private EntityManager manager;
	
	@Override
	public List<Restaurante> listar() {
		
		return  manager.createQuery("from Restaurante", Restaurante.class).getResultList() ;
	}

	@Override
	public void deletar(Restaurante restaurante) {
		 manager.remove(restaurante);
		
	}

	@Override
	public Restaurante salvar(Restaurante restaurante) {
		return manager.merge(restaurante);
	}

	@Override
	public Restaurante buscarPorId(Long id) {
		return manager.find(Restaurante.class, id);
	}
	
	

}
