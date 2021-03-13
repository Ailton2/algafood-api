package br.com.algafood.repository;

import java.util.List;

import br.com.algafood.model.Cozinha;

public interface CozinhaRepository {
	
	List<Cozinha> listar();
	
	public Cozinha buscarPorId(Long id);
	void deletar(Cozinha cozinha);
	public Cozinha cozinhaSalva(Cozinha cozinha);

}
