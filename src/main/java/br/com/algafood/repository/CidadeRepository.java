package br.com.algafood.repository;

import java.util.List;

import br.com.algafood.model.Cidade;

public interface CidadeRepository {
	
	public List<Cidade> listar();
	public Cidade salvar(Cidade cidade);
	public Cidade BuscarPorId(Long id);
	public void deletar(Long id);

}
