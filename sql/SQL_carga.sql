CREATE DATABASE IF NOT EXISTS enacom;
USE enacom;

DROP TABLE IF EXISTS acceso_rango_velocidad_provincia;
CREATE TABLE IF NOT EXISTS acceso_rango_velocidad_provincia (
año 					INT,
trimestre 				INT,
hasta_512_kbps 			INT,
512_Kbps_1_Mbps 		INT,
1_Mbps_6_Mbps			INT,
6_Mbps_10_Mbps		 	INT,
10_Mbps20_Mbps			INT,
20_Mbps_30_Mbps			INT,
Mas_30_Mbps				INT,
otros					INT,
total					INT,
id_provincia			INT
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Enacom\\acceso_a_internet_fijo_por_rangos_de_velocidad_de_bajada_y_provincia.csv'
INTO TABLE acceso_rango_velocidad_provincia
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS acceso_tecnologia_provincia;
CREATE TABLE IF NOT EXISTS acceso_tecnologia_provincia (
año 			INT,
trimestre 		INT,
adsl 			INT,
cablemodem 		INT,
fibra_optica	INT,
wirless		 	INT,
otros			INT,
total			INT,
id_provincia	INT
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Enacom\\acceso_a_internet_fijo_por_tecnologia_y_provincia.csv'
INTO TABLE acceso_tecnologia_provincia
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS ingresos_internet_fijo;
CREATE TABLE IF NOT EXISTS ingresos_internet_fijo (
año 			INT,
trimestre 		INT,
ingreso_pesos 	INT
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Enacom\\ingresos_por_la_operacion_del_servicio_de_internet_fijo.csv'
INTO TABLE ingresos_internet_fijo
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS accesos_cada_100_hogares_internet;
CREATE TABLE IF NOT EXISTS accesos_cada_100_hogares_internet (
año 						INT,
trimestre 					INT,
accesos_cada_100_hogares	INT,
id_provincia				INT
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Enacom\\penetracion_del_internet_fijo_por_provincia_(accesos_por_cada_100_hogares).csv'
INTO TABLE accesos_cada_100_hogares_internet
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS accesos_bancha_bangosta;
CREATE TABLE IF NOT EXISTS accesos_bancha_bangosta (
año 			INT,
trimestre 		INT,
banda_ancha		INT,
dial_up			INT,
total			INT,
id_provincia	INT
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Enacom\\accesos_a_banda_ancha_y_banda_angosta_por_provincia.csv'
INTO TABLE accesos_bancha_bangosta
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS velocidad_media_provincia;
CREATE TABLE IF NOT EXISTS velocidad_media_provincia (
año 			INT,
trimestre 		INT,
Mbps_media		DECIMAL(7,2),
id_provincia	INT
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Enacom\\Velocidad_media_de_bajada_de _Internet_fijo_por_provincia.csv'
INTO TABLE velocidad_media_provincia
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS accesos_cada_100_telefonia_fija;
CREATE TABLE IF NOT EXISTS accesos_cada_100_telefonia_fija (
año 							INT,
trimestre 						INT,
accesos_cada_100_habitantes		DECIMAL(7,2),
accesos_cada_100_hogares		DECIMAL(7,2),
id_provincia					INT
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Enacom\\Penetración_provincial_telefonia_fija_accesos_cada_100_hogares.csv'
INTO TABLE accesos_cada_100_telefonia_fija
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS provincias;
CREATE TABLE IF NOT EXISTS provincias(
categoria 		VARCHAR(20),
latitud			DECIMAL(15,12),
longitud		DECIMAL(15,12),
fuente			VARCHAR(10),
id_provincia	INT,
iso_id			VARCHAR(10),
iso_nombre		VARCHAR(50),
nombre			VARCHAR(50),
nombre_completo VARCHAR(100)		
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Enacom\\provincias.csv'
INTO TABLE provincias
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;
