show databases;

use aula_sql;

SELECT nome, salario, COALESCE(salario * 12, 0) AS "Salário anual", COALESCE(salario * 12, 0) + 10000
FROM jogador
WHERE COALESCE(salario * 12, 0) >= 1800000
ORDER BY "Salário anual" DESC;

SELECT UPPER(nome) AS TIME
,   LOWER(nome) AS 'Time de minusculo'
,   nome
,   estado
,   idTime
FROM    time
WHERE   UPPER(estado) = 'MG';

select 	nome
,		COALESCE(salario,0) * 12 as "Salario anual"
,		salario
,		idtime
from 	jogador
where 	idTime is not null;
#quando o professor usar ISNULL eu uso o COALESCE
# porem o IS NOT NULL eu posso usar normalmente pois ele é universal

SELECT idtime, nome, CONCAT(nome, '/', COALESCE(estado, 'Sem estado')) AS "time e estado"
FROM time;

select *
from jogador
where nome like '%l_';
-- <>%<> significa que vai puxar o nome do jogador que começa ou termina com determinada letra
-- %l_ significa que vai puxar o nome do jogador que a penultima letra é <L>

select 	nome
     ,		INSTR('r', nome)
     ,		substring(nome, INSTR(' ', nome), 3)
from 	jogador
where   nome like '% %';

SELECT nome,
       INSTR(nome, ' '),
       SUBSTR(nome, INSTR(nome, ' ') + 1, 2)
FROM jogador
WHERE INSTR(nome, ' ') > 0;
-- quando o professor usa CHARINDEX eu devo usar o INSTR

select j.nome AS jogador,
       salario,
       t.nome AS Time
from jogador j
inner join time t
on  j.idTime = t.idTime
where j.idTime = 1