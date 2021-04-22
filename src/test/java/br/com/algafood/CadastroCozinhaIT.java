package br.com.algafood;

import static org.assertj.core.api.Assertions.assertThat;

import javax.validation.ConstraintViolationException;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import br.com.algafood.exception.EntidadeEmUsoException;
import br.com.algafood.exception.EntidadeNaoEncontradaException;
import br.com.algafood.model.Cozinha;
import br.com.algafood.service.CozinhaService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CadastroCozinhaIT {
	
	@Autowired
	private CozinhaService cozinhaService;
	
	@org.junit.Test
	public void testarCozinhaSalvaComSucesso() {
		
		Cozinha novaCozinha = new Cozinha();
		novaCozinha.setNome("Chinesaa");
		
		//acao
		novaCozinha = cozinhaService.salvar(novaCozinha);
		
		
		//validaçao
		assertThat(novaCozinha).isNotNull();
		
	}

	@org.junit.Test(expected = ConstraintViolationException.class)
	public void testarCadastroCozinhaSemNome() {
		
		Cozinha novaCozinha = new Cozinha();
		novaCozinha.setNome(null);
		
		novaCozinha = cozinhaService.salvar(novaCozinha);
	}
	
	@org.junit.Test(expected = EntidadeEmUsoException.class)
	public void deveFalhar_QuandoExcluirCozinhaEmUso() {

		cozinhaService.deletar(1L);
		
	}
	
	@org.junit.Test(expected = EntidadeNaoEncontradaException.class)
	public void deveFalhar_QuandoExcluirCozinhaInexistente() {

		cozinhaService.deletar(5L);
		
	}
	
}
