package br.com.algafood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.algafood.exception.EntidadeEmUsoException;
import br.com.algafood.exception.EntidadeNaoEncontradaException;
import br.com.algafood.model.Estado;
import br.com.algafood.repository.EstadoRepository;

@Service
public class EstadoService {
	
	
	@Autowired
	private EstadoRepository estadoRepository;
	
	public Estado salvar(Estado estado) {
		return estadoRepository.salvar(estado);
		
		
	}
	public List<Estado> listar(){
		
		List<Estado> estados = estadoRepository.listar();
		
		return estados;
	}
	public void deletar(Long id) {

		try {
			 estadoRepository.deletar(id);
		} catch (EmptyResultDataAccessException e) {
			throw new EntidadeNaoEncontradaException(
				  String.format("Não existe cadastro de estado com o código %d ", id));
			
		 }catch (DataIntegrityViolationException e) {
			
		  throw new  EntidadeEmUsoException(
				  String.format("Estado com o código %d está em uso ", id));
		}
	  
	}
	
	public Estado buscarPorId(Long id) {
		
		Estado estado = estadoRepository.buscarporId(id);
		 
		return estado;
		
	}

	
}
