
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