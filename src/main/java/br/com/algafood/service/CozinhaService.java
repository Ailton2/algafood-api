package br.com.algafood.service;

import java.util.List;
import java.util.Optional;

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
		
		return cozinhaRepository.save(cozinha);
	}
	
	public void deletar(Long id) {
		try {
			cozinhaRepository.deleteById(id);
		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException (
				  String.format("Não existe cadastro de cozinha com o código %d ", id));
		 }catch (DataIntegrityViolationException e) {
			
		  throw new EntidadeEmUsoException(
				  String.format("Cozinha com o código %d está em uso ", id));
		}
		
	}
	
	public Cozinha BuscarporId(Long id) {
		
		   Optional<Cozinha> cozinha =  cozinhaRepository.findById(id);
		  return  cozinha.get();
	}
	

	
	public List<Cozinha> listar(){
		
	 return (List<Cozinha>) cozinhaRepository.findAll();
	}
}
