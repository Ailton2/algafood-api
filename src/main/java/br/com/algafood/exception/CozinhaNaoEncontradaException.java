package br.com.algafood.exception;

public class CozinhaNaoEncontradaException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;

	public CozinhaNaoEncontradaException(String mensagem) {
		super(mensagem);
	}
	
	public CozinhaNaoEncontradaException(Long idcozinha) {
	   this(String.format("Não existe cadastro de cozinha com o código %d ", idcozinha));
	}
}
