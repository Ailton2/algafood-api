package br.com.algafood.repository;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import br.com.algafood.model.Cidade;

@Component
public class CidadeRepositoryImpl implements CidadeRepository {
    
	@Autowired
	private EntityManager manager;
	 
	@Override
	public List<Cidade> listar() {
		return manager.createQuery("from Cidade",Cidade.class).getResultList();
	}

	@Transactional
	@Override
	public Cidade salvar(Cidade cidade) {
		
		return manager.merge(cidade);
	}

	@Override
	public Cidade BuscarPorId(Long id) {
		
		return manager.find(Cidade.class, id);
	}

	@Transactional
	@Override
	public void deletar(Long id) {
		
		Cidade cidade = BuscarPorId(id);
		
		manager.remove(cidade);
		
	}

}
