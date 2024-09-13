-- MySQL Script generated by MySQL Workbench
-- Fri Sep 13 08:09:43 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema capacitacao
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema capacitacao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `capacitacao` DEFAULT CHARACTER SET utf8 ;
USE `capacitacao` ;

-- -----------------------------------------------------
-- Table `capacitacao`.`instrutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`instrutor` (
  `id_Instrutor` 	INT(11) NOT NULL,
  `Nome` 			VARCHAR(100) NULL,
  `Email` 			VARCHAR(100) NULL,
  `valor_Hora` 		DOUBLE NULL,
  `Certificados` 	VARCHAR(255) NULL,
  PRIMARY KEY (`id_Instrutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`curso` (
  `Id_Curso`		INT(11) NOT NULL,
  `Nome` 			VARCHAR(100) NULL,
  `Requisito` 		VARCHAR(100) NULL,
  `Carga_Horaria` 	DOUBLE NULL,
  `Preco` 			DOUBLE NULL,
  PRIMARY KEY (`Id_Curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`turma` (
  `id_Turma` 			INT(11) NOT NULL,
  `Carga_horaria` 		DOUBLE NULL,
  `Data_inicial DATE` 	DATE NULL,
  `Data_Final` 			DATE NULL,
  `Id_Instrutor` 		INT(11) NOT NULL,
  `Id_Curso` 			INT(11) NOT NULL,
  PRIMARY KEY (`id_Turma`, `Id_Instrutor`, `Id_Curso`),
  -- INDEX `fk_turma_instrutor_idx` (`Id_Instrutor` ASC) VISIBLE,
  -- INDEX `fk_turma_curso1_idx` (`Id_Curso` ASC) VISIBLE,
  CONSTRAINT `fk_turma_instrutor`
    FOREIGN KEY (`Id_Instrutor`)
    REFERENCES `capacitacao`.`instrutor` (`id_Instrutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_curso1`
    FOREIGN KEY (`Id_Curso`)
    REFERENCES `capacitacao`.`curso` (`Id_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`aluno` (
  `Id_Aluno` 		INT(11) NOT NULL,
  `Nome` 			VARCHAR(100) NULL,
  `Cpf` 			VARCHAR(15) NULL,
  `DataNasc` 		DATE NULL,
  `Fone` 			CHAR(14) NULL,
  `Email` 			VARCHAR(100) NULL,
  PRIMARY KEY (`Id_Aluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`matricula` (
  `Id_Matricula` 	INT(11) NOT NULL,
  `Data_Matricula` 	DATE NULL,
  `Id_Aluno` 		INT(11) NOT NULL, -- chave estrangeira
  `Id_Turma` 		INT(11) NOT NULL, -- chave estrangeira
  PRIMARY KEY (`Id_Matricula`, `Id_Aluno`, `Id_Turma`),
  -- INDEX `fk_matricula_turma1_idx` (`Id_Aluno` ASC, `Id_Turma` ASC) VISIBLE,
  CONSTRAINT `fk_matricula_turma1`
    FOREIGN KEY (`Id_Aluno` , `Id_Turma`)
    REFERENCES `capacitacao`.`turma` (`Id_Instrutor` , `Id_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_aluno1`
    FOREIGN KEY ()
    REFERENCES `capacitacao`.`aluno` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;