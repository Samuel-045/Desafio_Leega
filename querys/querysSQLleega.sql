select * from estoque;
select * from enderecoUsuario;
select * from enderecoEditora;
select * from obra;
select * from editora;
select * from autor;
select * from cargo;
select * from devolucao;
select * from emprestimo;
select * from reserva;
select * from usuario;
select * from funcionario;
use biblioLeega2;
SELECT * FROM obra ORDER BY data_publicacao; -- 1

SELECT COUNT(*) AS total_obras FROM obra; -- 2

SELECT data_emprestimo, COUNT(*) AS quantidade_emprestimos
FROM emprestimo GROUP BY data_emprestimo
order by quantidade_emprestimos desc; -- 3

SELECT emprestimo.* FROM emprestimo
join funcionario on emprestimo.id_funcionario = funcionario.id_funcionario
WHERE funcionario.id_funcionario = (SELECT funcionario.id_funcionario FROM funcionario 
									WHERE nome_funcionario like '%Alice Meire%')     -- 4
AND HOUR(emprestimo.hora_emprestimo) BETWEEN 8 AND 9;

SELECT * FROM devolucao
WHERE data_devolucao BETWEEN '2012-03-29' AND '2013-02-02'; -- 5

SELECT * FROM reserva
WHERE data_reserva >= '2011-08-18' AND status_livro = 'Reservado'; -- 6

SELECT * FROM devolucao
WHERE data_devolucao < '2012-03-29'; -- 7

SELECT * FROM obra WHERE titulo_obra NOT 
IN ('O Conde de Monte Cristo', 'Filhos e Amantes'); -- 8

SELECT COUNT(*) AS 'Livros de Ficção' FROM 
obra WHERE genero = 'Ficção'; -- 9

SELECT obra.titulo_obra, editora.nome_editora, autor.nome_autor, 
MAX(estoque.quantidade_em_estoque) AS `Quantidade em estoque` FROM obra 
join editora on editora.id_editora = obra.id_editora 
join autor on autor.id_autor = obra.id_autor
join estoque on estoque.id_obra = obra.id_obra
group by obra.titulo_obra, editora.nome_editora, autor.nome_autor 
order by `Quantidade em estoque` Desc; -- 10

SELECT obra.titulo_obra, COUNT(emprestimo.id_obra) AS quantidade_emprestimos, estoque.quantidade_em_estoque -- 11
FROM obra
join estoque on estoque.id_obra = obra.id_obra
LEFT JOIN emprestimo ON obra.id_obra = emprestimo.id_obra
GROUP BY obra.titulo_obra , estoque.quantidade_em_estoque
ORDER BY estoque.quantidade_em_estoque ASC
LIMIT 1;

SELECT funcionario.nome_funcionario, COUNT(emprestimo.id_funcionario) AS total_emprestimos -- 12
FROM funcionario
JOIN emprestimo ON funcionario.id_funcionario = emprestimo.id_funcionario
WHERE funcionario.data_demissao = '9999-01-01'
GROUP BY funcionario.nome_funcionario;

SELECT genero, COUNT(*) AS total_publicacoes 
FROM obra GROUP BY genero ORDER BY total_publicacoes DESC; -- 13

UPDATE obra SET genero = 'Político'
Where id_obra = 29; -- 14

UPDATE enderecoUsuario SET bairro = 'Perdizes'
WHERE id_usuario = 25; -- 15

UPDATE estoque 
join obra on estoque.id_obra = obra.id_obra
SET estoque.quantidade_em_estoque = estoque.quantidade_em_estoque - 1
WHERE obra.titulo_obra IN ('Filho Nativo', 'Vidas Secas', 'Dom Casmurro'); -- 16

select * from usuario;
INSERT INTO usuario(id_usuario, nome_usuario, telefone, cpf)
VALUES
(31, 'Alfredo Tenttoni', '65495421', '02170251'),
(32, 'Cindy Crall', '58466577', '02182637'),
(33, 'Rubens Pardo', '51848978', '52412365'),  -- 17
(34, 'Carlos Pracidelli', '89457986', '23124005'),
(35, 'Ernesto Coimbra', '58442654', '05728368'); 
delete from usuario where id_usuario = 31; -- comando para excluir dados que a query já cadastrou anteriormente

SELECT nome_usuario, cpf, COUNT(cpf) AS Usuarios_duplicados
FROM usuario                                                -- 18
GROUP BY nome_usuario, cpf HAVING Usuarios_duplicados > 1;
	INSERT INTO usuario(id_usuario, nome_usuario, telefone, cpf) -- comando para ter dados duplicados 
	VALUES
	(36, 'Alfredo Tenttoni', '65495421', '02170251');

DELETE FROM usuario
WHERE id_usuario NOT IN (
  SELECT id_usuario
  FROM (
    SELECT MIN(id_usuario) AS id_usuario -- 19
    FROM usuario
    GROUP BY cpf
  ) AS subquery
);
SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;
SET SQL_SAFE_UPDATES = 1;
SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE obra ADD COLUMN valor_livro DECIMAL(10,2); -- 20
select * from obra;

ALTER TABLE devolucao
MODIFY multa_atraso VARCHAR(3); -- 21

UPDATE devolucao
SET multa_atraso = CASE
 WHEN multa_atraso = '0' THEN 'Não'
 WHEN multa_atraso = '1' THEN 'Sim' -- 22
END;
select * from devolucao;

ALTER TABLE OBRA DROP COLUMN valor_livro; -- 23

SELECT obra.titulo_obra, funcionario.nome_funcionario
FROM devolucao
join obra on obra.id_obra = devolucao.id_obra  -- 24
join funcionario on funcionario.id_funcionario = devolucao.id_funcionario
where devolucao.multa_atraso = 'Sim';

SELECT obra.titulo_obra, autor.nome_autor, autor.nacionalidade_autor, SUM(obra.valor_unitario) AS total
FROM obra
JOIN autor ON obra.id_autor = autor.id_autor
join emprestimo on obra.id_obra = emprestimo.id_obra  -- 25
WHERE autor.nacionalidade_autor != 'Brasileiro'
GROUP BY obra.titulo_obra, autor.nome_autor, autor.nacionalidade_autor;

SELECT usuario.nome_usuario, emprestimo.data_entrega
FROM emprestimo                                     -- 26
JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario
WHERE emprestimo.data_entrega = '2011-08-21';

SELECT obra.titulo_obra, estoque.quantidade_em_estoque, obra.valor_unitario 
FROM obra 
join estoque on estoque.id_obra = obra.id_obra WHERE 
data_publicacao < '2013-03-04'; -- 27

SELECT funcionario.nome_funcionario, cargo.nome_cargo, cargo.salario, 
Case
	When funcionario.data_demissao = '9999/01/01' 
	then 'Ativo'
	else 'inativo'                    -- 28
	end as 'Status'
FROM funcionario 
join cargo on funcionario.id_cargo = cargo.id_cargo    
ORDER BY funcionario.data_demissao desc;

SELECT obra.titulo_obra, autor.nome_autor, 
editora.nome_editora, estoque.quantidade_em_estoque
FROM obra join autor on obra.id_autor = autor.id_autor 
join editora on obra.id_editora = editora.id_editora join 
estoque on obra.id_obra = estoque.id_obra; -- 29

SELECT funcionario.nome_funcionario, departamento.nome_departamento
FROM funcionario
join departamento on funcionario.id_departamento = departamento.id_departamento
WHERE funcionario.idade_funcionario BETWEEN 30 AND 40;  -- 30

CREATE VIEW livros_valor AS
SELECT obra.titulo_obra, autor.nome_autor, obra.valor_unitario
FROM obra                                             -- 31
join autor on autor.id_autor = obra.id_autor
join estoque on estoque.id_obra = obra.id_obra;
select * from livros_valor; -- visualiacao da view

SELECT id_obra, titulo_obra, genero, valor_unitario 
FROM obra 
WHERE obra.valor_unitario > 90.00;   -- 32

UPDATE cargo
SET salario = salario * 1.12         -- 33
WHERE nome_cargo like '%Auxiliar Financeiro%';
select * from cargo; -- visualizacao da mudanca

UPDATE funcionario
SET data_demissao = LAST_DAY(CURDATE())
WHERE nome_funcionario like '%Alice Meire%';    -- 34
select * from funcionario;

SELECT titulo_obra, genero, data_publicacao FROM 
obra WHERE titulo_obra LIKE '%C%' AND 
data_publicacao BETWEEN '2011-01-01' AND '2013-12-31' ORDER BY genero;   -- 35

SELECT funcionario.nome_funcionario, funcionario.id_cargo -- 36
FROM funcionario
left join emprestimo on emprestimo.id_funcionario = funcionario.id_funcionario
WHERE funcionario.id_funcionario not IN (SELECT DISTINCT emprestimo.id_funcionario FROM emprestimo)
ORDER BY nome_funcionario;

SELECT cep, COUNT(cep) AS `Quantidade de ceps`
FROM enderecoUsuario													--  37
GROUP BY cep order by `Quantidade de ceps` desc;

SELECT usuario.nome_usuario, COUNT(enderecoUsuario.logradouro) AS `quantidade_enderecos` -- 38
FROM usuario
join enderecoUsuario on usuario.id_usuario = enderecoUsuario.id_usuario
GROUP BY usuario.nome_usuario
order by `quantidade_enderecos` desc;

SELECT obra.titulo_obra, usuario.nome_usuario AS responsavel       
FROM reserva                                                               -- 39
JOIN obra ON reserva.id_obra = obra.id_obra
JOIN usuario ON reserva.id_usuario = usuario.id_usuario
WHERE data_reserva = '2011-08-18' AND hora_reserva = '15:00:00';

SELECT usuario.nome_usuario, obra.titulo_obra, obra.valor_unitario 
FROM emprestimo
JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario             -- 40
JOIN estoque on estoque.id_obra = emprestimo.id_obra
JOIN obra ON emprestimo.id_obra = obra.id_obra
WHERE usuario.nome_usuario IN ('Emily Mall', 'Whitney Cinse');

SELECT usuario.nome_usuario, MIN(reserva.data_reserva) AS primeira_reserva,  
 MIN(emprestimo.data_emprestimo) AS primeiro_emprestimo,
 MIN(devolucao.data_devolucao) AS primeira_devolucao                          -- 41
FROM usuario
JOIN reserva ON usuario.id_usuario = reserva.id_usuario
JOIN emprestimo ON usuario.id_usuario = emprestimo.id_usuario
JOIN devolucao ON usuario.id_usuario = devolucao.id_usuario
GROUP BY usuario.nome_usuario
ORDER BY primeira_reserva ASC, primeiro_emprestimo ASC, primeira_devolucao ASC
LIMIT 1;

SELECT editora.nome_editora, Count(obra.id_editora) as 
"Quantidade de obras" FROM obra join editora on          -- 42
obra.id_editora = editora.id_editora group by obra.id_editora;    

SELECT usuario.nome_usuario, obra.titulo_obra, DATEDIFF('2014-01-01', emprestimo.data_emprestimo) as "Dias de atraso",   CASE  -- 43
        WHEN 
			DATEDIFF('2014-01-01', emprestimo.data_emprestimo) > 5 
        THEN 
            (DATEDIFF('2014-01-01', emprestimo.data_emprestimo) - 5) * 5
        ELSE 
            0
    END AS multa
FROM emprestimo
JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario
JOIN obra ON emprestimo.id_obra = obra.id_obra
WHERE emprestimo.id_emprestimo not in (select distinct id_emprestimo from devolucao);

SELECT usuario.nome_usuario, usuario.cpf, enderecoUsuario.logradouro -- 44
FROM usuario
join enderecoUsuario on usuario.id_usuario = enderecoUsuario.id_usuario
WHERE logradouro LIKE 'Avenida%'
ORDER BY cpf DESC;

SELECT obra.titulo_obra, COUNT(emprestimo.id_obra) AS total_emprestimos 
FROM emprestimo
JOIN obra ON emprestimo.id_obra = obra.id_obra                               -- 45
WHERE emprestimo.data_emprestimo BETWEEN '2011-01-01' AND '2013-12-31'
GROUP BY obra.titulo_obra
HAVING total_emprestimos > 1;

SELECT titulo_obra, valor_unitario, 
					ROUND((SELECT AVG(valor_unitario) FROM obra),2) as `Valor médio`    -- 46
FROM obra
WHERE valor_unitario < (SELECT AVG(valor_unitario) FROM obra)
Group by titulo_obra,valor_unitario;

select F.nome_funcionario, C.nome_cargo, D.nome_departamento, C.salario,  -- 47
					(select round(avg(salario),2) from Cargo) as 'Média_Salarial' 
from Funcionario as F
inner join Cargo as C on F.id_cargo = C.id_cargo
inner join Departamento as D on F.ID_Departamento = D.ID_Departamento
where C.Salario > (select round(avg(Salario),2) from Cargo);

SELECT UPPER(usuario.nome_usuario) AS nome           -- 48
FROM usuario
WHERE id_usuario NOT IN (SELECT DISTINCT id_usuario FROM emprestimo);

SELECT usuario.id_usuario, usuario.nome_usuario, enderecoUsuario.cep    -- 49
FROM emprestimo
JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario
JOIN obra ON emprestimo.id_obra = obra.id_obra
join enderecoUsuario on emprestimo.id_usuario = enderecoUsuario.id_usuario
GROUP BY usuario.id_usuario, usuario.nome_usuario, enderecoUsuario.cep
HAVING COUNT(emprestimo.id_usuario) > 3
ORDER BY enderecoUsuario.cep ASC;

SELECT obra.genero, SUM(estoque.qtde_disponivel) AS disponiveis,     -- 50
 SUM(estoque.quantidade_em_estoque - estoque.qtde_disponivel) AS emprestados
FROM obra
join estoque on estoque.id_obra = obra.id_obra
GROUP BY obra.genero;

SELECT HOUR(hora), COUNT(*) AS total_movimentacoes -- 51
FROM (
 SELECT hora_emprestimo as hora FROM emprestimo
 UNION ALL
 SELECT hora_devolucao as hora FROM devolucao
 UNION ALL
 SELECT hora_reserva as hora FROM reserva
) AS movimentacoes
GROUP BY HOUR(hora)
ORDER BY total_movimentacoes DESC;

SELECT * 
FROM (                                             -- 52 
	SELECT autor.nome_autor, COUNT(emprestimo.id_obra) AS total_lidos 
	FROM emprestimo
	JOIN obra ON emprestimo.id_obra = obra.id_obra
	join autor on autor.id_autor = obra.id_autor
	WHERE emprestimo.data_emprestimo BETWEEN '2012-01-01' AND '2013-12-31'
	GROUP BY autor.nome_autor
	ORDER BY total_lidos DESC
	LIMIT 3
) AS subquery1

UNION ALL

SELECT * 
FROM (
  SELECT autor.nome_autor, COUNT(emprestimo.id_obra) AS total_lidos 
	FROM emprestimo
	JOIN obra ON emprestimo.id_obra = obra.id_obra
	join autor on autor.id_autor = obra.id_autor
	WHERE emprestimo.data_emprestimo BETWEEN '2012-01-01' AND '2013-12-31'
	GROUP BY autor.nome_autor
	ORDER BY total_lidos ASC
	LIMIT 3
) AS subquery2;

SELECT 
    Funcionario.nome_funcionario,          -- 53
    COUNT(DISTINCT Emprestimo.id_emprestimo) AS total_emprestimos,
    COUNT(DISTINCT Devolucao.id_devolucao) AS total_devolucoes
FROM Funcionario
LEFT JOIN Emprestimo ON Funcionario.id_funcionario = Emprestimo.id_funcionario
LEFT JOIN Devolucao ON Funcionario.id_funcionario = Devolucao.id_funcionario
GROUP BY Funcionario.nome_funcionario
order by total_emprestimos desc;

SELECT usuario.nome_usuario, usuario.telefone, editora.nome_editora  -- 54
FROM enderecousuario
join enderecoEditora on enderecoUsuario.logradouro = enderecoEditora.logradouro 
join usuario on enderecousuario.id_usuario = usuario.id_usuario
join editora on enderecoEditora.id_editora = editora.id_editora
where enderecoeditora.logradouro = enderecousuario.logradouro;

CREATE VIEW livros_leya AS
SELECT obra.titulo_obra, obra.valor_unitario
FROM obra								          -- 55
join editora on editora.id_editora = obra.id_editora
WHERE editora.nome_editora = 'Leya';
select * from livros_leya;

UPDATE obra
join editora on editora.id_editora = obra.id_editora -- 56
SET obra.valor_unitario = obra.valor_unitario * 1.16
WHERE editora.nome_editora = 'Saraiva';
select * from obra join editora on editora.id_editora = obra.id_editora where editora.nome_editora = "Saraiva";

SELECT * 
FROM (                                              -- 57
  SELECT obra.titulo_obra, autor.nome_autor, editora.nome_editora, obra.numero_publicacao
  FROM obra
  JOIN autor ON obra.id_autor = autor.id_autor
  JOIN editora ON obra.id_editora = editora.id_editora
  ORDER BY obra.numero_publicacao ASC
  LIMIT 5
) AS subquery1

UNION ALL

SELECT * 
FROM (
  SELECT obra.titulo_obra, autor.nome_autor, editora.nome_editora, obra.numero_publicacao
  FROM obra
  JOIN autor ON obra.id_autor = autor.id_autor
  JOIN editora ON obra.id_editora = editora.id_editora
  ORDER BY obra.numero_publicacao DESC
  LIMIT 5
) AS subquery2;

SELECT nome_usuario, CONCAT('193.***.***-', SUBSTRING(cpf, -2)) AS cpf_mascarado -- 58
FROM usuario
WHERE cpf LIKE '193%';

