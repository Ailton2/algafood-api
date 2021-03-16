package br.com.algafood.repository;

import java.util.List;

import br.com.algafood.model.Estado;

public interface EstadoRepository {
	
	List<Estado> listar();
	
	public void deletar(Long id);
	
	public Estado buscarporId(Long id);
	
	public Estado salvar(Estado estado);

}
