DROP database IF EXISTS augolfdb;

CREATE SCHEMA `augolfdb`;

CREATE TABLE `augolfdb`.`user` (
  `userId` INT NOT NULL,
  `firstName` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(50) NOT NULL,
  `userName` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `gender` TINYINT(1) NOT NULL,
  `isActive` TINYINT(1) NOT NULL,
  `accountStatusId` INT NOT NULL,
  `accountRoleId` INT NOT NULL,
  `createdDate` DATETIME NOT NULL,
  `lastModified` DATETIME NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `userId_UNIQUE` (`userId` ASC) VISIBLE);
  
  CREATE TABLE `augolfdb`.`courselookup` (
  `courseId` INT NOT NULL,
  `clubName` VARCHAR(45) NOT NULL,
  `courseName` VARCHAR(45) NOT NULL,
  `courseCity` VARCHAR(45) NOT NULL,
  `courseState` VARCHAR(45) NOT NULL,
  `coursePar` VARCHAR(18) NOT NULL,
  `createdDate` DATETIME NOT NULL,
  `lastModified` DATETIME NOT NULL,
  PRIMARY KEY (`courseId`),
  UNIQUE INDEX `courseId_UNIQUE` (`courseId` ASC) VISIBLE);
  
  CREATE TABLE `augolfdb`.`scorecardlookup` (
  `scorecardId` INT NOT NULL,
  `userId` INT NOT NULL,
  `courseId` INT NOT NULL,
  `score` INT NOT NULL,
  `locked` TINYINT(1) NOT NULL,
  `picture` BLOB NULL,
  `createdDate` DATETIME NULL,
  `lastModified` DATETIME NULL,
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
  
  
  
  