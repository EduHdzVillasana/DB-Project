CREATE DATABASE BUSCOPAREJANET
USE BUSCOPAREJANET

CREATE TABLE usuario(
id_usuario INT,
email VARCHAR(50) UNIQUE NOT NULL,
password VARCHAR(10) NOT NULL, 
sexo CHAR(1) NOT NULL,
foto IMAGE NOT NULL,
nombre VARCHAR(100) NOT NULL,
apellido_paterno VARCHAR(100) NOT NULL,
apellido_materno VARCHAR(100) NOT NULL,
id_pais TINYINT ,
id_estado INT,
id_municipio INT,
calle VARCHAR(200) NOT NULL,
numero SMALLINT NOT NULL,
fecha_nacimiento DATE NOT NULL,
id_orientacion TINYINT,
CONSTRAINT PK_IU PRIMARY KEY(id_usuario) ,
CONSTRAINT CKK_U CHECK(sexo in ('F','M')),
);
CREATE TABLE gusto(
id_gusto INT,
id_categoria TINYINT,
descripcion VARCHAR(20),
CONSTRAINT PK_IG PRIMARY KEY(id_gusto),
);

CREATE TABLE categoria(
id_categoria TINYINT,
nombre VARCHAR(20),
CONSTRAINT PK_IC PRIMARY KEY(id_categoria),
CONSTRAINT CHK_C CHECK (nombre in('Evento Social','Deporte','Musica')),
);

CREATE TABLE orientacion_sexual(
id_orientacion TINYINT,
descripcion VARCHAR(20),
CONSTRAINT PK_IO PRIMARY KEY(id_orientacion),
CONSTRAINT CHK_O CHECK (descripcion in('Heterosexual','Homosexual','Bisexual','Asexual','Pansexual')),
);

CREATE TABLE pais(
id_pais TINYINT,
nombre_pais VARCHAR(50),
CONSTRAINT PK_IP PRIMARY KEY(id_pais),
);

CREATE TABLE estado(
id_estado INT IDENTITY,
id_pais TINYINT,
nombre_estado VARCHAR(50),
CONSTRAINT PK_E PRIMARY KEY (id_estado),
);

CREATE TABLE municipio(
id_municipio INT IDENTITY,
id_estado INT,
id_pais TINYINT,
nombre_municipio VARCHAR(50),
CONSTRAINT PK_IM PRIMARY KEY(id_municipio),
);

CREATE TABLE gusta(
id_usuario INT,
id_gusto INT,
fecha DATE,
mismos_gustos BIT NOT NULL,
CONSTRAINT PK_IGA PRIMARY KEY(id_usuario,id_gusto),
);

CREATE TABLE cita(
id_usuario_solicitante INT,
id_usuario_solicitado INT ,
fecha_hora DATETIME,
lugar VARCHAR(50),
estado BIT NOT NULL,
CONSTRAINT PK_CSE PRIMARY KEY (id_usuario_solicitante,id_usuario_solicitado),
);
select * from usuario

ALTER TABLE usuario
ADD CONSTRAINT FK_PU FOREIGN KEY (id_pais) REFERENCES pais(id_pais) ON DELETE SET NULL ON UPDATE CASCADE ;

ALTER TABLE usuario
ADD CONSTRAINT FK_EU FOREIGN KEY (id_estado) REFERENCES estado(id_estado) ON DELETE SET NULL ;

ALTER TABLE usuario
ADD CONSTRAINT FK_MU FOREIGN KEY (id_municipio) REFERENCES municipio(id_municipio) ON DELETE SET NULL ;

ALTER TABLE usuario
ADD CONSTRAINT FK_OU FOREIGN KEY (id_orientacion) REFERENCES orientacion_sexual(id_orientacion) ON DELETE SET NULL;

ALTER TABLE gusto
ADD CONSTRAINT FK_CG FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)  ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE estado 
ADD CONSTRAINT FK_PE FOREIGN KEY (id_pais) REFERENCES pais(id_pais)ON UPDATE CASCADE ON DELETE SET NULL ;

ALTER TABLE municipio
ADD CONSTRAINT FK_PM FOREIGN KEY (id_pais) REFERENCES pais(id_pais) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE municipio
ADD CONSTRAINT FK_EM FOREIGN KEY (id_estado) REFERENCES estado(id_estado) ;

ALTER TABLE cita
ADD CONSTRAINT FK_CS FOREIGN KEY (id_usuario_solicitante) REFERENCES usuario(id_usuario);

ALTER TABLE cita
ADD CONSTRAINT FK_CSO FOREIGN KEY (id_usuario_solicitado) REFERENCES usuario(id_usuario);

ALTER TABLE gusta
ADD CONSTRAINT FK_GU FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)  ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE gusta
ADD CONSTRAINT FK_GG FOREIGN KEY (id_gusto) REFERENCES gusto(id_gusto) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE INDEX idx_email ON usuario(email);

GO

CREATE VIEW citas__NE
AS
SELECT COUNT(cita.estado) AS [Citas No Exitosas] FROM cita WHERE cita.estado = 0
GO
GO
CREATE VIEW citas_E
AS
SELECT COUNT(cita.estado) AS [Citas Exitosas] FROM cita WHERE cita.estado = 1
GO
GO 
CREATE VIEW total_usuarios_por_pais
AS
SELECT pais.nombre_pais , COUNT(usuario.id_pais)AS cantidad
FROM usuario
	inner join pais ON usuario.id_pais = pais.id_pais
	GROUP BY pais.nombre_pais
GO
GO
CREATE VIEW usuarios_gustos
AS
SELECT usuario.id_usuario, usuario.nombre + ' ' +usuario.apellido_paterno+' '+usuario.apellido_materno AS 
[Nombre Completo],gusto.id_gusto,gusto.descripcion
FROM usuario 
	inner join gusta ON gusta.id_usuario = usuario.id_usuario 
	inner join gusto ON gusta.id_gusto = gusto.id_gusto 
GO
GO
CREATE VIEW usuarios_mexico
AS
SELECT (nombre + ' ' + apellido_paterno + ' ' + apellido_materno) as Nombre_completo, id_usuario, email FROM usuario WHERE id_pais = 1
GO
GO
CREATE VIEW usuarios_hombres

AS
SELECT email, nombre + ' ' + apellido_paterno + ' ' + apellido_materno AS Nombre_completo, id_usuario FROM usuario WHERE sexo = 'M'
GO

GO
CREATE VIEW usuarios_mujeres
AS
SELECT email, (nombre + ' ' + apellido_paterno + ' ' + apellido_materno) AS Nombre_completo, id_usuario FROM usuario WHERE sexo = 'F'
GO

GO
CREATE VIEW usuarios_heterosexuales
AS
SELECT (nombre + ' ' + apellido_paterno + ' ' + apellido_materno) AS Nombre_completo, id_usuario, email FROM usuario WHERE id_orientacion = 1
GO
GO
CREATE VIEW usuarios_homosexuales
AS
SELECT (nombre + ' ' + apellido_paterno + ' ' + apellido_materno) AS Nombre_completo, id_usuario, email FROM usuario WHERE id_orientacion = 2
GO
GO
CREATE VIEW usuarios_bisexuales
AS
SELECT (nombre + ' ' + apellido_paterno + ' ' + apellido_materno) AS Nombre_completo, id_usuario, email FROM usuario WHERE id_orientacion = 3
GO
GO
CREATE VIEW usuarios_asexuales
AS
SELECT (nombre + ' ' + apellido_paterno + ' ' + apellido_materno) AS Nombre_completo, id_usuario, email FROM usuario WHERE id_orientacion = 4
GO
GO
CREATE VIEW usuarios_pansexuales
AS
SELECT (nombre + ' ' + apellido_paterno + ' ' + apellido_materno) AS Nombre_completo, id_usuario, email FROM usuario WHERE id_orientacion = 5
GO
/******************************************PARA LOS TRIGGERS**************************************************/
/***********TABLAS****************/
CREATE TABLE Historial(
id_mov INT IDENTITY,
tipo_mov VARCHAR(20),
tabla VARCHAR(20),
ID_en_Tabla INT,
fecha_mov DATETIME,
CONSTRAINT PK_HU PRIMARY KEY(id_mov));

CREATE TABLE Historial_Citas(
id_mov INT IDENTITY,
tipo_mov VARCHAR(20),
tabla VARCHAR(20),
ID_Solicitado INT,
ID_Solicitante INT,
fecha_mov DATETIME,
CONSTRAINT PK_HC PRIMARY KEY(id_mov));