-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema militar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema militar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `militar` DEFAULT CHARACTER SET utf8 ;
USE `militar` ;

-- -----------------------------------------------------
-- Table `militar`.`cuarteles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `militar`.`cuarteles` (
  `Codigo_Cuartel` INT(4) NOT NULL,
  `Nombre_Cuartel` VARCHAR(40) NULL DEFAULT NULL,
  `Ubicacion` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`Codigo_Cuartel`),
  UNIQUE INDEX `Codigo_Cuartel` (`Codigo_Cuartel` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `militar`.`compañias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `militar`.`compañias` (
  `No_compañia` INT(3) NOT NULL,
  `Actividad` VARCHAR(40) NULL DEFAULT NULL,
  `Codigo_Cuartel` INT(4) NOT NULL,
  PRIMARY KEY (`No_compañia`),
  UNIQUE INDEX `No_compañia` (`No_compañia` ASC),
  INDEX `FK_Cuartel` (`Codigo_Cuartel` ASC),
  CONSTRAINT `FK_Cuartel`
    FOREIGN KEY (`Codigo_Cuartel`)
    REFERENCES `militar`.`cuarteles` (`Codigo_Cuartel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `militar`.`cuerpos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `militar`.`cuerpos` (
  `Codigo_Cuerpo` INT(4) NOT NULL,
  `Denominacion` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`Codigo_Cuerpo`),
  UNIQUE INDEX `Codigo_Cuerpo` (`Codigo_Cuerpo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `militar`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `militar`.`servicios` (
  `Codigo_Servicios` INT(4) NOT NULL,
  `Descripcion` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`Codigo_Servicios`),
  UNIQUE INDEX `Codigo_Servicios` (`Codigo_Servicios` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `militar`.`soldados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `militar`.`soldados` (
  `Codigo_Soldado` INT(4) NOT NULL,
  `Nombre` VARCHAR(20) NULL DEFAULT NULL,
  `Apellido_Paterno` VARCHAR(20) NULL DEFAULT NULL,
  `Apellido_Materno` VARCHAR(20) NULL DEFAULT NULL,
  `Graduacion` DATE NULL DEFAULT NULL,
  `No_Compañia` INT(3) NOT NULL,
  `Codigo_Cuerpo` INT(4) NOT NULL,
  `Codigo_Servicios` INT(4) NOT NULL,
  `Fecha_Inicio` DATE NOT NULL,
  `Fecha_Fin` DATE NOT NULL,
  PRIMARY KEY (`Codigo_Soldado`),
  UNIQUE INDEX `Codigo_Soldado` (`Codigo_Soldado` ASC),
  INDEX `FK_Compañia` (`No_Compañia` ASC),
  INDEX `FK_Cuerpo` (`Codigo_Cuerpo` ASC),
  INDEX `FK_Servicios` (`Codigo_Servicios` ASC),
  CONSTRAINT `FK_Compañia`
    FOREIGN KEY (`No_Compañia`)
    REFERENCES `militar`.`compañias` (`No_compañia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Cuerpo`
    FOREIGN KEY (`Codigo_Cuerpo`)
    REFERENCES `militar`.`cuerpos` (`Codigo_Cuerpo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Servicios`
    FOREIGN KEY (`Codigo_Servicios`)
    REFERENCES `militar`.`servicios` (`Codigo_Servicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
