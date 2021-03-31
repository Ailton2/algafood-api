package br.com.algafood.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;


public class EstadoNaoEncontradaException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;

	public EstadoNaoEncontradaException(String mensagem) {
		super(mensagem);
	}
	
	public EstadoNaoEncontradaException(Long idestado) {
	   this(String.format("Não existe cadastro de estado com o código %d ", idestado));
	}
}
