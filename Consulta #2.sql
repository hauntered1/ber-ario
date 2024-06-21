
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

select * FROM paciente


