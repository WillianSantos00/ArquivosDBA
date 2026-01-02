/*cria o banco de dados*/
CREATE DATABASE `universidade_u`;

/*se conecta ao banco de dados*/
USE `universidade_u`;

/*instruções ddl para criação das tabelas do banco de dados*/
CREATE TABLE `aluno` (
  `idaluno` int(11) NOT NULL AUTO_INCREMENT,
  `sexo` char(1) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `nome` varchar(25) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `ativo_sn` int(11) DEFAULT '1',
  PRIMARY KEY (`idaluno`),
  UNIQUE `uc_aluno_cpf` (`cpf`),
  UNIQUE `uc_aluno_email` (`email`)
);

CREATE TABLE `aluno_curso` (
  `fk_idaluno` int(11) NOT NULL,
  `fk_idcurso` int(11) NOT NULL,
  `data_inscricao_curso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_pago_curso` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`fk_idaluno`,`fk_idcurso`,`data_inscricao_curso`)
);

CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcurso`)
);

CREATE TABLE `disciplina` (
  `iddisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `fk_idprofessor` int(11) DEFAULT NULL,
  `fk_idcurso` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddisciplina`)
);

CREATE TABLE `endereco` (
  `idendereco` int(11) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `fk_idaluno` int(11) DEFAULT NULL,
  PRIMARY KEY (`idendereco`),
  UNIQUE `uc_endereco_fkidaluno` (`fk_idaluno`)
);

CREATE TABLE `funcionario` (
  `idmatricula` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `funcao` varchar(50) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `fk_idmatricula_supervisor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmatricula`)
);

CREATE TABLE `gasto` (
  `idgasto` int(11) NOT NULL AUTO_INCREMENT,
  `ano` int(11) NOT NULL,
  `tipo` enum('previsto','realizado') NOT NULL,
  `jan` float(10,2) DEFAULT NULL,
  `fev` float(10,2) DEFAULT NULL,
  `mar` float(10,2) DEFAULT NULL,
  `abr` float(10,2) DEFAULT NULL,
  `mai` float(10,2) DEFAULT NULL,
  `jun` float(10,2) DEFAULT NULL,
  `jul` float(10,2) DEFAULT NULL,
  `ago` float(10,2) DEFAULT NULL,
  `set` float(10,2) DEFAULT NULL,
  `out` float(10,2) DEFAULT NULL,
  `nov` float(10,2) DEFAULT NULL,
  `dez` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`idgasto`)
);

CREATE TABLE `professor` (
  `idprofessor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idprofessor`)
);

CREATE TABLE `projeto` (
  `idcodigo` int(11) NOT NULL AUTO_INCREMENT,
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`idcodigo`)
);

CREATE TABLE `projeto_funcionario` (
  `fk_idcodigo` int(11) NOT NULL,
  `fk_idmatricula` int(11) NOT NULL,
  `horas_estimadas` int(11) NOT NULL,
  `horas_realizadas` int(11) DEFAULT NULL,
  PRIMARY KEY (`fk_idcodigo`,`fk_idmatricula`)
);

CREATE TABLE `telefone` (
  `idtelefone` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) NOT NULL,
  `fk_idaluno` int(11) NOT NULL,
  `tipo` enum('res','com','cel') NOT NULL,
  PRIMARY KEY (`idtelefone`)
);

/*fks tabela aluno_curso*/
ALTER TABLE `aluno_curso` ADD CONSTRAINT `fk_aluno_curso` 
FOREIGN KEY (`fk_idaluno`) REFERENCES `aluno` (`idaluno`);

ALTER TABLE `aluno_curso` ADD CONSTRAINT `fk_curso_aluno` 
FOREIGN KEY (`fk_idcurso`) REFERENCES `curso` (`idcurso`);

/*fks tabela disciplina*/
ALTER TABLE `disciplina` ADD CONSTRAINT `fk_curso_disciplina` 
FOREIGN KEY (`fk_idcurso`) REFERENCES `curso` (`idcurso`);

ALTER TABLE `disciplina` ADD CONSTRAINT `fk_disciplina_professor` 
FOREIGN KEY (`fk_idprofessor`) REFERENCES `professor` (`idprofessor`);

/*fk tabela endereco*/
ALTER TABLE `endereco` ADD CONSTRAINT `fk_aluno_endereco` 
FOREIGN KEY (`fk_idaluno`) REFERENCES `aluno` (`idaluno`);

/*fk tabela funcionario*/
ALTER TABLE `funcionario` ADD CONSTRAINT `fk_funcionario_supervisor` 
FOREIGN KEY (`fk_idmatricula_supervisor`) REFERENCES `funcionario` (`idmatricula`);

/*fks tabela projeto_funcionario*/
ALTER TABLE `projeto_funcionario` ADD CONSTRAINT `projeto_funcionario_ibfk_1` 
FOREIGN KEY (`fk_idcodigo`) REFERENCES `projeto` (`idcodigo`);

ALTER TABLE `projeto_funcionario` ADD CONSTRAINT `projeto_funcionario_ibfk_2` 
FOREIGN KEY (`fk_idmatricula`) REFERENCES `funcionario` (`idmatricula`);

/*fk tabela telefone*/
ALTER TABLE `telefone` ADD CONSTRAINT `fk_aluno_telefone` 
FOREIGN KEY (`fk_idaluno`) REFERENCES `aluno` (`idaluno`);

/*inserts*/
INSERT INTO `aluno` (`sexo`, `email`, `nome`, `cpf`, `data_nascimento`) VALUES 
('M', 'jose@teste.com.br', 'José', '222.222.222-22', '1985-06-01'),
('F', 'maria@teste.com.br', 'Maria', '111.111.111-11', '1979-12-10'),
('F', 'rosa@teste.com.br', 'Rosa', '333.333.333-33', '1990-12-22'),
('M', 'joao@teste.com.br', 'João', '444.444.444-44', '1970-08-05'),
('M', 'pedro@teste.com.br', 'Pedro', '555.555.555-55', '1967-07-02'),
('F', 'bianca@teste.com.br', 'Bianca', '666.666.666-66', '1995-11-22'),
('M', 'jorge@teste.com.br', 'Jorge', '777.777.777-77', '1989-01-06'),
('F', 'mariana@teste.com.br', 'Mariana', '888.888.888-88', '1980-01-30'),
('M', 'antonio@teste.com.br', 'Antônio', '999.999.999-99', '1991-12-03');

INSERT INTO `endereco` (`logradouro`, `numero`, `bairro`, `cidade`, `estado`, `fk_idaluno`) VALUES
('Rua 9', 'nº 9', 'Bairro 9', 'São Paulo', 'SP', 9),
('Rua 5', 'nº 5', 'Bairro 5', 'Belo Horizonte', 'MG', 5),
('Rua 3', 'nº 3', 'Bairro 3', 'Natal', 'RN', 3),
('Rua 8', 'nº 8', 'Bairro 8', 'Rio de Janeiro', 'RJ', 8),
('Rua 4', 'nº 4', 'Bairro 4', 'Fortaleza', 'CE', 4),
('Rua 1', 'nº 1', 'Bairro 1', 'Manaus', 'AM', 1),
('Rua 7', 'nº 7', 'Bairro 7', 'Goiânia', 'GO', 7),
('Rua 2', 'nº 2', 'Bairro 2', 'Florianópolis', 'SC', 2),
('Rua 6', 'nº 6', 'Bairro 6', 'Vitória', 'ES', 6);

INSERT INTO `telefone` (`numero`, `fk_idaluno`, `tipo`) VALUES
('11 92222-2222', 9, 'cel'), 
('11 3333-2222', 9, 'com'), 
('31 5555-2222', 5, 'res'),
('21 4444-1111', 8, 'res'), 
('21 91111-2222', 9, 'cel'), 
('62 98888-7777', 7, 'cel'), 
('62 4444-4444', 7, 'com'), 
('62 6666-9999', 7, 'res'),
('27 95555-0000', 6, 'cel');

INSERT INTO `curso` (`descricao`) VALUES
('NodeJS e MongoDB'),
('Web Completo 2019'),
('ES6, TypeScript e Angular'),
('React Native'),
('Bancos de Dados Relacionais');

INSERT INTO `professor` (`nome`, `email`) VALUES 
('Laura', 'laura@teste.com.br'),
('Miguel', 'miguel@teste.com.br'),
('Sofia', 'sofia@teste.com.br'),
('Patrícia', 'patricia@teste.com.br'),
('Arthur', 'arthur@teste.com.br'),
('Breno', 'breno@teste.com.br'),
('Raquel', 'raquel@teste.com.br'),
('Hugo', 'hugo@teste.com.br'),
('Alex', 'alex@teste.com.br');

INSERT INTO `disciplina` (`descricao`, `carga_horaria`, `fk_idprofessor`, `fk_idcurso`) VALUES
('HTML', 4, 5, 2), 
('CSS', 3, null, 2), 
('Bootstrap', 5, 5, 2), 
('JavaScript', 10, null, 2), 
('PHP', 15, null, 2),
('NodeJS', 8, 3, 1), 
('MongoDB', 6, 3, 1), 
('Express', 4, 3, null), 
('ES6', 7, 3, 3), 
('TypeScript', 4, 3, 3), 
('Orientada a Objetos', 5, null, 3),
('Angular', 20, 4, 3), 
('ES6', 7, 3, null), 
('Ract Native', 7, 8, 4), 
('Redux', 4, 8, 4),
('MySQL', 7, null, 5);

SELECT * FROM Aluno;

SELECT * FROM Telefone;

SELECT * FROM Aluno LEFT JOIN Telefone on aluno.idAluno = telefone.fk_idAluno WHERE Sexo = 'F';

SELECT * FROM Curso;

SELECT * FROM Professor;

SELECT * FROM Disciplina;

SELECT * FROM curso as c LEFT JOIN disciplina as d on (c.idcurso = d.fk_idcurso) left join professor as p on (d.fk_idprofessor = p.idprofessor) WHERE idcurso = 1;

SELECT /* Projeção */
c.idCurso, c.descricao as curso, d.idDisciplina, d.descricao as disciplina, p.idProfessor, p.Nome as professor, now() as dataAtual
 FROM curso as c  /* Apelido */
LEFT JOIN /* Junção */
disciplina as d on (c.idcurso = d.fk_idcurso)
LEFT JOIN 
Professor as p on (d.fk_idProfessor = p.idProfessor)
WHERE /* Seleção */
idcurso = 1;

SELECT * FROM Curso as c right join disciplina as d on (c.idCurso = d.fk_idCurso);

SELECT * FROM Curso as c left join disciplina as d on (c.idCurso = d.fk_idCurso);

SELECT * FROM disciplina as d left join Curso as c on (c.idCurso = d.fk_idCurso);

SELECT * FROM disciplina as d right join Curso as c on (c.idCurso = d.fk_idCurso);

SELECT * FROM disciplina as d left join professor as p on (d.fk_idProfessor = p.idProfessor);

SELECT * FROM disciplina as d right join professor as p on (d.fk_idProfessor = p.idProfessor);

SELECT * FROM disciplina as d inner join professor as p on (d.fk_idProfessor = p.idProfessor);

SELECT 'Banana' as fruta
union
SELECT 'Maçã'
union all
SELECT 'Banana'
union all
SELECT 'Morango'
order by fruta;

SELECT idAluno as id, email, 'aluno' from Aluno where sexo = 'F'
union 
SELECT idProfessor as id, email, 'professor' from Professor where idProfessor in (2, 4, 6, 8, 10) order by email;

SELECT * FROM disciplina as d left join professor as p on (d.fk_idProfessor = p.idProfessor)
union
SELECT * FROM disciplina as d right join professor as p on (d.fk_idProfessor = p.idProfessor);

SELECT * FROM disciplina as d left join professor as p on (d.fk_idProfessor = p.idProfessor) WHERE idprofessor is null
union
SELECT * FROM disciplina as d right join professor as p on (d.fk_idProfessor = p.idProfessor) WHERE idDisciplina is null;

delimiter $$
create procedure proc_oi()
begin

select 'Oi, Você acabou de executar um procedimento que está armazenado no banco de dados! Sempre que você precisar, é só chamar' as msg;

end
$$

delimiter ;

call proc_oi();

show procedure status where db = 'universidade_u';

show create procedure universidade_u.proc_oi;

drop procedure universidade_u.proc_oi;

delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_oi`()

begin

select 'Oi, eu fui modificado!' as msg;

end
$$

delimiter ;

call proc_oi();

delimiter xyz

create procedure proc_media_ponderada(
in nome varchar(100),
in p1 float,
in p2 float,
in p3 float, 
in p4 float)

comment 'Efetua o cálculo de média ponderada ((p1*2) + (p2*2) + (p3*3) + (p4*3))/10'

begin
	/* Nome do Aluno, Média Ponderada */
    select nome, round((((p1*2) + (p2*2) + (p3*3) + (p4*3))/10), 1) as media_ponderada;
    
end
xyz

delimiter ;

call proc_media_ponderada('João', 10, 8, 5, 7);
call proc_media_ponderada('Maria', 10, 8.5, 5.3, 7);
call proc_media_ponderada('José', 4.5, 9.2, 4.7, 6.9);

show create procedure universidade_u.proc_media_ponderada;

delimiter $$

create procedure proc_resumo(out total_professores int, out total_alunos int)
comment 'Resumo de total de alunos e total de professores'
begin
	/* Total de professores */
    select count(*) into total_professores from professor;
    /* Total de Alunos */
    select count(*) into total_alunos from aluno;
    
end 
$$
delimiter ;

show procedure status where db = 'universidade_u';

call proc_resumo(@p, @a);

call proc_resumo(@professor, @aluno);

select @p as total_professor, @a as total_aluno;
select @professor as total_professor, @aluno as total_aluno;

set @x = 10;
set @y = 15;
set @nome = 'Jorge';

set @y = 25;

set @resultado = @x + @y;

select @x as P1, @y as P2, @nome as Aluno, @resultado as 'Soma';

set @cpf = '555.555.555-55';

select * from aluno;

set @idaluno = (select idaluno from aluno where cpf = @cpf);
select @idaluno, @cpf;

select * from telefone where fk_idaluno = @id_aluno;

delimiter $$

create procedure proc_variavel_escopo_local()
begin

declare x int default 10;
declare papagaio varchar(20);
set papagaio = @x;
select x as variavel_de_escopo_local;
select papagaio as variavel_de_escopo_local2;
end 
$$

delimiter ;

drop procedure proc_variavel_escopo_local;

call proc_variavel_escopo_local();

set @x = 'Banana';
select @x;

delimiter $$

create procedure proc_variavel_escopo_local2()
begin

declare total_professores int;
/*set total_professores = (select count(*) from professor);*/
/* Escrever de outra forma */
select count(*) into total_professores from professor;

select total_professores as qtde;
end
$$

delimiter ;

call proc_variavel_escopo_local2();

drop procedure proc_variavel_escopo_local2;

delimiter $$

create procedure proc_variaveis_escopo_parametro(in param1 int, param2 varchar(100))
begin

	select param1, param2;
    set param2 = 'Parâmetro 2 foi modificado e exportado pela procedure';

end
$$ 

delimiter ;

show procedure status where db = 'universidade_u';

set @param2 = 'Parametro 2'; 
select @param2;

call proc_variaveis_escopo_parametro(100, @param2);
select @param2;

delimiter $$

create procedure proc_exemplo_parametro(
in param1 int,
out param2 varchar(50),
inout param3 float)

begin

set param2 = 'Parametro 2 foi modificado';
set param3 = 30.3;

/* 
param1 - será exibido pois é um parâmetro de entrada
param2 - será exibido null pois o valor passado é apenas uma referência
param3 - será exibido 70.5 pois é um parametro de entrada e vai permitir alterar o valor da variável de sessão pois é uma referência
*/

end
$$
delimiter ;

set @p1 = 100;
set @p2 = 'Parâmetro 2';
set @p3 = 70.5;

call proc_exemplo_parametro(@p1, @p2, @p3);

select @p1, @p2, @p3;



delimiter $$
create procedure proc_ifelse()
comment 'Exemplo de uso dos condicionais ifelse'
begin

declare idade int default 15;
declare sexo char(1) default 'F';

if idade >= 18 and sexo = 'M' then
select 'Ele é maior de idade';
end if;

if idade <= 18 and sexo = 'M' then
select 'ele é menor de Idade';
end if;

if idade >= 18 and sexo = 'F' then
select 'Ela é maior de idade';
end if;

if idade <= 18 and sexo = 'F' then
select 'ela é menor de Idade';
end if;

end
$$

delimiter ;

call proc_ifelse();
drop procedure universidade_u.proc_ifelse;

delimiter $$

create procedure proc_ifelse_consulta()
comment 'Exemplo de uso dos condicionais ifelse'
begin

declare sexoMF char(1);

set sexoMF = (select sexo from aluno where idAluno = 3);

if sexoMF = 'M' then
select 'O aluno é do sexo masculino';
else
select 'A aluna é do sexo feminino';
end if;


end
$$

delimiter ;

call proc_ifelse_consulta();

drop procedure universidade_u.proc_ifelse_consulta;

select * from Aluno;

delimiter $$

create procedure proc_elseif_idade()
begin

declare idade int default 25;

if idade >= 0 and idade <=15 then
	select 'Criança';
elseif idade > 15 and idade <= 29 then
	select 'Jovem';
elseif idade > 29 and idade <= 59 then
	select 'Adulto';
else
	select 'Idoso';
    
end if;

end

$$

delimiter ;

call proc_elseif_idade();
drop procedure proc_elseif_idade;

delimiter $$

create procedure proc_elseif_idade_consulta()
begin

declare idade int;

set idade = (select timestampdiff(year, data_nascimento ,curdate()) from Aluno Where idaluno = 5);

if idade >= 0 and idade <=15 then
	select 'Criança';
elseif idade > 15 and idade <= 29 then
	select 'Jovem';
elseif idade > 29 and idade <= 59 then
	select 'Adulto';
else
	select 'Idoso';
    
end if;

end

$$

delimiter ;

drop procedure proc_elseif_idade_consulta;
call proc_elseif_idade_consulta();

delimiter $$

create procedure proc_case_simples()
comment 'Exemplo de uso do case'
begin

	declare opcao int default 2;
    
	/* Sintaxe Simples */
    case opcao
		when 1 then select 'Intrucao a ser executada é a opcao 1';
        when 2 then select 'Intrucao a ser executada é a opcao 2';
        when 3 then select 'Intrucao a ser executada é a opcao 3';
        when 4 then select 'Intrucao a ser executada é a opcao 4';
	else
		select 'Instrucao a ser executada se nenhuma opcao anterior for verdadeira';
	end case;
    
end

$$

delimiter ;

call proc_case_simples();
drop procedure proc_case_simples;

create table log(

idlog int primary key auto_increment,
log varchar(255)
);

desc log;
select * from log;
truncate table log;

delimiter $$
create procedure proc_while()
comment 'Exemplo de uso While'
begin
	declare contador int default 1;
    while contador <= 10 do
		insert log(log) values (contador);
        set contador = contador + 1;
	end while;
end
$$
delimiter ;

call proc_while();

delimiter $$
create procedure proc_loop()
comment'Exemplo de uso do Loop'
begin
	declare z int default 1;
    declare resultado varchar(20);
    
    loop_tabuada: loop
		set resultado = concat('2 x ', z, ' = ', (2*z));
        insert into log(log) values(resultado);
        set z = z + 1;
        if z > 10 then
			leave loop_tabuada;
		end if;
	end loop loop_tabuada;
end
$$
delimiter ;

select * from log;

call proc_loop;

delimiter $$
create procedure proc_repeat()
comment'Exemplo de uso do repeat'
begin
	declare z int default 1;
    declare resultado varchar(20);
    
    repeat
		set resultado = concat('5 x ', z, ' = ', (5*z));
        insert into log(log) values(resultado);
        set z = z + 1;
	until z > 10 end repeat;
end
$$
delimiter ;

select * from log;
truncate table log;

call proc_repeat();

create table calendario(

idcalendario int not null auto_increment primary key,
`data` date not null,
dia int not null,
mes int not null,
ano int not null,
feriado enum('s','n'),
nome_feriado varchar(50)
);

select * from calendario;

delimiter $$
create procedure proc_calendario(in p_data_inicio date, p_data_fim date)
comment 'Procedimento para definição de calendario acadêmico com base em uma data de inicio e fim'
begin
	declare v_dia, v_mes, v_ano int;
    declare v_feriado char(1);
    declare v_nome_feriado varchar(50);
    
    while p_data_inicio <= p_data_fim do
		set v_dia = extract(day from p_data_inicio);
        set v_mes = extract(month from p_data_inicio);
        set v_ano = extract(year from p_data_inicio);
        
        if v_dia = 1 and v_mes = 1 then
			set v_feriado = 's';
            set v_nome_feriado = 'Confraternização Universal';
		elseif v_dia = 3 and v_mes = 3 then
			set v_feriado = 's';
            set v_nome_feriado = 'Carnaval';
		elseif v_dia = 4 and v_mes = 3 then
			set v_feriado = 's';
            set v_nome_feriado = 'Carnaval';
		elseif v_dia = 5 and v_mes = 3 then
			set v_feriado = 's';
            set v_nome_feriado = 'Quarta-Feira de Cinzas';
		elseif v_dia = 18 and v_mes = 4 then
			set v_feriado = 's';
            set v_nome_feriado = 'Sexta-feira Santa';
		elseif v_dia = 20 and v_mes = 4 then
			set v_feriado = 's';
            set v_nome_feriado = 'Páscoa';
		elseif v_dia = 21 and v_mes = 4 then
			set v_feriado = 's';
            set v_nome_feriado = 'Tiradentes';
		elseif v_dia = 1 and v_mes = 5 then
			set v_feriado = 's';
            set v_nome_feriado = 'Dia do Trabalho';
		elseif v_dia = 19 and v_mes = 6 then
			set v_feriado = 's';
            set v_nome_feriado = 'Corpus Chirsti';
		elseif v_dia = 7 and v_mes = 9 then
			set v_feriado = 's';
            set v_nome_feriado = 'Dia da Independência';
		elseif v_dia = 12 and v_mes = 10 then
			set v_feriado = 's';
            set v_nome_feriado = 'Nossa Senhora Aparecida';
		elseif v_dia = 2 and v_mes = 11 then
			set v_feriado = 's';
            set v_nome_feriado = 'Finados';
		elseif v_dia = 15 and v_mes = 11 then
			set v_feriado = 's';
            set v_nome_feriado = 'Proclamação da República';
		elseif v_dia = 20 and v_mes = 11 then
			set v_feriado = 's';
            set v_nome_feriado = 'Consciência Negra';
		elseif v_dia = 25 and v_mes = 12 then
			set v_feriado = 's';
            set v_nome_feriado = 'Natal';
		else
			set v_feriado = 'n';
            set v_nome_feriado = null;
		end if;
        insert into calendario(`data`, dia, mes, ano, feriado, nome_feriado) values (p_data_inicio, v_dia, v_mes, v_ano, v_feriado, v_nome_feriado);
        set p_data_inicio = date_add(p_data_inicio, interval 1 day);
	end while;
end
$$
delimiter ;

call proc_calendario('2025-01-01', '2025-12-31');
drop procedure proc_calendario;
truncate table calendario;
select * from calendario where feriado = 's';

create table contrato(
    idcontrato int not null auto_increment,
    fk_idaluno int not null,
    fk_idcurso int not null,
    fk_data_inscricao_curso datetime not null,
    valor_total_curso float not null,
    desconto float not null default 0,
    numero_parcelas int not null,
    processado enum('n','s') default 'n',
    constraint pk_idcontrato primary key(idcontrato)
);

alter table contrato add constraint fk_contrato_aluno_curso

foreign key(fk_idaluno, fk_idcurso, fk_data_inscricao_curso)

references aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso);


/* alter table aluno_curso drop column valor_pago_curso; */

create table boleto(
	idboleto int primary key auto_increment,
    fk_idcontrato int,
    data_vencimento date not null,
    valor float not null,
    numero_parcela int not null
);

/* */
select * from aluno;
select * from curso;
select * from aluno_curso;
select * from contrato;
select * from boleto;
/* */

insert into aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso)values(1, 2, '2019-01-07 12:00:00');
insert into aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso)values(2, 3, '2019-01-12 17:30:00');
insert into aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso)values(3, 1, '2019-01-09 09:45:00');
insert into aluno_curso(fk_idaluno, fk_idcurso, data_inscricao_curso)values(4, 4, '2019-02-01 13:20:00');

select * from aluno_curso;

insert into contrato(fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, numero_parcelas)values(1, 2, '2019-01-07 12:00:00', 1500, 12);
insert into contrato(fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, numero_parcelas)values(2, 3, '2019-01-12 17:30:00', 1300, 12);
insert into contrato(fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, numero_parcelas)values(3, 1, '2019-01-09 09:45:00', 900, 10);
insert into contrato(fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, numero_parcelas)values(4, 4, '2019-02-01 13:20:00', 2000, 10);

select * from contrato;

delimiter $$
create procedure proc_boleto()
comment 'Procedure para processamento dos contratos e geração de geristros de boletos'
begin
	declare v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_numero_parcelas int;
    declare v_fk_data_inscricao_curso datetime;
    declare v_valor_total_curso, v_desconto float;
    declare v_processado char(1);
    
    declare c_contratos cursor for(
		select idcontrato, fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, desconto, numero_parcelas, processado from contrato
    );

open c_contratos;
	fetch c_contratos into v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_fk_data_inscricao_curso, v_valor_total_curso, v_desconto, v_numero_parcelas, v_processado;
    
    select v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_fk_data_inscricao_curso, v_valor_total_curso, v_desconto, v_numero_parcelas, v_processado;
    
end

$$

delimiter ;

call proc_boleto();

delimiter $$
create procedure proc_boleto_loop()
comment 'Procedure para processamento dos contratos e geração de geristros de boletos'
begin
	declare v_fim_loop int default 0;
    declare v_log text;
	declare v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_numero_parcelas int;
    declare v_fk_data_inscricao_curso datetime;
    declare v_valor_total_curso, v_desconto float;
    declare v_processado char(1);
    
    declare c_contratos cursor for(
		select idcontrato, fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, desconto, numero_parcelas, processado from contrato
    );

declare continue handler for not found set v_fim_loop = 1;

open c_contratos;
truncate table log;
repeat
	fetch c_contratos into v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_fk_data_inscricao_curso, v_valor_total_curso, v_desconto, v_numero_parcelas, v_processado;
    if v_fim_loop = 0 then
		set v_log = concat(v_fim_loop, ' *** ',v_idcontrato, ' - ', v_fk_idaluno, ' - ', v_fk_idcurso, ' - ',
        v_fk_data_inscricao_curso, ' - ', v_valor_total_curso, ' - ', v_desconto, ' - ', v_numero_parcelas, ' - ', v_processado);
        insert into log(log) values (v_log);
    end if;
    select * from log;
    until v_fim_loop > 0 end repeat;
	
    
end

$$

delimiter ;

call proc_boleto_loop();
drop procedure proc_boleto_loop;
select * from log;

delimiter $$
create procedure proc_boleto_insert()
comment 'Procedure para processamento dos contratos e geração de geristros de boletos'
begin
	declare v_fim_loop int default 0;
    declare v_log text;
	declare v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_numero_parcelas, v_boleto_loop_parcelas int;
    declare v_fk_data_inscricao_curso, v_boleto_data_vencimento datetime;
    declare v_valor_total_curso, v_desconto, v_boleto_valor_parcelas float;
    declare v_processado char(1);
    
    declare c_contratos cursor for(
		select idcontrato, fk_idaluno, fk_idcurso, fk_data_inscricao_curso, valor_total_curso, desconto, numero_parcelas, processado from contrato
    );

declare continue handler for not found set v_fim_loop = 1;

open c_contratos;
truncate table log;
repeat
	fetch c_contratos into v_idcontrato, v_fk_idaluno, v_fk_idcurso, v_fk_data_inscricao_curso, v_valor_total_curso, v_desconto, v_numero_parcelas, v_processado;
    if v_fim_loop = 0 then
		set v_log = concat(v_fim_loop, ' *** ',v_idcontrato, ' - ', v_fk_idaluno, ' - ', v_fk_idcurso, ' - ',
        v_fk_data_inscricao_curso, ' - ', v_valor_total_curso, ' - ', v_desconto, ' - ', v_numero_parcelas, ' - ', v_processado);
        insert into log(log) values (v_log);
        
        set v_boleto_loop_parcelas = 1;
		while v_boleto_loop_parcelas <= v_numero_parcelas do
			set v_boleto_valor_parcelas = v_valor_total_curso / v_numero_parcelas;
			set v_boleto_data_vencimento = date_add(v_fk_data_inscricao_curso,interval v_boleto_loop_parcelas month);
			insert into boleto (fk_idcontrato, data_vencimento, valor, numero_parcela)
            values (v_idcontrato, v_boleto_data_vencimento, v_boleto_valor_parcelas, v_boleto_loop_parcelas);
            set v_boleto_loop_parcelas = v_boleto_loop_parcelas + 1;
		end while;
			update contrato set processado = 's' where idcontrato = v_idcontrato;
    end if;
until v_fim_loop > 0 end repeat;	
end

$$

delimiter ;

call proc_boleto_insert();
drop procedure proc_boleto_insert;


select * from log;
select * from boleto;

delimiter $$

create function func_data_ptbr(p_data datetime)

returns char(10)
deterministic /* A função é determinística quando ela não afeta dados do BD, portanto ela é considerada segura */
comment 'A function serve para retornar datas no formado dd/mm/yyyy'
begin
	return date_format(p_data, '%d/%m/%Y');
end

$$
delimiter ;

select nome, data_nascimento from aluno;
select nome, date_format(data_nascimento, '%d/%m/%Y') as data_nascimento from aluno;
select nome, func_data_ptbr(data_nascimento) as data_nascimento from aluno;

drop function func_data_ptbr;

delimiter $$

create function func_data_ptbr(p_data datetime)
returns varchar(255)
deterministic
comment 'A function serve para retornar datas no formado dd/mm/yyyy'
begin
	return date_format(p_data, '--%d/%m/%Y--');
end

$$
delimiter ;

select func_data_ptbr('2025-11-27 00:00:00') as dataFormatada;

delimiter $$

create function func_idade(p_data_nasc datetime)
returns int
deterministic
comment 'Function pra calcular idade de aluno'
begin
	return timestampdiff(YEAR,p_data_nasc, curdate());
end

$$
delimiter ;

select nome, data_nascimento, func_idade(data_nascimento) as idade from Aluno;
drop function func_idade;

set global log_bin_trust_function_creators = 1;

delimiter $$
create function func_qtde_disciplinas(p_idcurso int)
returns int
comment 'Function que serve para retornar a quantidade de disciplinas com base no curso'
begin
	declare qtde_disciplinas int default 0;
    set qtde_disciplinas = (select count(*) as qtde_disciplinas from disciplina where fk_idcurso = p_idcurso);
    return qtde_disciplinas;
end
$$
delimiter ;

drop function universidadeu.func_qtde_disciplinas;
select func_qtde_disciplinas(3) as qtde_disciplinas;

/* Aplicando uma select(projeção) sem utilizar a function */

select fk_idcurso, (select descricao from curso where idcurso = fk_idcurso) as descricao, count(*) as qtde_disciplinas from disciplina group by fk_idcurso;

select idcurso, descricao, func_qtde_disciplinas(idcurso) as qtde_disciplinas from curso;

/* brModelo: */

CREATE TABLE funcionario_log (
    idfuncionario_log int auto_increment PRIMARY KEY,
    fk_idmatricula int,
    data_log datetime default current_timestamp,
    tipo_log char(2) not null,
    funcao_antiga varchar(50),
    funcao_nova varchar(50),
    telefone_antigo varchar(20),
    telefone_novo varchar(20),
    constraint fk_funcionario_log foreign key (fk_idMatricula) references funcionario(idmatricula)
);
 
 /* Listar as Triggers do bd */
 
 show triggers where `table` = 'funcionario';
 
 /* Instrução para recuperar a trigger (bloco lógico) */
 show create trigger universidade_u.tr_before_insert_funcionario;
 
 delimiter $$
 create trigger tr_before_insert_funcionario before insert on funcionario for each row
 begin
 
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo) 
    values
    (null, 'BI', null, NEW.Funcao, null, NEW.telefone);
 
 end
$$

delimiter ;

drop trigger tr_before_insert_funcionario;

delimiter $$
 create trigger tr_after_insert_funcionario after insert on funcionario for each row
 begin
 
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo) 
    values
    (new.matricula, 'AI', null, NEW.Funcao, null, NEW.telefone);
 
 end
$$

delimiter ;

delimiter $$
 create trigger tr_before_delete_funcionario before delete on funcionario for each row
 begin
 
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo) 
    values
    (null, 'BD', old.funcao, null, old.telefone, null);
 
 end
$$

delimiter ;

drop trigger tr_before_insert_funcionario;
drop trigger tr_after_insert_funcionario;
drop trigger tr_before_delete_funcionario;
select * from funcionario;
select * from funcionario_log;

insert into funcionario(matricula, nome, funcao, telefone) values (1, 'Alana', 'Assistente Administrativo', '11 98888-7777');
insert into funcionario(matricula, nome, funcao, telefone) values (2, 'Elton', 'Auxiliar Contabil', '11 3333-4444');
set foreign_key_checks = 1;
delete from funcionario where idmatricula = 1;

truncate projeto_funcionario;
select * from projeto_funcionario;

alter table funcionario add idfuncionario int primary key auto_increment first;
alter table funcionario add matricula int after idfuncionario;
alter table funcionario rename column fk_idmatricula_supervisor to fk_idfuncionario_supervisor;
desc funcionario;
alter table funcionario drop constraint fk_funcionario_supervisor;
alter table projeto_funcionario drop constraint projeto_funcionario_ibfk_2;
alter table funcionario_log drop constraint fk_funcionario_log;
desc funcionario_log;
alter table funcionario_log drop fk_idmatricula;
alter table funcionario_log add fk_idfuncionario int after idfuncionario_log;
alter table funcionario_log add matricula int after fk_idfuncionario;


ALTER TABLE FUNCIONARIO ADD CONSTRAINT fk_funcionario_supervisor
    FOREIGN KEY (fk_idfuncionario_supervisor)
    REFERENCES FUNCIONARIO (idfuncionario);


ALTER TABLE FUNCIONARIO_LOG ADD CONSTRAINT fk_funcionario_funcionario_log
    FOREIGN KEY (fk_idfuncionario)
    REFERENCES FUNCIONARIO (idfuncionario);
    
insert into funcionario(matricula, nome, funcao, telefone) values (3, 'Rubens', 'Assistente Administrativo', '11 3333-4444');
insert into funcionario(matricula, nome, funcao, telefone) values (4, 'Mônica', 'Gerente de Atendimento', '11 4444-4444');
insert into funcionario(matricula, nome, funcao, telefone) values (5, 'Marcela', 'Técnico de Informática', '11 3333-3333');

select * from funcionario;
select * from funcionario_log;
desc funcionario_log;
truncate funcionario;

delimiter $$
 create trigger tr_after_delete_funcionario after delete on funcionario for each row
 begin
 
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo) 
    values
    (old.matricula, 'AD', old.funcao, null, old.telefone, null);
 
 end
$$

delimiter ;

delete from funcionario where idfuncionario = 4;
select * from funcionario_log;

delimiter $$
 create trigger tr_before_update_funcionario before update on funcionario for each row
 begin
 
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo) 
    values
    (null, 'BU', old.funcao, new.funcao, old.telefone, new.telefone);
 
 end
$$

delimiter ;

update funcionario set funcao = 'Gerente de TI', Telefone = '11 7777-1111' where idfuncionario = 5;
update funcionario set funcao = 'Diretor de TI', Telefone = '11 7777-9999' where idfuncionario = 5;

ALTER TABLE Funcionario add Salario float after Telefone;
ALTER TABLE Funcionario_log add salario_antigo float after telefone_novo;
ALTER TABLE Funcionario_log add salario_novo float after salario_antigo;

select * from funcionario;
select * from funcionario_log;

delimiter $$
 create trigger tr_after_update_funcionario after update on funcionario for each row
 begin
 
	insert into funcionario_log(matricula, tipo_log, funcao_antiga, funcao_nova, telefone_antigo, telefone_novo, salario_antigo, salario_novo) 
    values
    (old.matricula, 'AU', old.funcao, new.funcao, old.telefone, new.telefone, old.salario, new.salario);
 
 end
$$

delimiter ;

update funcionario set funcao = 'Diretor TI', telefone = '11 7777-9999', salario = '12000' where idfuncionario = 5;
update funcionario set funcao = 'Gerente Administrativo', telefone = '11 3333-7777', salario = '6000' where idfuncionario = 3;
select * from funcionario_log;

select * from curso;
select * from disciplina;
select * from professor;

select idcurso, descricao from curso;
select iddisciplina, descricao from disciplina;
select idprofessor, nome from professor;

create view vw_rel_cursos_deisciplina_professores as
	select c.idcurso, c.descricao as curso, d.iddisciplina, d.descricao as disciplina, p.idprofessor, p.nome
	from curso as c left join disciplina as d on (c.idcurso = d.fk_idcurso)
    left join professor as p on (d.fk_idprofessor = p.idprofessor);
    
select * from vw_rel_cursos_deisciplina_professores;
select * from vw_rel_cursos_deisciplina_professores where idprofessor = 3;

alter view vw_rel_cursos_deisciplina_professores as
	select c.idcurso, c.descricao as curso, d.iddisciplina, d.descricao as disciplina, d.carga_horaria, p.idprofessor, p.nome
	from curso as c left join disciplina as d on (c.idcurso = d.fk_idcurso)
    left join professor as p on (d.fk_idprofessor = p.idprofessor);
    
select curso, sum(carga_horaria) as total from vw_rel_cursos_deisciplina_professores group by curso;

show create view vw_rel_cursos_deisciplina_professores;

show tables;

select idaluno, nome from aluno;
select idcurso, descricao from curso;
select idcontrato, valor_total_curso, fk_data_inscricao_curso from contrato;
select * from contrato;
select * from aluno_curso;

create view vw_rel_aluno_curso_contrato as
	select a.idaluno, a.nome, c.idcurso, c.descricao, co.idcontrato, co.valor_total_curso, ac.data_inscricao_curso from aluno_curso as ac left join aluno as a on (a.idaluno = ac.fk_idaluno)
    left join curso as c on (c.idcurso = ac.fk_idcurso) left join contrato as co on (co.fk_idaluno = ac.fk_idaluno);
    
select * from vw_rel_aluno_curso_contrato;

alter view vw_rel_aluno_curso_contrato as
	select a.idaluno, a.nome, c.idcurso, c.descricao, co.idcontrato, co.valor_total_curso, ac.data_inscricao_curso from aluno as a left join aluno_curso as ac on (a.idaluno = ac.fk_idaluno)
    left join curso as c on (c.idcurso = ac.fk_idcurso) left join contrato as co on (co.fk_idaluno = ac.fk_idaluno);
    
select * from vw_rel_aluno_curso_contrato;

select vw.nome, vw.descricao as curso, t.numero as telefone, t.tipo, e.estado from vw_rel_aluno_curso_contrato as vw left join telefone as t on (vw.idaluno = t.fk_idaluno) 
left join endereco as e on (vw.idaluno = e.fk_idaluno);

select * from telefone where fk_idaluno in (1, 2, 3, 4);
select * from telefone;

update telefone set fk_idaluno = 1 where fk_idaluno = 9;
update telefone set fk_idaluno = 3 where fk_idaluno = 7;