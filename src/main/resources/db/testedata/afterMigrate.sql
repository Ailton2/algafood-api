
set foreign_key_checks = 0;

delete from cidade;
delete from cozinha;
delete from estado;
delete from forma_pagamento;
delete from grupo;
delete from grupo_permissoes;
delete from permissao;
delete from produto;
delete from restaurante;
delete from restaurante_forma_pagamento;
delete from usuario;
delete from usuario_grupo;


set foreign_key_checks = 1;

alter table cidade auto_increment =1 ;
alter table cozinha auto_increment =1;
alter table estado auto_increment =1;
alter table forma_pagamento auto_increment =1;
alter table grupo auto_increment =1;
alter table permissao auto_increment =1;
alter table produto auto_increment =1;
alter table restaurante auto_increment =1;
alter table usuario auto_increment =1;




insert into cozinha (id,nome) values (1,'Tailandesa');
insert into cozinha (id,nome) values (2,'Indiana');
insert into cozinha (id,nome) values (3,'Brasileira');

insert into estado(id,nome) values (1,'Ceará');
insert into estado(id,nome) values (2,'Bahia');

insert into cidade(nome,estado_id) values('Fortaleza',1);
insert into cidade(nome,estado_id) values('Salvador',2);


insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,current_timestamp,current_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum');
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,current_timestamp,current_timestamp);
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,current_timestamp,current_timestamp);
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,current_timestamp,current_timestamp);

insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2);

insert into forma_pagamento(id,descricao) values(1,'credito');
insert into forma_pagamento(id,descricao) values(2,'debito');
insert into forma_pagamento(id,descricao) values(3,'dinheiro');

insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1);


insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',current_timestamp);

insert into grupo(id,nome) values(1,'ADMIN');
insert into grupo(id,nome) values(2,'USER');


insert into permissao(id,nome,descricao) values(1,'DELETE','apagar');
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario');
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente');

insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2);

insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1);

