/* Replace with your SQL commands */
-- MySQL Workbench Forward Engineering



-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema my_fav_library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema my_fav_library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `my_fav_library` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `my_fav_library` ;

-- -----------------------------------------------------
-- Table `my_fav_library`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_fav_library`.`author` (
  `idauthor` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NULL DEFAULT NULL,
  `lastname` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idauthor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `my_fav_library`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_fav_library`.`books` (
  `idbooks` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `summary` VARCHAR(500) NULL DEFAULT NULL,
  `author_idauthor` INT NOT NULL,
  `image` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`idbooks`),
  INDEX `fk_books_author_idx` (`author_idauthor` ASC) VISIBLE,
  CONSTRAINT `fk_books_author`
    FOREIGN KEY (`author_idauthor`)
    REFERENCES `my_fav_library`.`author` (`idauthor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `my_fav_library`.`literary_genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_fav_library`.`literary_genre` (
  `idliterary_genre` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idliterary_genre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `my_fav_library`.`books_has_literary_genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_fav_library`.`books_has_literary_genre` (
  `books_idbooks` INT NOT NULL,
  `literary_genre_idliterary_genre` INT NOT NULL,
  PRIMARY KEY (`books_idbooks`, `literary_genre_idliterary_genre`),
  INDEX `fk_books_has_literary_genre_literary_genre1_idx` (`literary_genre_idliterary_genre` ASC) VISIBLE,
  INDEX `fk_books_has_literary_genre_books1_idx` (`books_idbooks` ASC) VISIBLE,
  CONSTRAINT `fk_books_has_literary_genre_books1`
    FOREIGN KEY (`books_idbooks`)
    REFERENCES `my_fav_library`.`books` (`idbooks`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_books_has_literary_genre_literary_genre1`
    FOREIGN KEY (`literary_genre_idliterary_genre`)
    REFERENCES `my_fav_library`.`literary_genre` (`idliterary_genre`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



