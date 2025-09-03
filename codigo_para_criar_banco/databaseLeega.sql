create database BiblioLeega2;

use BiblioLeega2;

CREATE TABLE Cargo(
	id_cargo INTEGER PRIMARY KEY NOT NULL,
	nome_cargo VARCHAR(255),
	salario decimal(10,0)
);

select * from cargo;
INSERT INTO Cargo(id_cargo, nome_cargo, salario)
VALUES (1, 'Diretor', 20000),
		(2, 'Gerente', 8000),
		(3, 'Coordenador de Finanças', 7000),
		(4, 'Coordenador Contabil', 7000),
		(5, 'Coordenador de RH', 6000),
		(6, 'Coordenador de TI', 7000),
		(7, 'Analista de Sistemas', 3000),
		(8, 'Analista de Suporte', 2500),
		(9, 'Auxiliar Financeiro', 1700),
		(10, 'Auxiliar Contábil', 1700),
		(11, 'Auxiliar de RH', 1300),
		(12, 'Recepcionista', 1000);

CREATE TABLE Departamento(
	id_departamento INTEGER PRIMARY KEY NOT NULL,
	nome_departamento VARCHAR(255)
);

INSERT INTO Departamento(id_departamento, nome_departamento)
VALUES (1, 'Diretoria'),
		(2,  'Gerência'),
		(3, 'Financeiro'),
		(4, 'Contábil'), 
		(5, 'TI'),
		(6, 'Recursos Humanos'),
		(7, 'Recepção');

-- Tabela Funcionario
CREATE TABLE Funcionario(
	id_funcionario INTEGER PRIMARY KEY NOT NULL,
	id_cargo INTEGER,
	id_departamento INTEGER,
	nome_funcionario VARCHAR(255),
    idade_funcionario int,
	data_admissao DATE,
	data_demissao DATE,
	FOREIGN KEY (id_cargo) REFERENCES Cargo(id_cargo),
	FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento) 
);

INSERT INTO Funcionario(id_funcionario, id_cargo, id_departamento, nome_funcionario, data_admissao, data_demissao, idade_funcionario)
VALUES (1, 12, 7, 'Fabriola Pereira', '2000/10/01', '2012/10/09',27),
		(2, 2, 2, 'Carlos Meireles', '1995/11/04', '9999/01/01',45),
		(3, 1, 1, 'Adalberto Cristovão', '1990/11/07', '9999/01/01',30),
		(4, 1, 1, 'Camilla Prado', '1985/10/10', '9999/01/01',27),
		(5, 2, 2, 'Marcio Tales de Souza', '1981/09/01', '9999/01/01',37),
		(6, 6, 5, 'Fernando da Silva', '1976/10/04', '9999/01/01',29),
		(7, 3, 3, 'Barbara Maria', '1971/11/07', '9999/01/01',36),
		(8, 12, 7, 'Alice Meire ', '1966/10/10', '9999/01/01',23),
		(9, 5, 6, 'João Da Silva', '1962/09/01', '9999/01/01',49),
		(10, 4, 4, 'Marcos Prado', '1957/10/04', '9999/01/01',20),
		(11, 12, 7, 'Claudia Cristina', '2012/10/10', '9999/01/01',32);

Select * FROM Funcionario; 

-- Tabela Autor
CREATE TABLE Autor (
    id_autor INTEGER PRIMARY KEY NOT NULL,
    nome_autor VARCHAR(255),
    nacionalidade_autor VARCHAR(60)
);
select * from autor;

INSERT INTO Autor(id_autor, nome_autor, nacionalidade_autor)
VALUES (1, 'Alberto Mussa',"Argentino"),
	   (2, 'Aluísio de Azevedo',"Português"),
       (3,	'Ariano Suassuna',"Espanhol"),
       (4,	'Autran Dourado',"Brasileiro"),
	   (5,	'Bernardo Guimarães',"Português"),
       (6,	'Casimiro de Abreu',"Espanhol"),
       (7,	'Carlos Heitor Cony',"Uruguaio"),
       (8,	'Clarice Lispector',"Brasileira"),
       (9,	'Denis Mandarino',"Brasileiro"),
       (10,	'George Raymond Richard Martin',"Argentino"),
       (11,	'John Ronald Reuel Tolkien', "Argentino"),
       (12,	'Clive Staples Lewis',"Uruguaio"),
       (13,	'Edgar Allan Poe',"Uruguaio"),
       (14, 'Rick Riordan',"Argentino"),
       (15, 'Alexandre Dumas',"Brasileiro");
describe auto;

-- Tabela Editora
CREATE TABLE Editora(
	id_editora INTEGER PRIMARY KEY NOT NULL,
	nome_editora VARCHAR(255)
);

SELECT * FROM Editora;
INSERT INTO Editora(id_editora, nome_editora)
VALUES 
		(1, 'Aleph'),
		(2, 'Moderna'),
		(3, 'Saraiva'),
		(4, 'Ática'),
		(5, 'Casa'),
		(6, 'Leya'),
		(7, 'Draco'),
		(8, 'Nova');

INSERT INTO Editora(id_editora, nome_editora)
VALUES (9, 'Firmamento');

-- Endereco Editora
CREATE TABLE EnderecoEditora(
	id_endereco_editora INTEGER PRIMARY KEY NOT NULL,
	id_editora INTEGER,
	logradouro VARCHAR(255),
	bairro VARCHAR(100),
	cidade VARCHAR(100),
	estado VARCHAR(50),
	cep VARCHAR(15),
	FOREIGN KEY (id_editora) REFERENCES Editora(id_editora)
);

SELECT * FROM EnderecoEditora;

INSERT INTO EnderecoEditora(id_endereco_editora, id_editora, logradouro, bairro, cidade, estado, cep)
VALUES 
    (1, 1, 'Rua Funchal 1000', 'Vila Olímpia', 'São Paulo', 'SP', 04551060),
    (2, 2, 'Avenida Ibirapuera 300', 'Moema', 'São Paulo', 'SP', 04028001),
    (3, 3, 'Avenida Interlagos 247', 'Jardim Marajoara', 'São Paulo', 'SP', 04661200),
    (4, 4, 'Avenida José Carlos Pace 23', 'Centro', 'Boituva', 'SP', 18550000),
    (5, 5, 'Avenida Pres. Juscelino Kubitschek 45', 'Nova Marabá', 'Marabá', 'PA', 68507000),
    (6, 6, 'Avenida Brigadeiro Luís Antônio 48', 'Bela Vista', 'São Paulo', 'SP', 01318900),
    (7, 7, 'Marginal Pinheiros 69', 'Brooklin', 'São Paulo', 'SP', 04571010),
    (8, 8, 'Avenida Nossa Senhora do Sabará 65', 'Vila Emir', 'São Paulo', 'SP', 04447010);

-- Tabela Obra
CREATE TABLE Obra( 
	id_obra INTEGER PRIMARY KEY NOT NULL,
	id_editora INTEGER,
	id_autor INTEGER,
	titulo_obra VARCHAR(255),
	numero_publicacao INTEGER,
	genero VARCHAR(20), 
	data_publicacao DATE,
	valor_unitario DECIMAL(10,2),
	FOREIGN KEY (id_editora) REFERENCES Editora(id_editora),
	FOREIGN KEY (id_autor) REFERENCES Autor(id_autor)
);

INSERT INTO	Obra(id_obra, id_editora, id_autor, titulo_obra, numero_publicacao, genero, data_publicacao, valor_unitario)
VALUES  
		(1, 1,	15, 'O Conde de Monte Cristo', 12, 'Auto Ajuda', '2005-05-10',90.00),
		(2, 2,	12, 'Tratado de Confissom', 5 ,'Filosofia', '2010-12-31',55.00),
        (3, 5, 10, 'Triste Fim de Policarpo Quaresm', 3, 'Política', '2001-03-05',20.00), 
        (4, 8, 14, 'Tratado da Natureza Humana', 78, 'Romance', '2002-05-14',64.32),
        (5, 7, 8, 'Farsa de Inês Pereira', 2, 'Religioso', '1986-04-25',97.35),    
        (6, 6, 15, 'Filho Nativo', 45, 'Poema', '2004-06-12',98.65),     
        (7, 6, 10, 'Jogo Dos Tronos', 6, 'Ficção', '2001-08-26',41.63),                   
        (8, 8, 13, 'Diabo dos Números', 2, 'Terror', '1981-08-31',65.48),                 
        (9, 6, 10, 'Furia dos Reis', 1, 'Estrangeiro',	'2008-08-06',53.25),               
        (10, 6, 1, 'Filhos e Amantes', 98, 'Infanto Juvenil', '2005-09-01',87.10),         
        (11, 5, 3, 'Finis Patriae', 46, 'Política',	'2013-03-04',106.25),       
        (12, 5, 3, 'Finnegans Wake', 2, 'Romance', '2013-09-30',115.85),                 
        (13, 1, 15, 'Os Três Mosqueteiros', 2, 'Romance', '1953-03-06',86.54),             
        (14, 3, 6, 'Falcão de Malta', 2, 'Auto Ajuda', '2010-01-02',97.21),           
        (15, 2, 14, 'Vidas Secas', 45, 'Filosofia',	'2004-07-09',37.15),              
        (16, 4, 2, 'Flores sem Fruto', 1, 'Política', '2001-08-15',21.45),                 
        (17, 7, 4, 'Deixados para Trás', 8, 'Política',	'1931-09-12',25.35),               
        (18, 8, 12, 'Deus das Moscas', 2, 'Romance', '2003-09-25',85.37),             
        (19, 4, 11, 'Senhor dos Aneis', 4, 'Ficção', '1989-02-28',60.50),                
        (20, 3, 7, 'Fluviais', 8, 'Terror',	'2011-03-18',94.20),    
        (21, 2, 2, 'Folhas Caídas', 1, 'Ficção', '2010-09-19',55.00),                      
        (22, 6, 5, 'Força das Coisas', 24, 'Terror', '1985-11-25',85.00),                  
        (23, 5, 15, 'Fortaleza de Sharpe', 81, 'Política', '2001-01-01',122.50),            
        (24, 1, 9, 'Frankenstein', 8, 'Romance', '2010-12-13',105.00),
        (25, 7, 11, 'Rei Arthur', 85, 'Religioso', '1999-07-15',80.00),                    
        (26, 6, 6, 'Dom Casmurro', 2, 'Poema', '2011-08-15',108.25),                  
        (27, 4, 8, 'Dia dos Gafanhotos', 85, 'Política', '2011-11-11',57.25),              
        (28, 8, 12, 'Diabo dos Números', 2, 'Romance', '2013-05-06',101.00),            
        (29, 2, 3, 'Discurso do Método', 8, 'Religioso', '2012-08-06',82.12),              
        (30, 3, 10, 'Arte Da Guerra', 8, 'Romance', '1913-05-01',90.32);

CREATE TABLE Estoque(
	id_estoque INTEGER PRIMARY KEY NOT NULL,
	id_obra INTEGER,
	quantidade_em_estoque INTEGER,
	qtde_disponivel INTEGER,
	data_atualizacao DATE,
	FOREIGN KEY (id_obra) REFERENCES Obra(id_obra)
);
INSERT INTO Estoque(id_estoque, id_obra, quantidade_em_estoque, qtde_disponivel, data_atualizacao)
VALUES
	(1, 1, 5, 1,'2013-12-15'),
	(2, 2, 12, 10,'2013-12-20'),
	(3, 3, 4, 2,'2014-01-01'),
	(4, 4, 4, 0,'2013-12-15'),
	(5, 5, 23, 18,'2014-01-01'),
	(6, 6, 13, 11,'2014-01-01'),
	(7, 7, 33, 28,'2013-12-20'),
	(8, 8, 6, 4,'2014-01-01'),
	(9, 9, 15, 12,'2013-12-15'),
	(10, 10, 4, 0,'2013-12-15'),
	(11, 11, 15, 13,'2014-01-01'),
	(12, 12, 6, 1,'2014-01-01'),
	(13, 13, 19, 14,'2013-12-20'),
	(14, 14, 7, 5,'2014-01-01'),
	(15, 15, 26, 22,'2014-01-01'),
	(16, 16, 16, 11,'2014-01-01'),
	(17, 17, 25, 15,'2013-12-15'),
	(18, 18, 9, 6,'2014-01-01'),
	(19, 19, 15, 12,'2013-12-20'),
	(20, 20, 9, 6,'2014-01-01'),
	(21, 21, 10, 7,'2013-12-15'),
	(22, 22, 15, 11,'2013-12-15'),
	(23, 23, 17, 16,'2013-12-20'),
	(24, 24, 64, 59,'2013-12-15'),
	(25, 25, 17, 14,'2014-01-01'),
	(26, 26, 25, 22,'2013-12-20'),
	(27, 27, 2, 0,'2014-01-01'),
	(28, 28, 7, 3,'2014-01-01'),
	(29, 29, 3, 0,'2014-01-01'),
	(30, 30, 16, 14,'2014-01-01');


-- Tabela Usuario
CREATE TABLE Usuario(
	id_usuario INTEGER PRIMARY KEY NOT NULL,
	nome_usuario VARCHAR(40),
	telefone NUMERIC(15),
	cpf NUMERIC(14)
);

SELECT * FROM Usuario;

INSERT INTO Usuario(id_usuario, nome_usuario, telefone, cpf)
VALUES 
	(1, 'Antonio Marcos da Silva', 58442647, 19310721421),
	(2, 'Carlos Drummond de Andrade', 58442649, 19310765547),
	(3, 'Juliana Bento Souza', 58795469, 12214765547),
	(4, 'Arlene Batista', 58465486, 12214765522),
	(5, 'Bret Berlusconi', 58442647, 19310721452),
	(6, 'Cindy Crall', 58465489, 19310721449),
	(7, 'Donatello Siqueira', 58465487, 19310765529),
	(8, 'Emily Mall', 12545648,  19310721432),
	(9, 'Franklin Pekens', 58442649, 19310721456),
	(10, 'Gert Hender', 58466578, 12214765551),
	(11, 'Harvey Jonks', 58795469, 19310765521),
	(12, 'Irene Silva', 12545649, 12214765552),
	(13, 'Jose Albino', 58442650, 19310721427),
	(14, 'Katia Suellen', 58466578, 12214765523),
	(15, 'Lee Shimizu', 58795469, 12214765531),
	(16, 'Maria Aparecida', 12545650, 19310721433),
	(17, 'Nate Rogan', 58442651, 19310721464),
	(18, 'Ophelia Maria', 58466580, 12214765555),
	(19, 'Philippe Coutinho', 58795471, 19310765522),
	(20, 'Rina Pontes', 58445651, 12214765556),
	(21, 'Sean Woods', 58442652, 19310765571),
	(22, 'Tammy Miranda', 58466581, 12214765557),
	(23, 'Vicente Del Bosque', 58795474, 19310721475),
	(24, 'Whitney Cinse', 12545654, 12214765558),
	(25, 'Alberto Roberto', 58442653, 19310721433),
	(26, 'Beryl Berey', 58466582, 12214765559),
	(27, 'Chris Nicolas', 58442654, 19310721467),
	(28, 'Debby Loyd', 58466583, 12214765542),
	(29, 'Ernesto Coimbra', 58442655, 19310721432),
	(30, 'Florence Seedorf', 58466584, 12214765545);

CREATE TABLE EnderecoUsuario(
	id_endereco_usuario INTEGER PRIMARY KEY NOT NULL,
	id_usuario INTEGER,
	logradouro VARCHAR(100),
	bairro VARCHAR(100),
	cidade VARCHAR(100),
	estado VARCHAR(50),
	cep VARCHAR(15),
	FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

Select * FROM EnderecoUsuario;

INSERT INTO EnderecoUsuario(id_endereco_usuario, id_usuario, logradouro, bairro, cidade, estado, cep)
VALUES 
	(1, 1, 'Avenida 23 de Maio 21', 'Jardim das Árvores', 'São Paulo', 'SP',  05728354),
	(2, 2, 'Rua Martins Fontes 252', 'Parque Industrial', 'Campinas', 'SP',  05728355),
	(3, 3, 'Avenida dos Bandeirantes 20', 'Residencial Dourados', 'São Paulo', 'SP', 08128639),
	(4, 4, 'Avenida Eng. Luis Carlos Berrini 12', 'Vila Água Bonita', 'Piracicaba', 'SP', 08128636),
	(5, 5, 'Rua da Consolação 14', 'Vila Brasil', 'São Paulo', 'SP', 05728356),
	(6, 6, 'Rua Ipiranga 123', 'Vila Cristal', 'Campinas', 'SP', 08128637),
	(7, 7, 'Avenida Brigadeiro Faria Lima 50', 'Vila das Árvores', 'São Paulo', 'SP', 08128639),
	(8, 8, 'Rua Funchal 1000', 'Vila das Nações', 'São Paulo', 'SP', 08128638),
	(9, 9, 'Avenida Ibirapuera 300', 'Vila do Lago', 'São Paulo', 'SP', 05728358),
	(10, 10, 'Avenida Interlagos 247', 'Vila dos Estados', 'São Paulo', 'SP', 08128639),
	(11, 11, 'Avenida José Carlos Pace 23', 'Vila dos Pássaros', 'São Paulo', 'SP', 08128639),
	(12, 12, 'Avenida Pres. Juscelino Kubitschek 45', 'Vila Dourados', 'São Bernardo do Campo', 'SP', 08128640),
	(13, 13, 'Avenida Brigadeiro Luis Antonio 48', 'Água Aguinha', 'São Paulo', 'SP', 05728360),
	(14, 14, 'Marginal Pinheiros 69', 'Água Bonita', 'São Paulo', 'SP', 08128641),
	(15, 15, 'Avenida Nossa Sra. do Sabará 65', 'Conceição', 'São Paulo', 'SP', 08128641),
	(16, 16, 'Avenida Nove de Julho 72', 'Conjunto Metalúrgicos', 'São Paulo', 'SP', 08128642),
	(17, 17, 'Rua Olimpíadas 68', 'Continental', 'São Paulo', 'SP', 05728362),
	(18, 18, 'Avenida Rebouças 2581', 'Distrito Industrial Altino', 'São Paulo', 'SP', 08128643),
	(19, 19, 'Avenida do Rio Bonito 2541', 'Distrito Industrial Anhanguera', 'São Paulo', 'SP', 08128644),
	(20, 20, 'Avenida Robert Kennedy 3965', 'Distrito Industrial Autonomistas', 'São Paulo', 'SP', 08128644),
	(21, 21, 'Avenida Jornalista Roberto Marinho 698', 'Distrito Industrial Centro', 'São Paulo', 'SP', 05728364),
	(22, 22, 'Avenida Santo Amaro 5879', 'Distrito Industrial Mazzei', 'São Paulo', 'SP', 08128645),
	(23, 23, 'Rua Maria Imaculada 6598', 'Distrito Industrial Remédios', 'São Paulo', 'SP', 05728365),
	(24, 24, 'Avenida Washington Luis 654747', 'Helena Maria', 'São Paulo', 'SP', 08128645),
	(25, 25, 'Avenida Alfredo Maia 584', 'IAPI', 'São Paulo', 'SP', 05728366),
	(26, 26, 'Avenida Alfredo Maluf 265', 'Jaguaribe', 'São Paulo', 'SP', 08128647),
	(27, 27, 'Avenida Alfredo Pujol 987', 'Jardim D Abril', 'São Paulo', 'SP', 05728367),
	(28, 28, 'Avenida Amazonas 574', 'Jardim das Flores', 'São Paulo', 'SP', 08128648),
	(29, 29, 'Avenida Ampére 414', 'Jardim Elvira', 'Santo André', 'SP', 05728368),
	(30, 30, 'Avenida Ana Camargo 174', 'Jardim Mutinga', 'Santo André', 'SP', 08128649);

-- Tabela emprestimo
CREATE TABLE Emprestimo(
	id_emprestimo INTEGER PRIMARY KEY NOT NULL,
	id_funcionario INTEGER,
	id_usuario INTEGER,
	id_obra INTEGER,
	data_emprestimo DATE,
	hora_emprestimo	TIME,
	data_entrega date,
	FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
	FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
	FOREIGN KEY (id_obra) REFERENCES Obra(id_obra)
);

INSERT INTO Emprestimo(id_emprestimo, id_funcionario, id_usuario, id_obra, data_emprestimo, hora_emprestimo, data_entrega)
VALUES -- 4
	(1, 1, 1, 10, '2011-08-15','08:00:00','2011-08-17'),
	(2, 8, 20, 14, '2011-09-26','8:00','2011-09-28'),
	(3, 8, 13, 18, '2011-07-11','10:00','2011-07-13'),
	(4, 8, 29, 17, '2011-08-18','18:10','2011-08-20'),
	(5, 1, 2, 23, '2011-06-09','8:00','2011-06-11'),
	(6, 8, 21, 24, '2011-08-20','8:00','2011-08-22'),
	(7, 1, 14, 21, '2011-03-25','8:00','2011-03-27'),
	(8, 8, 30, 6, '2011-08-19','13:00','2011-08-21'),
	(9, 8, 19, 30, '2012-03-27','13:00','2012-03-29'),
	(10, 1, 3, 9, '2011-08-19','9:54','2011-08-21'),
	(11, 8, 12, 11, '2012-03-29','13:00','2012-03-31'),
	(12, 1, 8, 25, '2011-08-19','9:54','2011-08-21'),
	(13, 1, 11, 16, '2012-03-31','14:55','2012-04-02'),
	(14, 1, 4, 1, '2011-04-01','12:01','2011-04-03'),
	(15, 8, 11, 26, '2013-06-25','14:29','2013-06-27'),
	(16, 1, 22, 13, '2011-08-20','10:00','2011-08-22'),
	(17, 1, 8,  19, '2011-08-20','14:55','2011-08-22'),
	(18, 11, 10, 4, '2013-07-07','16:30','2013-07-09'),
	(19, 8, 12, 27, '2013-07-07','11:11','2013-07-09'),
	(20, 11, 5, 2, '2013-06-25','17:54','2013-06-27'),
	(21, 8, 18, 20, '2012-12-28','10:00','2012-12-30'),
	(22, 8, 15, 22, '2013-06-25','8:36','2013-06-27'),
	(23, 8, 9, 7, '2012-12-28','14:55','2012-12-30'),
	(24, 11, 17, 12, '2012-12-28','13:00','2012-12-30'),
	(25, 8, 6, 5, '2013-07-07','10:00','2013-07-09'),
	(26, 8, 23, 8, '2013-07-07','18:10','2013-07-09'),
	(27, 11, 16, 27, '2013-01-31','14:55','2013-02-02'),
	(28, 11, 7, 29, '2013-01-31','8:00','2013-02-02'),
	(29, 11, 24, 3, '2013-01-31','8:00','2013-02-02');
    
INSERT INTO Emprestimo(id_emprestimo, id_funcionario, id_usuario, id_obra, data_emprestimo, hora_emprestimo, data_entrega)
VALUES -- 4
	(32, 1, 1, 19, '2011-08-15','08:00:00','2011-08-29');

-- Tabela reserva
CREATE TABLE Reserva(
	id_reserva INTEGER PRIMARY KEY NOT NULL,
	id_emprestimo INTEGER,
	id_funcionario INTEGER,
	id_usuario INTEGER,
	id_obra INTEGER,
	status_livro VARCHAR(50),
	data_reserva DATE,
	hora_reserva TIME,
	FOREIGN KEY (id_emprestimo) REFERENCES Emprestimo(id_emprestimo),
	FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
	FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
	FOREIGN KEY (id_obra) REFERENCES Obra(id_obra)
);

INSERT INTO Reserva(id_reserva, id_emprestimo, id_funcionario, id_usuario, id_obra, status_livro, data_reserva, hora_reserva)
VALUES 
		(1, 5, 1,  2, 14, 'Disponível', '2011-06-08', '8:40'),
		(2, 3, 8,  13, 3, 'Reservado', '2011-07-11', '9:30'),
		(3, 1, 1,  1, 14, 'Reservado', '2011-08-14', '8:00'),
		(4, 4, 8,  29, 20, 'Reservado', '2011-08-18', '15:00'),
		(5, 8, 8,  30, 16, 'Reservado', '2011-08-19', '10:00'),
		(6, 10, 1, 3, 8, 'Reservado', '2011-08-18', '15:00'),
		(7, 12, 1,  8, 25, 'Disponível', '2011-08-19', '9:00'),
		(8, 6, 8,  21, 24, 'Disponível', '2011-08-08', '8:15'),
		(9, 16, 1, 22, 13, 'Disponível', '2011-08-18', '18:00'),
		(10, 17, 1, 8, 22, 'Reservado', '2011-08-15', '14:00');

-- Tabela Devolucao
CREATE TABLE Devolucao(
	id_devolucao INTEGER PRIMARY KEY NOT NULL,
	id_funcionario INTEGER,
	id_emprestimo INTEGER,
	id_usuario INTEGER,
	id_obra INTEGER,
	data_devolucao DATE,
	hora_devolucao TIME,
	multa_atraso VARCHAR(2),
	FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario),
	FOREIGN KEY (id_emprestimo) REFERENCES Emprestimo(id_emprestimo),
	FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
	FOREIGN KEY (id_obra) REFERENCES Obra(id_obra)
);

INSERT INTO	Devolucao(id_devolucao, id_funcionario, id_emprestimo,  id_usuario, id_obra, data_devolucao, hora_devolucao, multa_atraso)
VALUES 
		(1, 1, 5, 2, 14, '2011-06-11', '18:00', 0),
		(2, 8, 3, 13, 3, '2011-07-13', '13:00', 0),
		(3, 1, 1, 1, 14, '2011-08-17', '14:55', 0),
		(4, 8, 4,  29, 20, '2011-08-20', '12:01', 0),
		(5, 8, 8,  30, 16, '2011-08-21', '10:00', 0),
		(6, 1, 10,  3, 8, '2011-08-21', '14:55', 0),
		(7, 1, 12,  8, 25, '2011-08-21', '13:00', 0),
		(8, 8, 6,  21, 24, '2011-08-22', '14:55', 0),
		(9, 1, 16,  22, 13, '2011-08-26', '10:00', 1),
		(10, 1, 17,	 8, 22, '2011-08-22', '18:00', 0),
		(11, 8, 2,  20, 14, '2011-09-28', '14:29', 0),
		(12, 1, 7, 14, 27, '2012-03-30', '17:54', 1),
		(13, 8, 9,  19, 5, '2012-03-29', '8:36', 0),
		(14, 8, 11,  12, 27, '2012-03-31', '16:30', 0),
		(15, 1, 13,  11, 8, '2012-04-08', '11:11', 1),
		(16, 1, 14,  4, 1, '2012-04-03', '10:00', 0),
		(17, 8, 21,  18, 25, '2012-12-30', '18:00', 0),
		(18, 8, 23, 9, 11, '2013-01-12', '15:00', 1),
		(19, 11, 24,  17, 12, '2012-12-30', '16:00', 0),
		(20, 11, 27,  16, 27, '2013-02-02', '18:00', 0);
