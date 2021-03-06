package br.com.algafood;

import static org.hamcrest.CoreMatchers.equalTo;

import org.flywaydb.core.Flyway;
import org.hamcrest.Matcher;
import org.hamcrest.Matchers;
import org.hibernate.query.criteria.internal.expression.function.AggregationFunction.COUNT;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.HttpStatus;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import br.com.algafood.model.Cozinha;
import br.com.algafood.repository.CozinhaRepository;
import br.com.algafood.util.DatabaseCleaner;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;



@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("/application-test.properties")
public class TestApiCadastroCozinhaIT {
	
	@LocalServerPort
	private int port;
	
	@Autowired
	private CozinhaRepository cozinhaRepository;
	
	
	@Autowired
	private DatabaseCleaner  databaseCleaner;
	
	private int quantidadeCozinhasCadastradas;
	
	

	
	@Before
	public void setUp() {
		RestAssured.enableLoggingOfRequestAndResponseIfValidationFails();
		RestAssured.basePath ="/cozinhas";
		RestAssured.port =port;
		
		databaseCleaner.clearTables();
		preparaDados();
	
	}
	
	@Test
	public void deveRetornarStatus200_QuandoConsultarCozinhas() {
		
	RestAssured.given()
		.accept(ContentType.JSON)
	.when()
		.get()
	.then()
		.statusCode(HttpStatus.OK.value());
		
	}
	
	@Test
	public void deveConterQuantCozinhasEComONomeIguais_QuandoConsultarCozinhas() {
		
	RestAssured.given()
		.accept(ContentType.JSON)
	.when()
		.get()
	.then()
		.body("", Matchers.hasSize(quantidadeCozinhasCadastradas))
		.body("nome", Matchers.hasItems("Mexicana","Brasileira"));
		
	}
	
	@Test
	public void deveRetornarStatus201_QuandoCadastraCozinha() {
		RestAssured.given()
		.body("{ \"nome\": \"Asiatica\"}")
		.contentType(ContentType.JSON)
		.accept(ContentType.JSON)
	.when()
		.post()
	.then()
	    .statusCode(HttpStatus.CREATED.value());
		
		
		
	}
	
	@Test
	public void deveRetornarRespostasEEtatusCorretos_QuandoConsultarCozinhaExistente() {
		
		RestAssured.given()
		.pathParam("cozinhaId", 2)
		.accept(ContentType.JSON)
	.when()
		.get("/{cozinhaId}")
	.then()
		.statusCode(HttpStatus.OK.value())
		.body("nome", equalTo("Mexicana"));
		
	}
	
	@Test
	public void deveRetornarStatus404_QuandoConsultarCozinhaInexistente() {
		
		RestAssured.given()
		.pathParam("cozinhaId", 20)
		.accept(ContentType.JSON)
	.when()
		.get("/{cozinhaId}")
	.then()
		.statusCode(HttpStatus.NOT_FOUND.value());
		
		
	}
	
	public void preparaDados() {
		
		Cozinha cozinha1 = new Cozinha();
		cozinha1.setNome("Brasileira");
		cozinhaRepository.save(cozinha1);
		
		Cozinha cozinha2 = new Cozinha();
		cozinha2.setNome("Mexicana");
		cozinhaRepository.save(cozinha2);
		
		
		quantidadeCozinhasCadastradas = (int) cozinhaRepository.count();
	}

	
}
