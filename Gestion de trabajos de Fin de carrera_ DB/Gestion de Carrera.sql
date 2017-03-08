CREATE SCHEMA IF NOT EXISTS GESTION;

USE GESTION;



-- CREACION DE LAS TABLAS
-- *********************************************************************************************************


-- TRABAJO DE FINAL DE CARRERA

CREATE TABLE TFC(TEMA VARCHAR (100) NOT NULL UNIQUE,
				 NO_DE_ORDEN TINYINT(4) NOT NULL,
			     FECHA_INICIO DATE NOT NULL,
                 PRIMARY KEY (TEMA));


-- GRUPOS

CREATE TABLE GRUPOS(NO_GRUPO TINYINT(4) NOT NULL UNIQUE,
					 NOMBRE_GRUPO VARCHAR (40) NOT NULL,
                     COMPONENTES VARCHAR (40) DEFAULT 'SIN',
                     PRIMARY KEY (NO_GRUPO));

 -- DIRECCIONES

CREATE TABLE DIRECCIONES(IDDIRECCION TINYINT(4) NOT NULL AUTO_INCREMENT UNIQUE,
						 CALLE VARCHAR (20) NOT NULL DEFAULT 'SIN CALLE',
                         NUMERO TINYINT (4)  NOT NULL DEFAULT 0,
                         COLONIA VARCHAR (20) NOT NULL DEFAULT 'SIN_COLONIA',
                         DELEGACION VARCHAR (20) NOT NULL DEFAULT 'DESCONOCIDO',
                         CIUDAD VARCHAR (20) NOT NULL DEFAULT 'CIUDAD DE MEXICO',
                         PRIMARY KEY (IDDIRECCION)
                         );


 --  PROFESORES

 CREATE TABLE PROFESORES(DNI_PROFESOR  TINYINT(8),
					 NOMBRE_PROFESOR VARCHAR (20),
                     APELLIDO_PATERNO_PROFESOR VARCHAR (20),
                     APELLIDO_MATERNO_PROFESOR VARCHAR(20),
                     IDDIRECCION TINYINT (4) NOT NULL,
                     PRIMARY KEY (DNI_PROFESOR),

                     CONSTRAINT FK_DIRECCIONES -- SE NE CON LA TABLA DE DIRECCIONES
                     FOREIGN KEY(IDDIRECCION)-- CAMPO A QUIEN HACE REFERENCIA
                     REFERENCES DIRECCIONES (IDDIRECCION) -- LA TABLA A QUIEN HACE REFERENIA Y EL CAMPO
                     ON DELETE CASCADE -- BORRAR EN CASCADA
                     ON UPDATE CASCADE -- ACTUALIZAR EN CASCADA
                     );


 -- ALUMNOS

 CREATE TABLE ALUMNOS(MATRICULA_ALUMNO TINYINT (8) NOT NULL UNIQUE ,
			  NOMBRE_ALUMNO VARCHAR (20) NOT NULL,
              APELLIDO_PATERNO_ALUMNO VARCHAR (20) NOT NULL,
              APELLIDO_MATERNO_ALUMNO VARCHAR (20) NOT NULL,
              DNI_ALUMNO TINYINT (8) NOT NULL,
              DNI_PROFESOR TINYINT (8) NOT NULL,
              TEMA VARCHAR (100)DEFAULT 'DESCONOCIDO',
              NO_GRUPO TINYINT(4) NOT NULL,
              FECHA_INTEGRACION DATE,
              TIPO BOOLEAN DEFAULT 0,
              PRIMARY KEY (MATRICULA_ALUMNO),

               CONSTRAINT FK_PROFESORES -- SE NE CON LA TABLA DE DIRECCIONES
			   FOREIGN KEY(DNI_PROFESOR)-- CAMPO A QUIEN HACE REFERENCIA
			   REFERENCES PROFESORES (DNI_PROFESOR) -- LA TABLA A QUIEN HACE REFERENIA Y EL CAMPO
			   ON DELETE CASCADE -- BORRAR EN CASCADA
			   ON UPDATE CASCADE, -- ACTUALIZAR EN CASCADA

               CONSTRAINT FK_TFC -- SE NE CON LA TABLA DE DIRECCIONES
			   FOREIGN KEY(TEMA)-- CAMPO A QUIEN HACE REFERENCIA
			   REFERENCES TFC (TEMA) -- LA TABLA A QUIEN HACE REFERENIA Y EL CAMPO
			   ON DELETE CASCADE -- BORRAR EN CASCADA
			   ON UPDATE CASCADE, -- ACTUALIZAR EN CASCADA

               CONSTRAINT FK_GRUPOS -- SE NE CON LA TABLA DE DIRECCIONES
			   FOREIGN KEY(NO_GRUPO)-- CAMPO A QUIEN HACE REFERENCIA
			   REFERENCES GRUPOS (NO_GRUPO) -- LA TABLA A QUIEN HACE REFERENIA Y EL CAMPO
			   ON DELETE CASCADE -- BORRAR EN CASCADA
			   ON UPDATE CASCADE -- ACTUALIZAR EN CASCADA
              );

 -- COMITES


 CREATE TABLE COMITES(TRIBUNAL TINYINT(4) NOT NULL UNIQUE,
			          COMPONENTES VARCHAR (40) DEFAULT 'SIN_COMPONENTES' ,
                      LUGAR_EXAMEN VARCHAR (40) DEFAULT 'SIN ASIGNAR',
                      MATRICULA_ALUMNO TINYINT(8) NOT NULL,
                      FECHA DATE,
                      PRIMARY KEY (TRIBUNAL),

                      CONSTRAINT FK_MATRICULA_ALUMNO
                      FOREIGN KEY (MATRICULA_ALUMNO)
                      REFERENCES ALUMNOS (MATRICULA_ALUMNO)
                      ON DELETE CASCADE
                      ON UPDATE CASCADE
                      );


--Próximamente en una DB noSQL. (MongoDB).
