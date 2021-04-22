package br.com.algafood.dto;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class CozinhaIdInput {
	
	
	@NotNull
	private Long id;

}
