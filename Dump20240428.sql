-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: adt_project
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `AuthorID` int NOT NULL AUTO_INCREMENT,
  `AuthorName` varchar(255) NOT NULL,
  `LanguageCode` varchar(10) DEFAULT NULL,
  `AuthorRating` varchar(20) NOT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (32,'Unknown, Seamus Heaney','en-US','Novice'),(33,'Frank Miller, David Mazzucchelli, Richmond Lewis, Dennis O\'Neil','eng','Intermediate'),(34,'Harper Lee','eng','Novice'),(35,'David Sedaris','en-US','Intermediate'),(36,'Laini Taylor','eng','Intermediate'),(37,'Victoria Aveyard','eng','Intermediate'),(38,'Charles Duhigg','eng','Intermediate'),(39,'John Berendt','eng','Intermediate'),(40,'Colleen Hoover','eng','Intermediate'),(41,'Frances Hodgson Burnett, Nancy Bond','eng','Intermediate'),(42,'Sarah Dessen','en-US','Intermediate'),(43,'C.S. Lewis','eng','Intermediate'),(44,'Richelle Mead','eng','Famous'),(45,'Laura Ingalls Wilder, Garth Williams','eng','Intermediate'),(46,'Margery Williams Bianco, William   Nicholson','eng','Intermediate'),(47,'Robert M. Pirsig','eng','Intermediate'),(48,'H.G. Wells, Arthur C. Clarke','eng','Intermediate'),(49,'Sara Shepard','en-US','Intermediate'),(50,'Don Freeman','en-US','Intermediate'),(51,'Michael Pollan','eng','Intermediate'),(52,'Kate Atkinson','eng','Intermediate'),(53,'Nicholas Sparks','en-US','Intermediate'),(54,'Stephen King','','Intermediate'),(55,'Diana Gabaldon','eng','Intermediate'),(56,'Kenneth Branagh, William Shakespeare','eng','Intermediate'),(57,'Stephen King','spa','Intermediate'),(58,'Jeffrey Eugenides','eng','Intermediate'),(59,'Charlaine Harris','eng','Intermediate'),(60,'Thomas Hardy, Tim Dolin, Margaret R. Higonnet','eng','Intermediate'),(61,'Gustave Flaubert, Margaret Mauldon, Malcolm Bowie, Mark Overstall','eng','Intermediate'),(62,'Norton Juster, Jules Feiffer','en-US','Intermediate'),(63,'Brandon Sanderson','eng','Famous'),(64,'Charlaine Harris','en-GB','Intermediate'),(65,'Ned Vizzini','en-US','Intermediate'),(66,'Brandon Sanderson','eng','Intermediate'),(67,'Jojo Moyes','eng','Intermediate'),(68,'Vanessa Diffenbaugh','eng','Intermediate'),(69,'Frank Miller, Klaus Janson, Lynn Varley','eng','Intermediate'),(70,'James Patterson','eng','Intermediate'),(71,'Nick Hornby','eng','Intermediate'),(72,'Margaret Atwood','eng','Intermediate'),(73,'John Gray','en-US','Intermediate'),(74,'Anthony Bourdain','eng','Intermediate'),(75,'Michael Crichton','en-US','Intermediate'),(76,'Voltaire','eng','Intermediate'),(77,'Natalie Babbitt','eng','Intermediate'),(78,'Stephen King, Marie Milpois','fre','Intermediate'),(79,'P.D. Eastman','eng','Intermediate'),(80,'E.H. Gombrich','en-US','Intermediate'),(81,'Marissa Meyer','eng','Intermediate'),(82,'Robert T. Kiyosaki','eng','Intermediate'),(83,'Becca Fitzpatrick','eng','Intermediate'),(95,'Isabella Knightley','en','Expert'),(96,'Rafael Moreno','es','Intermediate'),(97,'Yuki Nagato','ja','Intermediate'),(98,'Amira Sayed','ar','Novice'),(99,'Ethan Hawke','en','Expert'),(100,'Lara Croft','en','Intermediate'),(101,'Nikolai Volkov','ru','Novice'),(102,'Samantha Bee','en','Expert'),(103,'Carlos Ruiz','es','Intermediate'),(104,'Anika Chopra','hi','Novice');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `BookID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `AuthorID` int DEFAULT NULL,
  `GenreID` int DEFAULT NULL,
  `PublishingYear` int DEFAULT NULL,
  `AverageRating` decimal(3,2) NOT NULL,
  `RatingsCount` int DEFAULT NULL,
  `PublisherID` int DEFAULT NULL,
  `SalePrice` decimal(5,2) DEFAULT NULL,
  `SalesRank` int DEFAULT NULL,
  `units` int DEFAULT '0',
  PRIMARY KEY (`BookID`),
  KEY `AuthorID` (`AuthorID`),
  KEY `GenreID` (`GenreID`),
  KEY `PublisherID` (`PublisherID`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `authors` (`AuthorID`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `genres` (`GenreID`),
  CONSTRAINT `books_ibfk_3` FOREIGN KEY (`PublisherID`) REFERENCES `publishers` (`PublisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (3,'Go Set a Watchman',34,1,2015,3.31,138669,2,8.69,3,85),(4,'When You Are Engulfed in Flames',35,2,2008,4.04,150898,3,7.50,3,82),(5,'Daughter of Smoke & Bone',36,1,2011,4.04,198283,4,7.99,4,105),(6,'Red Queen',37,1,2015,4.08,83354,2,4.99,5,56),(7,'The Power of Habit',38,1,2011,4.03,155977,1,6.99,6,80),(8,'Midnight in the Garden of Good and Evil',39,3,1994,3.90,167997,3,6.89,8,84),(10,'A Little Princess',41,1,1905,4.20,199872,5,6.49,10,56),(11,'The Truth About Forever',42,1,2004,4.13,179415,2,4.99,11,61),(12,'The horse and his boy',43,2,1954,3.90,189671,4,5.99,11,88),(13,'Last Sacrifice ',44,1,2010,4.42,206792,2,0.99,13,65),(14,'Little House on the Prairie',45,1,1935,4.18,195424,1,1.99,13,82),(15,'The Velveteen Rabbit',46,1,1922,4.29,173469,5,6.54,15,95),(16,'Zen and the Art of Motorcycle Maintenance',47,1,1974,3.76,139411,2,4.99,16,109),(17,'The War of the Worlds',48,1,1897,3.80,159752,2,4.99,17,66),(18,'Pretty Little Liars',49,1,2006,3.90,156328,2,4.99,17,98),(19,'Corduroy',50,1,1948,4.28,160860,6,1.99,18,100),(20,'The Omnivore\'s Dilemma',51,1,2006,4.17,133271,2,0.99,19,86),(21,'Life After Life',52,1,2013,3.74,138454,2,3.99,21,80),(22,'The Guardian',53,1,2003,4.14,136427,2,0.99,42,95),(23,'The Rescue',53,1,2000,4.10,142092,2,2.99,22,111),(24,'Cujo',54,1,1981,3.65,158215,2,2.99,26,78),(25,'Needful Things',54,1,1991,3.87,153821,2,0.99,23,80),(26,'Voyager',55,1,1993,4.38,157395,2,2.99,24,116),(27,'',56,1,1996,4.12,156869,2,0.99,25,77),(28,'Cujo',57,1,1981,3.65,158215,2,2.99,26,58),(29,'Needful Things',57,1,1991,3.87,153821,2,0.99,23,79),(30,'The Virgin Suicides',58,1,1993,3.83,159249,4,10.91,28,102),(31,'Club Dead',59,1,2003,4.03,181323,1,5.99,32,82),(32,'Dead to the World',59,1,2004,4.13,199572,2,0.99,29,56),(33,'Tess of the d\'Urbervilles: A Pure Woman Faithfully Presented',60,3,1891,3.77,171599,3,3.99,29,53),(34,'Madame Bovary',61,1,1856,3.64,158877,2,3.99,30,50),(35,'The Phantom Tollbooth',62,1,1961,4.22,178432,2,1.99,31,113),(36,'',63,1,2007,4.35,150736,5,8.99,35,81),(37,'The Way of Kings',63,1,2010,4.64,144822,2,0.99,32,88),(38,'Club Dead',64,1,2003,4.03,181323,1,5.99,32,75),(39,'Dead to the World',64,1,2004,4.13,199572,2,0.99,29,64),(40,'It\'s Kind of a Funny Story',65,3,2006,4.14,161001,1,0.99,34,115),(41,'',66,1,2007,4.35,150736,5,8.99,35,119),(42,'The Way of Kings',66,1,2010,4.64,144822,2,0.99,32,58),(43,'After You',67,1,2015,3.70,99342,2,0.99,36,99),(44,'The Language of Flowers',68,1,2011,4.07,140076,2,0.99,36,57),(45,'Batman: The Dark Knight Returns',69,1,1986,4.25,135979,2,0.99,37,81),(46,'The Angel Experiment',70,1,2005,4.08,172302,2,0.99,37,115),(47,'High Fidelity',71,1,1995,3.94,134849,5,10.65,41,68),(48,'Oryx and Crake',72,1,2003,4.00,151500,2,3.99,43,89),(49,'Men Are from Mars, Women Are from Venus Book of Days: 365 Inspirations to Enrich Your Relationships',73,1,1998,3.52,113915,2,1.99,44,120),(50,'Kitchen Confidential: Adventures in the Culinary Underbelly',74,1,2000,4.00,134177,1,5.99,45,71),(51,'Timeline',75,1,1999,3.83,148563,2,6.99,46,86),(52,'Candide',76,1,1759,3.76,151471,2,4.99,48,99),(53,'Tuck Everlasting',77,3,1975,3.85,174280,2,1.99,48,114),(54,'Christine',78,3,1983,3.72,151160,2,0.99,49,82),(55,'Are You My Mother?',79,1,1960,4.16,174204,4,5.99,50,88),(56,'The Story of Art',80,1,1950,3.83,164708,3,8.59,51,76),(57,'Scarlet',81,1,2013,4.30,193766,2,0.99,52,68),(58,'Rich Dad , Poor Dad',82,1,1997,3.95,153764,5,0.99,53,59),(59,'Silence ',83,1,2011,4.16,190722,2,4.99,54,115),(64,'Whispers of the Quantum Realm',97,5,2024,4.80,120,20,15.99,1,63),(65,'Solar Flares and Shadows',96,7,2024,4.70,85,10,12.99,2,64),(66,'Echoes from the Afrofuture',95,8,2023,4.90,143,9,18.99,3,82),(67,'The Labyrinth of Time',101,6,2024,4.60,97,17,13.99,4,95),(68,'Gardens Beyond the Galaxy',102,5,2025,4.50,88,15,14.99,5,108),(69,'Chronicles of the Forgotten',103,4,2023,4.40,76,11,16.99,6,65),(70,'The Enigma of Arrival',104,7,2024,4.20,64,13,17.99,7,94),(71,'Beneath the Cosmic Seas',99,5,2025,4.30,52,16,19.99,8,84),(72,'Lost Chronicles: Earth\'s Last Hope',100,6,2024,4.10,120,18,15.49,9,88),(73,'The Final Frontier: A New Dawn',98,8,2023,4.60,134,19,20.99,10,66),(75,'QQQQ',32,1,2018,3.50,1254,4,5.20,2,80),(77,'harry',32,2,2015,3.50,12546,5,5.20,8,32);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `GenreID` int NOT NULL AUTO_INCREMENT,
  `GenreName` varchar(255) NOT NULL,
  PRIMARY KEY (`GenreID`),
  UNIQUE KEY `UQ_GenreName` (`GenreName`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (8,'Afrofuturism'),(4,'Cyber Mystery'),(2,'fiction'),(1,'genre fiction'),(6,'Mythopoeia'),(3,'nonfiction'),(5,'Quantum Fiction'),(7,'Solarpunk');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `PublisherID` int NOT NULL AUTO_INCREMENT,
  `PublisherName` varchar(255) NOT NULL,
  PRIMARY KEY (`PublisherID`),
  UNIQUE KEY `UQ_PublisherName` (`PublisherName`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (8,'Aether Publishing House'),(2,'Amazon Digital Services,  Inc.'),(9,'Binary Stars Books'),(10,'Celestial Mapping Co.'),(11,'Dimensional Printworks'),(12,'Elemental Reads Publishing'),(13,'Forbidden Lore Press'),(14,'Graviton Media'),(3,'Hachette Book Group'),(1,'HarperCollins Publishers'),(15,'Horizon Line Books'),(16,'Interstellar Ink'),(17,'Labyrinth Literary'),(18,'Mythos Creations'),(19,'Nexus Book Group'),(4,'Penguin Group (USA) LLC'),(20,'Quantum Quills Publishing'),(5,'Random House LLC'),(21,'Rift Valley Press'),(6,'Simon and Schuster Digital Sales Inc'),(22,'Timefold Books');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_data`
--

DROP TABLE IF EXISTS `sample_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sample_data` (
  `index` int DEFAULT NULL,
  `Publishing Year` double DEFAULT NULL,
  `Book Name` text,
  `Author` text,
  `language_code` text,
  `Author_Rating` text,
  `Book_average_rating` double DEFAULT NULL,
  `Book_ratings_count` int DEFAULT NULL,
  `genre` text,
  `gross sales` double DEFAULT NULL,
  `publisher revenue` double DEFAULT NULL,
  `sale price` double DEFAULT NULL,
  `sales rank` int DEFAULT NULL,
  `Publisher` text,
  `units sold` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_data`
--

LOCK TABLES `sample_data` WRITE;
/*!40000 ALTER TABLE `sample_data` DISABLE KEYS */;
INSERT INTO `sample_data` VALUES (0,1975,'Beowulf','Unknown, Seamus Heaney','en-US','Novice',3.42,155903,'genre fiction',34160,20496,4.88,1,'HarperCollins Publishers',7000),(1,1987,'Batman: Year One','Frank Miller, David Mazzucchelli, Richmond Lewis, Dennis O\'Neil','eng','Intermediate',4.23,145267,'genre fiction',12437.5,7462.5,1.99,2,'HarperCollins Publishers',6250),(2,2015,'Go Set a Watchman','Harper Lee','eng','Novice',3.31,138669,'genre fiction',47795,28677,8.69,3,'Amazon Digital Services,  Inc.',5500),(3,2008,'When You Are Engulfed in Flames','David Sedaris','en-US','Intermediate',4.04,150898,'fiction',41250,24750,7.5,3,'Hachette Book Group',5500),(4,2011,'Daughter of Smoke & Bone','Laini Taylor','eng','Intermediate',4.04,198283,'genre fiction',37952.5,22771.5,7.99,4,'Penguin Group (USA) LLC',4750),(5,2015,'Red Queen','Victoria Aveyard','eng','Intermediate',4.08,83354,'genre fiction',19960,0,4.99,5,'Amazon Digital Services,  Inc.',4000),(6,2011,'The Power of Habit','Charles Duhigg','eng','Intermediate',4.03,155977,'genre fiction',27491.67,16495.002,6.99,6,'HarperCollins Publishers',3933),(7,1994,'Midnight in the Garden of Good and Evil','John Berendt','eng','Intermediate',3.9,167997,'nonfiction',26182,15709.2,6.89,8,'Hachette Book Group',3800),(8,2012,'Hopeless','Colleen Hoover','eng','Intermediate',4.34,189938,'genre fiction',26093.67,15656.202,6.99,9,'HarperCollins Publishers',3733),(9,1905,'A Little Princess','Frances Hodgson Burnett, Nancy Bond','eng','Intermediate',4.2,199872,'genre fiction',23792.34,14275.404,6.49,10,'Random House LLC',3666),(10,2004,'The Truth About Forever','Sarah Dessen','en-US','Intermediate',4.13,179415,'genre fiction',17964,0,4.99,11,'Amazon Digital Services,  Inc.',3600),(11,1954,'The horse and his boy','C.S. Lewis','eng','Intermediate',3.9,189671,'fiction',21564,12938.4,5.99,11,'Penguin Group (USA) LLC',3600),(12,2010,'Last Sacrifice ','Richelle Mead','eng','Famous',4.42,206792,'genre fiction',3431.34,0,0.99,13,'Amazon Digital Services,  Inc.',3466),(13,1935,'Little House on the Prairie','Laura Ingalls Wilder, Garth Williams','eng','Intermediate',4.18,195424,'genre fiction',6897.34,4138.404,1.99,13,'HarperCollins Publishers',3466),(14,1922,'The Velveteen Rabbit','Margery Williams Bianco, William   Nicholson','eng','Intermediate',4.29,173469,'genre fiction',21797.82,13078.692,6.54,15,'Random House LLC',3333),(15,1974,'Zen and the Art of Motorcycle Maintenance','Robert M. Pirsig','eng','Intermediate',3.76,139411,'genre fiction',16297.34,0,4.99,16,'Amazon Digital Services,  Inc.',3266),(16,1897,'The War of the Worlds','H.G. Wells, Arthur C. Clarke','eng','Intermediate',3.8,159752,'genre fiction',15968,0,4.99,17,'Amazon Digital Services,  Inc.',3200),(17,2006,'Pretty Little Liars','Sara Shepard','en-US','Intermediate',3.9,156328,'genre fiction',15968,0,4.99,17,'Amazon Digital Services,  Inc.',3200),(18,1948,'Corduroy','Don Freeman','en-US','Intermediate',4.28,160860,'genre fiction',6234.67,3740.802,1.99,18,'Simon and Schuster Digital Sales Inc',3133),(19,2006,'The Omnivore\'s Dilemma','Michael Pollan','eng','Intermediate',4.17,133271,'genre fiction',3035.34,0,0.99,19,'Amazon Digital Services,  Inc.',3066),(20,2013,'Life After Life','Kate Atkinson','eng','Intermediate',3.74,138454,'genre fiction',11702.67,0,3.99,21,'Amazon Digital Services,  Inc.',2933),(21,2000,'The Rescue','Nicholas Sparks','en-US','Intermediate',4.1,142092,'genre fiction',8569.34,0,2.99,22,'Amazon Digital Services,  Inc.',2866),(22,1991,'Needful Things','Stephen King','','Intermediate',3.87,153821,'genre fiction',2772,0,0.99,23,'Amazon Digital Services,  Inc.',2800),(23,1993,'Voyager','Diana Gabaldon','eng','Intermediate',4.38,157395,'genre fiction',8171.67,0,2.99,24,'Amazon Digital Services,  Inc.',2733),(24,1996,'','Kenneth Branagh, William Shakespeare','eng','Intermediate',4.12,156869,'genre fiction',2639.34,1583.604,0.99,25,'Amazon Digital Services,  Inc.',2666),(25,1981,'Cujo','Stephen King','spa','Intermediate',3.65,158215,'genre fiction',7774,0,2.99,26,'Amazon Digital Services,  Inc.',2600),(26,1993,'The Virgin Suicides','Jeffrey Eugenides','eng','Intermediate',3.83,159249,'genre fiction',26904.06,16142.436,10.91,28,'Penguin Group (USA) LLC',2466),(27,2004,'Dead to the World','Charlaine Harris','eng','Intermediate',4.13,199572,'genre fiction',2376,0,0.99,29,'Amazon Digital Services,  Inc.',2400),(28,1891,'Tess of the d\'Urbervilles: A Pure Woman Faithfully Presented','Thomas Hardy, Tim Dolin, Margaret R. Higonnet','eng','Intermediate',3.77,171599,'nonfiction',9576,5745.6,3.99,29,'Hachette Book Group',2400),(29,1856,'Madame Bovary','Gustave Flaubert, Margaret Mauldon, Malcolm Bowie, Mark Overstall','eng','Intermediate',3.64,158877,'genre fiction',9308.67,0,3.99,30,'Amazon Digital Services,  Inc.',2333),(30,1961,'The Phantom Tollbooth','Norton Juster, Jules Feiffer','en-US','Intermediate',4.22,178432,'genre fiction',4509.34,0,1.99,31,'Amazon Digital Services,  Inc.',2266),(31,2010,'The Way of Kings','Brandon Sanderson','eng','Famous',4.64,144822,'genre fiction',2178,0,0.99,32,'Amazon Digital Services,  Inc.',2200),(32,2003,'Club Dead','Charlaine Harris','en-GB','Intermediate',4.03,181323,'genre fiction',13178,7906.8,5.99,32,'HarperCollins Publishers',2200),(33,2006,'It\'s Kind of a Funny Story','Ned Vizzini','en-US','Intermediate',4.14,161001,'nonfiction',2045.34,1227.204,0.99,34,'HarperCollins Publishers',2066),(34,2007,'','Brandon Sanderson','eng','Intermediate',4.35,150736,'genre fiction',17980,10788,8.99,35,'Random House LLC',2000),(35,2015,'After You','Jojo Moyes','eng','Intermediate',3.7,99342,'genre fiction',1964.16,0,0.99,36,'Amazon Digital Services,  Inc.',1984),(36,2011,'The Language of Flowers','Vanessa Diffenbaugh','eng','Intermediate',4.07,140076,'genre fiction',1964.16,1178.496,0.99,36,'Amazon Digital Services,  Inc.',1984),(37,1986,'Batman: The Dark Knight Returns','Frank Miller, Klaus Janson, Lynn Varley','eng','Intermediate',4.25,135979,'genre fiction',1949.31,0,0.99,37,'Amazon Digital Services,  Inc.',1969),(38,2005,'The Angel Experiment','James Patterson','eng','Intermediate',4.08,172302,'genre fiction',1949.31,0,0.99,37,'Amazon Digital Services,  Inc.',1969),(39,1995,'High Fidelity','Nick Hornby','eng','Intermediate',3.94,134849,'genre fiction',20309.55,12185.73,10.65,41,'Random House LLC',1907),(40,2003,'The Guardian','Nicholas Sparks','en-US','Intermediate',4.14,136427,'genre fiction',1873.08,0,0.99,42,'Amazon Digital Services,  Inc.',1892),(41,2003,'Oryx and Crake','Margaret Atwood','eng','Intermediate',4,151500,'genre fiction',7485.24,0,3.99,43,'Amazon Digital Services,  Inc.',1876),(42,1998,'Men Are from Mars, Women Are from Venus Book of Days: 365 Inspirations to Enrich Your Relationships','John Gray','en-US','Intermediate',3.52,113915,'genre fiction',3703.39,2222.034,1.99,44,'Amazon Digital Services,  Inc.',1861),(43,2000,'Kitchen Confidential: Adventures in the Culinary Underbelly','Anthony Bourdain','eng','Intermediate',4,134177,'genre fiction',11057.54,6634.524,5.99,45,'HarperCollins Publishers',1846),(44,1999,'Timeline','Michael Crichton','en-US','Intermediate',3.83,148563,'genre fiction',12791.7,7675.02,6.99,46,'Amazon Digital Services,  Inc.',1830),(45,1759,'Candide','Voltaire','eng','Intermediate',3.76,151471,'genre fiction',8982,0,4.99,48,'Amazon Digital Services,  Inc.',1800),(46,1975,'Tuck Everlasting','Natalie Babbitt','eng','Intermediate',3.85,174280,'nonfiction',3582,2149.2,1.99,48,'Amazon Digital Services,  Inc.',1800),(47,1983,'Christine','Stephen King, Marie Milpois','fre','Intermediate',3.72,151160,'nonfiction',1766.16,1059.696,0.99,49,'Amazon Digital Services,  Inc.',1784),(48,1960,'Are You My Mother?','P.D. Eastman','eng','Intermediate',4.16,174204,'genre fiction',10596.31,6357.786,5.99,50,'Penguin Group (USA) LLC',1769),(49,1950,'The Story of Art','E.H. Gombrich','en-US','Intermediate',3.83,164708,'genre fiction',15058.27,9034.962,8.59,51,'Hachette Book Group',1753),(50,2013,'Scarlet','Marissa Meyer','eng','Intermediate',4.3,193766,'genre fiction',1720.62,1032.372,0.99,52,'Amazon Digital Services,  Inc.',1738),(51,1997,'Rich Dad , Poor Dad','Robert T. Kiyosaki','eng','Intermediate',3.95,153764,'genre fiction',1705.77,1023.462,0.99,53,'Random House LLC',1723),(52,2011,'Silence ','Becca Fitzpatrick','eng','Intermediate',4.16,190722,'genre fiction',8517.93,0,4.99,54,'Amazon Digital Services,  Inc.',1707);
/*!40000 ALTER TABLE `sample_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `BookID` int DEFAULT NULL,
  `GrossSales` decimal(10,2) NOT NULL,
  `PublisherRevenue` decimal(10,2) DEFAULT '0.00',
  `UnitsSold` int NOT NULL,
  `UserID` int DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `transactions_ibfk_1` (`BookID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (3,3,47795.00,28677.00,5500,7),(4,4,41250.00,24750.00,5500,5),(5,5,37952.50,22771.50,4750,9),(6,6,19960.00,0.00,4000,2),(7,7,27491.67,16495.00,3933,5),(8,8,26182.00,15709.20,3800,2),(10,10,23792.34,14275.40,3666,10),(11,11,17964.00,0.00,3600,1),(12,12,21564.00,12938.40,3600,4),(13,13,3431.34,0.00,3466,8),(14,14,6897.34,4138.40,3466,2),(15,15,21797.82,13078.69,3333,7),(16,16,16297.34,0.00,3266,4),(17,17,15968.00,0.00,3200,8),(18,18,15968.00,0.00,3200,10),(19,19,6234.67,3740.80,3133,4),(20,20,3035.34,0.00,3066,10),(21,21,11702.67,0.00,2933,5),(22,22,1873.08,0.00,1892,5),(23,23,8569.34,0.00,2866,6),(24,24,7774.00,0.00,2600,2),(25,25,2772.00,0.00,2800,4),(26,26,8171.67,0.00,2733,3),(27,27,17980.00,10788.00,2000,7),(28,27,2639.34,1583.60,2666,6),(29,28,7774.00,0.00,2600,2),(30,29,2772.00,0.00,2800,7),(31,30,26904.06,16142.44,2466,6),(32,31,13178.00,7906.80,2200,10),(33,32,2376.00,0.00,2400,10),(34,33,9576.00,5745.60,2400,2),(35,34,9308.67,0.00,2333,2),(36,35,4509.34,0.00,2266,3),(37,36,17980.00,10788.00,2000,1),(38,36,2639.34,1583.60,2666,8),(39,37,2178.00,0.00,2200,6),(40,38,13178.00,7906.80,2200,8),(41,39,2376.00,0.00,2400,7),(42,40,2045.34,1227.20,2066,6),(43,41,17980.00,10788.00,2000,10),(44,41,2639.34,1583.60,2666,4),(45,42,2178.00,0.00,2200,1),(46,43,1964.16,0.00,1984,9),(47,44,1964.16,1178.50,1984,5),(48,45,1949.31,0.00,1969,6),(49,46,1949.31,0.00,1969,4),(50,47,20309.55,12185.73,1907,8),(51,48,7485.24,0.00,1876,10),(52,49,3703.39,2222.03,1861,3),(53,50,11057.54,6634.52,1846,8),(54,51,12791.70,7675.02,1830,4),(55,52,8982.00,0.00,1800,4),(56,53,3582.00,2149.20,1800,9),(57,54,1766.16,1059.70,1784,7),(58,55,10596.31,6357.79,1769,8),(59,56,15058.27,9034.96,1753,7),(60,57,1720.62,1032.37,1738,6),(61,58,1705.77,1023.46,1723,1),(62,59,8517.93,0.00,1707,9),(65,64,1919.40,1151.64,120,9),(66,65,1104.15,662.49,85,2),(67,66,2717.57,1630.54,143,6),(68,67,1357.03,814.22,97,4),(69,68,1319.12,791.47,88,9),(70,69,1287.24,772.34,76,7),(71,70,1151.36,690.82,64,3),(72,71,1039.68,623.81,52,3),(73,72,1858.80,1115.28,120,9),(74,73,2808.66,1685.20,134,5),(75,64,2398.80,1439.28,150,2),(76,65,1039.15,623.49,100,3),(77,66,2727.57,1636.54,148,9),(78,67,1377.03,826.22,99,10),(79,68,1329.12,797.47,89,5),(92,6,4.99,0.00,1,NULL),(93,6,4.99,0.00,1,NULL),(94,6,4.99,0.00,1,NULL),(95,6,4.99,0.00,1,NULL),(96,6,24.95,0.00,5,NULL),(97,6,4.99,0.00,1,NULL),(101,6,49.90,0.00,10,NULL),(102,6,4.99,0.00,1,NULL),(103,6,9.98,0.00,2,NULL),(105,6,49.90,0.00,10,NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'aliceBlue','alicePass123'),(2,'bobBuilder','bobBuilds456'),(3,'charlieScene','chScene789'),(4,'deltaForce','deltaF321'),(5,'echoValley','echoV987'),(6,'foxtrotUniform','foxU654'),(7,'golfSierra','golfS321'),(8,'hotelCalifornia','hotelC852'),(9,'indiaEcho','indiaE753'),(10,'julietBravo','julietB159'),(11,'prit','12345');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-28  1:31:14
