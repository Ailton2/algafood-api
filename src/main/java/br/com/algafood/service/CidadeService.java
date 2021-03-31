package br.com.algafood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.algafood.exception.CidadeNaoEncontradaException;
import br.com.algafood.exception.EntidadeEmUsoException;
import br.com.algafood.model.Cidade;
import br.com.algafood.model.Estado;
import br.com.algafood.repository.CidadeRepository;

@Service
public class CidadeService {
	
	private static final String MSG_CIDADE_ESTÁ_EM_USO = "Cidade com o código %d está em uso.";
	
	
	@Autowired
	private CidadeRepository cidadeRepository;
	
	@Autowired
	private EstadoService estadoService;
	
	public List<Cidade> listar() {
		
		
		List<Cidade> cidades = (List<Cidade>) cidadeRepository.findAll();
		
		return cidades;
		
	}
	

	public Cidade salvar(Cidade cidade) {
		Long idestado = cidade.getEstado().getId();
		
		Estado estado = estadoService.buscarPorId(idestado);
		
		cidade.setEstado(estado);
		
	  return cidadeRepository.save(cidade);
	}
	
	public void deletar(Long id) {
		
		try {
			cidadeRepository.deleteById(id);
		} catch (EmptyResultDataAccessException e) {
			throw new CidadeNaoEncontradaException(id);
			
		}catch(DataIntegrityViolationException e){
			throw new EntidadeEmUsoException(
					String.format(MSG_CIDADE_ESTÁ_EM_USO,id));
		}
		
		
	}

	public Cidade BuscarPorId(Long id) {

		return  cidadeRepository.findById(id).orElseThrow(()->new CidadeNaoEncontradaException(id));

	}
}
