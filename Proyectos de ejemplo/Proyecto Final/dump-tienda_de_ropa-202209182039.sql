-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda_de_ropa
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` varchar(80) NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` varchar(100) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES ('4PCTMr55JD',1,'Sun Sep 18 2022',939970);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL,
  `nombre` varchar(80) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Adidas'),(2,'Tommy Hilfiger');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ropa`
--

DROP TABLE IF EXISTS `ropa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ropa` (
  `id_ropa` int NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `imagen` varchar(1000) NOT NULL,
  `id_marca` int NOT NULL,
  `id_talla` int NOT NULL,
  `id_tipo` int NOT NULL,
  `precio` double NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `numero_ventas` int DEFAULT NULL,
  PRIMARY KEY (`id_ropa`),
  KEY `id_marca` (`id_marca`),
  KEY `id_talla` (`id_talla`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `ropa_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  CONSTRAINT `ropa_ibfk_2` FOREIGN KEY (`id_talla`) REFERENCES `talla` (`id_talla`),
  CONSTRAINT `ropa_ibfk_3` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ropa`
--

LOCK TABLES `ropa` WRITE;
/*!40000 ALTER TABLE `ropa` DISABLE KEYS */;
INSERT INTO `ropa` VALUES (1,'CAMISETA UNIFORME DE LOCAL ALEMANIA','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/081ee791999f4621953baeec00913c63_9366/Camiseta_Uniforme_de_Local_Alemania_22_Blanco_HJ9606_21_model.jpg',1,3,2,279990,'Un look que acelera el pulso. El escudo de la selección tejido sobre el corazón con detalles dorados adorna el frente de esta camiseta adidas de la Selección de Alemania. Un cambio de dirección para las camisetas de local modernas, esa llamativa raya vertical está llena de ADN de la selección nacional. Los paneles de malla y el tejido con tecnología de absorción AEROREADY se combinan para mantener cómodos a los hinchas.',1),(2,'BUZO COLOMBIA CUELLO REDONDO','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/e1babb47296840e09187ae8800e0573d_9366/Buzo_Colombia_Cuello_Redondo_Rojo_HD8917_21_model.jpg',1,4,2,299990,'Apoyar a Colombia es parte de tu identidad. Ponte este buzo adidas para destacar tu amor por la Selección Colombia a donde vayas. Los colores inspirados en el uniforme de visitante y el pequeño escudo del club son suficientes para hacer alusión a tu lealtad futbolística. El tejido de felpa francesa de una mezcla de algodón y ajuste holgado se combinan para ofrecer una sensación cómoda y relajada.',10),(3,'SUDADERA TEAMSPORT','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7f34deb33fd04843aa9dae9e00be8b7f_9366/Sudadera_Teamsport_Rosa_HK0467_21_model.jpg',1,2,1,359990,'Una sudadera tan digna de la fama como cualquier clásico de adidas Pronto aparecerá en tu feed, la chaqueta de ajuste ceñido con las 3 Rayas conecta, y contrasta, a la perfección con los pantalones de pierna ancha con pretina alta. Hecha de un tejido de punto doble de poliéster, puedes lavarla después de cada uso sin temer un desgaste prematuro.',2),(4,'CHAQUETA SST PRIMEBLUE','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5d36d180854d4e919fb6ae8000cc62e3_9366/Chaqueta_SST_Primeblue_Verde_HN5890_21_model.jpg',1,3,1,379990,'Una chaqueta sin precedentes. Puede que se vea solo como una prenda icónica clásica de adidas, pero esta chaqueta SST Primeblue simboliza el cambio. Su diseño está confeccionado con Parley Ocean Plastic, hecho con residuos plásticos recuperados de las costas. Esta chaqueta es elegante y buena para el planeta. Úsala y únete al compromiso de adidas para ayudar a erradicar los residuos plásticos.',4),(5,'BUZO CON CAPUCHA BADGE OF SPORT','https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/247c128b603447f8b606ab5f0113d987_9366/Buzo_con_Capucha_Badge_of_Sport_Felpa_Francesa_Negro_GC7343_01_laydown.jpg',1,5,3,219990,'En este preciso momento, personas de todo el mundo están pasando su día y haciendo lo que tienen que hacer luciendo el logo adidas Badge of Sport. Es un símbolo unificador del compromiso, la pasión y el deporte, y este buzo con capucha adidas lo luce con orgullo en el pecho. Ponte el tuyo y únete a la comunidad global.',3),(6,'CAMISA DE RAYAS DE MANGA CORTA','https://tommycolombia.vteximg.com.br/arquivos/ids/251912-1040-1387/DM0DM13037_TH9_1.jpg?v=637934385198500000',2,4,2,223920,'Descuento del 20%',7);
/*!40000 ALTER TABLE `ropa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ropa_compra`
--

DROP TABLE IF EXISTS `ropa_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ropa_compra` (
  `id_ropa_compra` int NOT NULL AUTO_INCREMENT,
  `id_compra` varchar(80) NOT NULL,
  `id_ropa` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_ropa_compra`),
  KEY `id_ropa` (`id_ropa`),
  KEY `id_compra` (`id_compra`),
  CONSTRAINT `ropa_compra_FK` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  CONSTRAINT `ropa_compra_ibfk_1` FOREIGN KEY (`id_ropa`) REFERENCES `ropa` (`id_ropa`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ropa_compra`
--

LOCK TABLES `ropa_compra` WRITE;
/*!40000 ALTER TABLE `ropa_compra` DISABLE KEYS */;
INSERT INTO `ropa_compra` VALUES (20,'4PCTMr55JD',1,1),(21,'4PCTMr55JD',2,1),(22,'4PCTMr55JD',3,1);
/*!40000 ALTER TABLE `ropa_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talla`
--

DROP TABLE IF EXISTS `talla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talla` (
  `id_talla` int NOT NULL,
  `nombre` varchar(80) NOT NULL,
  PRIMARY KEY (`id_talla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talla`
--

LOCK TABLES `talla` WRITE;
/*!40000 ALTER TABLE `talla` DISABLE KEYS */;
INSERT INTO `talla` VALUES (1,'14'),(2,'S'),(3,'M'),(4,'L'),(5,'XL');
/*!40000 ALTER TABLE `talla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `id_tipo` int NOT NULL,
  `nombre` varchar(80) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'Mujer'),(2,'Hombre'),(3,'Unisex'),(4,'Niño');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `nombre_usuario` varchar(80) NOT NULL,
  `contrasenna` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `direccion` varchar(500) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Daniel Perez','DanielMPB@gmail.com','12345','Carrera 28 # 122');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tienda_de_ropa'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-18 20:39:50
