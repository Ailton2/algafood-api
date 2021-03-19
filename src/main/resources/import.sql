insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')

insert into restaurante (id,nome,taxa_frete,cozinha_id) values (1,'restNovo',10,1)
insert into restaurante (id,nome,taxa_frete,cozinha_id) values (2,'restCidade',20,3)
insert into restaurante (id,nome,taxa_frete,cozinha_id) values (3,'restSaude',30,3)
insert into restaurante (id,nome,taxa_frete,cozinha_id) values (4,'restGratis',0,3)

insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')

insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)