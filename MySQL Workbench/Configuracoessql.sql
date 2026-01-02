show variables;

show variables where variable_name = 'max_connections';

set @@global.max_connections = 250;

set global port = 3307;

show global variables where variable_name like 'auto_increment%';
show local variables where variable_name like 'auto_increment%';

/* auto_increment_increment -> incremento feito a cada novo registro */
/* auto_increment_offset -> valor inicial das colunas que recebem a constraint auto_increment */

set @@session.auto_increment_increment = 10;
set local auto_increment_offset = 5;

use universidade_u;

create table t1(
id int auto_increment primary key,
msg varchar(200)
);

select * from t1;

insert into t1(msg) values ('a');
insert into t1(msg) values ('b');
insert into t1(msg) values ('c');
insert into t2(msg) values ('d');
insert into t2(msg) values ('e');

select * from t2;

insert into t2(msg) values ('g');
insert into t2(msg) values ('h');

show global status where variable_name in ('uptime', 'bytes_received', 'bytes_sent');
show local status where variable_name in ('uptime', 'bytes_received', 'bytes_sent');


show global variables where variable_name = 'datadir';

show databases;

use mysql;

/* Permissões dos usuarios */

select * from user;

/* Estatísticas das tabelas do BD */

select * from innodb_table_stats;
select count(*) from universidade_u.aluno;

/* Logs */

select * from slow_log;
select * from general_log;

/* Ajuda */ 

select * from help_topic;
select * from help_topic where name like 'join';

use performance_schema;

show tables;

/* Inspecionar as variáveis de sistema e variáveis de status */

select * from global_variables;
select * from global_status;

/* Analisar clientes conectados ao servidor BD */

select * from hosts;
select * from users;

use information_schema;

show tables;

/* Mostrar as conexões que estão abertas */

select * from processlist;

/* Detalhes sobre as tabelas */

select table_name as nome_tabela, table_rows as total_registros, auto_increment, table_comment as comentario, (data_length + index_length) as total_bytes, round((((data_length + index_length)/1024)/1024), 2) as total_megabytes
from tables where table_schema = 'universidade_u' and table_type = 'BASE TABLE' order by total_bytes;

select * from tables;

/* Tamanho dos Bancos de Dados */

select table_schema, round(sum((((data_length + index_length)/1024)/1024)), 2) as total_megabytes from tables where table_type = 'BASE TABLE' GROUP BY table_schema ORDER BY total_megabytes desc;

/* Analisando Views */

select * from triggers;
select * from views;

use sys;

show tables;

select * from information_schema.tables where table_schema = 'universidade_u';
select * from host_summary_by_statement_latency;
select * from memory_global_total;

/* Logs de erros */

/* variável global read only - Arquivo onde mostram os erros do sistema */
show global variables where variable_name = 'log_error';

/* variável global read only - Diretório onde se encontra o arquivo */
show global variables where variable_name = 'datadir';

/* variável global dinâmica - Quais tipos de registros serão armazenados (1, 2, 3) */
show global variables where variable_name = 'log_error_verbosity';

set global log_error_verbosity = 3;
set @@global.log_error_verbosity = 2;
/* 1 -> Registrar apenas os logs de erros
   2 -> Registrar os logs de erros e os logs de avisos (alertas/warnings) 
   3 -> Registar os logs de erros, avisos (alertas/warnings) e notas (informações)
*/

/* Logs Gerais */

show global variables where variable_name = 'general_log_file';
show global variables where variable_name = 'datadir';
show global variables where variable_name = 'general_log';

set @@global.general_log = 'on';
set @@global.general_log = 'off';

select * from universidade_u.aluno;
use performance_schema;

/* Log Consultas Lentas */

show global variables where variable_name = 'slow_querry_log';

show global variables where variable_name = 'long_query_time';

set @@global.long_query_time = 10;

select sleep(11), 'Query muito lenta';

/* Logs Binários */

/* 
	1 -> Backup
    2 -> Querys que afetaram registros no banco de dados
    3 -> Querys que afetaram registros no banco de dados
    4 -> Querys que afetaram registros no banco de dados
	5 -> Querys que afetaram registros no banco de dados
	6 -> Banco de dados restaurado com base no backup do dia 1;
*/

show global variables where variable_name = 'log_bin_basename';

show global variables where variable_name = 'log_bin';

show binary logs;

show global variables where variable_name = 'max_binlog_size';

show global variables where variable_name = 'binlog_expire_logs_seconds';

/* Usuários e privilégios */

select * from mysql.user;
select * from mysql.db;
select * from mysql.tables_priv;
select * from mysql.columns_priv;
select * from mysql.procs_priv;

create user joao@'localhost' identified by '1234';
create user maria@'222.222.222.222' identified by '1234';
create user jose@'%' identified by '1234';
create user joao@'111.111.111.111' identified by '1234';

use universidade_u;

grant select on universidade_u.aluno to joao@'localhost';
grant insert on universidade_u.aluno to joao@'localhost';
grant update on universidade_u.aluno to joao@'localhost';
grant delete on universidade_u.aluno to joao@'localhost';
grant alter on universidade_u.aluno to joao@'localhost';
grant drop on universidade_u.aluno to joao@'localhost';
grant create on universidade_u.aluno to joao@'localhost';

show grants for joao@'localhost';

revoke drop on universidade_u.aluno from joao@'localhost';
revoke create on universidade_u.aluno from joao@'localhost';
revoke delete on universidade_u.aluno from joao@'localhost';

/* Alterando registros de usuários */

set password for joao@'localhost' = '4321';
alter user joao@'localhost' identified by 'abcd';

/* Excluindo registros de usuários */

drop user maria@'222.222.222.222';
drop user joao@'111.111.111.111';
