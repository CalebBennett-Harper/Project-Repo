SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=`TRADITIONAL,ALLOW_INVALID_DATES`;

CREATE DATABASE IF NOT EXISTS nosmoke;
grant all privileges on nosmoke_db.* to 'webapp'@'%';
flush privileges;
 
use nosmoke_db;
-- DROP SCHEMA IF EXISTS `nosmoke_schema` ;
-- CREATE SCHEMA IF NOT EXISTS `nosmoke_schema` DEFAULT CHARACTER SET latin1 ;
-- USE `nosmoke_schema` ;

-- -----------------------------------------------------
-- Table `nosmoke_schema`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NULL DEFAULT NULL,
  `age` INT(11) NULL DEFAULT NULL,
  `economic_status` VARCHAR(60) NULL DEFAULT NULL,
  `health` VARCHAR(60) NULL DEFAULT NULL,
  `years_vaping` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `name` (`name` ASC),
  INDEX `years_vaping` (`years_vaping` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke_schema`.`badges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`badges` (
  `badge_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` TEXT NULL DEFAULT NULL,
  `details` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`badge_id`),
  INDEX `name` (`city` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke_schema`.`challenges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`challenges` (
  `challenge_id` INT(11) NOT NULL AUTO_INCREMENT,
  `levels` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `badges` VARCHAR(255) NULL DEFAULT NULL,
  `begin_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`challenge_id`),
  INDEX `levels` (`levels` ASC),
  INDEX `end_date` (`end_date` DESC),
  CONSTRAINT `fk_challenges`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke_schema`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke_schema`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`education` (
  `resource_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `articles` TEXT NULL DEFAULT NULL,
  `videos` TEXT NULL DEFAULT NULL,
  `figures` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `fk_education`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke_schema`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke_schema`.`savings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`savings` (
  `savings_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `amount` DECIMAL(10, 2) NULL DEFAULT NULL,
  `curr_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`savings_id`),
  INDEX `curr_date` (`curr_date` DESC),
  CONSTRAINT `fk_savings`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke_schema`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke_schema`.`social_support`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`social_support` (
  `support_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `interactions` TEXT NULL DEFAULT NULL,
  `posts` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`support_id`),
  CONSTRAINT `fk_social_support`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke_schema`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke_schema`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`posts` (
  `post_id` INT(11) NOT NULL AUTO_INCREMENT,
  `support_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `interactions` TEXT NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `curr_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `curr_date` (`curr_date` DESC),
  CONSTRAINT `fk_posts_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke_schema`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_posts_support`
    FOREIGN KEY (`support_id`)
    REFERENCES `nosmoke_schema`.`social_support` (`support_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke_schema`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`comments` (
  `comment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `post_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `curr_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  INDEX `curr_date` (`curr_date` DESC),
  CONSTRAINT `fk_comments_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke_schema`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_post`
    FOREIGN KEY (`post_id`)
    REFERENCES `nosmoke_schema`.`posts` (`post_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke_schema`.`user_badges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`user_badges` (
  `user_id` INT(11) NOT NULL,
  `badge_id` INT(11) NOT NULL,
  `earned_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`, `badge_id`),
  INDEX `curr_date` (`curr_date` DESC),
  CONSTRAINT `fk_user_badges_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke_schema`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_badges_badge`
    FOREIGN KEY (`badge_id`)
    REFERENCES `nosmoke_schema`.`badges` (`badge_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke_schema`.`user_challenges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`user_challenges` (
  `user_id` INT(11) NOT NULL,
  `challenge_id` INT(11) NOT NULL,
  `progress` FLOAT NULL DEFAULT NULL,
  `completion` VARCHAR(50),
  PRIMARY KEY (`user_id`, `challenge_id`),
  CONSTRAINT `fk_user_challenges_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke_schema`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_challenges_challenge`
    FOREIGN KEY (`challenge_id`)
    REFERENCES `nosmoke_schema`.`challenges` (`challenge_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `nosmoke_schema`.`user_education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`user_education` (
  `user_id` INT(11) NOT NULL,
  `resource_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `resource_id`),
  CONSTRAINT `fk_user_education_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke_schema`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_education_resource`
    FOREIGN KEY (`resource_id`)
    REFERENCES `nosmoke_schema`.`education` (`resource_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `nosmoke_schema`.`user_support`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`user_support` (
  `user_id` INT(11) NOT NULL,
  `support_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `support_id`),
  CONSTRAINT `fk_user_support_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke_schema`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_support_support`
    FOREIGN KEY (`support_id`)
    REFERENCES `nosmoke_schema`.`social_support` (`support_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `nosmoke_schema`.`post_comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`post_comments` (
  `post_id` INT(11) NOT NULL,
  `comment_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `comment_id`),
  CONSTRAINT `fk_post_comments_post`
    FOREIGN KEY (`post_id`)
    REFERENCES `nosmoke_schema`.`posts` (`post_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_post_comments_comment`
    FOREIGN KEY (`comment_id`)
    REFERENCES `nosmoke_schema`.`comments` (`comment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `nosmoke_schema`.`support_posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`support_posts` (
  `post_id` INT(11) NOT NULL,
  `support_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `support_id`),
  CONSTRAINT `fk_support_posts_post`
    FOREIGN KEY (`post_id`)
    REFERENCES `nosmoke_schema`.`posts` (`post_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_support_posts_support`
    FOREIGN KEY (`support_id`)
    REFERENCES `nosmoke_schema`.`social_support` (`support_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `nosmoke_schema`.`badges_challenges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`badges_challenges` (
  `badge_id` INT(11) NOT NULL,
  `challenge_id` INT(11) NOT NULL,
  PRIMARY KEY (`badge_id`, `challenge_id`),
  CONSTRAINT `fk_badges_challenges_badges`
    FOREIGN KEY (`badge_id`)
    REFERENCES `nosmoke_schema`.`badges` (`badge_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_badges_challenges_challenges`
    FOREIGN KEY (`challenge_id`)
    REFERENCES `nosmoke_schema`.`challenges` (`challenge_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `nosmoke_schema`.`completed_challenge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`completed_challenge` (
  `user_id` INT(11) NOT NULL,
  `challenge_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `challenge_id`),
  CONSTRAINT `fk_completed_challenge_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `nosmoke_schema`.`users` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_completed_challenge_challenge`
    FOREIGN KEY (`challenge_id`)
    REFERENCES `nosmoke_schema`.`challenges` (`challenge_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `nosmoke_schema`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nosmoke_schema`.`suppliers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `company` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `email_address` VARCHAR(50) NULL DEFAULT NULL,
  `job_title` VARCHAR(50) NULL DEFAULT NULL,
  `business_phone` VARCHAR(25) NULL DEFAULT NULL,
  `home_phone` VARCHAR(25) NULL DEFAULT NULL,
  `mobile_phone` VARCHAR(25) NULL DEFAULT NULL,
  `fax_number` VARCHAR(25) NULL DEFAULT NULL,
  `address` LONGTEXT NULL DEFAULT NULL,
  `city` VARCHAR(50) NULL DEFAULT NULL,
  `state_province` VARCHAR(50) NULL DEFAULT NULL,
  `zip_postal_code` VARCHAR(15) NULL DEFAULT NULL,
  `country_region` VARCHAR(50) NULL DEFAULT NULL,
  `web_page` LONGTEXT NULL DEFAULT NULL,
  `notes` LONGTEXT NULL DEFAULT NULL,
  `attachments` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `city` (`city` ASC),
  INDEX `company` (`company` ASC),
  INDEX `first_name` (`first_name` ASC),
  INDEX `last_name` (`last_name` ASC),
  INDEX `zip_postal_code` (`zip_postal_code` ASC),
  INDEX `state_province` (`state_province` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;