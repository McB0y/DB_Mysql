create schema if not exists pildoras;
use pildoras;

create table CLIENTES(CODIGOCLIENTE VARCHAR (20) NOT NULL PRIMARY KEY,
					  EMPRESA VARCHAR (40),
                      DIRECCION VARCHAR(40),
                      POBLACION VARCHAR (40),
					  TELEFONO INT (10),
					  RESPONSABLE VARCHAR (60));
                      
                      
                      
                      

LOAD DATA INFILE '/ProgramData/MySQL/MySQL Server 5.7/Uploads/CLIENTES.csv' 
INTO TABLE CLIENTES
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' ; 

SHOW VARIABLES LIKE 'secure_file_priv';-- con este comando podemos ver la localidad de la variable

SELECT *from clientes;
DROP TABLE PEDIDOS;




Create table PEDIDOS(NUMERO_PEDIDO TINYINT (4) NOT NULL PRIMARY KEY,
			 CODIGO_CLIENTE VARCHAR (40),
             FECHA_PEDIDO DATE,
             FORMA_PAGO VARCHAR (20),
             DESCUENTO FLOAT,
             ENVIADO VARCHAR (20));



DESCRIBE PEDIDOS;
TRUNCATE PEDIDOS;




INSERT INTO PEDIDOS(NUMERO_PEDIDO, CODIGO_CLIENTE, FECHA_PEDIDO, FORMA_PAGO, DESCUENTO, ENVIADO) 
 VALUES(2,'CT01', NOW(), 'TARJETA', 0.0, 'FALSO');
 SELECT * FROM PEDIDOS;

LOAD DATA INFILE '/ProgramData/MySQL/MySQL Server 5.7/Uploads/PEDIDOS.csv' 
INTO TABLE PEDIDOS
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' ; 
 
 
 