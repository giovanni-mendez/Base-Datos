-- Active: 1727132803198@@127.0.0.1@3306
-- MySQL Script generated by MySQL Workbench
-- lun 26 ago 2024 14:35:02
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 5to_Bloody_Roar_2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `5to_Bloody_Roar_2` ;

-- -----------------------------------------------------
-- Schema 5to_Bloody_Roar_2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `5to_Bloody_Roar_2` ;
USE `5to_Bloody_Roar_2` ;

-- -----------------------------------------------------
-- Table `5to_Bloody_Roar_2`.`Personaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5to_Bloody_Roar_2`.`Personaje` (
  `idPersonaje` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `NombreBestia` VARCHAR(45) NOT NULL,
  `ResistenciaBestia` INT DEFAULT 10,
  PRIMARY KEY (`idPersonaje`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5to_Bloody_Roar_2`.`Ataque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5to_Bloody_Roar_2`.`Ataque` (
  `idAtaque` INT NOT NULL AUTO_INCREMENT,
  `Tipo_Ataque` VARCHAR(45) NULL,
  `Danio` INT NULL,
  PRIMARY KEY (`idAtaque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5to_Bloody_Roar_2`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5to_Bloody_Roar_2`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Contrasenia` CHAR(64) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5to_Bloody_Roar_2`.`ModoJuego`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5to_Bloody_Roar_2`.`ModoJuego` (
  `idModoJuego` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idModoJuego`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `5to_Bloody_Roar_2`.`Combate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `5to_Bloody_Roar_2`.`Combate` (
  `idCombate` INT NOT NULL AUTO_INCREMENT,
  `idPersonaje` INT NOT NULL, 
  `idJugador` INT NOT NULL,
  `idModo_Juego` INT NOT NULL,
  `Duracion` INT NULL,
  `Danio` INT NULL, -- Nueva columna para el daño
  PRIMARY KEY (`idCombate`),
  CONSTRAINT `fk_Partida_1`
    FOREIGN KEY (`idJugador`)
    REFERENCES `5to_Bloody_Roar_2`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Partida_2`
    FOREIGN KEY (`idModo_Juego`)
    REFERENCES `5to_Bloody_Roar_2`.`ModoJuego` (`idModoJuego`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Partida_3`
    FOREIGN KEY (`idPersonaje`)
    REFERENCES `5to_Bloody_Roar_2`.`Personaje` (`idPersonaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE INDEX `fk_Partida_1_idx` ON `5to_Bloody_Roar_2`.`Combate` (`idJugador` ASC) VISIBLE;


CREATE INDEX `fk_Partida_2_idx` ON `5to_Bloody_Roar_2`.`Combate` (`idModo_Juego` ASC) VISIBLE;

CREATE INDEX `fk_Partida_3_idx` ON `5to_Bloody_Roar_2`.`Combate` (`idPersonaje` ASC) VISIBLE;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

