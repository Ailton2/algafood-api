package br.com.algafood.dto;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class RestauranteDTO {
	
	private Long id;
	
	private String nome;
	
	private BigDecimal taxaFrete;
	
	private CozinhaDTO cozinhaDTO;
	

}
