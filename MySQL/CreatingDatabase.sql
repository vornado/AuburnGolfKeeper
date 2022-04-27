DROP database IF EXISTS augolfdb;

CREATE SCHEMA `augolfdb`;

CREATE TABLE `augolfdb`.`user` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(50) NOT NULL,
  `userName` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `gender` TINYINT NOT NULL,
  `isActive` TINYINT NOT NULL,
  `accountStatusId` INT NOT NULL,
  `accountRoleId` INT NOT NULL,
  `createdDate` DATETIME NOT NULL,
  `lastModified` DATETIME NOT NULL,
  `lastModifiedBy` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `userName_UNIQUE` (`userName` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `userId_UNIQUE` (`userId` ASC) VISIBLE);
  
  CREATE TABLE `augolfdb`.`courselookup` (
  `courseId` INT NOT NULL AUTO_INCREMENT,
  `clubName` VARCHAR(45) NOT NULL,
  `courseName` VARCHAR(45) NOT NULL,
  `courseCity` VARCHAR(45) NOT NULL,
  `courseState` VARCHAR(45) NOT NULL,
  `coursePar` VARCHAR(18) NOT NULL,
  `createdDate` DATETIME NOT NULL,
  `lastModified` DATETIME NOT NULL,
  `lastModifiedBy` VARCHAR(50) NOT NULL,
  `isActive` TINYINT NOT NULL,
  PRIMARY KEY (`courseId`),
  UNIQUE INDEX `courseId_UNIQUE` (`courseId` ASC) VISIBLE);
  
  CREATE TABLE `augolfdb`.`scorecardlookup` (
  `scorecardId` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `courseId` INT NOT NULL,
  `scoreHole1` INT NOT NULL,
  `scoreHole2` INT NOT NULL, 
  `scoreHole3` INT NOT NULL, 
  `scoreHole4` INT NOT NULL, 
  `scoreHole5` INT NOT NULL, 
  `scoreHole6` INT NOT NULL, 
  `scoreHole7` INT NOT NULL, 
  `scoreHole8` INT NOT NULL, 
  `scoreHole9` INT NOT NULL, 
  `scoreHole10` INT NULL,
  `scoreHole11` INT NULL,
  `scoreHole12` INT NULL, 
  `scoreHole13` INT NULL, 
  `scoreHole14` INT NULL, 
  `scoreHole15` INT NULL, 
  `scoreHole16` INT NULL, 
  `scoreHole17` INT NULL, 
  `scoreHole18` INT NULL, 
  `locked` TINYINT NOT NULL,
  `picture` BLOB NULL,
  `createdDate` DATETIME NULL,
  `lastModified` DATETIME NULL,
  `lastModifiedBy` VARCHAR(50) NOT NULL,
  `isActive` TINYINT NOT NULL,
  PRIMARY KEY (`scorecardId`),
  UNIQUE INDEX `scorecardId_UNIQUE` (`scorecardId` ASC) VISIBLE,
  INDEX `userIdFK_idx` (`userId` ASC) VISIBLE,
  INDEX `courseIdFK_idx` (`courseId` ASC) VISIBLE,
  CONSTRAINT `userIdFK`
    FOREIGN KEY (`userId`)
    REFERENCES `augolfdb`.`user` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `courseIdFK`
    FOREIGN KEY (`courseId`)
    REFERENCES `augolfdb`.`courselookup` (`courseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);