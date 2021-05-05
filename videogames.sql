-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: videogames
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scores` (
  `user` int(11) NOT NULL,
  `videogame` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`user`,`videogame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (2,2,4),(2,3,3),(3,2,2),(3,3,4),(3,4,1),(3,5,4),(4,4,5);
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'bob','$2b$10$qYLsRl/CAe9EjU1gLDc9JOsBrjjatKGWNxBALKNdh4N3RG8VL/sGi','Bob'),(3,'charlie','$2b$10$qYLsRl/CAe9EjU1gLDc9JOsBrjjatKGWNxBALKNdh4N3RG8VL/sGi','Charlie'),(4,'dave','$2b$10$qYLsRl/CAe9EjU1gLDc9JOsBrjjatKGWNxBALKNdh4N3RG8VL/sGi','Dave'),(5,'eve','$2b$10$qYLsRl/CAe9EjU1gLDc9JOsBrjjatKGWNxBALKNdh4N3RG8VL/sGi','Eve'),(6,'frank','$2b$10$qYLsRl/CAe9EjU1gLDc9JOsBrjjatKGWNxBALKNdh4N3RG8VL/sGi','Frank'),(7,'grace','$2b$10$qYLsRl/CAe9EjU1gLDc9JOsBrjjatKGWNxBALKNdh4N3RG8VL/sGi','Grace'),(8,'heidi','$2b$10$qYLsRl/CAe9EjU1gLDc9JOsBrjjatKGWNxBALKNdh4N3RG8VL/sGi','Heidi'),(9,'ivan','$2b$10$qYLsRl/CAe9EjU1gLDc9JOsBrjjatKGWNxBALKNdh4N3RG8VL/sGi','Ivan'),(10,'judy','$2b$10$qYLsRl/CAe9EjU1gLDc9JOsBrjjatKGWNxBALKNdh4N3RG8VL/sGi','Judy'),(11,'s.vidal','xxx','sergi'),(12,'asd','xxx','sdf'),(13,'LOGIN','xxx','paco'),(14,'a','xxx','b'),(16,'ab','xxx','b');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videogames`
--

DROP TABLE IF EXISTS `videogames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videogames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogames`
--

LOCK TABLES `videogames` WRITE;
/*!40000 ALTER TABLE `videogames` DISABLE KEYS */;
INSERT INTO `videogames` VALUES (2,'The Witcher 3: Wild Hunt'),(3,'The Witcher 3: Wild Hunt - Blood and Wine'),(4,'The Orange Box'),(5,'Warcraft III: The Frozen Throne'),(6,'Mafia'),(7,'Warcraft III: Reign of Chaos'),(8,'Counter - Strike'),(9,'Deus Ex'),(10,'Planescape: Torment'),(11,'The Witcher 3: Wild Hunt - Hearts of Stone'),(12,'Left 4 Dead'),(13,'Half - Life 2: Episode Two'),(14,'Team Fortress 2'),(15,'Day of Defeat'),(16,'Max Payne'),(17,'Diablo II: Lord of Destruction'),(18,'Baldur\'s Gate II: Shadows of Amn'),(19,'Age of Empires II: The Conquerors Expansion'),(20,'Age of Empires II: The Age of Kings'),(21,'System Shock 2'),(22,'Grim Fandango'),(23,'Fallout 2'),(24,'Starcraft'),(25,'Final Fantasy XIV: Shadowbringers'),(26,'Resident Evil 2'),(27,'RimWorld'),(28,'Hollow Knight'),(29,'Portal'),(30,'Medieval II: Total War'),(31,'Day of Defeat: Source'),(32,'Half-Life 2'),(33,'Rome: Total War'),(34,'Star Wars: Knights of the Old Republic'),(35,'Gothic II'),(36,'Unreal Tournament (1999)'),(37,'Thief: The Dark Project'),(38,'The Curse of Monkey Island'),(39,'When The Past Was Around'),(40,'Hades'),(41,'Age of Empires II: Definitive Edition'),(42,'Katana ZERO'),(43,'The Evil Within 2'),(44,'OneShot'),(45,'Steins;Gate'),(46,'The Wolf Among Us: Episode 1 - Faith'),(47,'Black Mesa'),(48,'To the Moon'),(49,'Portal 2'),(50,'Mass Effect 2'),(51,'The Secret of Monkey Island: Special Edition'),(52,'Warhammer 40,000: Dawn of War - Dark Crusade'),(53,'Space Rangers 2: Rise of the Dominators'),(54,'Grand Theft Auto: San Andreas'),(55,'Vampire: The Masquerade - Bloodlines'),(56,'Counter-Strike: Source'),(57,'Max Payne 2: The Fall of Max Payne'),(58,'Command & Conquer: Generals - Zero Hour'),(59,'Freelancer'),(60,'Silent Hill 2'),(61,'Age of Mythology'),(62,'Command & Conquer: Red Alert 2 - Yuri\'s Revenge'),(63,'Commandos 2: Men of Courage'),(64,'Command & Conquer: Red Alert 2'),(65,'Metal Gear Solid'),(66,'Thief II: The Metal Age'),(67,'Baldur\'s Gate'),(68,'Blood'),(69,'Tennis World Tour 2'),(70,'There is no game : Wrong dimension'),(71,'Persona 4 Golden'),(72,'Tales From Off-Peak City Vol. 1'),(73,'Pathologic 2'),(74,'Divinity: Original Sin II'),(75,'Vanquish'),(76,'Final Fantasy IX'),(77,'Stardew Valley'),(78,'The Legend of Heroes: Trails in the Sky SC'),(79,'Devil May Cry 4: Special Edition'),(80,'Life is Strange: Episode 3 - Chaos Theory'),(81,'Cities: Skylines'),(82,'The Wolf Among Us'),(83,'The Walking Dead: Episode 5 - No Time Left'),(84,'The Walking Dead: A Telltale Games Series'),(85,'Fallout: New Vegas'),(86,'Monkey Island 2 Special Edition: LeChuck\'s Revenge'),(87,'Mount & Blade: Warband'),(88,'Dragon Age: Origins'),(89,'Football Manager 2010'),(90,'Dawn of Discovery'),(91,'Plants vs.Zombies'),(92,'Savage 2: A Tortured Soul'),(93,'Supreme Commander: Forged Alliance'),(94,'RACE 07: Official WTCC Game'),(95,'Medieval II: Total War Kingdoms'),(96,'TrackMania United'),(97,'Company of Heroes'),(98,'Rise & Fall: Civilizations at War'),(99,'Hitman: Blood Money'),(100,'Hearts of Iron II: Doomsday'),(101,'The Sims 2: Open for Business'),(102,'Command & Conquer: The First Decade'),(103,'Knights of Honor'),(104,'Psychonauts'),(105,'Rise of Nations: Thrones & Patriots'),(106,'Unreal Tournament 2004'),(107,'NBA Live 2004'),(108,'Patrician III: Rise of the Hanse'),(109,'Age of Mythology: The Titans'),(110,'Rise of Nations'),(111,'Grand Theft Auto: Vice City'),(112,'Stronghold: Crusader'),(113,'The Elder Scrolls III: Morrowind'),(114,'Original War'),(115,'Gothic'),(116,'Stronghold'),(117,'Shogun: Total War Warlord Edition'),(118,'Desperados: Wanted Dead or Alive'),(119,'Baldur\'s Gate II: Throne of Bhaal'),(120,'Steel Soldiers'),(121,'Clive Barker\'s Undying'),(122,'Homeworld: Cataclysm'),(123,'Diablo II'),(124,'Homeworld'),(125,'Sid Meier\'s Alpha Centauri'),(126,'Myth II: Soulblighter'),(127,'Fallout'),(128,'Total Annihilation'),(129,'Master of Orion II: Battle at Antares'),(130,'Quake'),(131,'Sid Meier\'s Civilization II'),(132,'SpongeBob SquarePants: Battle for Bikini Bottom - Rehydrated'),(133,'Command & Conquer Remastered Collection'),(134,'One Step From Eden'),(135,'Half - Life: Alyx'),(136,'Ori and the Will of the Wisps'),(137,'Phoenix Wright: Ace Attorney Trilogy'),(138,'Mega Man 11'),(139,'Final Fantasy XII: The Zodiac Age'),(140,'A Hat in Time'),(141,'The Silver Case'),(142,'Ori and the Blind Forest: Definitive Edition'),(143,'Battlezone 98 Redux'),(144,'Pathologic Classic HD'),(145,'Tales From The Borderlands: Episode 5 - The Vault of the Traveler'),(146,'Mega Man Legacy Collection'),(147,'Life is Strange: Episode 2 - Out of Time'),(148,'Ori and the Blind Forest'),(149,'LISA: The Painful'),(150,'The Wolf Among Us: Episode 5 - Cry Wolf'),(151,'Divinity: Original Sin'),(152,'Gas Guzzlers Extreme'),(153,'Dishonored: The Brigmore Witches'),(154,'Europa Universalis IV'),(155,'Mortal Kombat Komplete Edition'),(156,'Crusader Kings II: The Old Gods'),(157,'Victoria II: Heart of Darkness'),(158,'Euro Truck Simulator 2'),(159,'The Cat Lady'),(160,'Primordia'),(161,'Crusader Kings II'),(162,'Batman: Arkham City'),(163,'Terraria'),(164,'Warhammer 40, 000: Dawn of War II - Chaos Rising'),(165,'S.T.A.L.K.E.R.: Call of Pripyat'),(166,'Machinarium'),(167,'Multiwinia: Survival of the Flattest'),(168,'AudioSurf'),(169,'The Witcher'),(170,'Heroes of Might and Magic V: Tribes of the East'),(171,'IL - 2 Sturmovik: 1946'),(172,'Dark Messiah of Might and Magic'),(173,'Devil May Cry 3: Special Edition'),(174,'FlatOut 2'),(175,'Black & White 2 - Battle of the Gods'),(176,'Need for Speed: Most Wanted'),(177,'Tom Clancy\'s Splinter Cell: Chaos Theory'),(178,'Nexus: The Jupiter Incident'),(179,'Torrente'),(180,'Codename: Panzers, Phase One'),(181,'Warhammer 40,000: Dawn of War'),(182,'The Sims 2'),(183,'Silent Storm'),(184,'Counter-Strike: Condition Zero'),(185,'Legacy of Kain: Defiance'),(186,'Victoria: An Empire Under the Sun'),(187,'Tom Clancy\'s Rainbow Six 3: Raven Shield'),(188,'Jurassic Park: Operation Genesis'),(189,'SimCity 4'),(190,'RollerCoaster Tycoon 2'),(191,'Geoff Crammond\'s Grand Prix 4'),(192,'Medieval: Total War'),(193,'Operation Flashpoint: Resistance'),(194,'Star Wars Jedi Knight II: Jedi Outcast'),(195,'Disciples II: Dark Prophecy'),(196,'Capitalism II'),(197,'Legacy of Kain: Soul Reaver 2'),(198,'Return to Castle Wolfenstein'),(199,'IL-2 Sturmovik'),(200,'Europa Universalis II'),(201,'Aliens Versus Predator 2'),(202,'Operation Flashpoint: Cold War Crisis'),(203,'Arcanum: Of Steamworks and Magick Obscura'),(204,'The Longest Journey'),(205,'The Operative: No One Lives Forever'),(206,'Sacrifice'),(207,'Zeus: Master of Olympus'),(208,'RollerCoaster Tycoon: Loopy Landscapes'),(209,'FreeSpace 2'),(210,'Half - Life'),(211,'Age of Empires'),(212,'The Last Express'),(213,'Diablo'),(214,'Command & Conquer: Red Alert'),(215,'Duke Nukem 3D'),(216,'Sword of the Necromancer'),(217,'Project Wingman'),(218,'A Short Hike'),(219,'The Walking Dead: The Telltale Series - The Final Season Episode 4: Take Us Back'),(220,'Devil May Cry 5'),(221,'Horizon Chase Turbo'),(222,'Mega Man Legacy Collection 2'),(223,'Rain World'),(224,'NieR: Automata'),(225,'Danganronpa: Trigger Happy Havoc'),(226,'Dariusburst: Chronicle Saviours'),(227,'Life is Strange'),(228,'Tales from the Borderlands: A Telltale Game Series'),(229,'Life is Strange: Episode 4 - Dark Room'),(230,'Tales From The Borderlands: Episode 2 - Atlas Mugged'),(231,'The Talos Principle'),(232,'Valiant Hearts: The Great War'),(233,'The Wolf Among Us: Episode 3 - A Crooked Mile'),(234,'BioShock Infinite: Burial at Sea - Episode Two'),(235,'South Park: The Stick of Truth'),(236,'Sid Meier\'s Civilization V: Brave New World'),(237,'The Swapper'),(238,'Street Fighter X Mega Man'),(239,'Hotline Miami'),(240,'The Walking Dead: Episode 4 - Around Every Corner'),(241,'The Walking Dead: Episode 2 - Starved for Help'),(242,'Europa Universalis III: Divine Wind'),(243,'Recettear: An Item Shop\'s Tale'),(244,'Amnesia: The Dark Descent'),(245,'Batman: Arkham Asylum'),(246,'Killing Floor'),(247,'Wallace & Gromit\'s Grand Adventures, Episode 2: The Last Resort'),(248,'DCS: Black Shark'),(249,'Braid'),(250,'Defense Grid: The Awakening'),(251,'King\'s Bounty: The Legend'),(252,'Mount & Blade'),(253,'Mass Effect'),(254,'Penumbra: Black Plague'),(255,'Company of Heroes: Opposing Fronts'),(256,'BioShock'),(257,'Sid Meier\'s Civilization IV: Beyond the Sword'),(258,'Brian Lara International Cricket 2007'),(259,'Geometry Wars: Retro Evolved'),(260,'EverQuest II: Echoes of Faydwer'),(261,'Star Wars: Empire at War: Forces of Corruption'),(262,'GTR 2'),(263,'Half-Life 2: Episode One'),(264,'Red Orchestra: Ostfront 41-45'),(265,'Star Wars: Battlefront II'),(266,'Fable: The Lost Chapters'),(267,'Advent Rising'),(268,'SWAT 4'),(269,'Star Wars: Republic Commando'),(270,'Dangerous Waters'),(271,'The Chronicles of Riddick: Escape From Butcher Bay - Developer\'s Cut'),(272,'The Lord of the Rings: The Battle for Middle - Earth'),(273,'Prince of Persia: Warrior Within'),(274,'Need for Speed: Underground 2'),(275,'Joint Operations: Typhoon Rising'),(276,'Beyond Good & Evil'),(277,'Hidden & Dangerous 2'),(278,'Star Wars Jedi Knight: Jedi Academy'),(279,'Cold Zero: No Mercy'),(280,'Age of Wonders: Shadow Magic'),(281,'Medieval: Total War - Viking Invasion'),(282,'Vietcong(2003)'),(283,'No One Lives Forever 2: A Spy in H.A.R.M.\'s Way'),(284,'Battlefield 1942'),(285,'Serious Sam: The Second Encounter'),(286,'Medal of Honor: Allied Assault'),(287,'Startopia'),(288,'Resident Evil 3: Nemesis'),(289,'Blade of Darkness'),(290,'Oni'),(291,'Giants: Citizen Kabuto'),(292,'Midtown Madness 2'),(293,'Metal Fatigue'),(294,'Shogun: Total War'),(295,'Star Wars Jedi Knight: Dark Forces II'),(296,'Full Throttle'),(297,'ALTDEUS: Beyond Chronos'),(298,'Suzerain'),(299,'Batbarian: Testament of the Primordials'),(300,'Phantom: Covert Ops');
/*!40000 ALTER TABLE `videogames` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-10 19:19:36
