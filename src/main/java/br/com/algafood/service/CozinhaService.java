package br.com.algafood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.algafood.exception.CozinhaNaoEncontradaException;
import br.com.algafood.exception.EntidadeEmUsoException;
import br.com.algafood.model.Cozinha;
import br.com.algafood.repository.CozinhaRepository;

@Service
public class CozinhaService {
	
	private static final String MSG_COZINHA_EM_USO = "Cozinha com o código %d está em uso ";
	
	
	@Autowired
	private CozinhaRepository cozinhaRepository;

	public Cozinha salvar(Cozinha cozinha) {
		
		return cozinhaRepository.save(cozinha);
	}
	
	public void deletar(Long id) {
		try {
			cozinhaRepository.deleteById(id);
		} catch (EmptyResultDataAccessException e) {
			throw new CozinhaNaoEncontradaException (id);
		 }catch (DataIntegrityViolationException e) {
			
		  throw new EntidadeEmUsoException(
				  String.format(MSG_COZINHA_EM_USO, id));
		}
		
	}
	


	
	public List<Cozinha> listar(){
		
	 return (List<Cozinha>) cozinhaRepository.findAll();
	}
	
	public Cozinha BuscarOrFalhar(Long id) {
		return cozinhaRepository.findById(id)
				.orElseThrow(()-> new CozinhaNaoEncontradaException(id));
		
	}
}
