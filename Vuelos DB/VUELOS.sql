
CREATE SCHEMA IF NOT EXISTS VUELOS;

USE VUELOS;



-- *********************************************************************************************************

-- AVIONES

CREATE TABLE AVIONES(MODELO VARCHAR (10) NOT NULL UNIQUE,
			         CAPACIDAD TINYINT(10) NOT NULL DEFAULT 0,
                     PRIMARY KEY (MODELO));
 
 
 -- VUELOS 
 
CREATE TABLE VUELOS(IDVUELO TINYINT(8) NOT NULL AUTO_INCREMENT,
					MODELO VARCHAR (10) NOT NULL,
                    PRIMARY KEY (IDVUELO),
                    
                    CONSTRAINT FK_AVIONES
                    FOREIGN KEY (MODELO)
                    REFERENCES AVIONES (MODELO)
                    ON DELETE NO ACTION
                    ON UPDATE NO ACTION
                    );   
                    
                    
-- AEROPUERTOS


CREATE TABLE AEROPUERTOS(CODIGO_AEROPUERTO TINYINT(5)NOT NULL UNIQUE,
						 NOMBRE VARCHAR (40) NOT NULL DEFAULT 'BENITO JUAREZ',
                         CIUDAD VARCHAR (20) NOT NULL,
                         PAIS VARCHAR (20) NOT NULL DEFAULT 'MEXICO'
                         );
   
   -- ESCALAS 
   
   CREATE TABLE ESCALAS(IDESCALA TINYINT (4) NOT NULL AUTO_INCREMENT,
					    PRIMER_ESCALA VARCHAR (50) NOT NULL,
                        SEGUNDA_ESCALA VARCHAR (50) NOT NULL,
                        TERCERA_ESCALA VARCHAR(50) NOT NULL,
                        PRIMARY KEY (IDESCALA)
                        );
                        
-- AEROLINEAS 

CREATE TABLE AEROLINEAS(IDLINEA TINYINT(4) NOT NULL AUTO_INCREMENT,
						NOMBRE_AEROLINEA VARCHAR(40) NOT NULL UNIQUE,
                        PRIMARY KEY(IDLINEA));                       
   
   
-- PROGRAMAS

CREATE TABLE PROGRAMAS  (NO_VUELO TINYINT (8) NOT NULL UNIQUE,
						 IDLINEA TINYINT (4) NOT NULL,
                         FECHA_DESPEGUE DATE,
                         FEHCA_ATERRIZAJE DATE,
                         CODIGO_AEROPUERTO TINYINT (5) NOT NULL,
                         IDESCALA TINYINT(4) NOT NULL,
                         IDVUELO TINYINT(8) NOT NULL,
                         PRIMARY KEY(NO_VUELO),
                         
                         CONSTRAINT FK_AEROPUERTO
						 FOREIGN KEY (CODIGO_AEROPUERTO)
						 REFERENCES AEROPUERTOS (CODIGO_AEROPUERTO)
						 ON DELETE NO ACTION
						 ON UPDATE NO ACTION,
                         
                         CONSTRAINT FK_ESCALA
						 FOREIGN KEY (IDESCALA)
						 REFERENCES ESCALAS (IDESCALA)
						 ON DELETE NO ACTION
						 ON UPDATE NO ACTION,
                         
                         CONSTRAINT FK_VUELO
						 FOREIGN KEY (IDVUELO)
						 REFERENCES VUELOS (IDVUELO)
						 ON DELETE NO ACTION
						 ON UPDATE NO ACTION,
                         
                         CONSTRAINT FK_AEROLINEA
						 FOREIGN KEY (IDLINEA)
						 REFERENCES AEROLINEAS (IDLINEA)
						 ON DELETE NO ACTION
						 ON UPDATE NO ACTION
                         
                         );                       