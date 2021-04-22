package br.com.algafood.converterDTO;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Component;

import br.com.algafood.dto.CozinhaDTO;
import br.com.algafood.dto.RestauranteDTO;
import br.com.algafood.model.Restaurante;

@Component
public class RestauranteConverterDTO {
	

	public RestauranteDTO toModel(Restaurante restaurante) {
		CozinhaDTO cozinhaDTO = new CozinhaDTO();
		cozinhaDTO.setId(restaurante.getCozinha().getId());
		cozinhaDTO.setNome(restaurante.getCozinha().getNome());
		
		RestauranteDTO restauranteDTO = new RestauranteDTO();
		restauranteDTO.setId(restaurante.getId());
		restauranteDTO.setNome(restaurante.getNome());
		restauranteDTO.setTaxaFrete(restaurante.getTaxaFrete());
		restauranteDTO.setCozinhaDTO(cozinhaDTO);
		
		return restauranteDTO;
	}
	
	public List<RestauranteDTO> toList(List<Restaurante> restaurantes){
		return  restaurantes.stream()
				.map(restaurante -> toModel(restaurante))
				.collect(Collectors.toList()); 
		

	}

}
