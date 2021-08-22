-- MySQL Script generated by MySQL Workbench
-- Thu Apr 15 01:32:20 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id_usuario` INT NULL,
  `email` VARCHAR(100) NULL,
  `senha` VARCHAR(100) NULL,
  `status` VARCHAR(45) NULL,
  `data_cadastro` TIMESTAMP(100) NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`perfil` (
  `idperfil` INT NOT NULL,
  `nome` VARCHAR(100) NULL,
  `foto` VARCHAR(100) NULL,
  `data_nascimento` TIMESTAMP(100) NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`idperfil`, `id_usuario`),
  INDEX `fk_perfil_usuario1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_perfil_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mydb`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`anotacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`anotacoes` (
  `idanotacoes` INT NOT NULL,
  `data` TIMESTAMP(100) NULL,
  `hora_entrada` VARCHAR(10) NULL,
  `hora_saida` VARCHAR(10) NULL,
  `obs` VARCHAR(1000) NULL,
  `hora_extra_dia` VARCHAR(10) NULL,
  `roleta_inicio` VARCHAR(20) NULL,
  `roleta_encerrante` VARCHAR(20) NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`idanotacoes`, `id_usuario`),
  INDEX `fk_anotacoes_usuario1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_anotacoes_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mydb`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`arquivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`arquivos` (
  `id_arquivos` INT NOT NULL,
  `arquivo` VARCHAR(300) NULL,
  PRIMARY KEY (`id_arquivos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`arquivos_anotacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`arquivos_anotacoes` (
  `id_arquivos_anotacoes` INT NOT NULL,
  `id_anotacoess` INT NULL,
  `id_arquivoss` INT NULL,
  `id_anotacoes` INT NOT NULL,
  `id_arquivos` INT NOT NULL,
  PRIMARY KEY (`id_arquivos_anotacoes`, `id_anotacoes`, `id_arquivos`),
  INDEX `fk_arquivos_anotacoes_anotacoes1_idx` (`id_anotacoes` ASC) VISIBLE,
  INDEX `fk_arquivos_anotacoes_arquivos1_idx` (`id_arquivos` ASC) VISIBLE,
  CONSTRAINT `fk_arquivos_anotacoes_anotacoes1`
    FOREIGN KEY (`id_anotacoes`)
    REFERENCES `mydb`.`anotacoes` (`idanotacoes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arquivos_anotacoes_arquivos1`
    FOREIGN KEY (`id_arquivos`)
    REFERENCES `mydb`.`arquivos` (`id_arquivos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
