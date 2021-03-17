package br.com.algafood.api.controller;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.algafood.model.Restaurante;
import br.com.algafood.service.RestauranteService;

@RestController
@RequestMapping("/restaurantes")
public class RestauranteController {

	@Autowired
	private RestauranteService restauranteService;
	
	
	@GetMapping
	public List<?> listar(){
		List<Restaurante> restaurantes = restauranteService.listar(); 
		
		return restaurantes;
	}
	
	
	@GetMapping("/{id}")
	public ResponseEntity<?> buscarPorId(@PathVariable Long id){
		
		Restaurante restaurante = restauranteService.buscarPorId(id);
		
		return ResponseEntity.ok(restaurante);
	}
	
	@PostMapping
	public ResponseEntity<Restaurante> salvar(@RequestBody Restaurante restaurante){
		
		 restauranteService.salvar(restaurante);
		 
		 return ResponseEntity.status(HttpStatus.CREATED).build();
		
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deletarPorId(@PathVariable Long id){
		
		if(id != null) {
			restauranteService.deletar(id);
			
			  return ResponseEntity.noContent().build();
		}

		return ResponseEntity.notFound().build();
		
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<Restaurante> atualizar(@PathVariable Long id,@RequestBody Restaurante restaurante){
		Restaurante restaurante2 = restauranteService.buscarPorId(id);
		
		BeanUtils.copyProperties(restaurante, restaurante2,"id");
		
		return ResponseEntity.ok(restaurante2);
	}
	
	
	

}
