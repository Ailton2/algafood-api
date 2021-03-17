package br.com.algafood.repository;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.algafood.model.Restaurante;

@Repository
public class RestauranteRepositoryImpl implements RestauranteRepository {

	
	@Autowired
	 private EntityManager manager;
	
	@Override
	public List<Restaurante> listar() {
		
		return  manager.createQuery("from Restaurante", Restaurante.class).getResultList() ;
	}

	@Override
	public void deletar(Long id) {
		 manager.remove(id);
		
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
