	

select * from erpx.dbo.tb_cliente;

select * from erpx.dbo.tb_item;

select * from erpx.dbo.tb_pedido;

select * from erpx.dbo.tb_pedido_item;

/* Visão Pedidos Detalhes */
go
create view dbo.vw_pedidos_detalhes as
	select p.id_pedido, c.razao_social,c.nome_fantasia, i.descricao as descricao_item, pit.quantidade as quantidade_solicitada
	from erpx.dbo.tb_pedido as p left join erpx.dbo.tb_cliente as c on (c.id_cliente = p.fk_id_cliente) left join erpx.dbo.tb_pedido_item as pit on (p.id_pedido = pit.fk_id_pedido)
	left join erpx.dbo.tb_item as i on (pit.fk_id_item = i.id_item);
go

select * from erpx.dbo.vw_pedidos_detalhes where id_pedido = 3;

/* Trabalhando com datas no SQL server */

select getdate() as data_atual;

select getdate() as 'data_atual',
datename(day, getdate()) as dia,
datename(month, getdate()) as mês,
datename(year, getdate()) as ano,
datename(dayofyear, getdate()) as dia_do_ano,
datename(weekday, getdate()) as dia_da_semana;

select datename(month, erpx.dbo.tb_pedido.data_solicitacao) as mes_solicitacao,
datename(year, erpx.dbo.tb_pedido.data_solicitacao) as ano_solicitacao 
from erpx.dbo.tb_pedido;

select data_solicitacao,
	   dateadd(day, 7, data_solicitacao) as data_limite_fabricacao,
	   dateadd(day, 30, data_solicitacao) as data_limite_entrega
from
	erpx.dbo.tb_pedido;

select '1989-06-01' as data_inicial,
	   getdate() as data_final,
	   datediff(year, '1989-06-01', getdate()) as diff_anos,
	   datediff(month, '1989-06-01', getdate()) as diff_meses,
	   datediff(day, '1989-06-01', getdate()) as diff_meses;


select id_pedido, data_solicitacao, getdate() as data_atual,
	   datediff(day, data_solicitacao, getdate()) as diff_dias
from 
	erpx.dbo.tb_pedido
where
	datediff(day, data_solicitacao, getdate()) >=1;


select data_solicitacao,
	   convert(varchar(10), data_solicitacao, 103) as data_no_padrao_103,
	   convert(varchar(10), data_solicitacao, 108) as data_no_padrao_108,
	   (convert(varchar(10), data_solicitacao, 103)+' '+convert(varchar(8), data_solicitacao, 108)) as data_hora
from
	erpx.dbo.tb_pedido;


/* Stored Procedures */

go
sp_columns tb_pedido_item;
go
sp_pkeys tb_pedido_item;
go

sp_columns tb_item;
go
sp_pkeys tb_item;
go
sp_fkeys tb_item;
go

sp_help tb_cliente;
go
sp_help tb_pedido_item;
go

sp_columns tb_pedido;
go

alter table tb_pedido add status_pedido varchar(15) default 'aberto';
go
update tb_pedido set status_pedido = 'cancelado' where id_pedido = 3;
go
update tb_pedido set status_pedido = 'aberto';
go
select * from tb_pedido;
go

create table tb_ordem_producao(
id_ordem_producao int primary key identity,
fk_id_pedido int not null,
data_limite_fabricacao datetime not null,
status_ordem_producao varchar(15) default 'aberto'
);
go

alter table tb_ordem_producao add constraint fk_tb_ordem_producao foreign key (fk_id_pedido) references tb_pedido (id_pedido);
go

alter table tb_pedido add constraint chk_status_pedido check
(
	status_pedido = 'aberto'
	or status_pedido = 'andamento'
	or status_pedido = 'cancelado'
	or status_pedido = 'finalizado'
);

alter table tb_ordem_producao add constraint chk_status_ordem_producao check
(
	status_ordem_producao = 'aberto'
	or status_ordem_producao = 'andamento'
	or status_ordem_producao = 'cancelado'
	or status_ordem_producao = 'finalizado'
);

select * from tb_cliente;
insert into tb_cliente (razao_social, nome_fantasia)
values ('Franquia 5', 'Miguel Bolos');

update tb_cliente set nome_fantasia = 'Miguel Bolos Ltda' where id_cliente = 5;

insert into tb_cliente (razao_social, nome_fantasia)
values ('Franquia 6', 'Juliana Doces');

go
/* Triguer AIU (After Insert/Update) */
create trigger tgr_teste_cliente_aiu on tb_cliente
after insert, update as 
begin
	print 'Olá, a lógica do gatilho foi disparada após a inserção/atualização do registro';
end;

go
/* Trigger IOFD(Instead of Delete) */
create trigger tgr_teste_cliente_iofd on tb_cliente
instead of delete as
begin
	print 'Olá, a lógica do gatilho foi disparada no lugar da deleção do registro';
end;
go

delete from tb_cliente where id_cliente = 6;
select * from tb_cliente;

go

create table tb_teste_triggers(
	historico varchar(200)
);
go

create trigger tgr_teste_cliente_ai on tb_cliente
after insert as
begin
	declare @campo1 varchar(50);
	declare @campo2 varchar(50);
	declare @msg varchar(200);

	select @campo1 = (select razao_social from inserted)
	select @campo2 = (select nome_fantasia from inserted)
	select @msg = concat('Cliente ', @campo1, ' de nome fantasia ', @campo2, ' foi cadastrado no sistema!');
	insert into tb_teste_triggers (historico) values(@msg);
end
go

insert into tb_cliente (razao_social, nome_fantasia)
values ('Franquia 7', 'Chocolândia');

select * from tb_cliente;
select * from tb_teste_triggers;

go

create trigger tgr_teste_cliente_au on tb_cliente
after update as
begin
	declare @campo1 varchar(50);
	declare @campo2 varchar(50);
	declare @msg varchar(200);

	select @campo1 = (select razao_social from inserted)
	select @campo2 = (select nome_fantasia from inserted)
	select @msg = concat('Cliente ', @campo1, ' de nome fantasia ', @campo2, ' foi atualizado no sistema!');
	insert into tb_teste_triggers (historico) values(@msg);
end;
go

update tb_cliente set razao_social = 'Franquia 9', nome_fantasia = 'Chocolândia Show'
where id_cliente = 7;

select * from tb_cliente;
select * from tb_teste_triggers;

drop trigger tgr_teste_cliente_au;

go

create trigger tgr_teste_cliente_au on tb_cliente
after update as
begin
	declare @campo1_novo varchar(50);
	declare @campo2_novo varchar(50);
	declare @campo1_antigo varchar(50);
	declare @campo2_antigo varchar(50);
	declare @msg varchar(200);
	select @campo1_novo = (select razao_social from inserted)
	select @campo2_novo = (select nome_fantasia from inserted)
	select @campo1_antigo = (select razao_social from deleted)
	select @campo2_antigo = (select nome_fantasia from deleted)
	select @msg = concat ('Cliente ', @campo1_antigo, ' de nome fantasia ', 
	@campo2_antigo, ' foi atualizado para ', @campo1_novo, ' de nome fantasia ',
	@campo2_novo);
	insert into tb_teste_triggers (historico)values(@msg);
end
go

update tb_cliente set razao_social = 'Franquia 8', nome_fantasia = 'Show de Sabores'
where id_cliente = 7;
go

insert into tb_cliente (razao_social, nome_fantasia) values
('Franquia 7', 'Cacau Show');
go

create trigger tgr_teste_cliente_ad on tb_cliente
after delete as
begin
	declare @campo1_antigo varchar(50);
	declare @campo2_antigo varchar(50);
	declare @msg varchar(200);
	select @campo1_antigo = (select razao_social from deleted)
	select @campo2_antigo = (select nome_fantasia from deleted)
	select @msg = concat ('Cliente ', @campo1_antigo, ' de nome fantasia ', 
	@campo2_antigo, ' foi removido!');
	insert into tb_teste_triggers (historico) values (@msg);
end
go

delete from tb_cliente where id_cliente = 8;
select * from tb_cliente;
select * from tb_teste_triggers;

go 

drop trigger tgr_teste_cliente_iofd;

go
/* Triggers DDL */
create trigger trg_controlador_instancia_bd
on all server
for create_database
as
begin
	print 'Um novo banco de dados foi criado!';
end
go
create database bd_trigger_1;
go

create trigger trg_controlador_erpx
on database
for create_table
as
begin
	print 'Uma nova tabela foi criada!';
end

go
create table tb_teste_trigger_3(id int);
go

/*
1- As triggers DDL não podem ser usados como instead of
2- As triggers DDL não criam tabelas temporárias inserted e deleted
*/

/* Listar triggers */

-- associadas a instância do servidor
select * from sys.server_triggers;

-- associadas ao banco de dados e tabelas específicas
use erpx;
select t.*, o.*
from
	sys.triggers as t
	left join sys.objects as o on(t.parent_id = o.object_id);

--Desabilitando triggers
disable trigger dbo.tgr_teste_cliente_ad on dbo.tb_cliente;
disable trigger trg_controlador_erpx on database;
disable trigger trg_controlador_instancia_bd on all server;

--Habilitando triggers
enable trigger dbo.tgr_teste_cliente_ad on dbo.tb_cliente;
enable trigger trg_controlador_erpx on database;
enable trigger trg_controlador_instancia_bd on all server;

use erpx;
go

drop trigger trg_gera_ordem_producao;
go

create trigger trg_gera_ordem_producao
on tb_pedido
after update
as
begin
	declare @status_pedido varchar(15);
	declare @data_limite_fabricacao datetime;

	select @status_pedido = (select status_pedido from inserted);

	if @status_pedido = 'andamento' --inserir um registro em tb_ordem_producao
	begin
		set @data_limite_fabricacao = (select dateadd(day, 7, data_solicitacao) from deleted);
		insert into tb_ordem_producao(fk_id_pedido, data_limite_fabricacao, status_ordem_producao)
		values(1, @data_limite_fabricacao, 'aberto')
	end;
end
go

select * from tb_pedido;
select * from tb_ordem_producao;
update tb_pedido set status_pedido = 'andamento' where id_pedido = 1;
update tb_pedido set status_pedido = 'andamento' where id_pedido = 2;
update tb_pedido set status_pedido = 'cancelado' where id_pedido = 3;

begin
	declare @teste_set varchar(100);
	declare @teste_select varchar(100);
	set @teste_set = 'Foi iniciada (SET)';
	select @teste_select = 'Foi iniciada (SELECT)';
	set @teste_set = (select razao_social from tb_cliente where id_cliente in (1, 2, 3, 7));
	select @teste_select = razao_social from tb_cliente where id_cliente in (1, 2, 3, 7);

	/*
		set é a instrução padrão para atribuição de valores a variáveis
		set não suporta múltiplas atribuições
		select suporta múltiplas atribuições, porém ficando com a última delas
		que quando variáveis possuírem valores já definidos elas se comportarão
		da seguinte forma:
		- no set o valor da variável será sobreposto por null caso a query não 
		retorne valor
		- no select o valor da variável será preservado caso a query não retorne 
		valor
	*/

	print @teste_set;
	print @teste_select;
end

select * from tb_cliente;