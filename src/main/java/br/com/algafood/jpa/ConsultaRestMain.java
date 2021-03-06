package br.com.algafood.jpa;

import java.util.List;

import org.springframework.boot.WebApplicationType;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ApplicationContext;

import br.com.algafood.AlgafoodApiApplication;
import br.com.algafood.model.Restaurante;
import br.com.algafood.repository.RestauranteRepository;

public class ConsultaRestMain {
	
	public static void main(String[] args) {
		
		ApplicationContext applicationContext = new SpringApplicationBuilder(AlgafoodApiApplication.class)
				.web(WebApplicationType.NONE).run(args);
		
		RestauranteRepository  restauranteRepository = applicationContext.getBean(RestauranteRepository.class);
		
	  List<Restaurante> restaurantes = restauranteRepository.listar();
	  
	  for (Restaurante restaurante : restaurantes) {
		System.out.println("restaurante "+restaurante.getNome());
	}
	}
	

}
