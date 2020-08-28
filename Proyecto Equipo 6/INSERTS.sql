
INSERT INTO gusto VALUES (1,2,'Jugar Futbol')
INSERT INTO gusto VALUES (2,2,'Jugar BasquetBall')
INSERT INTO gusto VALUES (3,2,'Jugar Tenis')
INSERT INTO gusto VALUES (4,2,'Correr')
INSERT INTO gusto VALUES (5,2,'Ir al Gimnasio')
INSERT INTO gusto VALUES (6,2,'Jugar BaseBall')
INSERT INTO gusto VALUES (7,2,'Practicar Muai Thai')
INSERT INTO gusto VALUES (8,1,'Cenas')
INSERT INTO gusto VALUES (9,1,'Fiestas')
INSERT INTO gusto VALUES (10,1,'Ir al Cine')
INSERT INTO gusto VALUES (11,1,'Ir al Parque')
INSERT INTO gusto VALUES (12,1,'Circulos de Lectura')
INSERT INTO gusto VALUES (13,1,'Ir a Museos')
INSERT INTO gusto VALUES (14,1,'Ir a los Bolos')
INSERT INTO gusto VALUES (15,3,'Tocar el Piano')
INSERT INTO gusto VALUES (16,3,'Tocar la Guitarra')
INSERT INTO gusto VALUES (17,3,'Tocar el Violin')
INSERT INTO gusto VALUES (18,3,'Tocar la Bateria')
INSERT INTO gusto VALUES (19,3,'Cantar')
INSERT INTO gusto VALUES (20,3,'Tocar el Bajo')
INSERT INTO gusto VALUES (21,3,'Tocar en una Banda')

SELECT *FROM categoria;
INSERT INTO categoria(id_categoria,nombre) VALUES (1,'Evento Social');
INSERT INTO categoria(id_categoria,nombre) VALUES (2,'Deporte');
INSERT INTO categoria(id_categoria,nombre) VALUES (3,'Musica');

SELECT *FROM orientacion_sexual;
INSERT INTO orientacion_sexual(id_orientacion,descripcion) VALUES (1,'Heterosexual');
INSERT INTO orientacion_sexual(id_orientacion,descripcion) VALUES (2,'Homosexual');
INSERT INTO orientacion_sexual(id_orientacion,descripcion) VALUES (3,'Bisexual');
INSERT INTO orientacion_sexual(id_orientacion,descripcion) VALUES (4,'Asexual');
INSERT INTO orientacion_sexual(id_orientacion,descripcion) VALUES (5,'Pansexual');
 
SELECT *FROM estado;
INSERT INTO pais(id_pais,nombre_pais) VALUES (1,'Mexico');
INSERT INTO pais(id_pais,nombre_pais) VALUES (2,'Estados unidos');
INSERT INTO pais(id_pais,nombre_pais) VALUES (3,'Alemania');
INSERT INTO pais(id_pais,nombre_pais) VALUES (4,'China');

SELECT *FROM estado;
INSERT INTO estado VALUES(1,'Quintana Roo')
INSERT INTO estado VALUES(1,'Zacatecas')

INSERT INTO estado VALUES(2,'Hawai')
INSERT INTO estado VALUES(2,'Luisiana')

INSERT INTO estado VALUES(3,'Brandeburgo')
INSERT INTO estado VALUES(3,'Baviera')

INSERT INTO estado VALUES(4,'Hubei')
INSERT INTO estado VALUES(4,'Jilin')

--MUNICIPIOS
SELECT *FROM municipio;
INSERT INTO municipio VALUES (1,1,'Bacalar')
INSERT INTO municipio VALUES (1,1,'Isla Mujeres')

INSERT INTO municipio VALUES (2,1,'Zacatecas')
INSERT INTO municipio VALUES (2,1,'Tepetongo')

INSERT INTO municipio VALUES (3,2,'Honolulu')
INSERT INTO municipio VALUES (3,2,'Oahu')

INSERT INTO municipio VALUES (4,2,'Nueva Orleans')
INSERT INTO municipio VALUES (4,2,'Monroe')

INSERT INTO municipio VALUES (5,3,'Forst')
INSERT INTO municipio VALUES (5,3,'Potsdam')

INSERT INTO municipio VALUES (6,3,'Munich')
INSERT INTO municipio VALUES (6,3,'Fussen')

INSERT INTO municipio VALUES (7,4,'Wuhan')
INSERT INTO municipio VALUES (7,4,'Suizhou')

INSERT INTO municipio VALUES (8,4,'Yanji')
INSERT INTO municipio VALUES (8,4,'Baishan')

insert into Usuario values (9, 'machinegunn97@gmail.com', '51864ghj', 'M', 0xff,'Daniel','Montemayor','Zuro',1,2,3,'Calle 1',123,'1996-08-31',1)
insert into Usuario values (10, 'correoardiente@hotmail.com', '51864ghj', 'F', 0xff,'Karla','Willbert','Peres',1,2,3,'Yang Sechan',987,'1996-08-31',1)
insert into Usuario values (11, 'balanaranja.com', '51864ghj', 'M', 0xff,'Brayan','Flores','De la Rosa',1,2,3,'Matamoros',987,'1996-08-31',2)
insert into Usuario values (12, 'anggelavatar@hotmail.com', '51864ghj', 'M', 0xff,'Angg','Ramirez','Cuacthemoc',1,2,3,'Olivia Ramirex',987,'1996-08-31',2)
insert into Usuario values (13, 'pedroypablo@tnorte.com', '51864ghj', 'M', 0xff,'Pedro','De Leon','Hernandez',1,2,3,'Alberto Carrera',987,'1996-08-31',2)
insert into Usuario values (14, 'lauritagarza@hotmail.com', '51864ghj', 'F', 0xff,'Laura','Garza','Guerra',1,2,3,'Hacienda Escondida',987,'1996-08-31',1)
insert into Usuario values (15, 'emilioguerra@hotmail.com', '51864ghj', 'M', 0xff,'Emilio','Guerra','Guerrero',1,2,3,'Hidalgo',987,'1996-08-31',2)
insert into Usuario values (16, 'katara@hotmail.com', '51864ghj', 'F', 0xff,'Katara','Villanueva','Peres',1,2,3,'Berreosabal',987,'1996-08-31',3)
insert into Usuario values (17, 'lucardmo@hotmail.com', '51864ghj', 'F', 0xff,'Lucero','Castro','Zepeda',1,2,3,'Anaya',987,'1996-08-31',3)
insert into Usuario values (18, 'traicymosby@hotmail.com', '51864ghj', 'F', 0xff,'Traicy','Mosby','Padron',1,2,3,'Barragan',987,'1996-08-31',3)
insert into Usuario values (19, 'cameliatexana@hotmail.com', '51864ghj', 'F', 0xff,'Camelia','Vega','Castro',1,2,3,'Naciones Unidas',987,'1996-08-31',3)

select *from usuario
INSERT INTO gusta VALUES (9,21,'2020-01-05',1)
INSERT INTO gusta VALUES (9,17,'2020-05-31',1)
INSERT INTO gusta VALUES (9,4,'2019-06-01',1)
INSERT INTO gusta VALUES (9,16,'2020-06-01',0)

INSERT INTO gusta VALUES (10,21,'2020-01-05',1)
INSERT INTO gusta VALUES (10,17,'2020-05-31',1)
INSERT INTO gusta VALUES (10,4,'2019-06-01',1)
INSERT INTO gusta VALUES (10,16,'2020-06-01',0)

INSERT INTO gusta VALUES (11,11,'2020-01-05',1)
INSERT INTO gusta VALUES (11,7,'2020-05-31',1)
INSERT INTO gusta VALUES (11,14,'2019-06-01',1)
INSERT INTO gusta VALUES (11,4,'2020-06-01',1)

INSERT INTO gusta VALUES (12,5,'2020-01-05',1)
INSERT INTO gusta VALUES (12,7,'2020-05-31',1)
INSERT INTO gusta VALUES (12,8,'2019-06-01',1)
INSERT INTO gusta VALUES (12,6,'2020-06-01',1)

INSERT INTO gusta VALUES (13,9,'2020-01-05',1)
INSERT INTO gusta VALUES (13,8,'2020-05-31',1)
INSERT INTO gusta VALUES (13,6,'2019-06-01',1)
INSERT INTO gusta VALUES (13,4,'2020-06-01',1)

INSERT INTO gusta VALUES (14,4,'2020-01-05',1)
INSERT INTO gusta VALUES (14,2,'2020-05-31',1)
INSERT INTO gusta VALUES (14,1,'2019-06-01',1)
INSERT INTO gusta VALUES (14,3,'2020-06-01',1)

INSERT INTO gusta VALUES (15,6,'2020-01-05',0)
INSERT INTO gusta VALUES (15,4,'2020-05-31',1)
INSERT INTO gusta VALUES (15,2,'2019-06-01',1)
INSERT INTO gusta VALUES (15,9,'2020-06-01',1)

INSERT INTO gusta VALUES (16,16,'2020-01-05',1)
INSERT INTO gusta VALUES (16,17,'2020-05-31',1)
INSERT INTO gusta VALUES (16,14,'2019-06-01',1)
INSERT INTO gusta VALUES (16,8,'2020-06-01',1)

INSERT INTO gusta VALUES (17,20,'2020-01-05',1)
INSERT INTO gusta VALUES (17,21,'2020-05-31',1)
INSERT INTO gusta VALUES (17,4,'2019-06-01',1)
INSERT INTO gusta VALUES (17,8,'2020-06-01',0)

INSERT INTO gusta VALUES (18,1,'2020-01-05',1)
INSERT INTO gusta VALUES (18,12,'2020-05-31',1)
INSERT INTO gusta VALUES (18,13,'2019-06-01',1)
INSERT INTO gusta VALUES (18,4,'2020-06-01',1)

INSERT INTO gusta VALUES (19,13,'2020-01-05',1)
INSERT INTO gusta VALUES (19,12,'2020-05-31',1)
INSERT INTO gusta VALUES (19,14,'2019-06-01',0)
INSERT INTO gusta VALUES (19,10,'2020-06-01',1)
INSERT INTO Usuario VALUES (1, 'josePerez@hotmail.com', 'buñuelos', 'M', 0xff,'Jose','Perez','Cantu',1,2,3,'Lila',113,'1995-01-27',1)

INSERT INTO gusta VALUES (1,4,'2020-03-02',1)
INSERT INTO gusta VALUES (1,5,'2019-12-27',0)
INSERT INTO gusta VALUES (1,21,'2020-02-24',1)
INSERT INTO gusta VALUES (1,17,'2020-05-29',1)

INSERT INTO Usuario values (2, 'IrisMatias@hotmail.com', 'AzUlEs', 'F', 0xff,'Iris','Rivera','Matias',1,1,1,'Bugambilia',788,'1999-08-10',2)

INSERT INTO gusta VALUES (2,14,'2020-04-18',1)
INSERT INTO gusta VALUES (2,16,'2020-02-12',1)
INSERT INTO gusta VALUES (2,12,'2020-03-14',1)



INSERT INTO Usuario VALUES (3, 'JamieJam@hotmail.com', 'letswrites', 'F', 0xff,'Jamie','James','Richardson',2,3,5,'Washington Avenue',145,'1998-12-17',3)

INSERT INTO gusta VALUES (3,14,'2020-03-02',0)
INSERT INTO gusta VALUES (3,5,'2019-10-23',1)
INSERT INTO gusta VALUES (3,13,'2020-02-15',1)
INSERT INTO gusta VALUES (3,7,'2018-06-23',0)
INSERT INTO gusta VALUES (3,6,'2020-01-25',1)
INSERT INTO gusta VALUES (3,18,'2020-01-05',1)


INSERT INTO Usuario VALUES (4, 'WayBack@hotmail.com', 'comeback13', 'F', 0xff,'Louis','Charleston','Smith',2,4,7,'Green Mountain',711,'1990-04-03',1)

INSERT INTO gusta VALUES (4,4,'2020-02-05',1)
INSERT INTO gusta VALUES (4,16,'2020-04-16',1)


INSERT INTO Usuario VALUES (5, 'Imagine2000@hotmail.com', 'Allthepeo', 'M', 0xff,'Gin','Mason','Avery',3,5,9,'Berlin',119,'1993-02-27',4)

INSERT INTO gusta VALUES (5,21,'2020-01-05',1)
INSERT INTO gusta VALUES (5,17,'2020-05-31',1)
INSERT INTO gusta VALUES (5,4,'2019-06-01',1)
INSERT INTO gusta VALUES (5,16,'2020-06-01',1)


INSERT INTO Usuario values (6, 'NoahFini@hotmail.com', 'HighHopes1', 'F', 0xff,'Noah','Fischer','Muller',3,6,11,'Magner St.',1064,'1990-05-22',1)

INSERT INTO gusta VALUES (6,19,'2020-05-13',0)
INSERT INTO gusta VALUES (6,9,'2019-11-01',1)
INSERT INTO gusta VALUES (6,10,'2020-03-14',0)
INSERT INTO gusta VALUES (6,1,'2018-06-01',1)

INSERT INTO Usuario values (7, 'WangJEFromT@hotmail.com', 'theArqui', 'M', 0xff,'Jia','Er','Wang',4,7,14,'Qianshing Huton',287,'1995-11-09',1)

INSERT INTO gusta VALUES (7,13,'2019-06-01',1)
INSERT INTO gusta VALUES (7,18,'2020-06-01',1)
INSERT INTO gusta VALUES (7,7,'2017-06-14',0)


INSERT INTO Usuario VALUES (8, 'ZhuoXin@hotmail.com', '51864ghj', 'F', 0xff,'Bing','Wen','Zhou',4,8,16,'Yang Sechan',987,'1996-08-31',5)


insert into Usuario values (22, 'Genaro71@outlook.com', 'carly09', 'M', 0xff,'Luis Genaro','Rodriguez','Saldivar',1,2,3,'Aztlan',1015,'1993-12-10',2)



INSERT INTO gusta VALUES (22,1,'2020-04-15',0)

INSERT INTO gusta VALUES (22,10,'2020-03-21',1)

INSERT INTO gusta VALUES (22,19,'2020-05-01',1)

INSERT INTO gusta VALUES (22,16,'2020-05-20',0)

INSERT INTO Usuario VALUES (23, 'DianaT1@gmail.com', 'lentes04', 'F', 0xff,'Diana','Torres','Cuevas',1,2,3,'Constituyentes',2050,'1998-03-22',5)



INSERT INTO gusta VALUES (23,10,'2020-01-09',1)

INSERT INTO gusta VALUES (23,17,'2020-04-07',1)

INSERT INTO gusta VALUES (23,6,'2019-11-16',1)

INSERT INTO gusta VALUES (23,4,'2020-05-18',1)

insert into Usuario values (24, 'Luciaquo@hotmail.com', 'eagles98', 'F', 0xff,'Andrea Lucia','De la cruz','Obispar',1,2,3,'Privada angeles',0560,'1999-11-20',2)



INSERT INTO gusta VALUES (24,14,'2019-08-15',0)

INSERT INTO gusta VALUES (24,5,'2020-04-10',1)

INSERT INTO gusta VALUES (24,11,'2020-05-22',1)

INSERT INTO gusta VALUES (24,15,'2020-01-20',1)

insert into Usuario values (25, 'karenyon@gmail.com', 'jacki154', 'F', 0xff,'Karen','Fuente','Hermosillo',1,2,3,'Calzada luz',1008,'1994-07-06',1)



INSERT INTO gusta VALUES (25,3,'2019-12-19',1)

INSERT INTO gusta VALUES (25,8,'2020-03-27',1)

INSERT INTO gusta VALUES (25,12,'2020-03-11',1)

INSERT INTO gusta VALUES (25,19,'2020-05-10',0)

insert into Usuario values (26, 'Juanakats@gmail.com', 'naruto19', 'M', 0xff,'Juan Carlos','Arenas','Arroyo',1,2,3,'Cedro',1592,'1998-09-02',4)



INSERT INTO gusta VALUES (26,18,'2020-05-21',0)

INSERT INTO gusta VALUES (26,21,'2019-10-25',0)

INSERT INTO gusta VALUES (26,9,'2020-01-27',1)

INSERT INTO gusta VALUES (26,7,'2020-04-22',1)

insert into Usuario values (27, 'SamantRT@hotmail.com', 'howard67', 'F', 0xff,'Samantha','Jonar','Bolivar',1,2,3,'Juarez',1813,'1998-04-01',1)



INSERT INTO gusta VALUES (27,9,'2020-02-14',1)

INSERT INTO gusta VALUES (27,13,'2020-04-02',1)

INSERT INTO gusta VALUES (27,15,'2020-06-01',0)

INSERT INTO gusta VALUES (27,4,'2020-05-19',1)

insert into Usuario values (28, 'Jolyjom@outlook.com', 'jami99', 'F', 0xff,'Amanda Luz','Cantu','Vazquez',1,2,3,'No reeleccion',9876,'1999-01-04',3)



INSERT INTO gusta VALUES (28,12,'2020-03-10',1)

INSERT INTO gusta VALUES (28,10,'2020-04-28',1)

INSERT INTO gusta VALUES (28,19,'2020-03-12',0)

INSERT INTO gusta VALUES (28,8,'2020-05-22',1)

insert into Usuario values (29, 'kevn23@hotmail.com', 'sausage43', 'M', 0xff,'Kevin Daniel','Lopez','Cordero',1,2,3,'Madrid',5867,'1996-05-17',1)



INSERT INTO gusta VALUES (29,1,'2020-04-15',1)

INSERT INTO gusta VALUES (29,2,'2020-05-10',0)

INSERT INTO gusta VALUES (29,5,'2020-03-29',1)

INSERT INTO gusta VALUES (29,9,'2020-02-18',1)

insert into Usuario values (30, 'Franc78@gmail.com', 'manchester08', 'M', 0xff,'Francisco','Juarez','Aguilar',1,2,3,'Boca de rio',6052,'1994-02-10',2)



INSERT INTO gusta VALUES (30,11,'2020-05-20',1)

INSERT INTO gusta VALUES (30,1,'2020-01-27',0)

INSERT INTO gusta VALUES (30,16,'2020-05-09',1)

INSERT INTO gusta VALUES (30,14,'2020-01-03',1)

insert into Usuario values (32, 'Markin6@hotmail.com', 'dairy66', 'M', 0xff,'Marcos','Oviedo','Carmen',1,2,3,'Robles',0098,'1995-10-20',5)



INSERT INTO gusta VALUES (32,7,'2020-04-11',1)

INSERT INTO gusta VALUES (32,13,'2020-02-20',1)

INSERT INTO gusta VALUES (32,17,'2019-06-15',1)

INSERT INTO gusta VALUES (32,19,'2020-03-19',1)

insert into Usuario values (33, 'Omarmar@outlook.com', 'verma21', 'M', 0xff,'Omar Alfredo','Coronado','Ruiz',1,2,3,'Vasconcelos',1112,'1998-11-03',2)



INSERT INTO gusta VALUES (33,3,'2020-05-10',1)

INSERT INTO gusta VALUES (33,10,'2020-05-11',0)

INSERT INTO gusta VALUES (33,13,'2020-01-22',1)

INSERT INTO gusta VALUES (33,8,'2019-12-24',1)

insert into Usuario values (34, 'Jannsi12@hotmail.com', 'luna24', 'F', 0xff,'Janneth','Garcia','Fuente',1,2,3,'Lagos',8765,'1999-04-16',1)



INSERT INTO gusta VALUES (34,4,'2020-05-21',0)

INSERT INTO gusta VALUES (34,5,'2020-04-01',1)

INSERT INTO gusta VALUES (34,9,'2020-03-15',1)

INSERT INTO gusta VALUES (34,19,'2020-03-14',0)

insert into Usuario values (35, 'manim89@hotmail.com', 'fly76', 'F', 0xff,'Marina','Quintana','Lomar',1,2,3,'Chapultepec',9801,'1997-07-15',4)



INSERT INTO gusta VALUES (35,5,'2020-01-05',1)

INSERT INTO gusta VALUES (35,10,'2020-04-22',1)

INSERT INTO gusta VALUES (35,11,'2020-04-10',1)

INSERT INTO gusta VALUES (35,19,'2020-05-09',0)

insert into Usuario values (36, 'Arlet73@gmail.com', 'rosemary6', 'F', 0xff,'Arleth Maria','Quintanilla','De jesus',1,2,3,'4 de julio',3426,'1997-12-20',5)



INSERT INTO gusta VALUES (36,13,'2020-05-10',1)

INSERT INTO gusta VALUES (36,15,'2020-01-15',1)

INSERT INTO gusta VALUES (36,2,'2020-01-22',0)

INSERT INTO gusta VALUES (36,4,'2020-04-26',1)

insert into Usuario values (37, 'Sergio09@hotmail.com', 'varim73', 'M', 0xff,'Sergio','Andrade','Nava',1,2,3,'Mar pacifico',2023,'1994-11-15',5)



INSERT INTO gusta VALUES (37,7,'2020-02-26',0)

INSERT INTO gusta VALUES (37,19,'2020-01-25',1)

INSERT INTO gusta VALUES (37,2,'2020-04-15',1)

INSERT INTO gusta VALUES (37,8,'2020-02-10',0)

insert into Usuario values (38, 'richar56@hotmail.com', 'navebar28', 'M', 0xff,'Ricardo Manuel','Sevilla','Cruz',1,2,3,'Vaticano',8399,'1995-12-26',3)



INSERT INTO gusta VALUES (38,6,'2020-04-10',1)

INSERT INTO gusta VALUES (38,4,'2020-04-23',1)

INSERT INTO gusta VALUES (38,12,'2020-01-15',0)

INSERT INTO gusta VALUES (38,15,'2020-04-20',1)

insert into Usuario values (39, 'Jack64@gmail.com', 'plomo8', 'F', 0xff,'Fernanda Jaqueline','Montenegro','Orizaba',1,2,3,'5 de mayo',2165,'1998-04-23',2)



INSERT INTO gusta VALUES (39,7,'2020-05-26',1)

INSERT INTO gusta VALUES (39,19,'2019-11-28',0)

INSERT INTO gusta VALUES (39,20,'2020-05-15',1)

INSERT INTO gusta VALUES (39,5,'2020-01-19',1)

insert into Usuario values (40, 'Honey54@hotmail.com', 'varas32', 'F', 0xff,'Monica','Esperanza','Jimenez',1,2,3,'Hidalgo',2456,'1999-12-17',2)



INSERT INTO gusta VALUES (40,2,'2020-03-26',0)

INSERT INTO gusta VALUES (40,4,'2020-05-28',1)

INSERT INTO gusta VALUES (40,9,'2019-10-14',1)

INSERT INTO gusta VALUES (40,10,'2020-05-25',0);
INSERT INTO cita VALUES (1,2,'2020-06-01','CUERNAVACA',1);
INSERT INTO cita VALUES (1,3,'2020-04-10','DOGOS',0);
INSERT INTO cita VALUES (2,4,'2019-03-15','TACOS',1);
INSERT INTO cita VALUES (5,7,'2018-02-15','HAMBUGUESAS EL GUERO',1);
INSERT INTO cita VALUES (7,20,'2019-07-25','PIZZAS GUGOS',0);
INSERT INTO cita VALUES (2,6,'2019-01-24','PLAZA DE LA TECNOLOGIA',1);
INSERT INTO cita VALUES (6,1,'2017-02-13','SAYU',0);