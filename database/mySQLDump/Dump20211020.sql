CREATE DATABASE  IF NOT EXISTS `api_estoque_horizon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `api_estoque_horizon`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: tritech.ddns.net    Database: api_estoque_horizon
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `estoques`
--

DROP TABLE IF EXISTS `estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoques` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `logradouro` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `uf` char(2) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_user_id` int unsigned NOT NULL,
  `updated_by_user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `created_by_user_id` (`created_by_user_id`),
  KEY `updated_by_user_id` (`updated_by_user_id`),
  CONSTRAINT `estoques_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `estoques_ibfk_2` FOREIGN KEY (`updated_by_user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoques`
--

LOCK TABLES `estoques` WRITE;
/*!40000 ALTER TABLE `estoques` DISABLE KEYS */;
INSERT INTO `estoques` VALUES (1,'Estoque 001','Rua 123','100','Logo Ali','Cajazeiras','Salvador','BA','40000000',1,0,1,1,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(2,'Estoque 002','Rua 456','200','Logo Ali','Parque Bela Vista','Salvador','BA','40000000',1,0,2,2,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(3,'Estoque 003','Rua 789','300','Logo Ali','Pituba','Salvador','BA','40000000',1,0,3,3,'2021-10-20 22:16:07','2021-10-20 22:16:07');
/*!40000 ALTER TABLE `estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens`
--

DROP TABLE IF EXISTS `itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `fabricante` varchar(255) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `codigo_barra` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  `estoque_id` int unsigned NOT NULL,
  `nota_fiscal_id` int unsigned NOT NULL,
  `created_by_user_id` int unsigned NOT NULL,
  `updated_by_user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `estoque_id` (`estoque_id`),
  KEY `nota_fiscal_id` (`nota_fiscal_id`),
  KEY `created_by_user_id` (`created_by_user_id`),
  KEY `updated_by_user_id` (`updated_by_user_id`),
  CONSTRAINT `itens_ibfk_1` FOREIGN KEY (`estoque_id`) REFERENCES `estoques` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `itens_ibfk_2` FOREIGN KEY (`nota_fiscal_id`) REFERENCES `notas_fiscais` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `itens_ibfk_3` FOREIGN KEY (`created_by_user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `itens_ibfk_4` FOREIGN KEY (`updated_by_user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens`
--

LOCK TABLES `itens` WRITE;
/*!40000 ALTER TABLE `itens` DISABLE KEYS */;
INSERT INTO `itens` VALUES (1,'Monitor','Monitor para PC','Dell','P2214H','000000000000',1,0,1,1,1,1,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(2,'Celular','Smartphone Apple','Apple','iPhone 8','000000000000',1,0,2,2,2,2,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(3,'Celular','Smartphone Apple','Apple','iPhone 13 Pro','000000000000',1,0,3,3,3,3,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(4,'Notebook','Notebook Gamer','Samsung','Odyssey i5','000000000000',1,0,1,2,1,1,'2021-10-20 22:16:07','2021-10-20 22:16:07');
/*!40000 ALTER TABLE `itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimento_itens`
--

DROP TABLE IF EXISTS `movimento_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimento_itens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo_movimento` varchar(255) NOT NULL,
  `qtd` varchar(255) NOT NULL,
  `item_id` int unsigned NOT NULL,
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_user_id` int unsigned NOT NULL,
  `updated_by_user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `created_by_user_id` (`created_by_user_id`),
  KEY `updated_by_user_id` (`updated_by_user_id`),
  CONSTRAINT `movimento_itens_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `itens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimento_itens_ibfk_2` FOREIGN KEY (`created_by_user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimento_itens_ibfk_3` FOREIGN KEY (`updated_by_user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimento_itens`
--

LOCK TABLES `movimento_itens` WRITE;
/*!40000 ALTER TABLE `movimento_itens` DISABLE KEYS */;
INSERT INTO `movimento_itens` VALUES (1,'entrada','10',1,0,1,1,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(2,'entrada','20',2,0,1,1,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(3,'entrada','20',3,0,3,3,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(4,'entrada','20',4,0,1,1,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(5,'saida','10',2,0,2,2,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(6,'saida','5',1,0,2,2,'2021-10-20 22:16:07','2021-10-20 22:16:07');
/*!40000 ALTER TABLE `movimento_itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_fiscais`
--

DROP TABLE IF EXISTS `notas_fiscais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_fiscais` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) NOT NULL,
  `cnpj_emissor` varchar(255) NOT NULL,
  `valor_total` decimal(10,0) NOT NULL,
  `tipo_nf` varchar(255) NOT NULL,
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_user_id` int unsigned NOT NULL,
  `updated_by_user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `created_by_user_id` (`created_by_user_id`),
  KEY `updated_by_user_id` (`updated_by_user_id`),
  CONSTRAINT `notas_fiscais_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notas_fiscais_ibfk_2` FOREIGN KEY (`updated_by_user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_fiscais`
--

LOCK TABLES `notas_fiscais` WRITE;
/*!40000 ALTER TABLE `notas_fiscais` DISABLE KEYS */;
INSERT INTO `notas_fiscais` VALUES (1,'123456','00000000000000',10000,'entrada',0,1,1,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(2,'654321','10000000000000',200000,'entrada',0,2,2,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(3,'987654','20000000000000',10000,'saida',0,3,3,'2021-10-20 22:16:07','2021-10-20 22:16:07');
/*!40000 ALTER TABLE `notas_fiscais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `excluido` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Fabricio Souza','12345678901','fabricio@email.com','$2a$10$WowwkeHLh4XLL7n07iitl.auqDtf886dmxJjfYf.PSSQEIc1pS8cW',1,0,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(2,'John Doe','12345678901','john@email.com','$2a$10$B0/zn.hP3OJJQS7gnb7d8.OHtIaq21.rYFz9KropFvNXbN1oF5z2a',1,0,'2021-10-20 22:16:07','2021-10-20 22:16:07'),(3,'Jane Doe','12345678901','jane@email.com','$2a$10$gcHqzNhaYlIPPFFjt/s6UOSSj4MSE7U9cxAeKm/lxCHfNXR4fQdvG',1,0,'2021-10-20 22:16:07','2021-10-20 22:16:07');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-20 19:20:53
