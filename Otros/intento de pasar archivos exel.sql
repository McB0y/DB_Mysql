flush privileges;
use pildoras;

create table CLIENTES(CODIGOCLIENTE VARCHAR (4) NOT NULL PRIMARY KEY,
					  EMPRESA VARCHAR (20),
                      DIRECCION VARCHAR(20),
                      POBLACION VARCHAR (20),
					  TELEFORNO TINYINT (10),
					  RESPONSABLE VARCHAR (20),
                      HISTORIAL TEXT);

LOAD DATA INFILE "C:\ProgramData\MySQL\MySQL Server 5.7\Uploads\CLIENTES.csv"
INTO TABLE CLIENTES FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'; 

SHOW VARIABLES LIKE 'secure_file_priv';
Drop database Pildoras;