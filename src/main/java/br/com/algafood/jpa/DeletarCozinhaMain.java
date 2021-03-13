package br.com.algafood.jpa;

import java.util.List;

import org.springframework.boot.WebApplicationType;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ApplicationContext;

import br.com.algafood.AlgafoodApiApplication;
import br.com.algafood.model.Cozinha;

public class DeletarCozinhaMain {
	
	public static void main(String[] args) {
		
		ApplicationContext applicationContext = new SpringApplicationBuilder(AlgafoodApiApplication.class)
				.web(WebApplicationType.NONE).run(args);
		
		CadastroCozinha cadastroCozinha = applicationContext.getBean(CadastroCozinha.class);
		
                Cozinha cozinha = new Cozinha();
                cozinha.setId(1L);
               
                
                cadastroCozinha.deletar(cozinha);
	}
	

}
