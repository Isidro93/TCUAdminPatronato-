-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estudiante` (
  `Id_Estudiante` VARCHAR(15) NOT NULL,
  `Apellido_1` VARCHAR(45) NOT NULL,
  `Apellido_2` VARCHAR(45) NULL,
  `Nombre_Completo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id_Estudiante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Familia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Familia` (
  `Id_Familia` INT NOT NULL AUTO_INCREMENT,
  `Telefono` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Contacto_Principal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id_Familia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pago_Anual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pago_Anual` (
  `Id_Pago_Anual` INT NOT NULL AUTO_INCREMENT,
  `Monto` DOUBLE NOT NULL,
  `Fecha_Cambio` DATETIME NOT NULL,
  PRIMARY KEY (`Id_Pago_Anual`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Familia_Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Familia_Estudiante` (
  `Estudiante_Id_Estudiante` VARCHAR(15) NOT NULL,
  `Familia_Id_Familia` INT NOT NULL,
  PRIMARY KEY (`Estudiante_Id_Estudiante`, `Familia_Id_Familia`),
  INDEX `fk_Familia_Estudiante_Familia1_idx` (`Familia_Id_Familia` ASC),
  CONSTRAINT `fk_Familia_Estudiante_Estudiante`
    FOREIGN KEY (`Estudiante_Id_Estudiante`)
    REFERENCES `mydb`.`Estudiante` (`Id_Estudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Familia_Estudiante_Familia1`
    FOREIGN KEY (`Familia_Id_Familia`)
    REFERENCES `mydb`.`Familia` (`Id_Familia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transaccion` (
  `Id_Transaccion` INT NOT NULL AUTO_INCREMENT,
  `Fecha` VARCHAR(45) NOT NULL,
  `Monto` DOUBLE NOT NULL,
  `Id_Familia` INT NOT NULL,
  `Pago_Anual_Id_Pago_Anual` INT NOT NULL,
  PRIMARY KEY (`Id_Transaccion`, `Id_Familia`, `Pago_Anual_Id_Pago_Anual`),
  INDEX `fk_Transaccion_Familia1_idx` (`Id_Familia` ASC),
  INDEX `fk_Transaccion_Pago_Anual1_idx` (`Pago_Anual_Id_Pago_Anual` ASC),
  CONSTRAINT `fk_Transaccion_Familia1`
    FOREIGN KEY (`Id_Familia`)
    REFERENCES `mydb`.`Familia` (`Id_Familia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaccion_Pago_Anual1`
    FOREIGN KEY (`Pago_Anual_Id_Pago_Anual`)
    REFERENCES `mydb`.`Pago_Anual` (`Id_Pago_Anual`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
