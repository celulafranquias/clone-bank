-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cep` int NOT NULL,
  `logradouro` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complemento` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localidade` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adresses_user_id_foreign` (`user_id`),
  CONSTRAINT `adresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresses`
--

LOCK TABLES `adresses` WRITE;
/*!40000 ALTER TABLE `adresses` DISABLE KEYS */;
INSERT INTO `adresses` VALUES (1,87703303,'Rua André Juliato','CASA','10','Jardim Maravilha','Paranavaí','PR',2,'2021-11-08 12:32:31','2021-11-08 12:32:31'),(2,65500000,'RUA PROJETADA 02','CASA','54','BOA VISTA','Chapadinha','MA',3,'2021-11-25 12:59:40','2021-11-25 12:59:40'),(3,65500000,'RUA BENJAMIM FERREIRA','CASA','1863','AREAL','Chapadinha','MA',4,'2021-11-25 13:09:46','2021-11-25 13:09:46');
/*!40000 ALTER TABLE `adresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,'001','Banco do Brasil S.A.','https://www.bb.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(2,'003','Banco da Amazônia S.A.','https://www.bancoamazonia.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(3,'004','Banco do Nordeste do Brasil S.A.','https://www.banconordeste.gov.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(4,'012','Banco Inbursa S.A.','https://www.bancoinbursa.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(5,'017','BNY Mellon Banco S.A.','https://www.bnymellon.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(6,'018','Banco Tricury S.A.','https://www.bancotricury.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(7,'021','BANESTES S.A. Banco do Estado do Espírito Santo','https://www.banestes.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(8,'024','Banco Bandepe S.A.','https://www.santander.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(9,'025','Banco Alfa S.A.','https://www.bancoalfa.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(10,'029','Banco Itaú Consignado S.A.','https://www.itau.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(11,'033','BANCO SANTANDER (BRASIL) S.A.','https://www.santander.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(12,'036','Banco Bradesco BBI S.A.','https://www.bradescobbi.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(13,'037','Banco do Estado do Pará S.A.','https://www.banpara.b.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(14,'040','Banco Cargill S.A.','https://www.bancocargill.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(15,'041','Banco do Estado do Rio Grande do Sul S.A.','https://www.banrisul.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(16,'047','Banco do Estado de Sergipe S.A.','https://www.banese.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(17,'062','Hipercard Banco Múltiplo S.A.','https://www.hipercard.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(18,'063','Banco Bradescard S.A.','https://www.ibi.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(19,'064','Goldman Sachs do Brasil Banco Múltiplo S.A.','https://www.goldmansachs.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(20,'065','Banco AndBank (Brasil) S.A.','https://www.andbank-lla.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(21,'066','BANCO MORGAN STANLEY S.A.','https://www.morganstanley.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(22,'069','Banco Crefisa S.A.','https://www.crefisa.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(23,'070','BRB - Banco de Brasília S.A.','https://www.brb.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(24,'074','Banco J. Safra S.A.','https://www.safra.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(25,'075','Banco ABN Amro S.A.','https://www.abnamro.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(26,'076','Banco KDB do Brasil S.A.','https://www.bancokdb.com.br/home.html','2021-11-29 21:14:08','2021-11-29 21:14:08'),(27,'077','Banco Inter S.A.','https://www.bancointer.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(28,'079','Banco Original do Agronegócio S.A.','https://www.bancooriginal.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(29,'081','BancoSeguro S.A.','https://www.rendimento.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(30,'082','BANCO TOPÁZIO S.A.','https://www.bancotopazio.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(31,'083','Banco da China Brasil S.A.','https://www.boc-brazil.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(32,'088','BANCO RANDON S.A.','https://www.bancorandon.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(33,'094','Banco Finaxis S.A.','https://www.finaxis.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(34,'095','Travelex Banco de Câmbio S.A.','https://www.bancoconfidence.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(35,'096','Banco B3 S.A.','https://www.bmfbovespa.com.br/bancobmfbovespa/','2021-11-29 21:14:08','2021-11-29 21:14:08'),(36,'104','Caixa Econômica Federal','https://www.caixa.gov.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(37,'107','Banco Bocom BBM S.A.','https://www.bancobbm.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(38,'119','Banco Western Union do Brasil S.A.','https://www.bancowesternunion.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(39,'120','BANCO RODOBENS S.A.','https://www.rodobens.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(40,'121','Banco Agibank S.A.','https://www.agibank.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(41,'122','Banco Bradesco BERJ S.A.','https://sim','2021-11-29 21:14:08','2021-11-29 21:14:08'),(42,'124','Banco Woori Bank do Brasil S.A.','https://www.wooribank.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(43,'125','BANCO GENIAL S.A.','https://www.brasilplural.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(44,'128','MS Bank S.A. Banco de Câmbio','https://www.msbank.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(45,'129','UBS Brasil Banco de Investimento S.A.','https://www.ubs.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(46,'132','ICBC do Brasil Banco Múltiplo S.A.','https://www.icbc.com.cn','2021-11-29 21:14:08','2021-11-29 21:14:08'),(47,'139','Intesa Sanpaolo Brasil S.A. - Banco Múltiplo','https://www.intesasanpaolobrasil.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(48,'144','BEXS BANCO DE CÂMBIO S/A','https://www.bexs.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(49,'184','Banco Itaú BBA S.A.','https://www.itaubba.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(50,'208','Banco BTG Pactual S.A.','https://www.btgpactual.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(51,'212','Banco Original S.A.','https://www.original.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(52,'213','Banco Arbi S.A.','https://www.bancoarbi.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(53,'217','Banco John Deere S.A.','https://www.johndeere.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(54,'218','Banco BS2 S.A.','https://www.bs2.com/banco/','2021-11-29 21:14:08','2021-11-29 21:14:08'),(55,'222','Banco Credit Agricole Brasil S.A.','https://www.calyon.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(56,'224','Banco Fibra S.A.','https://www.bancofibra.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(57,'233','Banco Cifra S.A.','https://www.bancocifra.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(58,'237','Banco Bradesco S.A.','https://www.bradesco.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(59,'241','BANCO CLASSICO S.A.','https://bancoclassico.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(60,'243','BANCO MASTER S/A','https://www.bancomaxima.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(61,'246','Banco ABC Brasil S.A.','https://www.abcbrasil.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(62,'249','Banco Investcred Unibanco S.A.','https://www.itau.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(63,'250','BCV - BANCO DE CRÉDITO E VAREJO S.A.','https://www.bancobcv.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(64,'254','PARANÁ BANCO S.A.','https://www.paranabanco.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(65,'265','Banco Fator S.A.','https://www.fator.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(66,'266','BANCO CEDULA S.A.','https://www.bancocedula.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(67,'300','Banco de la Nacion Argentina','https://www.bna.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(68,'318','Banco BMG S.A.','https://www.bancobmg.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(69,'320','China Construction Bank (Brasil) Banco Múltiplo S/A','https://www.br.ccb.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(70,'335','Banco Digio S.A.','https://www.digio.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(71,'336','Banco C6 S.A.','https://www.c6bank.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(72,'341','ITAÚ UNIBANCO S.A.','https://www.itau.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(73,'366','BANCO SOCIETE GENERALE BRASIL S.A.','https://www.sgbrasil.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(74,'368','Banco CSF S.A.','https://www.carrefoursolucoes.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(75,'370','Banco Mizuho do Brasil S.A.','https://www.mizuhobank.com/brazil/pt/','2021-11-29 21:14:08','2021-11-29 21:14:08'),(76,'376','BANCO J.P. MORGAN S.A.','https://www.jpmorgan.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(77,'380','PICPAY SERVICOS S.A.','https://www.picpay.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(78,'381','BANCO MERCEDES-BENZ DO BRASIL S.A.','https://www.bancomercedesbenz.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(79,'387','Banco Toyota do Brasil S.A.','https://www.bancotoyota.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(80,'389','Banco Mercantil do Brasil S.A.','https://www.mercantil.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(81,'393','Banco Volkswagen S.A.','https://www.bancovw.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(82,'394','Banco Bradesco Financiamentos S.A.','https://www.bradescofinanciamentos.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(83,'399','Kirton Bank S.A. - Banco Múltiplo','https://sim','2021-11-29 21:14:08','2021-11-29 21:14:08'),(84,'412','BANCO CAPITAL S.A.','https://www.bancocapital.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(85,'422','Banco Safra S.A.','https://www.safra.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(86,'456','Banco MUFG Brasil S.A.','https://www.br.bk.mufg.jp','2021-11-29 21:14:08','2021-11-29 21:14:08'),(87,'464','Banco Sumitomo Mitsui Brasileiro S.A.','https://www.smbcgroup.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(88,'473','Banco Caixa Geral - Brasil S.A.','https://www.bcgbrasil.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(89,'477','Citibank N.A.','https://www.citibank.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(90,'479','Banco ItauBank S.A.','https://www.itaubank.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(91,'487','Deutsche Bank S.A. - Banco Alemão','https://www.deutsche-bank.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(92,'488','JPMorgan Chase Bank, National Association','https://www.jpmorganchase.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(93,'492','ING Bank N.V.','https://www.ing.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(94,'505','Banco Credit Suisse (Brasil) S.A.','https://www.csfb.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(95,'600','Banco Luso Brasileiro S.A.','https://www.lusobrasileiro.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(96,'604','Banco Industrial do Brasil S.A.','https://www.bancoindustrial.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(97,'610','Banco VR S.A.','https://www.vrinvestimentos.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(98,'611','Banco Paulista S.A.','https://www.bancopaulista.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(99,'612','Banco Guanabara S.A.','https://www.bancoguanabara.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(100,'613','Omni Banco S.A.','https://www.bancopecunia.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(101,'623','Banco Pan S.A.','https://www.bancopan.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(102,'630','BANCO LETSBANK S.A.','https://www.intercap.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(103,'633','Banco Rendimento S.A.','https://www.rendimento.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(104,'634','BANCO TRIANGULO S.A.','https://www.tribanco.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(105,'637','BANCO SOFISA S.A.','https://www.sofisa.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(106,'643','Banco Pine S.A.','https://www.pine.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(107,'652','Itaú Unibanco Holding S.A.','https://www.itau.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(108,'653','BANCO VOITER S.A.','https://www.bip.b.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(109,'655','Banco Votorantim S.A.','https://www.bancovotorantim.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(110,'707','Banco Daycoval S.A.','https://www.daycoval.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(111,'712','Banco Ourinvest S.A.','https://www.ourinvest.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(112,'739','Banco Cetelem S.A.','https://www.cetelem.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(113,'741','BANCO RIBEIRAO PRETO S.A.','https://www.brp.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(114,'743','Banco Semear S.A.','https://www.bancosemear.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(115,'745','Banco Citibank S.A.','https://www.citibank.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(116,'746','Banco Modal S.A.','https://www.bancomodal.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(117,'747','Banco Rabobank International Brasil S.A.','https://www.rabobank.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(118,'748','BANCO COOPERATIVO SICREDI S.A.','https://www.sicredi.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(119,'751','Scotiabank Brasil S.A. Banco Múltiplo','https://www.br.scotiabank.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(120,'752','Banco BNP Paribas Brasil S.A.','https://www.bnpparibas.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(121,'753','Novo Banco Continental S.A. - Banco Múltiplo','https://www.nbcbank.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(122,'754','Banco Sistema S.A.','https://www.btgpactual.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(123,'755','Bank of America Merrill Lynch Banco Múltiplo S.A.','https://www.ml.com','2021-11-29 21:14:08','2021-11-29 21:14:08'),(124,'756','BANCO COOPERATIVO SICOOB S.A. - BANCO SICOOB','https://www.bancoob.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08'),(125,'757','BANCO KEB HANA DO BRASIL S.A.','https://www.bancokeb.com.br','2021-11-29 21:14:08','2021-11-29 21:14:08');
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_info`
--

DROP TABLE IF EXISTS `company_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_info`
--

LOCK TABLES `company_info` WRITE;
/*!40000 ALTER TABLE `company_info` DISABLE KEYS */;
INSERT INTO `company_info` VALUES (1,'aBank','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXQAAACDCAYAAACdg+BGAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAABZ0RVh0Q3JlYXRpb24gVGltZQAwOC8yNy8yMY8UkMoAAAAcdEVYdFNvZnR3YXJlAEFkb2JlIEZpcmV3b3JrcyBDUzbovLKMAAAgAElEQVR4nO2dd5gmVZX/Pz0RZgZGhiEHyVrY8CMKSMEwCBKasAwrwkoUCavYKgW68tsFFVEUS7CVBXEXlyB5l6AtMDAySCGwBAkthYQlDAsMmZmBSR32j++tfuutfmNPv91v15zP8/TT3W+oupW+99xzzj23pa+vD8MwDGP0M2akG2AYhmEMDSbohmEYOcEE3TAMIyeYoBuGYeQEE3TDMIycYIJuGIaRE0zQDcMwcoIJumEYRk4wQTcMw8gJJuiGYRg5wQTdMAwjJ5igG4Zh5AQTdMMwjJxggm4YhpETTNANwzByggm6YRhGTjBBNwzDyAkm6IZhGDnBBN0wDCMnmKAbhmHkBBN0wzCMnGCCbhiGkRNM0A3DMHKCCbphGEZOMEE3DMPICSbohmEYOcEE3TAMIyeYoBuGYeSEcY3cuB/GAGsAhwBfBbYF+oAeYBLQ0sj9DyN9QDfwKnAncCnwJNAXBd5ItsswjJWIlr6+viHfqBPyicCewLeBPYAJQ76j5qQXmAfcAPwr8HIUeEN/kg3DMDI0yuWyCnASMBv4LCuPmIPO6ceBM4BOYDfXwRmGYTSUIRd0J157Ar8Y6m2PMlqATwIhsMUIt8UwjJWARljo04FvNWC7o5ExwHbAcX4YWwDaMIyG0giRaUMWuiEmAPthVrphGA2mEYL+NWB8A7Y7WhkDbA5sPNINMQwj3zRC0HdowDZHOy0ofdMwDKNhNELQ85JbPpSMBVYf6UYYhpFvLFA3PPS5H8MwjIZhgj589I50AwzDyDcm6MNDC3auDcNoMCYyhmEYOcEE3TAMIyc0tNpik9ADLKDgw04yTqwzMwwjV+Rd0LuBOcCNwHKUabIacDTwaSTuhmEYuSDvgv4X4Iwo8LrSL/ph/DJwGbD+iLTKMIxc0tbRtRPwFWAm0tf/Bi7rbG+9czj2n2dB7wOuz4q540/A06zkgu6H8VhUa6Y3CrylI90ewxittHV0rQ+cCxxDcemTDYFZbR1dvwPO6mxvLaVHQ0ae/cj/C/y51BtR4C1EKwt9NKwtaiL8MN4QOBYIgMAP402sbrth1E9bR9euwDPAl4DrgL2B9dzPHsDFwMHAU20dXUc2si15FvQ7gb9WeH828MowtaWp8MN4AipxfAmyKs4DvgtMHcFmGcaoo62jawMUpxsDfA4VJ3wMJWEs62xvjTrbW08DtgZeAq5t6+jasVHtyaugLwbujgJvQYXPPI0s+J7haVJTsRPwebRMYMJxwFYj0xzDGLX8BK2PPBN4HnjP/cwH3mnr6HqtraPr3M721hjYC3kFftXW0dWQVdzy6kN/GHiw0geiwOv2w/h3qH77OsPSquZhJvCxEq/v74fxE1HgLRvMRp3lvyZagnAZ8EYUeCPaYTo30jR0vEuBtwZ7fCOJH8YtaPGYjwGL0HF0j2yrVm7aOrr2AP4BuLqzvfXhto6u3SkUJ7wCVZ7dBvjnto6uKzvbW59r6+j6PnA+8A3UGQwpebTQe4G7gJdr+OyDyFJfafDDeDqwOxLdLF8C1h3kdse47V4KXAl0AJ8aZDOHks2Bs4GrUGbT3qN09agd0HKG1wK/BHYd2eYYwGnu92Xud1KAr7uzvfV44KLUZ5N77lrkFTirEQ0ajTd2NV4F/hgFXn91Qz+MW/wwnuaHcdrFQBR4bwB3IGtyZWEG5WvWbwJsM0jBGwP4wCHu9yxg28E0cIjZBTgR+AxwILAPo3PR8gNQBsWO6Nx+dmSbYwBHAEuAbObK2LaOrueBC5GB+TPgWYDO9tZXgDdoULwqj4J+DwNP8DTgn4H9S3z+j8CLjW5UM+BcInsjtwjAQuBt5IpIOBGYMshdpDvG92mO+EQvxdlMo7XzXu5+Eqwc88hT7hr0oZHh6u7v/+5sbx2W65U3Qf8I+H2JYGgr0I4Wa56cee9R4D5WjvK2W6PATBI7uRedlydTn2kDNhrEtvso7higOcRzAeq4Ej6iOTqaenkXBftB7V9pU26biOuR67I183oPsBlwE5qN/pu2jq7pAG0dXRsjt+YHjWhQ3gT9YTQzK8sMdGJ3QCe6H+eamYMs1bwzE9g09f+jUeBdCzxCQeQmAIc6a74eWigWymYtGTye5mxXNcZQCLi1YGUrmoFL3O+T3e/kvhoPvAN81f2/KvAD9/dR6Nqd14gG5SnLpQf5w+elX/TDeBry6YJmhu7qh/HTmeyLe4DHUR5pLnHB0APQzQWyEJ5yf98FHEYhIHo0cDny9dVDdlhZcTlCP4zHI/fPcmBBFHjLM+9PQzf/sijwBmvRZDuWBcmsWDdTdip6DpauwD5K4jJTpro2LEofn4tTTAXWAhZGgfd6nZtPx4hAMxITV9li4PWhzubxw3h1dK6WRYG3KPV6CzAZ1UlaArwXBV61bX3Mff6dKPA+Sr2+CoXieUuiwHt/kG2diM7tMuDtKPBqGoH7YTwJpSF2u/YtjgKvpLHX2d76p7aOrmuAo9s6ui5CeebvAR8C4zvbW99s6+i6GGXCfKato2tb4F+QV+DngzmuauRJ0OcBc9PBUMfnUCAJ1HMeAdwKvJl8IAq8+X4Yz0XuiNEYMKuFGcD/S/1/L/CA+7sTeI6CoG8J7OKH8e/rTDus2fJ1D87foyDqQuB24AYnsjNQTnwrGtIu8sP4aRRYiqPAm19Hm1oo7lhW9cN4K5SqugvydU4EPkjt4+ko8N6qYx/ZY9sEjQS3QYHmscBrfhj/FfhbFHjPRoHX64fxMehhf9EP419FgTe3wmbTgtSDM1z8MN4WBUh9dP1akHX4sB/Gf0ajsPdW4FjWd8fSCmyBxG6BH8ZPoPP0RBR4fX4YH49GgPOBPwC/L7M93LZORaPFx/wwvh51Qp9ERfM2RM/qe34YP0XhmtQ0inadxUnoeV4E/MoP43ur3ct+GHvIgl4XdZjjUQZLpf1+C/g7VE6krbO9dVr6TTep6LS2jq4dkO5MBk7pbG9tiDsyT4J+N1A0d91ZgPuhoGjCzkjY7sp8/3bgizRHql1V/DAehyyQ+dWsD3ceDnSfBwnCXOB1gCjwlvlhfDfq+Cah++I4dI7q8dXWs0D4OuihS0ZPm7iiaXsC/x9Zm2m3QjcaVdzrh/FvgDsGmYf9RdTJb4lGB+m6G8tQMHeOH8aXRIF3Xz0bdvGZzyKx2hlZ4Mn2e5Dl9qgfxhcBb6FslV3cz0d+GN+fHaWkWIXC+egBtvTD+ASUOrcdAzvTg5AQ3eqH8a+jwHuozmMZ547lyyhDaBrFqa6LgBf8MA6B/3GfSwyGDSkj6Oh8HEDBHbE/ekbfRy7RNTOfX4au+2w/jC+OAu8BqrM18HVgA/f/W8gdu7DcF1wnfzEyJpJz+Rt3bGXpbG/937aOrs+imef3OIv9P1An1Ic69FmuPQBHdba3PlrDMQyK0ehLLMUiFAzNDpl3RLUU0kwFDvfDuCiTIwq8x1FwtKmzB/wwXs0P45koJepnwG41fG17lCOeCG5MJrUT5Y6n3VW7AZs1sL5LUhgsYVuUK34eukZZH/E49LDPAq4GvuWHcb2pX33ICtwDWWHjM+9PANZGVtqVfhj/Xa0b9sN4XeAc17YD0CSg9PaTOvwzgV+jPP2tU+9/DFlv5RhH4fqNQzV4foVEsNxzPB1lLV3uh/GBdRzLFGR5XolGUeszcN7CFCTgF7ufdGxmSoX7ZmxmW2NQ57cvA8UcdE3WQh3xlX4Yt9VwCBMpHtFMpkLMwbkjf4iuTXIu/wycHQXem+W+l9DZ3voguq8uRzOwZyP3y8toJPx14HfANp3trdfV0P5B0yyCPh+4BSXdDyY4+RDyS2XZH/h4idf3QcPHLHNQUa9mZn00w+w04EjgdOe+KInzbx5EcTB4Di4vNiEKvJfQOUys3nWQe6pRLqg+ClkbfcgC3JJiEXwcPRBPZL47FdWgOWMQwds0C5Gr6RkGxgs2AS70w/gz1Tbih/GawPeAM5HfNWG523YXshIT1kblF9ZKvdZN5RFO+r1xqHNIn6snUP2iO9B5S7M18Es/jPes4VgmAd9Bx7N25u3n3LbTNZBWQ8K+uvu/Fx13uWMplQ2V5l0K1yQbV9gC+KkfxjtXPooBKZ5l9+fun28j11/C34BTosB7tcp++ulsb32ts701me9wJbq3e9DIf//O9tZDGl1pEUbW5dKLerHZ6KBvjwJvuR/Gl6Aha630IOu86OT7YbwRGj6VOsaPA/v4YfzXzBB3NnowNqxj/8PNW6jT2cn9fyjwAz+MLygTWFsPDZ2Th/9tVOdmcYnPXoHcEdPRA9mGZn6+NnTN7yft284+/PehRUnuR8c7HV3Lz6MHBmSMfAM9/FfWsU/Q+bsDzRR+CT3809E5PRx1LCBR/5Ifxk+5Cp0DcMHNL1PIdEjopHA/LUEd6kzk+tqAgaSzWMq1vdT7z6Pj70TugT5kLR+MqmkmhsumwLl+GJ8QBV4lN8JR6Lymn5t7UWfxEHJ/bIBcY/sxMGWvmtutl9Jpo88gN82j6B7tRqOWXdE1SY7jk8AJVUpUZM9VpVH3l5HrL3k+3gTOLFN2uyqd7a2PIHflcYP5/ooykoLeDdwbBd4/Zl6/Ct2MpW76UjwHRCVen0FB9LKMQ1brNaTEKgq8BX4YR+hmXa3Md0eUKPDedZ2ej4aoY4FvIvfIzcALyHUyz/nWD6d4xuZt6OEsxd3ofE53/38STZW/tgE1WUoJ1HKU23tWFHhp98884C9+GN8K/AiNHFrQsP80P4zviwKv1slhrwHfiQLvqhLv/acfxg+hqfXJ/ecDn/DD+JFs5oZzK2xHsZj3oinf50WB927q9Yf8ML4OBdDOA0qlgdTr7nsWODkKvHszrz8OPO6Coj+nEBfaE5jlh/FFpeIPfhhvgUZ+6RHflcj1kC6l8Shwmx/G/4VGi7vX2e7scT4NnBYF3j0lPnuLH8aPu+NIRgyfBj5BIUsrS/beKtnJODfUP1GYtbkE1VnprHYAzcpIulzGApv6Ybxe5vUHUJ2Dd1KvVbrR7yBTJtf5APen8ozHHYDdnEsizXVkgqvNRhR4d6Jyt+mh5KEoGHM58q3+wg/jDmRtpc/DWsBnShw3rgO4iUIgdBISoOHo+JP5AKdnxDzdvhdR5/XH1MvbAofV4ev/A7rGJYkC7xY0Ykysv3XRiK7UszIGpXsm7qxu5EP/TkbMk233RYF3M/J/v1Rrgx3ZZ+BN4JwSYp7e3xzgAhRwTDic0m5I0IgsnRRwG/DNjJint/9n1AE8V7npRWRz6JcBt5UR84Rb0HVL2IzSLtNK+yzCD+NtkHGQnkT378Cva01xbEZGWtB3QMPCftxNfyVyuySWd7lh3IfAPSXcB7uiKe6VWA2JVTY4+hLqVJqmkp0fxuP9MD7ED+NTXUocaFJDOwPLFmyJhsJfQbWZN8u8fzCyuq7yw/hIlwGT5moU00jYDdixVAcwxLwBXFEtXdC5lS6mEGuZiLJEai1XUItf9GFkrYFiCKtQ+h5ci+Kg+3zglzXkf98B/DbzWjmXSkJW0COUBleNW9Bku0SktkEjjqIPuQDzjFQbPgAuLNUxFTVCyQT/Ru0zrbPHuYgqpTeiwFuCjLbkmZxCYT5F3fhhvAEaWaRHrncC56fz60cjIx0UXR043g/jAa6RKPBuQmL/DWQ1Po0ufpo7kJ+1Hz+MV0PBwqzlX4oZDPQBAtxM/RZUQ3DZE+ejFKpLgJ/7YbxeFHg9UeBdhgo2/RQ94POp7cHaGGUNXItydPuDXy6qP4eChbo+cnE0embiy0hIa+EBiuv1rEPpDIlSjKP6sXxEsYAOeE6cIG6AziVIbJ6iSpob9M9OfoCBCQC1BkUBusrEQbL7+gD5vpPruQpqd3bUtTEyBpJz8zA1WN7uPESk5nXUQPpYeqntnl1OQdDHUv+osQX6R+/nUlzX6S/At+oJgjYrIy3oID/tD90EhiKiwHsxCryfo8DFl5B4nYgKbZ2FfHvvZL62GuWHlFk2QjXAszdHRHF9k5FkCsW59IcAFySuqijw7o8C70zgC+7nMNShHY98u6eioM+x7ud4ZL1fiDqtE4BLXepWwr9R3HnuCXy8gSmMoIyTWifALEbZEAmTKfb7VqKWe75SwDb9mYkUhKUX+fprzdt/i8ys5hroS/2uJxvsfQqC3oLOVfY8rIrOY3K8L1HsqimJiyvMpziLpx5qLRExLvW5MdRnYPQCy9z9eyYyZhKWAmEUeM3yvK8QIxEU7UHD3kkU0rb2RWlVQangVsrKqIW3kX/5VhQU3ZvKxab2Qy6IF1L76/HD+A4UEMumbg03r6A62JdRuF5fBNb3w/g/UabGPDTBqD/A6zqpNVAHN9l9twdZOQuRu+onSPxDFES7wFl9D6PsjD3Rg7M1smj+lcrxjBXJ4Z9I6RrtpZhA8ZB7GcVpapXopno7axGYvsy2kmn+4ymkY1ZiMsUT3qqRbXc9302nOPYhd1LWKu6m+Byujq7JhzVuf7AVOntpfBG3D6LA+9AP4yNRTng61TXp4HLBcFjo/UXfURGoryBL+5sU55keBvzGD+NDV2RnUeAtc1brL5G75lgk8OUsiO2AGSV8xDdSX7CnITh/7DUMLOYzE2VjXI4yQzr9MP6DH8a3+2E8G83yvA25q250f3e6n1tQB3E88pl/HqU2bun22YtSGBNhmogmy1R7aFdE0DegkC5YjU3RyC7hXWq37nuo3s6q8QJnmb5DIXg/Fk3gqsXVB8rdTo9K+6q0awmFdL8WYGtX96QizgX5aQqd5XKUtpmNEb3hXk/24VNwJ1VjO4qPpR56KMQrGsVHfhjvhvLrs5PRJqD5DLs0uA3DwnC5XF5B6UEnRoF3WRR490WB91s0Yy7NDOAyP4yv9sP4C34Yr1vCHVIzUeC9HwXe3Cjwvofya0tNG56IJhqtnv0uyoce8SCJKyZ1Prohsy6mbVHNiv2Q6O6PRjx7oeDw9ijFa0P3swkKRh+Oovy3olHNuRRPrrmd4k5wN8pkxzj6WLER30bAUb5quZTF3Q/HU+xWi6ld0GHoZgO/TmFC2xjXpsOrfckP481QJ5oOSFcT9Cx7oayUarQhQU+u27Oonkz2c/PRyCxpw/polmhFfBXs+gLF69NWOpZeahslDRU96FxfQXEQND1C2Qr4vguWjmqGKx3tDeC6KPCyszAvRcWR0j6ttd3/+6IH9S0/jJ9Dbpq3kY8ysS4SEUkmZfSh4dsSZLW9jSqtLY8Cb44fxq8iizY7++9z6KbP1ne5luKJJiOGi/Sf74fxY6hNeyOX1XhcRUIk9pNRgDDdWT+MJm28h1wV66H0NA+dixuAvdPTnKPAe9O5dL6GHtZpKEPmLko/jC0MnEpfz0M7Abl/nkSunXKchqpBJsc3D+gcoVSzxajjOwqd9/HASW7CWskMFBf7+CeUmZOmm8p12sdSPHJYG/i2H8YvRoH3WJl97QycTrF75maKZ3oC/W7G21GsKomnnOyH8TNR4F1dZvtTgDPQaDFNb4Vqi31olNCXOp5GGpYtDEx8uBmlvn6Vwkjvc8CZfhh/2xlQo5LhEPQWlDp3EnJ99BMF3ut+GJ+BptqeSvGwbW2K/deJUCdD5iSYkhb0pCb3UgpBthfchJvZUeD9zQ/jE5G4bZ7a9prAHn4Yz03PHI0C70k/jJ90n22GADJR4M32w/hBZHWvgUR9GrIW5yGL/BwKlROfRcWu5rqZuGOR+CTn92D0UF7vh/EBmUj/NSgInVhf+wCeE6xs07KWex/1LxoyFTjHZfZchgyBXnTuN0Ji848UT/q6DdXdKEe2HWOofi37Mn+X7JiiwMMP43tQnY4j0TnYBAjdJJ0bUCfbjfy026FU0zYGBvWqZXuUasPOKKB9ASoBvdC1YTU0WvsGuh8SngVurCBYD6Br3u7+XwsZERsit93rSIxXccf5NWR8ZcsvVOqYWhgYdK41ZlHp/+x7yfvZbb8AfD8KvMf9MF6IJoElC6afhLToEkYpwyXo04FT3Wy7oipsUeC94YfxD1D1v73dzzrIkpyAbvzEOulBN9QSJPCLUdAmCYr1uM9OQSK3MfJVzgIe8cP4x1Hg3eSH8dlIMNLFkNrQhJPsotHXoVzjkQ6O9hNpRab+FD8/jFuSQlt+GCdWe8JtUeDdlfpuD1rFZwHwvB/Gf0Gpn7cA+/phfEXK2o3de/uje2VzYJ8o8IomcqUYimH02iiDaV8Uw3gRXcdPIUFMH9t9KEOhUkA026Z0katK3+nL/F1O1N/zw/iHrm2Jtbc5Ml5moTTGd5Hf36P8hJhqLpceSgv+zmgWZRc6V+Nxa8NSsLRBrsPvUmFR9Cjwlvph/CN0rpM1SzdANbxnIbF7E7mWtqC4HHP6OKoJ+ngK1yBbrKsc2fNTqfPrpfS5/ADNQk5q3VyLrtkZ6L6YBJztRiWVJjo1LcNpda4D/NhX/eYi3GSi+5BP90Rk7RyBev/j3O/DkOgehGZFHoZ8Y0e59491nz3Gff9QNIw6CU0a2Am42g/jY6LAuwZZVWm2RzNHs81L18hoSlJivjEaRiZD7A9QR1npu4tdJ3ssGqlMTb23BHVoycMzDjgok+KYJu1HTaoL1spiCsGxscj/fwxKMzseCVdazO9H08WrTflfheKMmIlUv+8nUrCgJ7nvl+0EosB7Co0c0kWxpiB31tHomhxMsZh3UxyYnELlQmiTKT6/6U5sPdQBnozSUGdSLObzkevlhmjgegHZY3kDWfbp2biT0Pk/Glnvh1Ms5um2jAFWqxBrGUNxcH1VChZyJSZRfPyVJhaVm6T1A5QkAPQnHFyASl4krItGWJvU0KamY7jTFrdGE1m+XMrKcyf4+SHe5yN+GP8O3ZDnoxKcS9BEnV2RNQO6AfZB/rX+HOco8Bb7YXwn8sMNNjVruJhF8YSJRxlYea8kUeBd44fxJxiYcXAP8rkmYrQPcHDGkoeBltlk6usEH0PZOge4n4Tsg/sO6mQujALvBaqzlGL3RjKSq8SyzH6rpkRGgTfXufPOoDDKTEjvfxFyEz2BjJHt3OurUvl5HEexoP0HGmUdQ/nR42KU1vpTVPyupusRBV6XH8anuGM5LLP9dBu7UQGyB1w7tnKvT0DCXeo891CcpjiB2rJcsqmNlY6ll+JUxD40irk0G2uJVBvpe2j0lATat0euppOjgesTNzUjkYe+K6rP/GPgluEIZkVa4eb3Lrh6BQrG/jsDC94fgCz52ZnX/wtZic0u6N1o2L0Gql53IXVUSowC728lXn4NDdVPd9tdTum83R40w/Qq5Ht9ndJZReWYD/wCxTdORlk1a7h9LUEZN0+h2cH31TFF+zE0UWonFFP5A9Xznh9E98l6yEURUcPC0lHgPeaH8TeRSB+EhvNro5HFIuS/vcu14V00gjoFBfxvpvLCwXORm/AT6Bpf5L4XoRIWWyFLtw91eq+4fd3rylnURRR4z/thfBZyxR3itr8W0oxFKMXxQdQJv+P+P879PZvyLpHlaMT8KeRKe4zyxeLS3IOMsI2R0VeqIF/C/yCf/zYoMeIO4KZy90wUeA/6YfwvyIJPUjW/ALzsh/HZoylI2tLXN7SeBD+Ma93ga+jCX4/E5+VaLYjM/qYjK2JjCpkCi9GFfB14Lj0s98N4UzTs2g5lzGRnzX0X1XRYmvrOWBQsmsXgOsEFqMjR5YP4bs04//nmqON5BXghGoIqie74t0IumY+QkLyZDYz6KiU7DVmbS0t9JvXZLVGnmtRCmQP8fRR47/uqyb0OsvIno+u5AHh3MBaTX1i/cglaw7LaCk8tSLwmojVI615r1O1zKgVXyodIsN9Mucgmo2DvQnRsZSckuXO7BnJjfUjq3LpnIDnGHiS4i6IaFmeo8VjWcMcyCbckoPt5JyqszzoRJTUsBd6PUuuElthecn6nuM9WrBfjvpPcW5PQ+Xq/nF44t2my/cXOjVRt++OQi/YwdE3GoXIUX6t0LM3GSAp6wjwk7g+53++jXjzJYJmEhvvPAz8rISKnoyyOSRSCIcmwbjG6KPehJcv+5L6zO+rB16M4fQoUCDwiytRD9sP4CGQh1btKDgyToI8m/DDeHAn6DPfSXOCL6dmuhjHc+FqsJHEXjgVeGaGU2EHRDGuKbuR+dkAW1HIkzEk6U7I6+hy05Fo/zjI5kMrToDdCw+0j/TC+EfhJFHj3+2H8a5QPnA1Eech6zxa4vx2lfe1Ik6QwjnKSDjuhXGaCYQwbrjZUdvLeqKGZhGk8GjJOQxH6NdEQcyrKR76kxPB9L+STr8YqKG3s68BvXUcQkqmjnuJgP4zTQS0irVgzmyYqqzvKGUdxdsO6NG65O8NYKWgmQa/EMyg404+vOt57UXlh3SwT0RT5HyGL8C5KB8gORMGnLLeg3tssyRXnXZTp0Yd8ol2MYsvIMJqB0SDoi9CaodngXivF6W31cAzKEliX0ilTU4A9S9QVeRwtFmCCvuK8hQqOnYCyI86hCermGMZophl86NV4iNJTcXdEbpTBMBGJ+oeUn6V2CkpX7J9ZFwVet5tm/Wlqr6pnlMAFmp52s/JGTdDJMJqZ0SDor6Li9FOQn30hymH9B2ooc1qBCVT22W4InOWH8U9Rsf8kJXIeypleh9ExwmlqTMwNY+hodkHvRdOnf4vEczyyqjenuOhQozgcTQ6Zh3ztvShwO9jaz4ZhGA2j2QW9BYn3Zqn/exm+dq+CXDvbUygOlFjljV402TAMoy5Gg6BnhXMk3BzmWjEMo+kxoTIMw8gJJuiGYRg5wQTdMAwjJ5igDw/1LgBsGIZRNybow4cJumEYDaURgl7L6iMrG72ohK5hGEbDaISg3139IysdS7HCU4ZhNJhGCPpPqLyU1spGN/AkWjHdMAyjYTRC0B9CC9gaYhnQieq/GIZhNIwhF/Qo8Jahpdriod72KKQHrXR0yWDWSzUMw6iHRmW5PIPKzz7XoO2PBnrQYtRfiWca2XoAAAE2SURBVAJv+Ug3xjCM/DPki0QnuJW9t0QLGByBKhQmtWPyVtgqyTPvRivxPAZcgVwtS0osnWcYhjHkNEzQAfwwBq2cvT5a+m13tI5kL7Jg85AH34c6qIVojdK70XJq3SbkhmEMJw0VdMMwDGP4yIOFbBiGYWCCbhiGkRtM0A3DMHKCCbphGEZOMEE3DMPICSbohmEYOcEE3TAMIyeYoBuGYeQEE3TDMIycYIJuGIaRE0zQDcMwcoIJumEYRk4wQTcMw8gJJuiGYRg5wQTdMAwjJ5igG4Zh5AQTdMMwjJxggm4YhpETTNANwzByggm6YRhGTjBBNwzDyAkm6IZhGDnBBN0wDCMnmKAbhmHkBBN0wzCMnGCCbhiGkRNM0A3DMHKCCbphGEZOMEE3DMPICSbohmEYOeH/AMVS2lcEfxFNAAAAAElFTkSuQmCC','2021-11-18 00:43:08','2021-11-18 00:43:08');
/*!40000 ALTER TABLE `company_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corresponding_data`
--

DROP TABLE IF EXISTS `corresponding_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corresponding_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corresponding_data`
--

LOCK TABLES `corresponding_data` WRITE;
/*!40000 ALTER TABLE `corresponding_data` DISABLE KEYS */;
INSERT INTO `corresponding_data` VALUES (1,'É Seguro Pague','R. Valter Kreiser, 3248 - Zona VII, Umuarama - PR,','87503-660','18.261.725/0001-07','(44) 9 9168-4832','contato@eseguropague.com.br','2021-12-02 08:21:00','2021-12-02 08:21:00');
/*!40000 ALTER TABLE `corresponding_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rg` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nascimento` date NOT NULL,
  `celular` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cnpj` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_user_id_foreign` (`user_id`),
  CONSTRAINT `documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'150900000','32353049915','1980-11-11','11953194942','images\\doc\\user_2.png',2,'2021-11-08 12:32:31','2021-11-08 12:32:31',NULL),(2,'0127204119','03304058370','1987-05-20','98991085475',NULL,3,'2021-11-25 12:59:40','2021-11-25 12:59:40',''),(3,'0476820020','61362260304','1998-05-09','98985354628',NULL,4,'2021-11-25 13:09:46','2021-11-25 14:13:19','');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_simulas`
--

DROP TABLE IF EXISTS `menu_simulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_simulas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_txt` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` double(5,2) NOT NULL,
  `qtd` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_simulas`
--

LOCK TABLES `menu_simulas` WRITE;
/*!40000 ALTER TABLE `menu_simulas` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_simulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Água, Luz, Telefone e Internet','Água, Luz, Telefone e Internet',1,'2021-11-08 12:28:27','2021-11-08 12:28:27'),(2,'TAXA DETRAN','IPVA DETRAN',2,'2021-11-24 23:58:04','2021-11-25 00:00:19'),(3,'DARF','IMPOSTO DE RENDA PF',2,'2021-11-24 23:58:27','2021-11-24 23:59:24'),(4,'DARF','IMPOSTO DE RENDA PJ',2,'2021-11-24 23:58:42','2021-11-24 23:59:22'),(5,'DARF PF','IMPOSTO DE RENDA PF',1,'2021-11-24 23:59:49','2021-11-24 23:59:49'),(6,'DARF PJ','IMPOSTO DE RENDA PJ',1,'2021-11-25 00:00:04','2021-11-25 00:00:04'),(7,'IPVA DETRAN MA','IPVA DETRAN',1,'2021-11-25 00:00:41','2021-11-25 00:00:41'),(8,'EMPRESTIMO CARTAO','EMPRESTIMO CARTAO',1,'2021-11-25 00:02:10','2021-11-25 00:02:10'),(9,'BOLETO PIX','BOLETO PIX',1,'2021-11-25 01:05:42','2021-11-25 01:05:42'),(10,'IPTU-ALVARA-ISS','IPTU-ALVARA-ISS',1,'2021-11-25 12:27:32','2021-11-25 12:27:32');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2021_08_21_121830_create_sessions_table',1),(7,'2021_08_21_123530_create_roles_table',1),(8,'2021_08_21_123623_create_permissions_table',1),(9,'2021_08_21_123640_create_role_permissions_table',1),(10,'2021_08_21_123722_create_user_roles_table',1),(11,'2021_08_23_220157_create_adresses_table',1),(12,'2021_08_23_220254_create_documents_table',1),(13,'2021_08_27_121008_create_menus_table',1),(14,'2021_08_27_121551_create_role_menus_table',1),(15,'2021_09_01_014410_create_tickets_table',1),(16,'2021_09_30_221344_create_menu_simulas_table',1),(17,'2021_11_03_134532_create_notifications_table',1),(18,'2021_11_09_140428_add_cpf_to_documents_table',2),(19,'2021_11_09_140545_make_cpf_nullable',2),(20,'2021_11_09_142000_make_cnpj_nullable',2),(21,'2021_11_18_001227_create_company_info_table',2),(22,'2021_11_20_102457_add_cartoes_column_to_tickets_table',3),(23,'2021_11_20_124525_add_blocked_column_to_users_table',3),(24,'2021_11_29_203204_create_banks_table',4),(25,'2021_12_02_071243_create_corresponding_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_ticket_id_foreign` (`ticket_id`),
  CONSTRAINT `notifications_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'ver_menu_admin','Ver menu admin',NULL,NULL),(2,'cadastrar_admin','Cadastrar admin',NULL,NULL),(3,'editar_admin','Editar admin',NULL,NULL),(4,'excluir_admin','Excluir admin',NULL,NULL),(5,'ver_admin','Ver admin',NULL,NULL),(6,'ver_menu_vendedores','Ver menu vendedores',NULL,NULL),(7,'cadastrar_vendedores','Cadastrar vendedores',NULL,NULL),(8,'editar_vendedores','Editar vendedores',NULL,NULL),(9,'excluir_vendedores','Excluir vendedores',NULL,NULL),(10,'ver_vendedores','Ver vendedores',NULL,NULL),(11,'ver_menu_cliente','Ver menu cliente',NULL,NULL),(12,'cadastrar_cliente','Cadastrar cliente',NULL,NULL),(13,'editar_cliente','Editar cliente',NULL,NULL),(14,'ver_cliente','Ver cliente',NULL,NULL),(15,'excluir_cliente','Excluir cliente',NULL,NULL),(16,'menu_permissoes','Ver menu permissões',NULL,NULL),(17,'cadastrar_permissoes','Cadastrar permissões',NULL,NULL),(18,'editar_permissoes','Editar permissões',NULL,NULL),(19,'ver_permissoes','Ver permissões',NULL,NULL),(20,'excluir_permissoes','Excluir permissões',NULL,NULL),(21,'ver_menu_menus','Ver menu de menus',NULL,NULL),(22,'cadastrar_menu_menus','Cadastrar menu de menus',NULL,NULL),(23,'editar_menu_menus','Editar menu de menus',NULL,NULL),(24,'ver_menu_menus','Ver menu de menus',NULL,NULL),(25,'excluir_menu_menus','Excluir menu de menus',NULL,NULL),(26,'ver_menu_vendas','Ver menu vendas',NULL,NULL),(27,'realizar_venda','Realizar venda',NULL,NULL),(28,'excluir_venda','Excluir venda',NULL,NULL),(29,'ver_venda','Ver venda',NULL,NULL),(30,'gerar_codigo_barras','Gerar código de barras',NULL,NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_menus`
--

DROP TABLE IF EXISTS `role_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_txt` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` double(5,2) NOT NULL,
  `qtd` int NOT NULL,
  `menu_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_menus_menu_id_foreign` (`menu_id`),
  CONSTRAINT `role_menus_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menus`
--

LOCK TABLES `role_menus` WRITE;
/*!40000 ALTER TABLE `role_menus` DISABLE KEYS */;
INSERT INTO `role_menus` VALUES (1,'Parcelamento em 2 vezes','Parcelamento em 2 vezes',15.51,2,1,'2021-11-08 12:31:08','2021-11-08 12:31:08'),(2,'Água, Luz, Telefone,Internet','a vista 4,15% a.m CET 4,15%',4.15,1,1,'2021-11-24 19:48:35','2021-11-24 19:48:35'),(3,'Água, Luz, Telefone,Internet','parcelado em 3X 4,82%',8.31,2,1,'2021-11-24 19:57:06','2021-11-24 19:57:06'),(4,'Água, Luz, Telefone,Internet','parcelado em 3X 4,82%',9.79,3,1,'2021-11-24 19:58:18','2021-11-24 19:58:18'),(5,'Água, Luz, Telefone,Internet','parcelado em 2X 5,49%',8.31,2,1,'2021-11-24 19:59:04','2021-11-24 19:59:04'),(6,'Água, Luz, Telefone,Internet','PARCELADO EM 4X 4,22%',10.76,4,1,'2021-11-24 20:03:03','2021-11-24 20:03:03'),(7,'Água, Luz, Telefone,Internet','PARCELADO EM 5X 3,98%',12.25,5,1,'2021-11-24 20:03:51','2021-11-24 20:03:51'),(8,'Água, Luz, Telefone,Internet','PARCELADO EM 6X 3,82%',13.77,6,1,'2021-11-24 20:04:51','2021-11-24 20:04:51'),(9,'Água, Luz, Telefone,Internet','PARCELADO EM 7X 3,70%',15.34,7,1,'2021-11-24 20:06:20','2021-11-24 20:06:20'),(10,'Água, Luz, Telefone,Internet','PARCELADO EM 8X 3,19%',14.88,8,1,'2021-11-24 20:07:30','2021-11-24 20:07:30'),(11,'Água, Luz, Telefone,Internet','PARCELADO EM 9X 3,12%',16.21,9,1,'2021-11-24 20:09:13','2021-11-24 20:09:13'),(12,'Água, Luz, Telefone,Internet','PARCELADO EM 10X 3,06%',17.58,10,1,'2021-11-24 20:10:37','2021-11-24 20:10:37'),(13,'Água, Luz, Telefone,Internet','PARCELADO EM 11X 3,01%',18.98,11,1,'2021-11-24 20:14:09','2021-11-24 20:14:09'),(14,'Água, Luz, Telefone,Internet','PARCELADO EM 12X 3,01%',20.41,12,1,'2021-11-24 20:14:49','2021-11-24 20:14:49'),(15,'Água, Luz, Telefone,Internet','PARCELADO EM 13X 3,22%',20.48,13,1,'2021-11-24 20:15:54','2021-11-24 20:15:54'),(16,'Água, Luz, Telefone,Internet','PARCELADO EM 14X 3,21%',25.71,14,1,'2021-11-24 20:16:44','2021-11-24 20:16:44'),(17,'Água, Luz, Telefone,Internet','PARCELADO EM 15X 3,22%',27.47,15,1,'2021-11-24 20:17:25','2021-11-24 20:17:25'),(18,'Água, Luz, Telefone,Internet','PARCELADO EM 16X 3,19%',29.28,16,1,'2021-11-24 20:18:16','2021-11-24 20:18:16'),(19,'Água, Luz, Telefone,Internet','PARCELADO EM 17X 3,19%',31.15,17,1,'2021-11-24 20:19:05','2021-11-24 20:19:05'),(20,'Água, Luz, Telefone,Internet','PARCELADO EM 17X 3,20%',33.07,18,1,'2021-11-24 20:19:41','2021-11-24 20:19:41'),(21,'Água, Luz, Telefone,Internet','PARCELADO EM 18X 3,20%',33.07,18,1,'2021-11-24 20:28:12','2021-11-24 20:28:12'),(22,'BOLETO PIX','PIX 4,89',4.89,1,9,'2021-11-25 01:06:16','2021-11-25 01:06:16'),(23,'IMPOSTO DE RENDA PF','PARCELADO EM 2X 5,49%',8.31,2,5,'2021-11-26 14:20:42','2021-11-26 14:20:42'),(24,'IMPOSTO DE RENDA PF','CREDITO A VISTA 5,49%',5.49,1,5,'2021-11-26 17:22:50','2021-11-26 17:22:50'),(25,'CARTAO DE CREDITO CEMA','PARCELADO 1X 12%',12.00,1,8,'2021-12-02 12:38:22','2021-12-02 12:38:22'),(26,'CARTAO DE CREDITO CEMA','PARCELADO 2X 12%',13.75,2,8,'2021-12-02 12:39:00','2021-12-02 12:39:00'),(27,'CARTAO DE CREDITO CEMA','PARCELADO 3X 14,50%',14.50,3,8,'2021-12-02 12:40:18','2021-12-02 12:40:18'),(28,'CARTAO DE CREDITO CEMA','PARCELADO 4X 15,20%',15.20,4,8,'2021-12-02 12:43:56','2021-12-02 12:43:56'),(29,'CARTAO DE CREDITO CEMA','PARCELADO 5X 16,00%',16.00,5,8,'2021-12-02 12:45:02','2021-12-02 12:45:02'),(30,'CARTAO DE CREDITO CEMA','PARCELADO 6X 17,00%',17.00,6,8,'2021-12-02 12:45:32','2021-12-02 12:45:32'),(31,'CARTAO DE CREDITO CEMA','PARCELADO 7X 18,00%',18.00,7,8,'2021-12-02 12:46:46','2021-12-02 12:46:46'),(32,'CARTAO DE CREDITO CEMA','PARCELADO 8X 19,00%',19.00,8,8,'2021-12-02 12:47:40','2021-12-02 12:47:40'),(33,'CARTAO DE CREDITO CEMA','PARCELADO 9X 19,25%',19.25,9,8,'2021-12-02 12:48:12','2021-12-02 12:48:12'),(34,'CARTAO DE CREDITO CEMA','PARCELADO 10X 19,50%',19.50,10,8,'2021-12-02 12:49:16','2021-12-02 12:49:16'),(35,'CARTAO DE CREDITO CEMA','PARCELADO 11X 19,50%',19.50,11,8,'2021-12-02 12:49:36','2021-12-02 12:49:36'),(36,'CARTAO DE CREDITO CEMA','PARCELADO 12X 19,50%',19.50,12,8,'2021-12-02 12:49:55','2021-12-02 12:49:55'),(37,'CARTAO DE CREDITO CEMA','PARCELADO 1X 10,50%',10.50,1,8,'2021-12-02 13:25:06','2021-12-02 13:25:06');
/*!40000 ALTER TABLE `role_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned NOT NULL,
  `permission_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_permissions_role_id_foreign` (`role_id`),
  KEY `role_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','Usuário admin',NULL,NULL),(2,'Vendedor','Usuário vendedor',NULL,NULL),(3,'Cliente','Usuário cliente',NULL,NULL),(4,'Gestor','Gestor','2021-12-03 14:53:58','2021-12-03 14:53:58');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('1GT25kTgNzU9Si0ZIZz219pgfYpwPeOOXdNuQvFj',NULL,'161.35.90.153','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY1BXTVdUNEZjQ29jekJmaXhvVXdram5kQ3dWZm93SDN0VjloU3pNNiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638598916),('2XvHS1nfIiCak90s9yt7xt3ZW6XOc78cly3VAcxW',NULL,'117.74.135.35','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Win64; x64; Trident/4.0)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNXp5MVI0a0VxR1ZiZHdPSUtGRWpRVmVyaEFNbkQ0OEJmTFhDb3hxMiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638545429),('6g8llt6r3BFuKli18GuzRPgdjMsAu3ceNATJqE9C',NULL,'117.74.135.35','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNVNVOGNNZEJ0VEt5aTZIQnpMSjVocVNZem5iVTRiRHh3cDJjaFpmUyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyODoiaHR0cDovLzE2Ny45OS41My41L2luZGV4LnBocCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI4OiJodHRwOi8vMTY3Ljk5LjUzLjUvaW5kZXgucGhwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1638545429),('7UQMcaNvNK1d15snovQINYCxxqPKhGqTPiVEP9sc',NULL,'104.140.188.18','https://gdnplus.com:Gather Analyze Provide.','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZzBIS3ZsWDY0bDJUTEdNRjFVTmdQaDZhRzAwNktTaHl6OFB1aXZadiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638581644),('93z7NroDBGKm3inXVuXlBbV60mzmHMlUIpcRTcYf',NULL,'177.37.160.14','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 facebookexternalhit/1.1 Facebot Twitterbot/1.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoib1dCTnZCVElwOFU4ZUtsdVpkZVBoRmxJdERiR2F6d0tFaUdQVTVFUSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNjcuOTkuNTMuNS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638551340),('ed95o6RmBQ0dDPdY8i1X6s1E1JxrKwnTsIfgbrM1',NULL,'117.74.135.35','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaE1HZFg1dE5IMVVqQUZEQTc0ZUp3d1cwZkRvNGd6Y0pRQWV2N3dGTCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638545135),('eTT3lw2jtidJI7i0vwOT6IqMyF4lfHpZDdzO0BFS',NULL,'186.213.61.101','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNm9xaU5EYnZuM1N2a29nNjRtUkFmZGtDdXhEYnQwb0JWVnZBNkdXMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNjcuOTkuNTMuNS9sb2dpbiI7fX0=',1638552254),('fw6qDS5SrXEP9LfE0f6PtD6lsHRy2PRBgv9vraHs',NULL,'117.74.135.35','Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMU81T2Q2R1pXWFdTbFA0YnlyOXB3S1A0NVI1VjhOMlp2aFhIdDdVNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNjcuOTkuNTMuNS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638545471),('gh7I6GmPcVX9Q3wCIK3s5dQw5NHSqMVI7mEaS6mV',NULL,'117.74.135.35','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOFNWN2Z2YW1jM0JrMVQ1N25xS1h5eW1lbks5N3FINTlGbHFkNnoxRiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxMDQ6Imh0dHA6Ly8xNjcuOTkuNTMuNS9pbmRleC5waHA/cz0lMkZtb2R1bGUlMkZhY3Rpb24lMkZwYXJhbTElMkYlMjQlN0IlNDBkaWUlMjhtZDUlMjhIZWxsb1RoaW5rUEhQJTI5JTI5JTdEIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTA0OiJodHRwOi8vMTY3Ljk5LjUzLjUvaW5kZXgucGhwP3M9JTJGbW9kdWxlJTJGYWN0aW9uJTJGcGFyYW0xJTJGJTI0JTdCJTQwZGllJTI4bWQ1JTI4SGVsbG9UaGlua1BIUCUyOSUyOSU3RCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638545135),('HHWGPhMlFgEzD5UCzw1MgnY5C9pjxIDsGVduWTrJ',NULL,'128.14.134.170','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicHk3NFQ1ZXhadWVlek5URk5JVmxQWHZFTGxmdm1MTTBwbmpTS2w2UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNjcuOTkuNTMuNS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638590175),('hX0fSmzfCJOKWrPpsQNs6zCk9FxjaeS1XmQ0ZLVP',NULL,'86.38.173.89','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZ3NIODk4akIya2EwY3hjNGJXVWEzdTF2Q3BFczBickZiUUtsRERpUSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638560493),('iEP3uy0hzVmDReiP3hOfgkE0EnayzNccDPuDkvGS',NULL,'185.180.143.79','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoid0FOTk54TkYzdURtRUpSYllWWUxGTFhxUWlyWW1aWXE0RE5JUzdMZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNjcuOTkuNTMuNS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638582564),('jIZ2TFeKk7s2CFhtpFXSWCKcOfOFUys4IhfVPUSd',NULL,'180.149.125.169','Mozilla/5.0 (Windows NT 5.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYm1BZnNWcTA2d2wzdG9xZk50eDBqbEVjbm1YaENmVVFKMW1yR1I2dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNjcuOTkuNTMuNS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638576986),('jVi3qPtYbG63mC5s2QUKaIE7qsCn69iZOUXQVVHU',NULL,'128.1.248.42','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2tIUmNEQXpaMkNvejVDOXlCWnR6RldyTFd3aTNKZTd5VjJWSzB2QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNjcuOTkuNTMuNS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1641660776),('Kk2BdEdSXKNLYQ8XsipdlSi9Lu7xhzWhSULSnmRq',NULL,'177.52.26.37','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNjNZNXY2MmVQZnVwY1pVZERFS2RFRW5ha0J2TXluY2s0TnQweXdCViI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638558059),('LgLVqI9OIoyGYSliR5D20NCHk7g2nJp7ohT4ZT5V',NULL,'117.74.135.35','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiM0lSa3FKTktrU2RxdFhNMXFFTlMyZWdDNmdvbUVnUTQ0VDJybGxsTCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNTI6Imh0dHA6Ly8xNjcuOTkuNTMuNS9pbmRleC5waHA/ZnVuY3Rpb249Y2FsbF91c2VyX2Z1bmNfYXJyYXkmcz0lMkZpbmRleCUyRiU1Q3RoaW5rJTVDYXBwJTJGaW52b2tlZnVuY3Rpb24mdmFycyU1QjAlNUQ9bWQ1JnZhcnMlNUIxJTVEJTVCMCU1RD1IZWxsb1RoaW5rUEhQIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTUyOiJodHRwOi8vMTY3Ljk5LjUzLjUvaW5kZXgucGhwP2Z1bmN0aW9uPWNhbGxfdXNlcl9mdW5jX2FycmF5JnM9JTJGaW5kZXglMkYlNUN0aGluayU1Q2FwcCUyRmludm9rZWZ1bmN0aW9uJnZhcnMlNUIwJTVEPW1kNSZ2YXJzJTVCMSU1RCU1QjAlNUQ9SGVsbG9UaGlua1BIUCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638545134),('LQSt55ZJck9emEDkS7o3f2nfAEixj9WmGvnsKsPe',NULL,'128.14.133.58','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoibzdaejVMdWsyU3JSaTlMSFJXVlM5a3RlSTFpbnhYaHRWSWhiN1FsSCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638551431),('mKAYml5abHX5TKY2p00plitadKbazif77O296lO2',NULL,'177.37.160.14','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRk5xRmdkRmFEOGpwcUhOUVFYWkVRVmpQdmxiQ1JvZEVrcnZZVlBZUCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNjcuOTkuNTMuNS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638551414),('nWIBUS1aNJA12bwRosRyNm5jKnU5pZe6a2Acbwb9',NULL,'117.74.135.35','Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTdBT01LSWY0S1pmQkJkMWFUWUxPdlB0aFZ2a2huWVVTaklLOVRMYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly8xNjcuOTkuNTMuNS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638545469),('oomMKT5PupUacj9U1jXjIPtMBLPugwm6EEq4BmhG',1,'177.37.160.14','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36','YTo3OntzOjY6Il90b2tlbiI7czo0MDoibktRR1d2Mk5yUWtCY3FBdnJHM0hwRWdTWE4xR0JTcDdpVms2ZEJlRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM1OiJodHRwOi8vMTY3Ljk5LjUzLjUvdG9kb3MtcGFnYW1lbnRvcyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR3SXpBdEMwbnRUQktQQXZwMFJVdER1U0t2RHhFeUpSYlR5bVZaVWhQOUNnLkxZZjN6MjVsRyI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkd0l6QXRDMG50VEJLUEF2cDBSVXREdVNLdkR4RXlKUmJUeW1WWlVoUDlDZy5MWWYzejI1bEciO30=',1638599476),('OUcnCuXe5ptqXsFCkCGdXvVGiinviBm2oo5HCKWa',1,'192.141.122.4','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.41','YTo3OntzOjY6Il90b2tlbiI7czo0MDoieU5yM0NTMFBXZlJsNlo1NFRscnJ4NnI1WmEwNEFaRzJwME1hTWpoYSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjE4OiJodHRwOi8vMTY3Ljk5LjUzLjUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkd0l6QXRDMG50VEJLUEF2cDBSVXREdVNLdkR4RXlKUmJUeW1WWlVoUDlDZy5MWWYzejI1bEciO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJHdJekF0QzBudFRCS1BBdnAwUlV0RHVTS3ZEeEV5SlJiVHltVlpVaFA5Q2cuTFlmM3oyNWxHIjt9',1638563551),('pgPfm25xJs3tov4TdUBStr9hGsWEkELEkKnekiW8',NULL,'117.74.135.35','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUVZBekpzVkFsdWdhN0tlemJNd0M0TFdvRENkRFJnTEFiWXREQXlQMSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638545101),('Ph9WDNtoA8MH6IvpBOhVp9G0SL4jyf4nKhLIMJrT',NULL,'35.195.93.98','python-requests/2.26.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQzdtQ3VBdW5JVFUwbVRVa0xhREJzcTB5Nm1oaUVJa0piM3hISU1pQyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638553843),('pxENttA2Pdah6Ttu13BuFRYAzSYVYbxlKVKE1mEU',NULL,'188.127.224.137','masscan/1.3 (https://github.com/robertdavidgraham/masscan)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMTBuTTlzV09UcEJDdEJhSUdJNThxajJKVE5IYXlQd095MkxlOWwzVCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638545888),('QPWMjZpZYiAtslZYJOKT5E67VdlVVpq8MXXMoBOz',NULL,'185.180.143.79','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiOVhidXhMb1BOTHhHV0NlTEhxcDRwNTVqbjRNdmVwZk9uVzFFbTZyZyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638582564),('RQfGLMxWuDxq1vemY8WcqXTl93r2cru849zLU9OM',NULL,'128.14.134.170','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTVp2Zmhxc0VDbnIwSERrMU9YdWlFRFpxVmc0dnpnYTJFdk5HdDhtayI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638590174),('t7AkRVu5sp9eXEe2Zyrtai1jOfQH4kFt7eCxLO3F',NULL,'128.1.248.42','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoic3MycnJudDNoNFQ4bEZVbnVnemV3ZWJxdnRvaDJEaDVacDhDT0ZSWSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1641660776),('V4foyrFgZnuIfgYyeRtect2Kg7JVuCJouWWCeAoM',NULL,'136.144.41.117','Linux Gnu (cow)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoienJYSzF4M2JRT0I0MzJWalZvMW9Xb0w3b0FyUG8wWUtLdG9SZnB6UyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638598231),('v5s6rW8Xsmpchz8b6coqmHCzmdtNLk7vbn4bCKBP',NULL,'117.74.135.35','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMG85T0dHVXVnTXFPeDltWVRlaGNFRElsaElPQW01YlZ1cFB5cmxvdiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo5MToiaHR0cDovLzE2Ny45OS41My41Lz9hPWZldGNoJmNvbnRlbnQ9JTNDcGhwJTNFZGllJTI4JTQwbWQ1JTI4SGVsbG9UaGlua0NNRiUyOSUyOSUzQyUyRnBocCUzRSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjkxOiJodHRwOi8vMTY3Ljk5LjUzLjUvP2E9ZmV0Y2gmY29udGVudD0lM0NwaHAlM0VkaWUlMjglNDBtZDUlMjhIZWxsb1RoaW5rQ01GJTI5JTI5JTNDJTJGcGhwJTNFIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1638545135),('XVKbBZCv3risKNmPvypH7RMWeNvF2FPXUzLe6NKQ',NULL,'117.74.135.35','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT1UybVJGblVWUVd2dGpwUHBsWXdaY3ZrT1M1VFlFaVVraEtkTm1xSyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638545137),('ySq1qSsU5lFGFJ1llk92QNWzeKWRNCiDqmCkhUe1',NULL,'64.62.197.212','','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRTZFSTNRVG40QU4yWE0xbDMzbGZsV2I2M3J3ekxQR1BNb3pFd0xhQSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638599947),('zII97p7QD0yEdnUfndMBU084x1XxVFoDqt2rjWY3',NULL,'180.149.125.169','Mozilla/5.0 (Windows NT 5.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT2xnWjFzNzdNbEV3WEZDNWpkUWRFY3BOclNVMW1HelJ0RlhXOW1UVyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638576986),('zln0ViAyw4kxCVMq0Guohz442KlBwLLdInVpHbUF',NULL,'117.74.135.35','Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0)','YTo0OntzOjY6Il90b2tlbiI7czo0MDoidXdHY1R3RGw4QkFJcVQ4YVhPNW9CZVY3WFRzYVI4YXpjN2dWV2dORCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxODoiaHR0cDovLzE2Ny45OS41My41Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTg6Imh0dHA6Ly8xNjcuOTkuNTMuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1638545101);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `vencimento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `parcelas` int NOT NULL,
  `valorParcelas` double(10,3) NOT NULL,
  `subTotal` double(10,3) NOT NULL,
  `cartoes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` double(10,3) NOT NULL,
  `img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `vendedor_id` bigint unsigned NOT NULL,
  `menu_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_client_id_foreign` (`client_id`),
  KEY `tickets_vendedor_id_foreign` (`vendedor_id`),
  KEY `tickets_menu_id_foreign` (`menu_id`),
  CONSTRAINT `tickets_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  CONSTRAINT `tickets_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  CONSTRAINT `tickets_vendedor_id_foreign` FOREIGN KEY (`vendedor_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'Boleto Bancário','03399201429390031066030202801020488270000063954',1,'11/07/2021',2,2,1108.099,2216.198,'1123, 4512, 5114',2216.198,'https://eseguropague-space.fra1.digitaloceanspaces.com/production/uploads/12891bdc-87c5-40b0-8f7e-e89d00748f83_86928092021%20%281%29.pdf',2,1,1,'2021-11-23 18:45:59','2021-11-30 15:20:33'),(2,'Boleto Bancário','03399201429390031066030202901028888580000063954',1,'Invalid date',2,2,1108.099,2216.198,'1123, 4512, 5114',2216.198,'https://eseguropague-space.fra1.digitaloceanspaces.com/production/uploads/49e224d6-8182-43d5-9f96-cbe378e5fe7b_86928092021.pdf',2,1,1,'2021-11-23 18:45:59','2021-11-30 15:20:52'),(3,'Boleto Bancário','03399201429390031066030203101024589170000063954',1,'02/07/2022',2,2,1108.099,2216.198,'1123, 4512, 5114',2216.198,'https://eseguropague-space.fra1.digitaloceanspaces.com/production/uploads/b74aa337-c109-4ea9-b308-9a201ac4d5c5_BANCO%20ALPHABANK%20boleto%20carro.pdf',2,1,1,'2021-11-23 18:45:59','2021-12-02 20:20:38'),(4,'Boleto Bancário','23792374034000032815905016519901388150000122664',1,'Invalid date',2,3,448.909,1346.728,'4456',1346.728,'https://eseguropague-space.fra1.digitaloceanspaces.com/production/uploads/7f57fe97-8430-45af-8eac-28f315fd71cc_BANCO%20ALPHABANK%20-295f404072232ad70d1f4893912d68a3.pdf',3,1,1,'2021-11-25 13:03:02','2021-11-26 18:36:35'),(5,'Boleto Bancário','23792374034000032815905016519901388150000122664',1,'Invalid date',2,8,176.146,1409.164,'2546',1409.164,'https://eseguropague-space.fra1.digitaloceanspaces.com/production/uploads/8fa7065e-d226-40d6-b73b-b5d200df0f66_BANCO%20ALPHABANK%20-295f404072232ad70d1f4893912d68a3.pdf',4,1,1,'2021-11-25 17:02:57','2021-11-26 18:29:28'),(6,'Boleto Bancário','858000000046723003852133340717213275136917601006',1,'30/11/2021',2,1,498.229,498.229,'5014',498.229,'https://eseguropague-space.fra1.digitaloceanspaces.com/production/uploads/2d9b8fed-2a19-45de-a0aa-eccc307a9fdb_DARF.pdf',4,1,5,'2021-11-26 17:40:52','2021-11-26 18:34:20'),(7,'Boleto Bancário','03399201429390031898681302301023988200000065538',1,'Invalid date',2,1,682.578,682.578,'5014',682.578,'https://eseguropague-space.fra1.digitaloceanspaces.com/production/uploads/4d98f3e3-8b99-42a3-ba7f-6ddb7ff84c39_BANCO%20ALPHABANK%20boleto%20carro.pdf',4,1,1,'2021-11-26 18:00:33','2021-11-26 18:29:00'),(8,'Boleto Bancário','00190000090337338215380233602178100000000014021',1,'18/11/2021',2,1,146.029,146.029,'5014',146.029,'https://eseguropague-space.fra1.digitaloceanspaces.com/production/uploads/431942cb-9b2f-475f-8617-278815b66317_PAG%20CONTA.pdf',3,1,1,'2021-12-01 18:40:59','2021-12-01 19:41:24');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_roles_user_id_foreign` (`user_id`),
  KEY `user_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,1,NULL,NULL),(2,2,3,'2021-11-08 12:32:31','2021-11-08 12:32:31'),(3,3,3,'2021-11-25 12:59:40','2021-11-25 12:59:40'),(4,4,3,'2021-11-25 13:09:46','2021-11-25 13:09:46');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `vendedor_id` int DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'E Seguro','admin@admin.com',NULL,'$2y$10$wIzAtC0ntTBKPAvp0RUtDuSKvDxEyJRbTymVZUhP9Cg.LYf3z25lG',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-06 19:14:08','2021-11-18 00:27:27'),(2,'ISAIAS ALVES DA COSTA','isaias7costa2@hotmail.com',NULL,'$2y$10$heEQdq9GkPBJkXfjqj5d2eSWSAIP19XrpXhbTs1CmULYQ4WGgNnaO',0,NULL,NULL,1,3,1,NULL,NULL,NULL,'2021-11-08 12:32:31','2021-11-08 12:32:31'),(3,'ilayne nagila costa melo','ilayne.nagila@hotmail.com',NULL,'$2y$10$UFnx0I0.Ft1B7QD5M/xwn.4.T.c/B1bn9OQyh0Ua.VEEKj/KeYQ0m',0,NULL,NULL,1,3,1,NULL,NULL,NULL,'2021-11-25 12:59:40','2021-11-25 12:59:40'),(4,'THAMIRES ALVES DOS SANTOS','thamires.joaoarthur@gmail.com',NULL,'$2y$10$g59sZ0WKgJbMvIgV.2kafOjUPzaiuZT8N2ugxe4TWpAqm6K6V.FTq',0,NULL,NULL,1,3,1,NULL,NULL,NULL,'2021-11-25 13:09:46','2021-11-25 13:19:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-08 17:38:40
