package br.com.algafood.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Pedido {
	
	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private BigDecimal subtotal;
	
	@Column(nullable = false)
	private BigDecimal taxaFrete;
	
	@Column(nullable = false)
	private BigDecimal valorTotal;
	
	@Column(nullable = false)
	private LocalDate dataCriacao;
	
	private LocalDate dataConfirmacao;
	
	private LocalDate dataCancelamento;
	private LocalDate dataEntrega;
	
	//@Column(nullable = false)
	//private FormaPagamento formaPagamento;
	
	@ManyToOne
	@JoinColumn(name = "restaurante_id",nullable = false)
	private Restaurante restaurante;
	
	
//	@ManyToOne
//	@JoinColumn(name = "usuario_id",nullable = false)
 //   private Usuario usuario;
    
	@Column(nullable = false)
    private String status;
    
	@Column(nullable = false)
    private String cep;
    
	@Column(nullable = false)
    private String logradouro;
    
	@Column(nullable = false)
    private String numero;
    
	@Column(nullable = false)
    private String complemento;
    
	@Column(nullable = false)
    private String bairro;

	@OneToMany(mappedBy = "pedido")
	private  List<ItemPedido> itensPedido;
}
