package br.com.algafood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.algafood.exception.EntidadeEmUsoException;
import br.com.algafood.exception.EstadoNaoEncontradaException;
import br.com.algafood.model.Estado;
import br.com.algafood.repository.EstadoRepository;

@Service
public class EstadoService {
	
	
	private static final String MSG_ESTADO_ESTÁ_EM_USO = "Estado com o código %d está em uso ";
	
	
	@Autowired
	private EstadoRepository estadoRepository;
	
	public Estado salvar(Estado estado) {
		return estadoRepository.save(estado);
		
		
	}
	public List<Estado> listar(){
		
		 List<Estado> estados = (List<Estado>) estadoRepository.findAll();
		
		return estados;
	}
	public void deletar(Long id) {

		try {
			 estadoRepository.deleteById(id);
		} catch (EmptyResultDataAccessException e) {
			throw new EstadoNaoEncontradaException(id);
				 
			
		 }catch (DataIntegrityViolationException e) {
			
		  throw new  EntidadeEmUsoException(
				  String.format(MSG_ESTADO_ESTÁ_EM_USO, id));
		}
	  
	}
	
	public Estado buscarPorId(Long id) {
		
		return estadoRepository.findById(id).orElseThrow(() -> new EstadoNaoEncontradaException( id));
		 
		
	}

	
}
