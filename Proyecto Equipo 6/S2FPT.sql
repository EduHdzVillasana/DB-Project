--FUNCIONES
CREATE FUNCTION SOLICITANTE_TOTAL_CITAS_EYF()
RETURNS TABLE
AS
RETURN(SELECT  A.Solicitante, A.[Estatus de Cita], COUNT (A.[Estatus de Cita]) AS [Cantidad de Citas]
FROM
	(SELECT usuario.nombre + ' ' + usuario.apellido_paterno + ' ' + usuario.apellido_materno AS Solicitante, 
		CASE WHEN cita.estado = 1 THEN 'Cita Exitosa'
								ELSE 'Cita No Exitosa' END AS [Estatus de Cita]
	FROM	cita
		inner join usuario ON cita.id_usuario_solicitante = usuario.id_usuario) A
		GROUP BY A.Solicitante, A.[Estatus de Cita]
UNION
SELECT usuario.nombre + ' ' + usuario.apellido_paterno + ' ' + usuario.apellido_materno AS Solicitante, 'Total Citas',
COUNT(cita.id_usuario_solicitante)
	FROM	cita
		inner join usuario ON cita.id_usuario_solicitante = usuario.id_usuario
		GROUP BY usuario.nombre + ' ' + usuario.apellido_paterno + ' ' + usuario.apellido_materno)


		select * from ()
GO
CREATE FUNCTION GUSTOS_POR_PERSONA (@correo varchar(50)) 
RETURNS TABLE
AS
RETURN (
SELECT gusto.id_gusto, gusto.descripcion, gusta.mismos_gustos
FROM usuario 
	inner join gusta ON gusta.id_usuario = usuario.id_usuario 
	inner join gusto ON gusta.id_gusto = gusto.id_gusto 
	WHERE usuario.email = @correo )
GO
CREATE FUNCTION GUSTA_POR_PERSONA_ID (@id int) 
RETURNS TABLE
as
return (
select gusto.id_gusto, gusto.descripcion, gusta.mismos_gustos
from usuario 
	inner join gusta on gusta.id_usuario = usuario.id_usuario 
	inner join gusto on gusta.id_gusto = gusto.id_gusto 
	where usuario.id_usuario = @id )
GO 

CREATE FUNCTION PAREJAS_POSIBLES_ID(@id int)
RETURNS TABLE 
AS
RETURN (
	with idp (id_usuario, id_orientacion, id_estado, sexo) as (
			select usuario.id_usuario, usuario.id_orientacion, usuario.id_estado, usuario.sexo
			from usuario where usuario.id_usuario = @id),
		gdp (id_gusto, mismos_gustos) as (
			select G.id_gusto, G.mismos_gustos
			from GUSTA_POR_PERSONA_ID(@id) as G)
	select usuario.id_usuario, usuario.nombre , count (usuario.nombre) as [Numero de gustos en comun]
	from usuario
		inner join gusta on usuario.id_usuario = gusta.id_usuario
		inner join gdp on gusta.id_gusto = gdp.id_gusto and gusta.mismos_gustos = 1 and gdp.mismos_gustos = 1
		inner join idp on idp.id_estado = usuario.id_estado and idp.id_usuario <> usuario.id_usuario and idp.id_orientacion = usuario.id_orientacion
		where case
					when	idp.id_orientacion = 1 and idp.sexo <> usuario.sexo then 1
					when	idp.id_orientacion = 2 and idp.sexo = usuario.sexo then 1
					when	idp.id_orientacion = 3 or idp.id_orientacion = 4 or idp.id_orientacion = 5 then 1
					else 0
					end = 1
	group by usuario.nombre, usuario.id_usuario)
	GO

	CREATE FUNCTION parejas_posibles_email (@correo varchar (50))
RETURNS TABLE 
AS
RETURN (
	with idp (id_usuario, id_orientacion, id_estado, sexo) as (
			select usuario.id_usuario, usuario.id_orientacion, usuario.id_estado, usuario.sexo
			from usuario where usuario.email = @correo),
		gdp (id_gusto, mismos_gustos) as (
			select G.id_gusto, G.mismos_gustos
			from gustos_por_persona(@correo) as G)
	select usuario.id_usuario, usuario.nombre , count (usuario.nombre) as [Numero de gustos en comun]
	from usuario
		inner join gusta on usuario.id_usuario = gusta.id_usuario
		inner join gdp on gusta.id_gusto = gdp.id_gusto and gusta.mismos_gustos = 1 and gdp.mismos_gustos = 1
		inner join idp on idp.id_estado = usuario.id_estado and idp.id_usuario <> usuario.id_usuario and idp.id_orientacion = usuario.id_orientacion
		where case
					when	idp.id_orientacion = 1 and idp.sexo <> usuario.sexo then 1
					when	idp.id_orientacion = 2 and idp.sexo = usuario.sexo then 1
					when	idp.id_orientacion = 3 or idp.id_orientacion = 4 or idp.id_orientacion = 5 then 1
					else 0
					end = 1
	group by usuario.nombre, usuario.id_usuario)
Go
--PROCEDURE
CREATE PROCEDURE ACTUALIZAR_DIRECCION
@id_usuario INT,@id_paisN TINYINT,
@id_estadoN INT,@id_municipioN INT,
@calleN VARCHAR(200), @numeroN SMALLINT
AS
	DECLARE	@NumError INT = 0,
			@DescError VARCHAR(500) = 'OK'

IF EXISTS( SELECT id_pais FROM pais
WHERE id_pais=@id_paisN )
BEGIN
	UPDATE usuario
	SET id_pais=@id_paisN
	WHERE id_usuario= @id_usuario

END	
IF EXISTS( SELECT estado.id_estado FROM estado
WHERE estado.id_estado=@id_estadoN )
BEGIN
	UPDATE usuario
	SET id_estado=@id_estadoN
	WHERE id_usuario= @id_usuario
END	
IF EXISTS( SELECT id_municipio,id_estado FROM municipio
WHERE id_estado=@id_estadoN AND  id_municipio=@id_municipioN)
BEGIN
	UPDATE usuario 
	SET id_municipio=@id_municipioN,calle=@calleN,numero=@numeroN
	WHERE id_usuario= @id_usuario
END
ELSE
BEGIN
	SET @NumError = 1
	SET	@DescError = 'El Estado o Municipio no existe'
END
Select @NumError As NumError, @DescError As DescError
GO;


CREATE PROCEDURE USUARIOS_POR_PAIS 
AS
SELECT pais.nombre_pais , COUNT(usuario.id_pais) AS cantidad
FROM usuario
	inner join pais ON usuario.id_pais = pais.id_pais
	--where pais.nombre_pais = 'Mexico'
	GROUP BY pais.nombre_pais
GO

CREATE PROCEDURE MOSTRAR_USUARIOS
AS 
SELECT *FROM usuario;


GO
CREATE PROCEDURE CANT_PERSONAS_OS 
@id_orientacion TINYINT
AS 
SELECT (nombre + ' ' + apellido_paterno + ' ' + apellido_materno) AS
Nombre_completo, id_usuario, email FROM usuario WHERE id_orientacion = @id_orientacion
GO
CREATE PROCEDURE PAIS_MAS_USUARIOS 
AS 
SELECT TOP 1 A.nombre_pais, MAX(A.cantidad) AS Cantidad_de_usuarios FROM 

					(SELECT pais.nombre_pais , COUNT(usuario.id_pais) AS cantidad
					FROM usuario
						inner join pais ON usuario.id_pais = pais.id_pais
						GROUP BY pais.nombre_pais) A
						GROUP BY A.nombre_pais ORDER BY MAX(A.cantidad)  DESC
GO		

CREATE PROCEDURE ELIMINAR_USUARIO
@id_usuario INT
AS
	delete gusta where id_usuario=@id_usuario
	delete cita where id_usuario_solicitante=@id_usuario
	delete cita where id_usuario_solicitado=@id_usuario
	delete from usuario where id_usuario=@id_usuario
GO

--TRIGGER
/*INSERTAR EN USUARIO*/
CREATE TRIGGER tr_Usuario_I
ON usuario FOR INSERT
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_usuario from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro insertado','usuario',@ID_en_Tabla,GETDATE())
GO
/*ELIMINAR EN USUARIO*/
CREATE TRIGGER tr_Usuario_E
ON usuario FOR DELETE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_usuario from deleted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro eliminado','usuario',@ID_en_Tabla,GETDATE())
GO
/*ACTUALIZAR EN USUARIO*/
CREATE TRIGGER tr_Usuario_A
ON usuario FOR UPDATE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_usuario from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro actualizado','usuario',@ID_en_Tabla,GETDATE())
GO


/*INSERTAR EN GUSTO*/
CREATE TRIGGER tr_Gusto_I
ON gusto FOR INSERT
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_gusto from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro insertado','gusto',@ID_en_Tabla,GETDATE())
GO
/*ELIMINAR EN GUSTO*/
CREATE TRIGGER tr_Gusto_E
ON gusto FOR DELETE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_gusto from deleted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro eliminado','gusto',@ID_en_Tabla,GETDATE())
GO
/*ACTUALIZAR EN GUSTO*/
CREATE TRIGGER tr_Gusto_A
ON gusto FOR UPDATE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_gusto from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro actualizado','gusto',@ID_en_Tabla,GETDATE())
GO

/*INSERTAR EN CITA*/
CREATE TRIGGER tr_Cita_I
ON cita FOR INSERT
AS
set nocount on
declare @ID_Solicitado INT
declare @ID_Solicitante INT
select @ID_Solicitado= id_usuario_solicitado from inserted
select @ID_Solicitante= id_usuario_solicitante from inserted
INSERT INTO Historial_Citas(tipo_mov,tabla,ID_Solicitado,ID_Solicitante,fecha_mov) 
values('Registro insertado','cita',@ID_Solicitado,@ID_Solicitante,GETDATE())
GO
/*ELIMINAR EN CITA*/
CREATE TRIGGER tr_Cita_E
ON cita FOR DELETE
AS
set nocount on
declare @ID_Solicitado INT
declare @ID_Solicitante INT
select @ID_Solicitado= id_usuario_solicitado from deleted
select @ID_Solicitante= id_usuario_solicitante from deleted
INSERT INTO Historial_Citas(tipo_mov,tabla,ID_Solicitado,ID_Solicitante,fecha_mov) 
values('Registro eliminado','cita',@ID_Solicitado,@ID_Solicitante,GETDATE())
GO
/*ACTUALIZAR EN CITA*/
CREATE TRIGGER tr_Cita_A
ON cita FOR UPDATE
AS
set nocount on
declare @ID_Solicitado INT
declare @ID_Solicitante INT
select @ID_Solicitado= id_usuario_solicitado from inserted
select @ID_Solicitante= id_usuario_solicitante from inserted
INSERT INTO Historial_Citas(tipo_mov,tabla,ID_Solicitado,ID_Solicitante,fecha_mov) 
values('Registro actualizado','cita',@ID_Solicitado,@ID_Solicitante,GETDATE())
GO
--/INSERTAR EN PAIS/
CREATE TRIGGER tr_Pais_I
ON pais FOR INSERT
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_pais from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro insertado','pais',@ID_en_Tabla,GETDATE())
GO
--/ELIMINAR EN PAIS/
CREATE TRIGGER tr_Pais_E
ON pais FOR DELETE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_pais from deleted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro eliminado','pais',@ID_en_Tabla,GETDATE())
GO
--/ACTUALIZAR EN PAIS/
CREATE TRIGGER tr_Pais_A
ON pais FOR UPDATE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_pais from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro actualizado','pais',@ID_en_Tabla,GETDATE())
GO

--/INSERTAR EN ESTADO/
CREATE TRIGGER tr_Estado_I
ON estado FOR INSERT
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_estado from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro insertado','estado',@ID_en_Tabla,GETDATE())
GO
--/ELIMINAR EN ESTADO/
CREATE TRIGGER tr_Estado_E
ON estado FOR DELETE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_estado from deleted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro eliminado','estado',@ID_en_Tabla,GETDATE())
GO
--/ACTUALIZAR EN ESTADO/
CREATE TRIGGER tr_Estado_A
ON estado FOR UPDATE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_estado from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro actualizado','estado',@ID_en_Tabla,GETDATE())
GO

--/INSERTAR EN MUNICIPIO/
CREATE TRIGGER tr_Municipio_I
ON municipio FOR INSERT
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_municipio from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro insertado','municipio',@ID_en_Tabla,GETDATE())
GO
--/ELIMINAR EN MUNICIPIO/
CREATE TRIGGER tr_Municipio_E
ON municipio FOR DELETE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_municipio from deleted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro eliminado','municipio',@ID_en_Tabla,GETDATE())
GO
--/ACTUALIZAR EN MUNICIPIO/
CREATE TRIGGER tr_Municipio_A
ON municipio FOR UPDATE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_municipio from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro actualizado','municipio',@ID_en_Tabla,GETDATE())
GO

--/INSERTAR EN ORIENTACION/
CREATE TRIGGER tr_Orientacion_I
ON orientacion_sexual FOR INSERT
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_orientacion from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro insertado','orientacion sexual',@ID_en_Tabla,GETDATE())
GO
--/ELIMINAR EN ORIENTACION/
CREATE TRIGGER tr_Orientacion_E
ON orientacion_sexual FOR DELETE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_orientacion from deleted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro eliminado','orientacion sexual',@ID_en_Tabla,GETDATE())
GO
--/ACTUALIZAR EN ORIENTACION/
CREATE TRIGGER tr_Orientacion_A
ON orientacion_sexual FOR UPDATE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_orientacion from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro actualizado','orientacion sexual',@ID_en_Tabla,GETDATE())
GO

--/INSERTAR EN CATEGORIA/
CREATE TRIGGER tr_categoria_I
ON categoria FOR INSERT
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_categoria from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro insertado','categoria',@ID_en_Tabla,GETDATE())
GO
--/ELIMINAR EN CATEGORIA/
CREATE TRIGGER tr_Categoria_E
ON categoria FOR DELETE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_categoria from deleted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro eliminado','categoria',@ID_en_Tabla,GETDATE())
GO
--/ACTUALIZAR EN CATEGORIA/
CREATE TRIGGER tr_Categoria_A
ON categoria FOR UPDATE
AS
set nocount on
declare @ID_en_Tabla INT
select @ID_en_Tabla= id_categoria from inserted
INSERT INTO Historial(tipo_mov,tabla,ID_en_Tabla,fecha_mov) values('Registro actualizado','categoria',@ID_en_Tabla,GETDATE())
GO

