package br.com.algafood.api.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.com.algafood.Groups;
import br.com.algafood.exception.CozinhaNaoEncontradaException;
import br.com.algafood.exception.EntidadeNaoEncontradaException;
import br.com.algafood.exception.NegocioException;
import br.com.algafood.model.Restaurante;
import br.com.algafood.repository.RestauranteRepository;
import br.com.algafood.repository.spec.RestauranteComFreteGratisSpec;
import br.com.algafood.repository.spec.RestauranteComNomeSemelhanteSpec;
import br.com.algafood.repository.spec.RestauranteSpecs;
import br.com.algafood.service.RestauranteService;



@RestController
@RequestMapping("/restaurantes")
public class RestauranteController {

	@Autowired
	private RestauranteService restauranteService;
	
	@Autowired
	private RestauranteRepository restauranteRepository;
	

	
	@GetMapping
	public List<Restaurante> listar(){
		List<Restaurante> restaurantes = restauranteService.listar(); 
		
		return restaurantes;
	}
	
	
	@GetMapping("/{id}")
	public Restaurante buscarPorId(@PathVariable Long id){
		
		return restauranteService.buscarPorId(id);
		
		
	}
	
	@PostMapping
	public Restaurante salvar(@RequestBody @Valid Restaurante restaurante){
		
		
		try {
			return restauranteService.salvar(restaurante);
		} catch (CozinhaNaoEncontradaException e) {
			throw new NegocioException(e.getMessage());
		}
		
		 
	
		
	}
	
	@DeleteMapping("/{id}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void deletarPorId(@PathVariable Long id){
		
		
			restauranteService.deletar(id);
			
		
		
	}
	
	@PutMapping("/{id}")
	public Restaurante atualizar(@PathVariable Long id,@Valid @RequestBody Restaurante restaurante){
		Restaurante restaurante2 = restauranteService.buscarPorId(id);
		
		BeanUtils.copyProperties(restaurante, restaurante2,"id","formaPagamentos","endereco","dataCadastro");
		try {
			return restauranteService.salvar(restaurante2);
		} catch (CozinhaNaoEncontradaException e) {
			throw new NegocioException(e.getMessage(),e);
		}
		
	}
	
	
	
	
	@GetMapping("/pornome")
     public  List<Restaurante> buscarNome(String nome,Long id){
    	 
		List<Restaurante> restaurantes = restauranteService.buscarPorNome(nome, id);
		
		return restaurantes;
		
    	    
     }
	
	@GetMapping("/pornome-e-frete")
	public List<Restaurante> Buscataxas(String nome,BigDecimal taxaFreteInicial,BigDecimal taxaFreteFinal){
	
	
		return  restauranteService.Buscataxas(nome, taxaFreteInicial, taxaFreteFinal); 
		
		
	}
	@GetMapping("/pornome-e-frete2")
	public List<Restaurante> Buscataxas2(String nome,BigDecimal taxaFreteInicial,BigDecimal taxaFreteFinal){
	
	
		return  restauranteService.Buscataxas2(nome, taxaFreteInicial, taxaFreteFinal); 
		
		
	}
	
	@GetMapping("/pornome-e-freteCriteria")
	public List<Restaurante> findtaxasCriteria(String nome,BigDecimal taxaFreteInicial,BigDecimal taxaFreteFinal){
	
	
		return  restauranteService.BuscataxasCriteria(nome, taxaFreteInicial, taxaFreteFinal); 
		
		
	}
	
	@GetMapping("/com-freteGratis")
	public List<Restaurante> findFreteGratis(String nome){

		return restauranteRepository.findComFreteGratis(nome);
		
		
	}
	
	@GetMapping("/primeiro")
	public Optional<Restaurante> restaurantePrimeiro(){
		
		return restauranteRepository.buscarPrimeiro();
	}

}
