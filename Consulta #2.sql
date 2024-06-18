
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


