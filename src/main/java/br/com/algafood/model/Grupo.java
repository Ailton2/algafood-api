package br.com.algafood.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import lombok.Data;

@Entity
@Data
public class Grupo {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nome;
	
	
	@ManyToMany
	@JoinTable(name = "grupo_permissoes",
	joinColumns = @JoinColumn(name="grupo_id"),
	inverseJoinColumns = @JoinColumn(name="permissao_id"))
	private List<Permissao> permissoes = new ArrayList<>();
}