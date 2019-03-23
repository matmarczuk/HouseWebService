-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema InteligentHouse
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema InteligentHouse
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `InteligentHouse` DEFAULT CHARACTER SET latin1 ;
USE `InteligentHouse` ;

-- -----------------------------------------------------
-- Table `InteligentHouse`.`Mieszkanie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InteligentHouse`.`Mieszkanie` (
  `idMieszkanie` INT(11) NOT NULL AUTO_INCREMENT,
  `Numer` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idMieszkanie`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InteligentHouse`.`Alarm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InteligentHouse`.`Alarm` (
  `idAlarm` INT(11) NOT NULL AUTO_INCREMENT,
  `Data` DATETIME NULL DEFAULT NULL,
  `Opis` LONGTEXT NULL DEFAULT NULL,
  `fkMieszkanie` INT(11) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idAlarm`),
  INDEX `fk_Alarm_1_idx` (`fkMieszkanie` ASC),
  CONSTRAINT `fk_Alarm_1`
    FOREIGN KEY (`fkMieszkanie`)
    REFERENCES `InteligentHouse`.`Mieszkanie` (`idMieszkanie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InteligentHouse`.`Gosc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InteligentHouse`.`Gosc` (
  `idGosc` INT(11) NOT NULL AUTO_INCREMENT,
  `Imie` VARCHAR(45) NULL DEFAULT NULL,
  `Nazwisko` VARCHAR(45) NULL DEFAULT NULL,
  `Tablica_rejstracyjna` VARCHAR(45) NULL DEFAULT NULL,
  `fkMieszkanie` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idGosc`),
  INDEX `fk_Gosc_1_idx` (`fkMieszkanie` ASC),
  CONSTRAINT `fk_Gosc_1`
    FOREIGN KEY (`fkMieszkanie`)
    REFERENCES `InteligentHouse`.`Mieszkanie` (`idMieszkanie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InteligentHouse`.`Pomieszczenie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InteligentHouse`.`Pomieszczenie` (
  `idPomieszczenie` INT(11) NOT NULL AUTO_INCREMENT,
  `Nazwa` VARCHAR(45) NULL DEFAULT NULL,
  `Typ` ENUM('bathroom', 'childroom', 'livingroom', 'wardrobe', 'kitchen', 'bedroom') NULL DEFAULT NULL,
  `fkMieszkanie` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idPomieszczenie`),
  INDEX `fk_Pomieszczenie_1_idx` (`fkMieszkanie` ASC),
  CONSTRAINT `fk_Pomieszczenie_1`
    FOREIGN KEY (`fkMieszkanie`)
    REFERENCES `InteligentHouse`.`Mieszkanie` (`idMieszkanie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InteligentHouse`.`Kamera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InteligentHouse`.`Kamera` (
  `idKamera` INT(11) NOT NULL AUTO_INCREMENT,
  `Nazwa` VARCHAR(45) NULL DEFAULT NULL,
  `fkPomieszczenie` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idKamera`),
  INDEX `fk_Kamera_1_idx` (`fkPomieszczenie` ASC),
  CONSTRAINT `fk_Kamera_1`
    FOREIGN KEY (`fkPomieszczenie`)
    REFERENCES `InteligentHouse`.`Pomieszczenie` (`idPomieszczenie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InteligentHouse`.`Miejsce_garazowe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InteligentHouse`.`Miejsce_garazowe` (
  `idMiejsce_garazowe` INT(11) NOT NULL AUTO_INCREMENT,
  `Kod` VARCHAR(45) NULL DEFAULT NULL,
  `Nr_rejstracyjny` VARCHAR(45) NULL DEFAULT NULL,
  `fkMieszkanie` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idMiejsce_garazowe`),
  UNIQUE INDEX `Kod_UNIQUE` (`Kod` ASC),
  INDEX `fk_Miejsce_garazowe_1_idx` (`fkMieszkanie` ASC),
  CONSTRAINT `fk_Miejsce_garazowe_1`
    FOREIGN KEY (`fkMieszkanie`)
    REFERENCES `InteligentHouse`.`Mieszkanie` (`idMieszkanie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InteligentHouse`.`Okres_rozliczeniowy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InteligentHouse`.`Okres_rozliczeniowy` (
  `idOkres_rozliczeniowy` INT(11) NOT NULL AUTO_INCREMENT,
  `Miesiac` DATE NULL DEFAULT NULL,
  `fkMieszkanie` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idOkres_rozliczeniowy`),
  INDEX `fk_Okres_rozliczeniowy_1_idx` (`fkMieszkanie` ASC),
  CONSTRAINT `fk_Okres_rozliczeniowy_1`
    FOREIGN KEY (`fkMieszkanie`)
    REFERENCES `InteligentHouse`.`Mieszkanie` (`idMieszkanie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InteligentHouse`.`Odczyt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InteligentHouse`.`Odczyt` (
  `idOdczyt` INT(11) NOT NULL AUTO_INCREMENT,
  `Wartosc` FLOAT NULL DEFAULT NULL,
  `Dzien` DATE NULL DEFAULT NULL,
  `Typ` ENUM('Woda', 'Prad') NULL DEFAULT NULL,
  `fkOkres_rozl` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idOdczyt`),
  INDEX `fk_Odczyt_1_idx` (`fkOkres_rozl` ASC),
  CONSTRAINT `fk_Odczyt_1`
    FOREIGN KEY (`fkOkres_rozl`)
    REFERENCES `InteligentHouse`.`Okres_rozliczeniowy` (`idOkres_rozliczeniowy`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InteligentHouse`.`Oswietlenie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InteligentHouse`.`Oswietlenie` (
  `idOswietlenie` INT(11) NOT NULL AUTO_INCREMENT,
  `Nazwa` VARCHAR(45) NULL DEFAULT NULL,
  `Stan` VARCHAR(45) NULL DEFAULT NULL,
  `fkPomieszczenie` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idOswietlenie`),
  INDEX `fk_Oswietlenie_1_idx` (`fkPomieszczenie` ASC),
  CONSTRAINT `fk_Oswietlenie_1`
    FOREIGN KEY (`fkPomieszczenie`)
    REFERENCES `InteligentHouse`.`Pomieszczenie` (`idPomieszczenie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InteligentHouse`.`Rolety`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InteligentHouse`.`Rolety` (
  `idRolety` INT(11) NOT NULL AUTO_INCREMENT,
  `Nazwa` VARCHAR(45) NULL DEFAULT NULL,
  `Stan` INT(11) NULL DEFAULT NULL,
  `fkPomieszczenie` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idRolety`),
  INDEX `fk_Rolety_1_idx` (`fkPomieszczenie` ASC),
  CONSTRAINT `fk_Rolety_1`
    FOREIGN KEY (`fkPomieszczenie`)
    REFERENCES `InteligentHouse`.`Pomieszczenie` (`idPomieszczenie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InteligentHouse`.`Temperatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InteligentHouse`.`Temperatura` (
  `idTemperatura` INT(11) NOT NULL AUTO_INCREMENT,
  `Zadana_temp` FLOAT NULL DEFAULT NULL,
  `Aktualna_temp` FLOAT NULL DEFAULT NULL,
  `Zewn_temp` FLOAT NULL DEFAULT NULL,
  `fkPomieszczenie` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idTemperatura`),
  INDEX `fk_Temperatura_1_idx` (`fkPomieszczenie` ASC),
  CONSTRAINT `fk_Temperatura_1`
    FOREIGN KEY (`fkPomieszczenie`)
    REFERENCES `InteligentHouse`.`Pomieszczenie` (`idPomieszczenie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `InteligentHouse`.`Uzytkownik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `InteligentHouse`.`Uzytkownik` (
  `idUzytkownik` INT(11) NOT NULL AUTO_INCREMENT,
  `Imie` VARCHAR(45) NULL DEFAULT NULL,
  `Nazwisko` VARCHAR(45) NULL DEFAULT NULL,
  `Login` VARCHAR(45) NULL DEFAULT NULL,
  `Haslo` VARCHAR(45) NULL DEFAULT NULL,
  `fkMieszkanie` INT(11) NULL DEFAULT NULL,
  `Wlasciciel` TINYINT(4) NULL DEFAULT NULL,
  `Telefon` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idUzytkownik`),
  INDEX `fk_Uzytkownik_1_idx` (`fkMieszkanie` ASC),
  CONSTRAINT `fk_Uzytkownik_1`
    FOREIGN KEY (`fkMieszkanie`)
    REFERENCES `InteligentHouse`.`Mieszkanie` (`idMieszkanie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
