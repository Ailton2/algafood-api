
create table forma_pagamento 
(id bigint not null auto_increment,
 descricao varchar(80),
  primary key (id)
)engine=InnoDB default charset=utf8;
  
create table grupo 
(id bigint not null auto_increment,
 nome varchar(100),
  primary key (id)
) engine=InnoDB default charset=utf8;

create table grupo_permissoes (
  grupo_id bigint not null,
   permissao_id bigint not null
) engine=InnoDB default charset=utf8;

create table permissao (
id bigint not null auto_increment,
 descricao varchar(100),
  nome varchar(100),
   primary key (id)
   ) engine=InnoDB default charset=utf8;

create table produto (
id bigint not null auto_increment,
 ativo bit, descricao varchar(100),
  nome varchar(100), 
  preco decimal(19,2), 
  restaurante_id bigint,
   primary key (id)
   ) engine=InnoDB default charset=utf8;
   
create table restaurante (
id bigint not null auto_increment,
 data_atualizacao date not null,
  data_cadastro date not null,
   endereco_bairro varchar(255), 
   endereco_cep varchar(100), 
   endereco_complemento varchar(100),
    endereco_logradouro varchar(100),
     endereco_numero varchar(100),
      nome varchar(100),
       taxa_frete decimal(19,2), 
       cozinha_id bigint not null,
        endereco_cidade_id bigint,
primary key (id)
) engine=InnoDB default charset=utf8;

create table restaurante_forma_pagamento (
   restaurante_id bigint not null, 
   forma_pagamento_id bigint not null
   ) engine=InnoDB default charset=utf8;
   
create table usuario (
   id bigint not null auto_increment,
    data_cadastro date not null, 
    email varchar(100), 
    nome varchar(100),
     senha varchar(80),
      primary key (id)
      ) engine=InnoDB default charset=utf8;
      
create table usuario_grupo (
   usuario_id bigint not null, 
   grupo_id bigint not null
   ) engine=InnoDB default charset=utf8;
   

alter table grupo_permissoes add constraint FK_grupo_permissoes_permissao foreign key (permissao_id) references permissao (id);
alter table grupo_permissoes add constraint FK_grupo_permissoes_grupo foreign key (grupo_id) references grupo (id);
alter table produto add constraint FK_produto_restaurante foreign key (restaurante_id) references restaurante (id);
alter table restaurante add constraint FK_restaurante_cozinha foreign key (cozinha_id) references cozinha (id);
alter table restaurante add constraint FK_restaurante_cidade foreign key (endereco_cidade_id) references cidade (id);
alter table restaurante_forma_pagamento add constraint FK_restaurante_forma_pagamento_forma_pagamento foreign key (forma_pagamento_id) references forma_pagamento (id);
alter table restaurante_forma_pagamento add constraint FK_restaurante_forma_pagamento_restaurante foreign key (restaurante_id) references restaurante (id);
alter table usuario_grupo add constraint FK_usuario_grupo_grupo foreign key (grupo_id) references grupo (id);
alter table usuario_grupo add constraint FK_usuario_grupo_usuario foreign key (usuario_id) references usuario (id);
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
create table cidade (id bigint not null auto_increment, nome varchar(255), estado_id bigint, primary key (id)) engine=InnoDB
create table cozinha (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table estado (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table forma_pagamento (id bigint not null auto_increment, descricao varchar(255), primary key (id)) engine=InnoDB
create table grupo (id bigint not null auto_increment, nome varchar(255), primary key (id)) engine=InnoDB
create table grupo_permissoes (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB
create table item_pedido (id bigint not null auto_increment, observacao varchar(255), preco_total decimal(19,2) not null, preco_unitario decimal(19,2) not null, quantidade bigint not null, pedido_id bigint not null, primary key (id)) engine=InnoDB
create table pedido (id bigint not null auto_increment, bairro varchar(255) not null, cep varchar(255) not null, complemento varchar(255) not null, data_cancelamento date, data_confirmacao date, data_criacao date not null, data_entrega date, logradouro varchar(255) not null, numero varchar(255) not null, status varchar(255) not null, subtotal decimal(19,2) not null, taxa_frete decimal(19,2) not null, valor_total decimal(19,2) not null, restaurante_id bigint not null, primary key (id)) engine=InnoDB
create table permissao (id bigint not null auto_increment, descricao varchar(255), nome varchar(255), primary key (id)) engine=InnoDB
create table produto (id bigint not null auto_increment, ativo bit, descricao varchar(255), nome varchar(255), preco decimal(19,2), restaurante_id bigint, primary key (id)) engine=InnoDB
create table restaurante (id bigint not null auto_increment, data_atualizacao date not null, data_cadastro date not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255), taxa_frete decimal(19,2), cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB
create table usuario (id bigint not null auto_increment, data_cadastro date not null, email varchar(255), nome varchar(255), senha varchar(255), primary key (id)) engine=InnoDB
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB
alter table cidade add constraint FKkworrwk40xj58kevvh3evi500 foreign key (estado_id) references estado (id)
alter table grupo_permissoes add constraint FKbjj8fbcfxr7joapufexdn7fv0 foreign key (permissao_id) references permissao (id)
alter table grupo_permissoes add constraint FKd7wt9tnvrfttdcl5ofoelgi6j foreign key (grupo_id) references grupo (id)
alter table item_pedido add constraint FK60ym08cfoysa17wrn1swyiuda foreign key (pedido_id) references pedido (id)
alter table pedido add constraint FK3eud5cqmgsnltyk704hu3qj71 foreign key (restaurante_id) references restaurante (id)
alter table produto add constraint FKb9jhjyghjcn25guim7q4pt8qx foreign key (restaurante_id) references restaurante (id)
alter table restaurante add constraint FK76grk4roudh659skcgbnanthi foreign key (cozinha_id) references cozinha (id)
alter table restaurante add constraint FKbc0tm7hnvc96d8e7e2ulb05yw foreign key (endereco_cidade_id) references cidade (id)
alter table restaurante_forma_pagamento add constraint FK7aln770m80358y4olr03hyhh2 foreign key (forma_pagamento_id) references forma_pagamento (id)
alter table restaurante_forma_pagamento add constraint FKa30vowfejemkw7whjvr8pryvj foreign key (restaurante_id) references restaurante (id)
alter table usuario_grupo add constraint FKk30suuy31cq5u36m9am4om9ju foreign key (grupo_id) references grupo (id)
alter table usuario_grupo add constraint FKdofo9es0esuiahyw2q467crxw foreign key (usuario_id) references usuario (id)
insert into cozinha (id,nome) values (1,'Tailandesa')
insert into cozinha (id,nome) values (2,'Indiana')
insert into cozinha (id,nome) values (3,'Brasileira')
insert into estado(id,nome) values (1,'Ceará')
insert into estado(id,nome) values (2,'Bahia')
insert into cidade(nome,estado_id) values('Fortaleza',1)
insert into cidade(nome,estado_id) values('Salvador',2)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao,endereco_cep,endereco_bairro,endereco_logradouro,endereco_cidade_id,endereco_numero,endereco_complemento) values (1,'restNovo',10,1,utc_timestamp,utc_timestamp,'61700000','Serpa','Rua Luiz',1,'123','nunhum')
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (2,'restCidade',20,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (3,'restSaude',30,3,utc_timestamp,utc_timestamp)
insert into restaurante (id, nome, taxa_frete, cozinha_id, data_cadastro,data_atualizacao) values (4,'restGratis',0,3,utc_timestamp,utc_timestamp)
insert into produto(id,nome,descricao,preco,ativo,restaurante_id) values(1,'Baiao','Baiao',10,true,2)
insert into forma_pagamento(id,descricao) values(1,'credito')
insert into forma_pagamento(id,descricao) values(2,'debito')
insert into forma_pagamento(id,descricao) values(3,'dinheiro')
insert into restaurante_forma_pagamento(restaurante_id,forma_pagamento_id) values (1,1),(1,2),(2,1)
insert into usuario(id,nome,email,senha,data_cadastro) values(1,'Ailton','tym@wefe','123',utc_timestamp)
insert into grupo(id,nome) values(1,'ADMIN')
insert into grupo(id,nome) values(2,'USER')
insert into permissao(id,nome,descricao) values(1,'DELETE','apagar')
insert into permissao(id,nome,descricao) values(2,'SALVAR','usuario')
insert into permissao(id,nome,descricao) values(3,'BUSCAR','gerente')
insert into grupo_permissoes(grupo_id,permissao_id) values(1,1),(2,2)
insert into usuario_grupo(usuario_id,grupo_id) values(1,2),(1,1)
