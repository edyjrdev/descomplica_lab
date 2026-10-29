--ORACLE SQL
-- https://freesql.com/
-- SCHEMA My Schema

drop table aluno;

CREATE TABLE aluno
(
    ra number(5) primary key,
    nome varchar2(100),
    cpf varchar2(11) unique,
    data_nasc date,
    data_matricula date,
    sexo char(1) check (sexo='M' or sexo='F' or sexo='O')
);

describe aluno;

--drop table aluno;

--Constraints
-- primary key
-- foreign key
-- unique
-- not null
-- check (dominio de valores). Ex check (stars between 1 e 5)


create table disciplina
(
    cod_disc number(3) primary key,
    nome_dics varchar2(50) not null,
    carga_horaria number(3)
);

create table professor 
(
    rp number(5) primary key,
    nome_prof varchar2(150) not null,
    dt_nasc date,
    sexo char(1) check (sexo='M' or sexo='F' or sexo='O'),
    cpf varchar2(11) unique,
    cod_disc number(3) references disciplina (cod_disc)
);

-- alterar tabelas
-- ALTER TABLE ADD/MODIFY/DROP

alter table aluno
    ADD endereco varchar2(255);
alter table aluno
    ADD cidade varchar2(150);
alter table aluno
    ADD uf char(2);

alter table aluno
    MODIFY endereco varchar2(300);

alter table aluno
    DROP column endereco;

create table dummie
(
    id number(5) primary key,
    descricao varchar2(50)
);

rename dummie to temp;

create table departamento (
    depnum number(2,0) primary key,
    nome varchar2(100) not null,
    loc varchar2(100)
);

describe departamento;

insert into departamento (depnum, nome, loc) values (10, 'Tecnologia', 'DF');
insert into departamento (depnum, nome, loc) values (11, 'Comercial', 'SP');
insert into departamento (depnum, nome, loc) values (12, 'Administrativo', 'SP');

select * from departamento;

insert into departamento values (13, 'Estoque', 'RJ');
insert into departamento values (15, 'Diretoria', null); -- insere nulo no loc

alter table departamento 
    add dt_criacao date;

DESCRIBE departamento;

update departamento set dt_criacao = CURRENT_DATE
    where loc = 'DF';

select CURRENT_DATE from dual;

select * from departamento;

update departamento set loc = 'US'
where depnum = 15;

update departamento set dt_criacao = CURRENT_DATE
    where loc = 'SP';

delete from departamento 
where dt_criacao is null;

select * from departamento;

delete from departamento; -- limpa tabela

--Schema SCOTT

--- projecao = selecao de colunas

describe scott.emp;

select * 
from scott.emp;

select 
    ename nome, 
    sal "Salário do Func",
    job as "Cargo do Func" 
from scott.emp;

SELECT
    ename nome, 
    sal "Salário do Func",
    sal * 12 as "Salário Anual"
from scott.emp;

--simular aumento de 
SELECT
    ename nome, 
    sal "Salário do Func",
    sal * 11/100 as "Aumento 11%",
    sal + (sal * 10/100) as "Salário com aumento"
from scott.emp;

--concatenacao
SELECT
    ename, job, ename ||' é '|| job as "Nome / Cargo"
from scott.emp;

-- sem repetição de valroes
SELECT distinct
    job
from scott.emp;

-- 
select ename, job, deptno
from scott.EMP
where job = 'CLERK';

select ename, sal, comm
from scott.EMP
where sal<=comm;

select ename, sal, comm
from scott.EMP
where sal between 1000 and 1500;

select empno, ename, sal, mgr
from scott.EMP
where mgr in (7902,7566,7788);

--- like % _

--começa com S
select empno, ename, sal, mgr
from scott.EMP
where ename like 'S%';

--segunda letra com A
select empno, ename, sal, mgr
from scott.EMP
where ename like '_A%';

select empno, ename, sal, mgr
from scott.EMP
where mgr is null;

select empno, ename, job, sal
from scott.EMP
where sal >= 1100 or job = 'CLERK';

select empno, ename, job, sal
from scott.EMP
where sal > 1100 and not job = 'CLERK';

select ename, job
from scott.emp
where job not in ('CLERK', 'MANAGER', 'ANALYST');

select ename, job, deptno, hiredate
from scott.emp
order by hiredate;

select ename, sal
from scott.emp
where sal>=1500;

select ename, sal, job
from scott.emp
where sal between 500 and 2000;

select ename, sal, comm
from scott.emp
where comm is null;


select ename, sal, comm
from scott.emp
where sal > 1000 and job = 'CLERK';

select ename, sal, comm
from scott.emp
order by ename;

select ename, sal, comm
from scott.emp
order by ename;

-- operacoes
select ename,sal, 12 * (sal + 110) as "Salario com BonusS"
from scott.emp;

select ename, job, sal, ename ||' é '|| job ||' ganha '|| sal as mensagem
from scott.emp;

select distinct job
from scott.emp
order by job;

-- funcoes de caractere
-- lower, upper, initcap
-- concat, substr, length, instr, lpad, trim (remove caracteres)

select empno, ename, deptno
from scott.EMP
where upper(ename) = upper('blake');

select ename, concat(ename, '-', job), length(ename), instr(ename, 'A')
from scott.EMP
where substr(job, 1, 5) = 'SALES';

-- round(, d)
-- trunc(,d)
-- mod(n,d) - resto
-- power(n, e)
-- sqrt(n) - raiz quadrada
-- floor(n)
-- ceil(n) 


select round(45.923, 2), round( 45.923, 0), round(45.923, -1)
from dual;

select trunc(45.923, 2), trunc( 45.923), trunc(45.923, -1)
from dual;

select ename, sal, comm, mod(sal, comm)
from scott.emp
where job = 'SALESMAN';

select ename, upper(ename), lower(ename), initcap(ename)
from scott.emp;

select ename, concat(ename, ' ', job), substr(ename, 1, 3), instr(ename, 'S'), length(ename)
from scott.emp;

select round((sal / comm), 2), trunc((sal / comm),1)
from scott.emp
where job = 'SALESMAN' and comm > 0;

-- datas
-- sysdate
-- mounth_between(date1, date2) - diferença em meses entre duas datas
-- add_months(date, n) - adiciona n meses a uma data


select ename, (sysdate - hiredate) / 7 as "semanas"
from scott.emp
where deptno = 10;

--Conversoes
-- TO_NUMBER
-- TO_CHAR
-- TO_DATE  

-- TO_CHAR(date, 'fmt')
--TO_CHAR(date, 'YEAR')
--TO_CHAR(date, 'YYYY-MM')
--TO_CHAR(date, 'YYYY-MM-DD')

select sysdate from dual;

select to_char(sysdate, 'YYYY-MM-DD') as dt_format from dual;
select to_char(sysdate, 'YEAR') as ano_corrente from dual;
select to_char(sysdate, 'DAY') as dia_corrente from dual;

select ename, to_char(hiredate, 'YYYY-MM-DD') as dt_contratacao, trunc((sysdate - hiredate) / 365) as anos_completos_trabalhados
from scott.emp;

select ename, sal, to_char(sal, 'L999,999.99')
from scott.emp;

-- NVL
-- NVL(comm, 0) - substitui valores nulos por 0
-- NVL(hiredate, '01-JAN-1900') - substitui valores nulos pela data mais antiga
-- NVL(sal, 0) - substitui valores nulos por 0
-- NVL(job, 'Sem cargo') - substitui valores nulos por 'Sem cargo'

select ename, sal, nvl(comm, 0) as valcomm, sal * 12 + nvl(comm, 0) as salario_anual
from scott.emp;

-- DECODE = CASE OU IF THEN ELSE
select ename, job, sal,
       decode(job, 
        'MANAGER', sal * 1.15, 
        'CLERK', sal * 1.10, 
        'SALESMAN', sal * 1.12  , 
        sal * 1.0) as salario_bonificado
from scott.emp;

-- CASE
select ename, job, sal,
    CASE WHEN job = 'CLERK' THEN sal * 2 
         WHEN job = 'MANAGER' THEN sal * 1.15
         WHEN job = 'SALESMAN' THEN sal * 1.12
         ELSE sal * 1.0
    END as salario_bonificado
from scott.emp;