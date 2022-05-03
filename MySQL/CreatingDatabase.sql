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
  `parHole1` INT NOT NULL,
  `parHole2` INT NOT NULL, 
  `parHole3` INT NOT NULL, 
  `parHole4` INT NOT NULL, 
  `parHole5` INT NOT NULL, 
  `parHole6` INT NOT NULL, 
  `parHole7` INT NOT NULL, 
  `parHole8` INT NOT NULL, 
  `parHole9` INT NOT NULL, 
  `parHole10` INT NULL,
  `parHole11` INT NULL,
  `parHole12` INT NULL, 
  `parHole13` INT NULL, 
  `parHole14` INT NULL, 
  `parHole15` INT NULL, 
  `parHole16` INT NULL, 
  `parHole17` INT NULL, 
  `parHole18` INT NULL, 
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
    
use augolfdb;
    
INSERT INTO user (firstName, lastName, userName, email, password, gender, isActive, accountStatusId, accountRoleId, createdDate, lastModified, lastModifiedBy)
values ("Admin", "Auburn", "AUAdmin", "admin@agsk.com", "adminGolf", -1, 1, 3, 3, now(), now(), "SYSTEM"),
("User", "Auburn", "userDenied", "userDenied@agsk.com", "userDeniedGolf", -1, 1, 2, 1, now(), now(), "SYSTEM"),
("User", "Auburn", "userPending", "userPending@agsk.com", "userPendingGolf", -1, 1, 1, 1, now(), now(), "SYSTEM"),
("User", "Auburn", "userApproved", "userApproved@agsk.com", "userApprovedGolf", -1, 1, 3, 1, now(), now(), "SYSTEM"),
("Mod", "Auburn", "ModDenied", "ModDenied@agsk.com", "ModDeniedGolf", -1, 1, 2, 2, now(), now(), "SYSTEM"),
("Mod", "Auburn", "ModPending", "ModPending@agsk.com", "ModPendingGolf", -1, 1, 1, 2, now(), now(), "SYSTEM"),
("Mod", "Auburn", "ModApproved", "ModApproved@agsk.com", "ModApprovedGolf", -1, 1, 3, 2, now(), now(), "SYSTEM");

INSERT INTO courselookup (clubName, courseName, courseCity, courseState, parHole1, parHole2, parHole3, parHole4, parHole5, parHole6, parHole7, parHole8, parHole9, parHole10, parHole11, parHole12, parHole13, parHole14, parHole15, parHole17, parHole18, createdDate, lastModified, lastModifiedBy, isActive)
Values ('Robert Trent Jones Golf Course', 'Short Course', 'Owens Cross Roads', 'Alabama', 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, now(), now(), 'SYSTEM', 1),
('Robert Trent Jones Golf Course', 'Highlands','Owens Cross Roads', 'Alabama', 4, 5, 3, 4, 4, 4, 3, 5, 4, 3, 4, 4, 4, 5, 3, 5, 4, now(), now(), 'SYSTEM', 1)