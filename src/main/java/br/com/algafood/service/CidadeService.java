package br.com.algafood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.algafood.model.Cidade;
import br.com.algafood.repository.CidadeRepository;

@Service
public class CidadeService {
	
	@Autowired
	private CidadeRepository cidadeRepository;
	
	public List<Cidade> listar() {
		
		List<Cidade> cidades = cidadeRepository.listar();
		
		return cidades;
		
	}
	
	public Cidade BuscarPorId(Long id) {
		
		Cidade cidade = cidadeRepository.BuscarPorId(id);
		
		return cidade;
	}
	
	public Cidade salvar(Cidade cidade) {
		
	  return cidadeRepository.salvar(cidade);
	}
	
	public void deletar(Long id) {
		
		cidadeRepository.deletar(id);
		
	}

}
