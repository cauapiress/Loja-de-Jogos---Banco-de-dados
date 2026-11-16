-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: loja_de_jogos
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nome_categoria` (`nome_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Ação'),(2,'Aventura'),(5,'Corrida'),(4,'Esporte'),(8,'FPS'),(9,'Luta'),(3,'RPG'),(10,'Simulação'),(6,'Terror');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(30) NOT NULL,
  `CPF` char(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Lucas Almeida','lucas@gmail.com','21999998888','12345678901'),(2,'Mariana Costa','mariana@gmail.com','21988882222','12345678902'),(3,'Pedro Santos','pedro@gmail.com','21988883333','12345678903'),(4,'Ana Oliveira','ana@gmail.com','21988884444','12345678904'),(5,'Gabriel Souza','gabriel@gmail.com','21988885555','12345678905'),(6,'Beatriz Lima','beatriz@gmail.com','21988886666','12345678906'),(7,'Rafael Ferreira','rafael@gmail.com','21988887777','12345678907'),(8,'Juliana Rodrigues','juliana@gmail.com','21988888888','12345678908'),(9,'Matheus Gomes','matheus@gmail.com','21988889999','12345678909'),(10,'Camila Ribeiro','camila@gmail.com','21988880000','12345678910');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_jogo_plataforma` int NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_item`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_jogo_plataforma` (`id_jogo_plataforma`),
  CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`id_jogo_plataforma`) REFERENCES `jogo_plataforma` (`id_jogo_plataforma`),
  CONSTRAINT `item_pedido_chk_1` CHECK ((`quantidade` > 0)),
  CONSTRAINT `item_pedido_chk_2` CHECK ((`preco_unitario` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
INSERT INTO `item_pedido` VALUES (1,1,1,1,149.90),(2,2,2,1,199.90),(3,3,6,1,89.90),(4,4,8,1,249.90),(5,5,10,1,179.90),(6,6,13,1,119.90),(7,7,15,1,149.90),(8,7,17,1,149.90),(9,8,18,1,159.90),(10,9,19,1,109.90),(11,9,21,1,109.90),(12,10,22,1,139.90);
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogo`
--

DROP TABLE IF EXISTS `jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogo` (
  `id_jogo` int NOT NULL AUTO_INCREMENT,
  `nome_jogo` varchar(100) NOT NULL,
  `ano_lancamento` year DEFAULT NULL,
  PRIMARY KEY (`id_jogo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo`
--

LOCK TABLES `jogo` WRITE;
/*!40000 ALTER TABLE `jogo` DISABLE KEYS */;
INSERT INTO `jogo` VALUES (1,'The Witcher 3',2015),(2,'Red Dead Redemption 2',2018),(3,'Resident Evil 4',2023),(4,'Elden Ring',2022),(5,'EA Sports FC 26',2025),(6,'Cyberpunk 2077',2020),(7,'God of War Ragnarök',2022),(8,'Minecraft',2011),(9,'Mortal Kombat 1',2023),(10,'Forza Horizon 5',2021);
/*!40000 ALTER TABLE `jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogo_categoria`
--

DROP TABLE IF EXISTS `jogo_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogo_categoria` (
  `id_jogo_categoria` int NOT NULL AUTO_INCREMENT,
  `id_jogo` int NOT NULL,
  `id_categoria` int NOT NULL,
  `categoria_principal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_jogo_categoria`),
  UNIQUE KEY `id_jogo` (`id_jogo`,`id_categoria`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `jogo_categoria_ibfk_1` FOREIGN KEY (`id_jogo`) REFERENCES `jogo` (`id_jogo`),
  CONSTRAINT `jogo_categoria_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo_categoria`
--

LOCK TABLES `jogo_categoria` WRITE;
/*!40000 ALTER TABLE `jogo_categoria` DISABLE KEYS */;
INSERT INTO `jogo_categoria` VALUES (1,1,3,1),(2,1,2,0),(3,2,2,1),(4,2,1,0),(5,3,1,1),(6,3,6,0),(7,4,3,1),(8,4,1,0),(9,5,4,1),(10,5,10,0),(11,6,3,1),(12,6,1,0),(13,7,2,1),(14,7,1,0),(15,8,10,1),(16,8,2,0),(17,9,9,1),(18,9,1,0),(19,10,5,1),(20,10,10,0);
/*!40000 ALTER TABLE `jogo_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogo_plataforma`
--

DROP TABLE IF EXISTS `jogo_plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogo_plataforma` (
  `id_jogo_plataforma` int NOT NULL AUTO_INCREMENT,
  `id_jogo` int NOT NULL,
  `id_plataforma` int NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_jogo_plataforma`),
  UNIQUE KEY `id_jogo` (`id_jogo`,`id_plataforma`),
  KEY `id_plataforma` (`id_plataforma`),
  CONSTRAINT `jogo_plataforma_ibfk_1` FOREIGN KEY (`id_jogo`) REFERENCES `jogo` (`id_jogo`),
  CONSTRAINT `jogo_plataforma_ibfk_2` FOREIGN KEY (`id_plataforma`) REFERENCES `plataforma` (`id_plataforma`),
  CONSTRAINT `jogo_plataforma_chk_1` CHECK ((`preco` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo_plataforma`
--

LOCK TABLES `jogo_plataforma` WRITE;
/*!40000 ALTER TABLE `jogo_plataforma` DISABLE KEYS */;
INSERT INTO `jogo_plataforma` VALUES (1,1,1,79.90),(2,1,2,99.90),(3,1,3,99.90),(4,2,1,119.90),(5,2,2,149.90),(6,3,1,139.90),(7,3,3,159.90),(8,4,1,199.90),(9,4,2,249.90),(10,5,1,179.90),(11,5,2,249.90),(12,5,3,249.90),(13,6,1,129.90),(14,6,2,149.90),(15,7,1,199.90),(16,7,3,249.90),(17,8,1,89.90),(18,8,2,99.90),(19,9,1,159.90),(20,9,3,199.90),(21,10,1,149.90),(22,10,2,179.90);
/*!40000 ALTER TABLE `jogo_plataforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `forma_pagamento` varchar(50) NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  `data_pagamento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pagamento`),
  UNIQUE KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `pagamento_chk_1` CHECK ((`valor_pago` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,'Cartão de crédito',149.90,'2026-10-01 14:35:00'),(2,2,'PIX',199.90,'2026-10-02 16:25:00'),(3,3,'Cartão de débito',89.90,'2026-10-03 10:20:00'),(4,4,'PIX',249.90,'2026-10-04 18:50:00'),(5,5,'Cartão de crédito',179.90,'2026-10-05 12:05:00'),(6,6,'PIX',119.90,'2026-10-06 20:15:00'),(7,7,'Cartão de crédito',299.80,'2026-10-07 09:35:00'),(8,8,'PIX',159.90,'2026-10-08 15:55:00'),(9,9,'Cartão de débito',219.80,'2026-10-09 11:30:00'),(10,10,'PIX',139.90,'2026-10-10 19:45:00');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `data_pedido` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` varchar(30) NOT NULL DEFAULT 'Pendente',
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `pedido_chk_1` CHECK ((`valor_total` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'2026-10-01 14:30:00',149.90,'Pago'),(2,2,'2026-10-02 16:20:00',199.90,'Pago'),(3,3,'2026-10-03 10:15:00',89.90,'Pago'),(4,4,'2026-10-04 18:45:00',249.90,'Pago'),(5,5,'2026-10-05 12:00:00',179.90,'Pago'),(6,6,'2026-10-06 20:10:00',119.90,'Pago'),(7,7,'2026-10-07 09:30:00',299.80,'Pago'),(8,8,'2026-10-08 15:50:00',159.90,'Pago'),(9,9,'2026-10-09 11:25:00',219.80,'Pago'),(10,10,'2026-10-10 19:40:00',139.90,'Pago');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataforma`
--

DROP TABLE IF EXISTS `plataforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataforma` (
  `id_plataforma` int NOT NULL AUTO_INCREMENT,
  `nome_plataforma` varchar(50) NOT NULL,
  PRIMARY KEY (`id_plataforma`),
  UNIQUE KEY `nome_plataforma` (`nome_plataforma`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataforma`
--

LOCK TABLES `plataforma` WRITE;
/*!40000 ALTER TABLE `plataforma` DISABLE KEYS */;
INSERT INTO `plataforma` VALUES (1,'PC/Steam'),(3,'PlayStation'),(2,'Xbox');
/*!40000 ALTER TABLE `plataforma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-15 23:16:29
