-- MySQL Script generated by MySQL Workbench
-- 05/05/15 19:19:55
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema analisis_clinico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema analisis_clinico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `analisis_clinico` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `analisis_clinico` ;

-- -----------------------------------------------------
-- Table `analisis_clinico`.`Parametros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `analisis_clinico`.`Parametros` (
  `Idparametros` INT NOT NULL,
  `glucosa` INT NULL,
  `trigliceridos` INT NULL,
  `lipidos` INT NULL,
  `coresterol_total` INT NULL,
  `coresterol_alto` INT NULL,
  `coresterol_bajo` INT NULL,
  PRIMARY KEY (`Idparametros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `analisis_clinico`.`muestra_sangre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `analisis_clinico`.`muestra_sangre` (
  `idmuestra_sangre` INT NOT NULL,
  PRIMARY KEY (`idmuestra_sangre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `analisis_clinico`.`Tipo_paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `analisis_clinico`.`Tipo_paciente` (
  `Estado_idEstado` INT NOT NULL,
  `descripcion` TINYINT(1) NULL,
  PRIMARY KEY (`Estado_idEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `analisis_clinico`.`dieta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `analisis_clinico`.`dieta` (
  `id_dieta` INT NOT NULL,
  `tipo 1` VARCHAR(45) NULL,
  `tipo 2` VARCHAR(45) NULL,
  `tipo 3` VARCHAR(45) NULL,
  PRIMARY KEY (`id_dieta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `analisis_clinico`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `analisis_clinico`.`Paciente` (
  `idPaciente` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Parametros_Idparametros` INT NOT NULL,
  `muestra_sangre_idmuestra_sangre` INT NOT NULL,
  `Tipo_paciente_Estado_idEstado` INT NOT NULL,
  `dieta_id_dieta` INT NOT NULL,
  PRIMARY KEY (`idPaciente`),
  INDEX `fk_Paciente_Parametros1_idx` (`Parametros_Idparametros` ASC),
  INDEX `fk_Paciente_muestra_sangre1_idx` (`muestra_sangre_idmuestra_sangre` ASC),
  INDEX `fk_Paciente_Tipo_paciente1_idx` (`Tipo_paciente_Estado_idEstado` ASC),
  INDEX `fk_Paciente_dieta1_idx` (`dieta_id_dieta` ASC),
  CONSTRAINT `fk_Paciente_Parametros1`
    FOREIGN KEY (`Parametros_Idparametros`)
    REFERENCES `analisis_clinico`.`Parametros` (`Idparametros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_muestra_sangre1`
    FOREIGN KEY (`muestra_sangre_idmuestra_sangre`)
    REFERENCES `analisis_clinico`.`muestra_sangre` (`idmuestra_sangre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_Tipo_paciente1`
    FOREIGN KEY (`Tipo_paciente_Estado_idEstado`)
    REFERENCES `analisis_clinico`.`Tipo_paciente` (`Estado_idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_dieta1`
    FOREIGN KEY (`dieta_id_dieta`)
    REFERENCES `analisis_clinico`.`dieta` (`id_dieta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `analisis_clinico`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `analisis_clinico`.`Medico` (
  `idMedico` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `analisis_clinico`.`Estudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `analisis_clinico`.`Estudio` (
  `Folio` INT NOT NULL,
  `noestudio` INT NULL,
  `fecha_I` DATE NULL,
  `fecha_A` VARCHAR(45) NULL,
  `Parametros_Idparametros` INT NOT NULL,
  `Medico_idMedico` INT NOT NULL,
  `Paciente_idPaciente` INT NOT NULL,
  PRIMARY KEY (`Folio`),
  INDEX `fk_Estudio_Paciente1_idx` (`Paciente_idPaciente` ASC),
  INDEX `fk_Estudio_Medico1_idx` (`Medico_idMedico` ASC),
  INDEX `fk_Estudio_Parametros1_idx` (`Parametros_Idparametros` ASC),
  UNIQUE INDEX `Folio_UNIQUE` (`Folio` ASC),
  CONSTRAINT `fk_Estudio_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente`)
    REFERENCES `analisis_clinico`.`Paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudio_Medico1`
    FOREIGN KEY (`Medico_idMedico`)
    REFERENCES `analisis_clinico`.`Medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudio_Parametros1`
    FOREIGN KEY (`Parametros_Idparametros`)
    REFERENCES `analisis_clinico`.`Parametros` (`Idparametros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `analisis_clinico`.`dieta_has_muestra_sangre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `analisis_clinico`.`dieta_has_muestra_sangre` (
  `dieta_id_dieta` INT NOT NULL,
  `muestra_sangre_idmuestra_sangre` INT NOT NULL,
  PRIMARY KEY (`dieta_id_dieta`, `muestra_sangre_idmuestra_sangre`),
  INDEX `fk_dieta_has_muestra_sangre_muestra_sangre1_idx` (`muestra_sangre_idmuestra_sangre` ASC),
  INDEX `fk_dieta_has_muestra_sangre_dieta1_idx` (`dieta_id_dieta` ASC),
  CONSTRAINT `fk_dieta_has_muestra_sangre_dieta1`
    FOREIGN KEY (`dieta_id_dieta`)
    REFERENCES `analisis_clinico`.`dieta` (`id_dieta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dieta_has_muestra_sangre_muestra_sangre1`
    FOREIGN KEY (`muestra_sangre_idmuestra_sangre`)
    REFERENCES `analisis_clinico`.`muestra_sangre` (`idmuestra_sangre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
