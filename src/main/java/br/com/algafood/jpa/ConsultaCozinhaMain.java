package br.com.algafood.jpa;

import java.util.List;

import org.springframework.boot.WebApplicationType;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ApplicationContext;

import br.com.algafood.AlgafoodApiApplication;
import br.com.algafood.model.Cozinha;
import br.com.algafood.repository.CozinhaRepository;

public class ConsultaCozinhaMain {
	
	public static void main(String[] args) {
		
		ApplicationContext applicationContext = new SpringApplicationBuilder(AlgafoodApiApplication.class)
				.web(WebApplicationType.NONE).run(args);
		
		CozinhaRepository cozinhaRepository = applicationContext.getBean(CozinhaRepository.class);
		
	  List<Cozinha> cozinhas = cozinhaRepository.listar();
	  
	  for (Cozinha cozinha : cozinhas) {
		System.out.println("cozinha "+cozinha.getNome());
	}
	}
	

}
