package br.com.algafood.exception;

public class RestauranteNaoEncontradaException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;

	public RestauranteNaoEncontradaException(String mensagem) {
		super(mensagem);
	}
	
	public RestauranteNaoEncontradaException(Long idrest) {
	   this(String.format("Não existe cadastro de restaurante com o código %d ", idrest));
	}
}
