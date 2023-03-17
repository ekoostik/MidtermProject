-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vigilancedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `vigilancedb` ;

-- -----------------------------------------------------
-- Schema vigilancedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vigilancedb` DEFAULT CHARACTER SET utf8 ;
USE `vigilancedb` ;

-- -----------------------------------------------------
-- Table `neighborhood`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `neighborhood` ;

CREATE TABLE IF NOT EXISTS `neighborhood` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `image_url` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  `create_date` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address1` VARCHAR(45) NULL,
  `address2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip_code` VARCHAR(45) NULL,
  `neighborhood_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_neighborhood1_idx` (`neighborhood_id` ASC),
  CONSTRAINT `fk_address_neighborhood1`
    FOREIGN KEY (`neighborhood_id`)
    REFERENCES `neighborhood` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `household`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `household` ;

CREATE TABLE IF NOT EXISTS `household` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `occupants` INT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_household_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_household_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NOT NULL,
  `role` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `household_id` INT NOT NULL,
  `profile_url` VARCHAR(2000) NULL,
  `about_me` TEXT NULL,
  `create_date` DATE NULL,
  `update_date` DATE NULL,
  `date_of_birth` DATE NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_household1_idx` (`household_id` ASC),
  CONSTRAINT `fk_user_household1`
    FOREIGN KEY (`household_id`)
    REFERENCES `household` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post` ;

CREATE TABLE IF NOT EXISTS `post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NULL,
  `image` VARCHAR(2000) NULL,
  `user_id` INT NOT NULL,
  `create_date` DATE NULL,
  `neighborhood_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_user1_idx` (`user_id` ASC),
  INDEX `fk_post_neighborhood1_idx` (`neighborhood_id` ASC),
  CONSTRAINT `fk_post_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_neighborhood1`
    FOREIGN KEY (`neighborhood_id`)
    REFERENCES `neighborhood` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NULL,
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `create_date` DATE NULL,
  INDEX `fk_comment_post1_idx` (`post_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `neighborhood_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `neighborhood_event` ;

CREATE TABLE IF NOT EXISTS `neighborhood_event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `event_date` DATE NULL,
  `creation_date` DATE NULL,
  `active` TINYINT NULL,
  `user_id` INT NOT NULL,
  `neighborhood_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_user1_idx` (`user_id` ASC),
  INDEX `fk_neighborhood_event_neighborhood1_idx` (`neighborhood_id` ASC),
  INDEX `fk_neighborhood_event_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_neighborhood_event_neighborhood1`
    FOREIGN KEY (`neighborhood_id`)
    REFERENCES `neighborhood` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_neighborhood_event_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vehicle_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vehicle_type` ;

CREATE TABLE IF NOT EXISTS `vehicle_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vehicle` ;

CREATE TABLE IF NOT EXISTS `vehicle` (
  `id` INT NOT NULL,
  `make` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `license_plate_id` INT NOT NULL,
  `household_id` INT NOT NULL,
  `state_plate` VARCHAR(45) NULL,
  `vehicle_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vehicle_household1_idx` (`household_id` ASC),
  INDEX `fk_vehicle_vehicle_type1_idx` (`vehicle_type_id` ASC),
  CONSTRAINT `fk_vehicle_household1`
    FOREIGN KEY (`household_id`)
    REFERENCES `household` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicle_vehicle_type1`
    FOREIGN KEY (`vehicle_type_id`)
    REFERENCES `vehicle_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `report` ;

CREATE TABLE IF NOT EXISTS `report` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NULL,
  `report_time` DATE NULL,
  `contact_authority` TINYINT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_report_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_report_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet` ;

CREATE TABLE IF NOT EXISTS `pet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `species` VARCHAR(45) NULL,
  `tag` TINYINT NULL,
  `breed` VARCHAR(45) NULL,
  `household_id` INT NOT NULL,
  `color` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `household_id`),
  INDEX `fk_animal_household1_idx` (`household_id` ASC),
  CONSTRAINT `fk_animal_household1`
    FOREIGN KEY (`household_id`)
    REFERENCES `household` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `home_owner_association`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `home_owner_association` ;

CREATE TABLE IF NOT EXISTS `home_owner_association` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `monthly_due` DOUBLE NULL,
  `neighborhood_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_hoa_neighborhood1_idx` (`neighborhood_id` ASC),
  CONSTRAINT `fk_hoa_neighborhood1`
    FOREIGN KEY (`neighborhood_id`)
    REFERENCES `neighborhood` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `person_of_interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `person_of_interest` ;

CREATE TABLE IF NOT EXISTS `person_of_interest` (
  `id` INT NOT NULL,
  `incident_time` DATE NULL,
  `description` TEXT NULL,
  `report_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_person_of_interest_report1_idx` (`report_id` ASC),
  CONSTRAINT `fk_person_of_interest_report1`
    FOREIGN KEY (`report_id`)
    REFERENCES `report` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `animal` ;

CREATE TABLE IF NOT EXISTS `animal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `species` VARCHAR(45) NULL,
  `spotting_time` DATE NULL,
  `description` TEXT NULL,
  `report_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_animal_report1_idx` (`report_id` ASC),
  CONSTRAINT `fk_animal_report1`
    FOREIGN KEY (`report_id`)
    REFERENCES `report` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `post_like`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `post_like` ;

CREATE TABLE IF NOT EXISTS `post_like` (
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`post_id`, `user_id`),
  INDEX `fk_post_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_post_has_user_post1_idx` (`post_id` ASC),
  CONSTRAINT `fk_post_has_user_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment_like`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment_like` ;

CREATE TABLE IF NOT EXISTS `comment_like` (
  `user_id` INT NOT NULL,
  `comment_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `comment_id`),
  INDEX `fk_user_has_comment_comment1_idx` (`comment_id` ASC),
  INDEX `fk_user_has_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_comment_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_comment` ;

CREATE TABLE IF NOT EXISTS `event_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT NULL,
  `create_date` DATE NULL,
  `user_id` INT NOT NULL,
  `neighborhood_event_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_event_comment_neighborhood_event1_idx` (`neighborhood_event_id` ASC),
  CONSTRAINT `fk_event_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_comment_neighborhood_event1`
    FOREIGN KEY (`neighborhood_event_id`)
    REFERENCES `neighborhood_event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS vigil@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'vigil'@'localhost' IDENTIFIED BY 'vigil';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'vigil'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `neighborhood`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `neighborhood` (`id`, `name`, `image_url`, `description`, `create_date`) VALUES (1, 'Rolling Meadows', NULL, NULL, NULL);
INSERT INTO `neighborhood` (`id`, `name`, `image_url`, `description`, `create_date`) VALUES (2, 'Shady Acres', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `address` (`id`, `address1`, `address2`, `city`, `state`, `zip_code`, `neighborhood_id`) VALUES (1, '123 Seasme St', NULL, 'Lowell', 'HI', '39430', 1);
INSERT INTO `address` (`id`, `address1`, `address2`, `city`, `state`, `zip_code`, `neighborhood_id`) VALUES (2, '590 Third St', NULL, 'Lowell', 'HI', '39430', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `household`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `household` (`id`, `occupants`, `address_id`) VALUES (1, 1, 1);
INSERT INTO `household` (`id`, `occupants`, `address_id`) VALUES (2, 5, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `household_id`, `profile_url`, `about_me`, `create_date`, `update_date`, `date_of_birth`) VALUES (1, 'admin', 'admin', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `household_id`, `profile_url`, `about_me`, `create_date`, `update_date`, `date_of_birth`) VALUES (2, 'DRich', 'user', 1, NULL, 'Damien', NULL, 'Richards', 2, NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `post`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `post` (`id`, `description`, `image`, `user_id`, `create_date`, `neighborhood_id`) VALUES (1, 'I have a bunch of plants I need to rehome, any takers?', NULL, 2, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `comment` (`id`, `description`, `post_id`, `user_id`, `create_date`) VALUES (1, 'Yeah, I\'ll take a few for my garden!!!', 1, 1, NULL);
INSERT INTO `comment` (`id`, `description`, `post_id`, `user_id`, `create_date`) VALUES (2, 'Me, too!!', 1, 2, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `neighborhood_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `neighborhood_event` (`id`, `name`, `description`, `event_date`, `creation_date`, `active`, `user_id`, `neighborhood_id`, `address_id`) VALUES (1, 'Block Party in the cul-de-sac on 3rd!', 'BYOB', NULL, NULL, 1, 2, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `vehicle_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `vehicle_type` (`id`, `name`) VALUES (1, 'Compact');

COMMIT;


-- -----------------------------------------------------
-- Data for table `vehicle`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `vehicle` (`id`, `make`, `model`, `color`, `description`, `license_plate_id`, `household_id`, `state_plate`, `vehicle_type_id`) VALUES (1, 'Pontiac', 'Sunfire', 'Gray', 'Mirror is missing', 1, 1, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `report`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `report` (`id`, `description`, `report_time`, `contact_authority`, `user_id`) VALUES (1, 'Moose found in driveway', NULL, NULL, 2);
INSERT INTO `report` (`id`, `description`, `report_time`, `contact_authority`, `user_id`) VALUES (2, 'Person looking to brake into cars.', NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `pet` (`id`, `species`, `tag`, `breed`, `household_id`, `color`, `name`) VALUES (1, 'Dog ', NULL, 'Doberman', 1, 'Blue/Tan', 'Memphis');
INSERT INTO `pet` (`id`, `species`, `tag`, `breed`, `household_id`, `color`, `name`) VALUES (2, 'Chicken', NULL, 'Americana Hen', 2, 'Red', 'Hennifer ');

COMMIT;


-- -----------------------------------------------------
-- Data for table `home_owner_association`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `home_owner_association` (`id`, `name`, `description`, `monthly_due`, `neighborhood_id`) VALUES (1, 'Sell-Your-Soul Home Owers Association', NULL, 135.00, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `person_of_interest`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `person_of_interest` (`id`, `incident_time`, `description`, `report_id`) VALUES (1, NULL, 'Person shooping around cars at night, have footage of them on my ringdoor bell camera.', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `animal`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `animal` (`id`, `species`, `spotting_time`, `description`, `report_id`) VALUES (1, 'Moose', NULL, 'A bull male moose rammed my car in the driveway this morning!', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `event_comment` (`id`, `comment`, `create_date`, `user_id`, `neighborhood_event_id`) VALUES (1, 'I be there!!!', NULL, 1, 1);

COMMIT;

