package br.com.algafood.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.algafood.model.Cidade;
import br.com.algafood.repository.CidadeRepository;

@Service
public class CidadeService {
	
	@Autowired
	private CidadeRepository cidadeRepository;
	
	public List<Cidade> listar() {
		
		List<Cidade> cidades = (List<Cidade>) cidadeRepository.findAll();
		
		return cidades;
		
	}
	
	public Cidade BuscarPorId(Long id) {
		
		 Optional<Cidade> cidade = cidadeRepository.findById(id);
	
		
		return cidade.get();
	}
	
	public Cidade salvar(Cidade cidade) {
		
	  return cidadeRepository.save(cidade);
	}
	
	public void deletar(Long id) {
		
		cidadeRepository.deleteById(id);
		
	}

}
