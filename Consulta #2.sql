
/*apagar tabela*/
DROP TABLE exame


CREATE TABLE recepcionista (
idrecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomerecepcionista VARCHAR (50) NOT NULL,
cpfrecepcionista CHAR (11) NOT NULL UNIQUE,
loginrecepcionista VARCHAR (20) NOT NULL UNIQUE,
senharecepcionista CHAR (6) NOT NULL,
celular CHAR (11) NULL 
);

CREATE TABLE paciente(
idpaciente  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomepaciente VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
cel CHAR (11) NULL,
email VARCHAR(30) NULL, 
Logradouro VARCHAR(30) NOT NULL,
numero VARCHAR (6) NOT NULL,
complemento VARCHAR (10) NULL,
cidade VARCHAR (20) NOT NULL,
cep CHAR (8) NULL,
observacoes VARCHAR(200) NULL
);

CREATE TABLE especialidade(
idespecialidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeespecialidade VARCHAR(30) NOT NULL 
);

CREATE TABLE medico(
idmedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idespecialidade INT NOT NULL,
nomemedico VARCHAR(50) NOT NULL,
CRM CHAR(8) NOT NULL UNIQUE,
login VARCHAR(20) NOT NULL UNIQUE,
senha CHAR(6) NOT NULL 
);

CREATE TABLE consulta(
idconsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idmedico INT NOT NULL,
idpaciente INT NOT NULL,
idrecepcionista INT NOT NULL,
dataehora DATETIME NOT NULL,
sintomas VARCHAR(200) NULL,
prescricao VARCHAR(200) NULL
);

CREATE TABLE exame(
idexame INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idconsulta INT NOT NULL,
dataehora DATETIME NOT NULL,
nomeexame VARCHAR(30) NOT NULL DEFAULT 'Sangue Padrão',
statusexame VARCHAR(10) NOT NULL,
constraint chk_statusexame CHECK (statusexame='Em analise' OR statusexame='Disponivel'OR statusexame='entregue'),
resultado VARCHAR(200) NULL,
dataretiradaexame DATETIME NULL,
dataprevisaoentrega DATETIME NULL
);

INSERT INTO paciente
VALUES (1,'Donald','56128396852','13991421942','Donald@gmail.com','Vila','523123','apto 21','Santos','11015230','O paciente é completamente louco nao sabe falar corretamente');
/*1.Inserir de forma implícita 8 pacientes*/
INSERT INTO paciente
VALUES (2,'Margarida','23434595672','13991221942','Margarida@gmail.com','Rodeio','78','apto 21','São vicente','23025970','Louca porem bem sofisticada'),
(3,'Patinhas','98759027853','13995679078','tiopatinhas@gmail.com','vila nova','98','apto 34','Santos','90813340','Homem bem rico, louco tambem'),
(4,'Huguinho','98676907853','13945672375','huiguinhogamer@gmail.com','vila velha','90','Casa fundos','Cubatão','83515926','Chatinho, bem humorado'),
(5,'Luizinho','98975127373','13945626486','Luizinhogamer@gmail.com','vila mais ou menos','78','Casa da frente','Praia Grande','86545245','Muito doente'),
(6, 'Mickey','94595127987','21943426476','MickeyOGOAT@gmail.com','VILA FODA','90','Apto 56','São Vicente','86545245','O homem mais simpatico e incrivel ja visto'),
(7,'Zezinho','99525127883','46943421298','zezinhogamer@outlook.com','vila normal','908','Fundos','São joão Del Rei','86545245','Problema nas pernas'),
(8,'minie','99522391236','13945673479','minielinda@yahoo.com','vila linda','678','apto 321','são Paulo','86545245','Simpática');
SELECT * FROM paciente
/*2.Inserir de forma explícita 3 recepcionistas*/
INSERT INTO recepcionista (nomerecepcionista, cpfrecepcionista, loginrecepcionista, senharecepcionista, celular)
VALUES
('Chico Bento','09230116092','chicobento.senaclin','chicobentono','47984955501'),
('Franjinha','77049900044','franjinha.senaclin','franjinhachato','89981133564'),
('Cebolinha','60170653005','cebolinha,senaclin','euodeioodc','66994168582');
SELECT * FROM recepcionista

/*3.Inserir de forma explícita 5 especialidades. 
Para facilitar, utilize a forma reduzida para realizar vários inserts de uma única 
vez, como visto em nossos encontros.
*/
INSERT INTO especialidade (nomeespecialidade)
VALUES
('Cardiologista'),
('Otorrinolaringologista'),
('Clínico Geral'),
('Gastroenterologista'),
('Ortopedista');
SELECT * FROM especialidade

/*4.Inserir de forma implícita 5 médicos*/
INSERT INTO medico
VALUES
(1,1,'Pardal','765544SP','pardal_med.senaclin','1234'),
(2,5,'Mônica','768880SP','monica_med.senaclin','4321'),
(3,3,'Zé Carioca','165544RJ','zeca_med.senaclin','5678'),
(4,4,'Magali','265544SP','magali_med.senaclin','8765'),
(5,2,'Horácio','365544MG','horacio_med.senaclin','91011');
SELECT * FROM paciente
SELECT * FROM consulta
SELECT * FROM recepcionista

/*5. Inserir de forma explícita uma consulta para cada médico
Dados conforme abaixo, demais dados livres. Atenção para colocar
datas de consultas posteriores a data de hoje.*/
INSERT INTO consulta (idmedico,idpaciente,idrecepcionista,dataehora,sintomas)
VALUES 
(1,1,1,'1998-08-19 14:30','Febre, dores no corpo e garganta inflamada'),
(2,2,1,'2000-03-04 20:00','Dor no corpo'),
(3,3,1,'2020-05-29 10:40','Dor no pancreas'),
(4,6,2,'2023-01-12 19-30','Garganta inflamada'),
(8,5,2,'2024-03-10 17-30','Dor de dente');

/*6.Inserir mais duas consultas ao Patinhas*/
INSERT INTO consulta (idmedico,idpaciente,idrecepcionista,dataehora,sintomas,prescricao)
VALUES
(1,3,1,'2020-05-19 15:20','Dor no pancreas grave','dorflex'),
(2,3,1,'2020-07-19 15:20','Febre alta','Rivotril');

/*7.Inserir um exame para cada consulta do Patinhas criada no item anterior (6*/
INSERT INTO exame (idconsulta,dataehora ,nomeexame ,statusexame ,resultado ,dataretiradaexame ,dataprevisaoentrega)
VALUES
(6, '2020-05-20 10:30','Eletrocardiograma','Entregue','Deu tudo certo','2020-05-21','2020-05-22'),
(7, '2020-07-20 10:45','Raio-X Coluna','Entregue','Tudo certo','2020-07-21','2020-05-22');

/*8.Remarcar (Atualizar) a consulta do Donald para a mesma data porém, 2hs mais tarde.*/
UPDATE consulta
SET dataehora='1998-08-19 16:30'
WHERE idConsulta=1

/*9.A Minie mudou de endereço mas não mudou de cidade (logradouro, numero e 
complemento). Realize a alteração dos dados.*/
UPDATE paciente
SET Logradouro='vila atualizada', numero='45', complemento='casa fundos'
WHERE idpaciente=8

/*10.O Mickey mudou o celular, realize a alteração*/
UPDATE paciente
SET cel='21943421234'
WHERE idpaciente=6

/*11.O Patinhas não poderá comparecer na consulta com o Ze Carioca. Realize a exclusão da 
mesma no sistema. Foi possível? Justifique*/
DROP consulta
WHERE idconsulta=3
/*Não é possivel realizar o código pois outros id já estão associados no mesmo*/

/*12.Realize a exclusão da Dr Mônica da tabela Medico. Foi possível? Justifique.*/
DROP medico 
WHERE idmedico = 2
/*não é possivel pq já tem consultas com id dela*/

/*13.Exibir a data de todas as consultas em ordem cronológica, da que está mais próxima para a 
que está mais longe.*/
SELECT idconsulta, dataehora FROM consulta
ORDER BY dataehora ASC

/*14.Exibir todos os dados da tabela médico.*/
SELECT * FROM medico

/*15.Exibir apenas as cidades em que a clínica possui pacientes, em ordem alfabética.*/
SELECT cidade FROM paciente
ORDER BY cidade ASC

/*16.Exibir nome, celular e e-mail de todos os pacientes da clínica, em ordem alfabética.*/
SELECT nomepaciente, cel, email FROM paciente
ORDER BY nomepaciente ASC

/*18.Resetar a senha de todos os médicos do sistema para o padrão "DOCTOR"*/
UPDATE medico
SET senha='DOCTOR'

/*19.Exibir apenas o nome do médico e seu CRM, dos médicos registrados em SP, tudo isto em 
ordem alfabética.*/
SELECT nomemedico, crm FROM medico
WHERE crm like '%SP'
ORDER BY nomemedico ASC

/*20.Exibir nome e celular de todos os pacientes que vivem em Santos e possuem nome 
iniciando com a letra P*/
SELECT nomepaciente, cel FROM paciente
WHERE cidade = 'Santos' AND nomepaciente LIKE 'P%'
ORDER BY nomepaciente ASC

/*DESAFIO: Exibir o nome, logradouro, numero e cidade de todos os pacientes que moram em 
casa, em ordem alfabética.*/

SELECT nomepaciente, logradouro, numero, cidade FROM paciente
WHERE complemento LIKE 'c%'
ORDER BY nomepaciente asc

select * FROM consulta

/*DESAFIO AGRUPAMENTO DE DADOS*/

/*quantos pacientes tem*/
SELECT COUNT(*) AS totaldepaciente
FROM paciente;

/*quantos pacientes tem em cada cidade*/
SELECT cidade, COUNT(*) AS totaldepaciente
FROM paciente
GROUP BY cidade


/*utra opção mas com mais palavras*/
SELECT COUNT(*) AS 'Quantidade de médicos'
FROM medico

/*valor maximo/maior*/
SELECT MAX(dataehora) FROM consulta

/*valor minimomenor*/
SELECT MIN(dataehora) FROM consulta

/*soma*/
SELECT SUM(idmedico) FROM medico

/*Média*/
SELECT AVG (idmedico) FROM medico

/*Procurar a quantidade de médicos em MG*/
SELECT COUNT(idmedico) AS 'Quantidade de médicos em MG'
FROM medico
WHERE crm LIKE '%MG'


/*nao faça*/
SELECT tiposanguino AS 'Tipo sanguíneos',
       COUNT (idpaciente) AS 'total de pacientes'
  FROM paciente 
 
 SELECT COUNT(idpaceinte) AS 'total de paciente'
 FROM paciente
 GROUP BY tiposanguino
/*=========================================*/
SELECT cidade, COUNT(*) AS totaldepaciente
FROM paciente
GROUP BY cidade
ORDER BY COUNT(idpaciente) DESC
/*=========================================*/
SELECT cidade, COUNT(*) AS totaldepaciente
FROM paciente
GROUP BY cidade
ORDER BY COUNT(idpaciente) 
/*=========================================*/
SELECT cidade, COUNT(*) AS totaldepaciente
FROM paciente
GROUP BY cidade
HAVING COUNT(idpaciente)>=2
ORDER BY totaldepaciente DESC;

/*Primeiro filtrar = WHERE ***
depois agrupar = GROUP BY ***
depois filtrar o agrupamento HAVING COUNT(*****)
por fim ordernar ORDER BY COUNT(*****) DESC ou ASC*/
 
/*****JOIN*****/

/*Traga o nome do médico, o crm e a data da consulta marcada pra 
ele levando em conta todos os médicos que pussuem consultas*/

SELECT nomemedico, nomepaciente, crm, dataehora FROM medico
INNER JOIN consulta  
on medico.idmedico = consulta.idmedico
INNER JOIN paciente  
ON paciente.idpaciente = consulta.idpaciente;

SELECT * FROM paciente
SELECT * FROM recepcionista

/*****LEFT*****/
SELECT nomemedico, crm, dataehora FROM medico
left JOIN consulta  
on medico.idmedico = consulta.idmedico

/* A - Criar uma query que traga o nome do recepcionista, o celular
dele, e a data da consulta que ele marcou */
SELECT nomerecepcionista, celular, dataehora FROM recepcionista
inner JOIN consulta  
on recepcionista.idrecepcionista = consulta.idrecepcionista

/*B - Criar uma query que traga o nome do paciente, seu documento,
o nome do médico, o crm, a data da consulta e o recepcionista 
que a marcou */
SELECT nomepaciente,cpf,nomemedico,crm,dataehora,nomerecepcionista FROM consulta
INNER JOIN 
recepcionista ON consulta.idrecepcionista = recepcionista.idrecepcionista
INNER JOIN 
medico ON consulta.idmedico = medico.idmedico
INNER JOIN 
paciente ON consulta.idpaciente = paciente.idpaciente;

/*C - Criar uma query que traga quantas consultas existem 
na clínica */
SELECT COUNT(*) AS totaldeconsultas
FROM consulta;

/*D - Criar uma query que traga o nome do paciente, o email,
o tipo sanguineo e a data de suas consultas
mas somente dos pacientes que possuem email*/
SELECT nomepaciente, email, dataehora
FROM 
paciente
INNER JOIN 
consulta ON paciente.idpaciente = consulta.idpaciente
WHERE 
paciente.email LIKE '%@%'
/*E - Criar uma query que traga o nome de TODOS OS paciente, 
o nome do médico, a data da consulta
independente de os pacientes possuírem consultas */
SELECT 
nomepaciente,nomemedico,dataehora
FROM 
paciente
LEFT JOIN 
consulta ON paciente.idpaciente = consulta.idpaciente
LEFT JOIN 
medico ON consulta.idmedico = medico.idmedico
ORDER BY 
paciente.nomepaciente, consulta.dataehora;

SELECT * FROM paciente

SELECT COUNT(idconsulta) AS Consultas, cidade
FROM consulta
INNER JOIN
paciente ON consulta.idpaciente = paciente.idpaciente
GROUP BY cidade;
/*1.Buscar nome do médico, nome da especialidade, e crm de todos os médicos cuja especialidade 
seja “Cardiologista”*/
SELECT nomemedico, nomeespecialidade, crm FROM medico
INNER JOIN especialidade ON medico.idespecialidade = medico.idmedico
WHERE nomeespecialidade LIKE 'Car%'

/*2.Buscar quantos pacientes a clínica possui por cidade*/
SELECT cidade, COUNT(*) AS Pacientes
FROM paciente
GROUP BY cidade
ORDER BY COUNT(idpaciente) 

/*3.Buscar a data de todas as consultas, nome do médico e o nome do paciente, em ordem 
cronológica.*/
SELECT nomemedico, cdataehora, nomepaciente 
FROM consulta
INNER JOIN medico ON consulta.idmedico = medico.idmedico
INNER JOIN paciente ON consulta.idpaciente = paciente.idpaciente
ORDER BY consulta.dataehora ASC;

/*4.Buscar o nome do paciente, celular, email, e a data da consulta de todos os pacientes com 
consulta marcada, desde que vivam em Santos. */
SELECT nomepaciente, cel, email, dataehora FROM consulta
INNER JOIN paciente ON consulta.idpaciente = paciente.idpaciente
WHERE cidade LIKE 'Sant%';

/*5.Buscar todos os pacientes que tenham com a letra "P" no nome.*/
SELECT * FROM paciente
WHERE nomepaciente LIKE '%p%'

/*6.Buscar o nome do médico, a data da consulta, o nome do paciente e a especialidade do médico 
de todas as consultas de determinado dia (escolhido por você), em ordem alfabética.*/
SELECT nomemedico, dataehora, nomepaciente, nomeespecialidade 
FROM consulta
INNER JOIN medico ON consulta.idmedico = medico.idmedico
INNER JOIN paciente ON consulta.idpaciente = paciente.idpaciente
INNER JOIN especialidade ON medico.idespecialidade = especialidade.idespecialidade
WHERE DATE(consulta.dataehora) LIKE '%19%'
ORDER BY medico.nomemedico ASC;


/*7.Buscar o nome dos médicos e sua especialidade, apenas dos médicos com CRM de SP*/
SELECT nomemedico, nomeespecialidade 
FROM medico
INNER JOIN especialidade ON medico.idespecialidade = especialidade.idespecialidade
WHERE crm LIKE '%SP%'

/*8.Buscar a data da consulta que está mais longe na clínica.*/
SELECT MAX(dataehora) AS 'Ta longe pra caramba'
FROM consulta;

/*9.Buscar quantos médicos a clínica possui por especialidade*/
SELECT idmedico, nomeespecialidade FROM medico
INNER JOIN especialidade ON medico.idespecialidade = especialidade.idespecialidade
GROUP BY nomeespecialidade DESC

/*10.Buscar o nome, celular e email de todos os pacientes que começam com a letra “D” em ordem 
alfabética.*/
SELECT nomepaciente, cel, email FROM paciente 
WHERE nomepaciente like 'D%' 
ORDER BY nomepaciente ASC

/*11.Buscar todos os exames, bem como quem foi o médico que solicitou e a data do exame, em 
ordem cronológica (por data). */
SELECT nomeexame, nomemedico, exame.dataehora
FROM exame
INNER JOIN consulta ON exame.idconsulta = consulta.idconsulta
INNER JOIN medico ON consulta.idmedico = medico.idmedico
ORDER BY exame.dataehora;

SELECT * FROM paciente

/*12.Buscar o nome do médico, o crm e a data da consulta, de todos os médicos, ainda que não 
possuam consultas.*/
SELECT nomemedico, crm, dataehora
FROM medico
LEFT JOIN consulta ON medico.idmedico = consulta.idmedico;

/*13.Buscar o nome de todos os pacientes, celular, email e data da consulta em ordem alfabética. 
Trazer os pacientes ainda que não possuam consultas. */
SELECT nomepaciente, cel,email, consulta.dataehora
FROM paciente
LEFT JOIN consulta ON paciente.idpaciente = consulta.idpaciente
ORDER BY paciente.nomepaciente ASC;

/*14.Buscar o nome de todos os pacientes, logradouro, número e complemento apenas dos 
moradores que moram em São Paulo, em ordem alfabética.*/
SELECT nomepaciente, logradouro, numero, complemento FROM paciente
WHERE cidade LIKE 'são p%'

/*15.Buscar a data de todas as consultas, o nome do recepcionista que marcou, o nome do 
paciente, o nome do médico, a especialidade do médico e o celular do paciente em ordem 
cronológica invertida.*/
SELECT consulta.dataehora, nomerecepcionista, nomepaciente, nomemedico, nomeespecialidade, cel
FROM consulta
INNER JOIN recepcionista ON consulta.idrecepcionista = recepcionista.idrecepcionista
INNER JOIN paciente ON consulta.idpaciente = paciente.idpaciente
INNER JOIN medico ON consulta.idmedico = medico.idmedico
INNER JOIN especialidade ON medico.idespecialidade = especialidade.idespecialidade
ORDER BY consulta.dataehora DESC;


/*16 e 17---
DESAFIO
A
SELECT idmedico COUNT(*) AS 'tantas consultas'
FROM consultas
GROUP BY idmedico

B 
SELECT idespecialidade COUNT(*) AS 'tantas consultas'
FROM consultas
JOIN JOIN medico ON consulta.idmedico = medico.idmedico
GROUP BY idespecialidade;

/*View como criar - Estruturas CREATE, DROP ALTER*/
create VIEW vw_RelatorioConsulta
AS 
SELECT consulta.dataehora, nomerecepcionista, nomepaciente, nomemedico, nomeespecialidade, cel
FROM consulta
INNER JOIN recepcionista ON consulta.idrecepcionista = recepcionista.idrecepcionista
INNER JOIN paciente ON consulta.idpaciente = paciente.idpaciente
INNER JOIN medico ON consulta.idmedico = medico.idmedico
INNER JOIN especialidade ON medico.idespecialidade = especialidade.idespecialidade
ORDER BY consulta.dataehora DESC;

/*executar view*/
SELECT dataehora, nomepaciente from vw_relatorioconsulta
ORDER BY nomepaciente DESC
/*==================AULA DIA 1====================*/
/*STORED PROCEDURES*/
/*VIEW MUDA DADOS. STORED PROCEDURES PODE MUDAR OU NÃO
DROP, CREATE, ALTER*/
CREATE PROCEDURE pi_Recepcionista
(IN nomerecepcionista VARCHAR(50),
cpfrecepcionista CHAR(11),
loginrecepcionista VARCHAR(20),
senharecepcionista CHAR(6),
celular CHAR(11)
) 
INSERT INTO recepcionista (nomerecepcionista, cpfrecepcionista, loginrecepcionista, senharecepcionista, celular)
VALUES (nomerecepcionista, cpfrecepcionista, loginrecepcionista, senharecepcionista, celular);

/*chamar a stored procedure*/
CALL pi_Recepcionista
('Yuri','12309845623','yrbz.senaclin','castie123','47557853459')

SELECT * FROM paciente
DELETE FROM recepcionista WHERE nomerecepcionista= 'Yuri'

DROP PROCEDURE pd_drecepcionista

CREATE PROCEDURE pd_recepcionista
(IN param_idrecepcionista INT)
DELETE FROM recepcionista 
WHERE idrecepcionista = param_idrecepcionista; 
CALL pd_recepcionista(15)
/*======================================*/

DROP PROCEDURE ps_pacientescidade

/*CREATE PROCEDURE ps_pacientescidade
(
IN cidade VARCHAR(20), 
IN nomepaciente VARCHAR(50)
)
SELECT * FROM paciente
WHERE cidade = cidade AND nome = nomepaciente;*/

SELECT * FROM paciente
/*======================================*/
CREATE PROCEDURE ps_pacientescidade
(
IN jcidade VARCHAR(20) 
)
SELECT nomepaciente, cidade FROM paciente
WHERE cidade = jcidade;

CALL ps_pacientescidade ('Santos')
/*======================================*/
 DROP PROCEDURE ps_IdmedicoDataHOraConsulta
CREATE PROCEDURE ps_IdmedicoDataHOraConsulta
(
IN para_idmedico INT
)
SELECT idmedico, dataehora FROM consulta
WHERE idmedico=para_idmedico
ORDER BY dataehora ASC;
 
CALL ps_IdmedicoDataHOraConsulta(1)
/*======================================*/

SELECT * FROM consulta
/*ERRADO*/
CREATE PROCEDURE ps_contarconsulta 
(
IN para_idconsulta INT
)
SELECT COUNT(*) AS total_consultas
FROM consultas
WHERE idconsulta = para_idconsulta;



/*CERTO*/
CREATE PROCEDURE ps_contarconsultasl()
SELECT COUNT(*) AS total_consultas
FROM idconsultas;

CALL ps_contarconsultasl()

/*saidera*/
CREATE PROCEDURE ps_nomepacienteconsulta
(
IN nnomepaciente, nomemedico, dataehora FROM paciente
)
inner JOIN paciente ON consulta.idpaciente = paciente.idpaciente
inner JOIN medico ON consulta.idmedico = medico.idmedico
WHERE nomepaciente = nnomepaciente;

select * FROM paciente

 /*1) Criar uma view que traga nome e contatos (telefones e pacientes) em ordem alfabética 
e executá-la.
*/
CREATE VIEW vw_contatopaciente
AS
SELECT nomepaciente, cel FROM paciente
ORDER BY nomepaciente ASC 

SELECT * from vw_contatopaciente

/*2) Criar uma view que traga a quantidade de consultas agrupadas por especialidade e 
executá-la*/
CREATE VIEW vw_consultaporespecialidade 
AS 
SELECT 
especialidade.nomeespecialidade,
COUNT(consulta.idconsulta) AS total_consultas FROM consulta
INNER JOIN medico ON consulta.idmedico = medico.idmedico
INNER JOIN especialidade ON medico.idespecialidade = especialidade.idespecialidade
GROUP BY especialidade.nomeespecialidade;

SELECT * FROM  vw_consultaporespecialidade 

/*3) Criar uma procedure que permita saber quantos médicos possuímos por especialidade. 
A procedure deverá exibir a quantidade de médico de acordo com o nome da 
especialidade informada. Executar a procedure.*/

CREATE PROCEDURE ps_medicoespecialidade 
(
IN especialidade_nome VARCHAR(30)
)
SELECT especialidade.nomeespecialidade AS 'especialidade',
COUNT(idmedico) AS 'quantidade medicos' FROM medico
JOIN especialidade ON medico.especialidade = idespecialidade
WHERE nomeespecialidade = especialidade_nome
GROUP BY nomeespecialidade;

CALL ps_medicoespecialidade()

/*4) Criar uma procedure para resetar todas as senhas dos médicos para DOCTOR e 
executá-la*/

CREATE PROCEDURE ps_alterartodassenha 
UPDATE medico
SET senha = 'DOCTOR'



/*5) Criar uma procedure para alterar as informações de paciente*/

CREATE PROCEDURE pi_mudandotudo
(
IN nomepaciente VARCHAR(50),
cpf CHAR(11),
cel CHAR (11),
email VARCHAR(30), 
Logradouro VARCHAR(30),
numero VARCHAR (6),
complemento VARCHAR (10),
cidade VARCHAR (20),
cep CHAR (8),
observacoes VARCHAR(200)
)
INSERT INTO paciente
(nomepaciente, cpf, cel, email, Logradouro, numero, complemento, cidade, cep, observacoes)
VALUES (nomepaciente, cpf, cel, email, Logradouro, numero, complemento, cidade, cep, observacoes); 

/*6) Criar uma procedure para inserir uma consulta na clínica.*/
CREATE PROCEDURE pi_addconsulta
(
IN
idconsulta INT,
idmedico INT,
idpaciente INT,
idrecepcionista INT,
dataehora DATETIME,
sintomas VARCHAR(200),
prescricao VARCHAR(200)
)
INSERT INTO consulta
(idconsulta,idmedico,idpaciente,idrecepcionista ,dataehora,sintomas,prescricao)
VALUES(idconsulta,idmedico,idpaciente,idrecepcionista ,dataehora,sintomas,prescricao);

CALL pi_addconsulta()
/*7) Criar uma procedure para excluir um exame do sistema. (Obs - Sabemos que na prática 
deveremos utilizar a exclusão lógica).*/
CREATE PROCEDURE pd_deleex
(
IN a_idexame INT
)
DELETE FROM exame
WHERE idexame = a_idexame;

CALL pd_deleex(3)
/*8) Criar uma procedure que liste a data da consulta e o nome do paciente de acordo com 
o nome do médico. Aqui, listaremos a agenda do médico. Execute a procedure.*/
CREATE PROCEDURE ps_Tudomedico
(
IN anomemedico VARCHAR(50)
)
SELECT consulta.dataehora, nomepaciente AS 'nome do paciento' FROM consulta 
JOIN medico ON consulta.idmedico = medico.idmedico
JOIN paciente ON consulta.idpaciente = paciente.idpaciente
WHERE nomemedico = anomemedico
ORDER BY consulta.dataehora;

/*9) Criar um mecanismo para trazer a quantidade de médicos que a clínica possui por 
especialidade. Execute o mecanismo.*/
CREATE PROCEDURE ps_quantidademedico()
SELECT 
especialidade.nomeespecialidade AS especialidade, 
COUNT(*) AS quantidade_de_medicos FROM medico
JOIN especialidade ON medico.idespecialidade = especialidade.idespecialidade
GROUP BY especialidade.nomeespecialidade;

/*10) Criar uma procedure que liste a data da consulta, o celular do paciente e a 
especialidade da consulta de acordo com o nome do paciente informado, mas em 
ordem cronológica. Neste caso estaremos verificando todas as consultas do paciente.*/

CREATE PROCEDURE ps_listona
(
IN a_nomepaciente VARCHAR(50)
)
SELECT consulta.dataehora, paciente.cel AS celular, especialidade.nomeespecialidade AS especialidade FROM consulta
JOIN medico ON consulta.idmedico = medico.idmedico
JOIN paciente ON consulta.idpaciente = paciente.idpaciente
JOIN especialidade ON medico.idespecialidade = especialidade.idespecialidade
WHERE paciente.nomepaciente = a_nomepaciente
ORDER BY consulta.dataehora;

/*DESAFIO: Criar uma procedure que sirva para atualizar a data de uma consulta. A procedure 
deve receber ID da consulta e a data e hora para a qual queremos trocar*/

CREATE PROCEDURE pu_alterarDataConsulta
(
IN a_idConsulta INT,
IN a_atualiza DATETIME
)
UPDATE consulta
SET dataehora = a_atualiza
WHERE idConsulta = a_idConsulta;


