package br.com.algafood.desconverterDTO;

import org.springframework.stereotype.Component;

import br.com.algafood.dto.RestauranteInput;
import br.com.algafood.model.Cozinha;
import br.com.algafood.model.Restaurante;

@Component
public class RestauranteDesconverte {
	
	
	public Restaurante paraDomainObject(RestauranteInput restauranteInput) {
		
		Restaurante restaurante = new Restaurante();
	
		restaurante.setNome(restauranteInput.getNome());
		restaurante.setTaxaFrete(restauranteInput.getTaxaFrete());
		
		Cozinha cozinha = new Cozinha();
		cozinha.setId(restauranteInput.getCoziIdInput().getId());
		restaurante.setCozinha(cozinha);
		
		return restaurante;
	}

}
