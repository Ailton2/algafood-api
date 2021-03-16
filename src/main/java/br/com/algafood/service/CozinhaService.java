package br.com.algafood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.algafood.exception.EntidadeEmUsoException;
import br.com.algafood.exception.EntidadeNaoEncontradaException;
import br.com.algafood.model.Cozinha;
import br.com.algafood.repository.CozinhaRepository;

@Service
public class CozinhaService {
	
	@Autowired
	private CozinhaRepository cozinhaRepository;

	public Cozinha salvar(Cozinha cozinha) {
		
		return cozinhaRepository.cozinhaSalva(cozinha);
	}
	
	public void deletar(Long id) {
		try {
			cozinhaRepository.deletar(id);
		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException (
				  String.format("Não existe cadastro de cozinha com o código %d ", id));
		 }catch (DataIntegrityViolationException e) {
			
		  throw new EntidadeEmUsoException(
				  String.format("Cozinha com o código %d está em uso ", id));
		}
		
	}
	
	public Cozinha BuscarporId(Long id) {
		
		  return cozinhaRepository.buscarPorId(id);
	}
	

	
	public List<Cozinha> listar(){
		
	 return cozinhaRepository.listar();
	}
}
