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
  `profile_url` VARCHAR(2000) NULL,
  `about_me` TEXT NULL,
  `create_date` DATE NULL,
  `update_date` DATE NULL,
  `date_of_birth` DATE NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


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
  `neighborhood_id` INT NULL,
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
  `address_id` INT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_household_address1_idx` (`address_id` ASC),
  INDEX `fk_household_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_household_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_household_user1`
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
-- Table `vehicle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vehicle` ;

CREATE TABLE IF NOT EXISTS `vehicle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `make` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `household_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vehicle_household1_idx` (`household_id` ASC),
  CONSTRAINT `fk_vehicle_household1`
    FOREIGN KEY (`household_id`)
    REFERENCES `household` (`id`)
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
  `subject` VARCHAR(45) NULL,
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
-- Table `animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `animal` ;

CREATE TABLE IF NOT EXISTS `animal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `species` VARCHAR(45) NULL,
  `spotting_time` DATE NULL,
  `description` TEXT NULL,
  `report_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_animal_report1_idx` (`report_id` ASC),
  CONSTRAINT `fk_animal_report1`
    FOREIGN KEY (`report_id`)
    REFERENCES `report` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postlike`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `postlike` ;

CREATE TABLE IF NOT EXISTS `postlike` (
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


-- -----------------------------------------------------
-- Table `report_has_neighborhood`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `report_has_neighborhood` ;

CREATE TABLE IF NOT EXISTS `report_has_neighborhood` (
  `report_id` INT NOT NULL,
  `neighborhood_id` INT NOT NULL,
  PRIMARY KEY (`report_id`, `neighborhood_id`),
  INDEX `fk_report_has_neighborhood_neighborhood1_idx` (`neighborhood_id` ASC),
  INDEX `fk_report_has_neighborhood_report1_idx` (`report_id` ASC),
  CONSTRAINT `fk_report_has_neighborhood_report1`
    FOREIGN KEY (`report_id`)
    REFERENCES `report` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_has_neighborhood_neighborhood1`
    FOREIGN KEY (`neighborhood_id`)
    REFERENCES `neighborhood` (`id`)
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
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `profile_url`, `about_me`, `create_date`, `update_date`, `date_of_birth`) VALUES (1, 'admin', 'admin', 1, 'admin', 'Skill', 'Distillery', 'sd@distillery.edu', NULL, NULL, '2008-03-27', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `profile_url`, `about_me`, `create_date`, `update_date`, `date_of_birth`) VALUES (2, 'DRich', 'user', 1, NULL, 'Damien', 'Richards', 'drich@distillery.edu', NULL, NULL, '2022-12-10', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `profile_url`, `about_me`, `create_date`, `update_date`, `date_of_birth`) VALUES (3, 'RTisdale', 'flower', 1, NULL, 'Rob', 'Tisdale', 'rtisdale@distillery.edu', NULL, NULL, '2023-04-20', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `profile_url`, `about_me`, `create_date`, `update_date`, `date_of_birth`) VALUES (4, 'Wheaties23', 'foofoo', 1, NULL, 'Collin', 'Wheat', 'cwheat@distillery.edu', NULL, NULL, '2018-03-27', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `email`, `profile_url`, `about_me`, `create_date`, `update_date`, `date_of_birth`) VALUES (5, 'DunDun', 'dunnn', 1, NULL, 'David', 'Dunlevy', 'dunlevy@distillery.edu', NULL, NULL, '2020-03-02', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `neighborhood`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `neighborhood` (`id`, `name`, `image_url`, `description`, `create_date`) VALUES (1, 'Rolling Meadows', NULL, NULL, '2002-03-27');
INSERT INTO `neighborhood` (`id`, `name`, `image_url`, `description`, `create_date`) VALUES (2, 'Shady Acres', NULL, NULL, '2000-12-05');
INSERT INTO `neighborhood` (`id`, `name`, `image_url`, `description`, `create_date`) VALUES (3, 'Desparado', NULL, NULL, '2009-06-30');

COMMIT;


-- -----------------------------------------------------
-- Data for table `post`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `post` (`id`, `description`, `image`, `user_id`, `create_date`, `neighborhood_id`) VALUES (1, 'I have a bunch of plants I need to rehome, any takers?', NULL, 2, '2023-03-27', 1);
INSERT INTO `post` (`id`, `description`, `image`, `user_id`, `create_date`, `neighborhood_id`) VALUES (2, 'I thought I heard some gunshots outside... Dis anyone hear that?', NULL, 4, '2023-03-27', 1);
INSERT INTO `post` (`id`, `description`, `image`, `user_id`, `create_date`, `neighborhood_id`) VALUES (3, 'LOST DOG: If anyone sees a small poodle mix dog, please let me know ASAP! Her name is Coco and she\'s a little skittish! I will offer a reward of $1000 if anyone can sees her and bring her home!', NULL, 2, '2023-03-27', 1);

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
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `address` (`id`, `address1`, `address2`, `city`, `state`, `zip_code`, `neighborhood_id`) VALUES (1, '123 Seasme St', NULL, 'Lowell', 'HI', '39430', 1);
INSERT INTO `address` (`id`, `address1`, `address2`, `city`, `state`, `zip_code`, `neighborhood_id`) VALUES (2, '590 Third St', NULL, 'Lowell', 'HI', '39430', 1);
INSERT INTO `address` (`id`, `address1`, `address2`, `city`, `state`, `zip_code`, `neighborhood_id`) VALUES (3, '982 Holt Ave', NULL, 'Denver', 'CO', '80102', 3);
INSERT INTO `address` (`id`, `address1`, `address2`, `city`, `state`, `zip_code`, `neighborhood_id`) VALUES (4, '209 Lefthand Drive', NULL, 'Silverton', 'CO', '80102', 2);
INSERT INTO `address` (`id`, `address1`, `address2`, `city`, `state`, `zip_code`, `neighborhood_id`) VALUES (5, '3092 Cleveland Ave', NULL, 'Silverton', 'CO', '80102', 2);
INSERT INTO `address` (`id`, `address1`, `address2`, `city`, `state`, `zip_code`, `neighborhood_id`) VALUES (6, '2309 Bordeaux Ct', NULL, 'Silverton', 'CO', '80102', 2);
INSERT INTO `address` (`id`, `address1`, `address2`, `city`, `state`, `zip_code`, `neighborhood_id`) VALUES (7, '329 Third St', NULL, 'Denver', 'CO', '80102', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `household`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `household` (`id`, `occupants`, `address_id`, `user_id`) VALUES (1, 1, 1, 5);
INSERT INTO `household` (`id`, `occupants`, `address_id`, `user_id`) VALUES (2, 5, 2, 4);
INSERT INTO `household` (`id`, `occupants`, `address_id`, `user_id`) VALUES (3, 4, 3, 3);
INSERT INTO `household` (`id`, `occupants`, `address_id`, `user_id`) VALUES (4, 2, 4, 2);
INSERT INTO `household` (`id`, `occupants`, `address_id`, `user_id`) VALUES (5, 8, 5, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `neighborhood_event`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `neighborhood_event` (`id`, `name`, `description`, `event_date`, `creation_date`, `active`, `user_id`, `neighborhood_id`, `address_id`) VALUES (1, 'Block Party in the cul-de-sac on 3rd!', 'BYOB', NULL, NULL, 1, 1, 1, 1);
INSERT INTO `neighborhood_event` (`id`, `name`, `description`, `event_date`, `creation_date`, `active`, `user_id`, `neighborhood_id`, `address_id`) VALUES (2, 'Pampered Chef party!!', 'Pamela\'s annual pampered chef party is this thurday! Comment for details!', NULL, NULL, 1, 2, 1, 2);
INSERT INTO `neighborhood_event` (`id`, `name`, `description`, `event_date`, `creation_date`, `active`, `user_id`, `neighborhood_id`, `address_id`) VALUES (3, 'Golf Outing Saturday!', 'Meet me at our local golf course to show down! Big your buddies!', NULL, NULL, 1, 3, 1, 3);
INSERT INTO `neighborhood_event` (`id`, `name`, `description`, `event_date`, `creation_date`, `active`, `user_id`, `neighborhood_id`, `address_id`) VALUES (4, 'March Madness Watch Party!', 'Come on over to my place to watch some College basketball!', NULL, NULL, 1, 3, 1, 4);
INSERT INTO `neighborhood_event` (`id`, `name`, `description`, `event_date`, `creation_date`, `active`, `user_id`, `neighborhood_id`, `address_id`) VALUES (5, 'Cooking Class', 'Trying out a new hobby of teaching others how to cook! ', NULL, NULL, 1, 2, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `vehicle`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `vehicle` (`id`, `make`, `model`, `color`, `description`, `household_id`) VALUES (1, 'Pontiac', 'Sunfire', 'Gray', 'Mirror is missing', 1);
INSERT INTO `vehicle` (`id`, `make`, `model`, `color`, `description`, `household_id`) VALUES (2, 'Ford', 'F150', 'Black', 'Lifted with tinted windows', 2);
INSERT INTO `vehicle` (`id`, `make`, `model`, `color`, `description`, `household_id`) VALUES (3, 'Toyota', 'Rav4', 'White', NULL, 3);
INSERT INTO `vehicle` (`id`, `make`, `model`, `color`, `description`, `household_id`) VALUES (4, 'Honda', 'CRV', 'Red', NULL, 3);
INSERT INTO `vehicle` (`id`, `make`, `model`, `color`, `description`, `household_id`) VALUES (5, 'Hyundai', 'Elantra', 'Blue', NULL, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `report`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `report` (`id`, `description`, `report_time`, `contact_authority`, `user_id`, `subject`) VALUES (1, 'Moose found in driveway', '2023-02-22', 1, 2, 'Moose found in driveway');
INSERT INTO `report` (`id`, `description`, `report_time`, `contact_authority`, `user_id`, `subject`) VALUES (2, 'I drove into the neighborhood and saw a tall man in a black shirt and jeans walking along the street. As he passed by each car he would stop and look to see what was inside of each car. I don\'t know if he was looking to break into one of them or not.', '2023-01-13', 1, 1, 'Possible Car Break-in');
INSERT INTO `report` (`id`, `description`, `report_time`, `contact_authority`, `user_id`, `subject`) VALUES (3, 'Bobcat Family ', '2022-12-06', 0, 3, 'Bobcat Family ');
INSERT INTO `report` (`id`, `description`, `report_time`, `contact_authority`, `user_id`, `subject`) VALUES (4, 'Missing Dog seen running near the pond', '2023-01-11', 0, 2, 'Loose Dog');
INSERT INTO `report` (`id`, `description`, `report_time`, `contact_authority`, `user_id`, `subject`) VALUES (5, 'Moutain Lion roaming near the neighborhood', '2023-02-15', 0, 5, 'Moutain Lion roaming near the neighborhood');
INSERT INTO `report` (`id`, `description`, `report_time`, `contact_authority`, `user_id`, `subject`) VALUES (6, 'Gator spotted near the pond', '2023-01-18', 0, 3, 'Gator spotted near the pond');
INSERT INTO `report` (`id`, `description`, `report_time`, `contact_authority`, `user_id`, `subject`) VALUES (7, 'I came out to my car this morning. It was parked on the street in front of my house and found that there was a huge dent with blue scuff marks on it. I contacted my insurance already but no sight of a note left behind of the car that hit mine.', NULL, 1, 1, 'Hit and run');
INSERT INTO `report` (`id`, `description`, `report_time`, `contact_authority`, `user_id`, `subject`) VALUES (8, 'I was expecting a package today and was alerted by amazon that it had delivered. However, it was nowhere to be seen so i checked my doorbell camera and saw a female in a red hoodie come up to the porch, take my package, and drive off!', NULL, 1, 4, 'Package Theft');
INSERT INTO `report` (`id`, `description`, `report_time`, `contact_authority`, `user_id`, `subject`) VALUES (10, 'Wolves sighting', '2022-03-23', 0, 2, 'Wolves sighting');

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
INSERT INTO `home_owner_association` (`id`, `name`, `description`, `monthly_due`, `neighborhood_id`) VALUES (2, 'Washington Township HOA', NULL, 258.00, 2);
INSERT INTO `home_owner_association` (`id`, `name`, `description`, `monthly_due`, `neighborhood_id`) VALUES (3, 'Larime HOA', NULL, 306.00, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `animal`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `animal` (`id`, `species`, `spotting_time`, `description`, `report_id`) VALUES (1, 'Moose', '2023-02-22', 'A bull male moose rammed my car in the driveway this morning!', 1);
INSERT INTO `animal` (`id`, `species`, `spotting_time`, `description`, `report_id`) VALUES (2, 'Bobcat', '2022-12-05', 'Haven\'t seen one of these guys in years! A small family of bobcats were spotted in my yard yesterday!', 3);
INSERT INTO `animal` (`id`, `species`, `spotting_time`, `description`, `report_id`) VALUES (3, 'Mountain Lion ', '2023-03-27', 'My tree camera caught a snapshot of a lone mountian lion lurking around the woods to the back of my house. Awfully close to where I keep my chicken house!', 5);
INSERT INTO `animal` (`id`, `species`, `spotting_time`, `description`, `report_id`) VALUES (4, 'Dog', '2023-01-13', 'Small poodle. mixed dog running around the neighborhood. I tried to catch it, but it was very skittish. Hopefully it is caught soon!', 4);
INSERT INTO `animal` (`id`, `species`, `spotting_time`, `description`, `report_id`) VALUES (5, 'Gator', '2023-04-18', 'Spotted an aligator in the neighborhood pond this afternoon. It was sitting in the grass surrounded by little white puff balls everywhere! I heard there was a toy poodle missing... I hope those puff balls weren\'t from the poodle!', 6);
INSERT INTO `animal` (`id`, `species`, `spotting_time`, `description`, `report_id`) VALUES (6, 'Wolf', '2023-03-23', 'Saw a pack of wolves crossing the street outside the neighborhood, keep your small dogs inside!', 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `vigilancedb`;
INSERT INTO `event_comment` (`id`, `comment`, `create_date`, `user_id`, `neighborhood_event_id`) VALUES (1, 'I be there!!!', NULL, 1, 1);

COMMIT;

