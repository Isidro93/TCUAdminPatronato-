-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema admin_patronato
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema admin_patronato
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `admin_patronato` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `admin_patronato` ;

-- -----------------------------------------------------
-- Table `admin_patronato`.`Familia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admin_patronato`.`Familia` (
  `id_familia` INT NOT NULL,
  `id_estudiante` INT NOT NULL,
  `id_encargado` INT NOT NULL,
  PRIMARY KEY (`id_estudiante`, `id_familia`, `id_encargado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `admin_patronato`.`Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admin_patronato`.`Estudiante` (
  `id_estudiantes` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `s_nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `s_apellido` VARCHAR(45) NULL,
  `genero` CHAR(1) NOT NULL,
  PRIMARY KEY (`id_estudiantes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `admin_patronato`.`Encargado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admin_patronato`.`Encargado` (
  `id_encargado` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `s_nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `s_apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`id_encargado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `admin_patronato`.`Familia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admin_patronato`.`Familia` (
  `id_familia` INT NOT NULL,
  `id_estudiante` INT NOT NULL,
  `id_encargado` INT NOT NULL,
  PRIMARY KEY (`id_estudiante`, `id_familia`, `id_encargado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `admin_patronato`.`Cuota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admin_patronato`.`Cuota` (
  `id_cuota` INT NOT NULL,
  `monto_cuota` DOUBLE NOT NULL,
  PRIMARY KEY (`id_cuota`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `admin_patronato`.`Cuota_has_Familia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admin_patronato`.`Cuota_has_Familia` (
  `Cuota_idCuota` INT NOT NULL,
  `Familia_Estudiante_idEstudiantes` INT NOT NULL,
  `Familia_Encargado_Id_Encargado` INT NOT NULL,
  `Familia_idFamilia` INT NOT NULL,
  PRIMARY KEY (`Cuota_idCuota`, `Familia_Estudiante_idEstudiantes`, `Familia_Encargado_Id_Encargado`, `Familia_idFamilia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `admin_patronato`.`Pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admin_patronato`.`Pago` (
  `id_estudiantes` INT NOT NULL,
  `id_familia` INT NOT NULL,
  `id_encargado` INT NOT NULL,
  `id_cuota` INT NOT NULL,
  `monto` DOUBLE NOT NULL,
  `fecha` DATETIME NOT NULL,
  `codigo_reembolso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estudiantes`, `id_familia`, `id_encargado`, `id_cuota`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
