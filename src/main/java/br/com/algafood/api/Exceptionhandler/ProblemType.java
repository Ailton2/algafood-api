package br.com.algafood.api.Exceptionhandler;

import lombok.Getter;

@Getter
public enum ProblemType {
	
	
	DADOS_INVALIDOS("/dados-invalidos","Dados inválidos"),
	ERRO_DE_SISTEMA("/erro-sistema","Erro de sistema"),
	PARAMETRO_INVALIDO("/PARAMETRO-INVALIDO","Parametro inválido"),
	MENSAGEM_INCONPREENSIVEL("/mensagem-incopreensivel","Mensagem incopreensivel"),
	RECURSO_NAO_ENCONTRADO("/recurso-nao-encontrado","Recurso não encontrado"),
	ENTIDADE_EM_USO("/entidade-em-uso", "Entidade em uso"),
	ERRO_NEGOCIO("/erro-negocio", "Violação de regra de negócio");

	
	private String title;
	private String uri;

	ProblemType(String path, String title) {
		this.uri = "https://algafood.com.br"+path;
		this.title=title;
	}
	
	
	
	
	

}
