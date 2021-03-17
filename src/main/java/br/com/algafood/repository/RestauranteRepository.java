package br.com.algafood.repository;

import java.util.List;

import br.com.algafood.model.Restaurante;

public interface RestauranteRepository {
	
	List<Restaurante> listar();
	void deletar(Long id);
	public Restaurante salvar(Restaurante restaurante);
	public Restaurante buscarPorId(Long id);

}
