-- Creando la base de datos 
create database pruebis;

use pruebis;

--
-- Table structure for table `medico`
--

CREATE TABLE `medico` (
  `rfc` varchar(13) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidoP` varchar(50) NOT NULL,
  `apellidoM` varchar(50) NOT NULL,
  `departamento` varchar(20) DEFAULT NULL,
  `especialidad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rfc`)
);

--
-- Dumping data for table `medico`
--



--
-- Table structure for table `paciente`
--

CREATE TABLE `paciente`(
  `expedientep` varchar(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidoP` varchar(50) NOT NULL,
  `apellidoM` varchar(50) NOT NULL,
  `fecha_de_nacimiento` varchar(20) NOT NULL,
  `sexo` varchar(6) NOT NULL,
  `estatura` float DEFAULT NULL,
  PRIMARY KEY (`expedientep`)
);

--
-- Dumping data for table `paciente`
--

-- tabla para historiales.

CREATE TABLE `historial` (
 `idhistorial` smallint(4) NOT NULL AUTO_INCREMENT,
 `historial` text DEFAULT NULL,
 `comentarios` text DEFAULT NULL,
 `fecha` varchar(12) DEFAULT NULL,
 `expedientep` varchar(11) NOT NULL,
  PRIMARY KEY (`idhistorial`),
  KEY `FK_exp_paciente` (`expedientep`),
  CONSTRAINT `FK_exp_paciente` FOREIGN KEY (`expedientep`) REFERENCES `paciente` (`expedientep`) ON DELETE CASCADE ON UPDATE CASCADE
);






-- base de datos definitiva para el uso del dispositivo.
 

CREATE TABLE `evaluaciones` (
  `idevaluaciones` smallint(4) NOT NULL AUTO_INCREMENT,
  `marcha_normal` tinyint(2) DEFAULT NULL,
  `cambio_de_velocidad` tinyint(2) DEFAULT NULL,
  `movimiento_c_h` tinyint(2) DEFAULT NULL,
  `movimiento_c_v` tinyint(2) DEFAULT NULL,
  `vueltas_pivote` tinyint(2) DEFAULT NULL,
  `sobre_obstaculo` tinyint(2) DEFAULT NULL,
  `lado_obstaculo` tinyint(2) DEFAULT NULL,
  `escaleras` tinyint(2) DEFAULT NULL,
  `puntaje` tinyint(2) DEFAULT NULL,
  `fecha` varchar(12) DEFAULT NULL,
  `coordenadas` text DEFAULT NULL,
  `presion` varchar(7) DEFAULT NULL,
  `peso` float(5) DEFAULT NULL,
 -- `tiempo` tinyint(5) DEFAULT NULL, NO SE SI ESTA LINEA VALLA
  `expedientep` varchar(11) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  PRIMARY KEY (`idevaluaciones`),
  KEY `FK_exp_paciente_evaluaciones` (`expedientep`),
  KEY `FK_rfc_medico` (`rfc`),
  CONSTRAINT `FK_rfc_medico` FOREIGN KEY (`rfc`) REFERENCES `medico` (`rfc`) ON DELETE CASCADE  ON UPDATE CASCADE,
  CONSTRAINT `FK_exp_paciente_evaluaciones` FOREIGN KEY (`expedientep`) REFERENCES `paciente` (`expedientep`) ON DELETE CASCADE ON UPDATE CASCADE
);


--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` varchar(15) NOT NULL,
  `contraseña` varchar(15) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidoP` varchar(20) NOT NULL,
  `apellidoM` varchar(20) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  PRIMARY KEY (`rfc`)
);




