CREATE DATABASE  IF NOT EXISTS `mvc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mvc`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: mvc
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `authority` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_authorities_users` (`username`),
  CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,'Anonymus','ROLE_ADMIN'),(2,'botose','ROLE_USER'),(3,'admin','ROLE_ADMIN'),(4,'ganiko','ROLE_USER'),(5,'gbalazs','ROLE_USER'),(7,'joe','ROLE_USER'),(8,'Fanni','ROLE_USER'),(10,'Laci','ROLE_USER'),(11,'Jani','ROLE_USER');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Soup'),(2,'Fried meat'),(3,'Baked meat'),(4,'Slow cooked food'),(5,'Side dish'),(6,'Casserole'),(7,'Pudding'),(8,'Cake'),(9,'Meatloaf'),(10,'Drinks');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `UNIT_PRICE` int(10) DEFAULT NULL,
  `UP_DESCRIPTION` varchar(25) DEFAULT NULL,
  `DESCRIPTION` text,
  `AUTHOR` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AUTHOR` (`AUTHOR`),
  CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`AUTHOR`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Sugar',28,NULL,'Sugar is the generalized name for sweet, short-chain, soluble carbohydrates, many of which are used in food. They are carbohydrates, composed of carbon, hydrogen, and oxygen. There are various types of sugar derived from different sources. Simple sugars are called monosaccharides and include glucose (also known as dextrose), fructose and galactose. The table or granulated sugar most customarily used as food is sucrose, a disaccharide. (In the body, sucrose hydrolyses into fructose and glucose.) Other disaccharides include maltose and lactose. Longer chains of sugars are called oligosaccharides. Chemically-different substances may also have a sweet taste, but are not classified as sugars. Some are used as lower-calorie food substitutes for sugar described as artificial sweeteners.','ganiko'),(2,'Salt',12,NULL,'Common salt is a mineral substance composed primarily of sodium chloride (NaCl), a chemical compound belonging to the larger class of ionic salts; salt in its natural form as a crystalline mineral is known as rock salt or halite. Salt is present in vast quantities in the sea where it is the main mineral constituent, with the open ocean having about 35 grams (1.2 oz) of solids per litre, a salinity of 3.5%. Salt is essential for animal life, and saltiness is one of the basic human tastes. The tissues of animals contain larger quantities of salt than do plant tissues; therefore the typical diets of nomads who subsist on their flocks and herds require little or no added salt, whereas cereal-based diets require supplementation. Salt is one of the oldest and most ubiquitous of food seasonings, and salting is an important method of food preservation.','ganiko'),(3,'Flour',28,NULL,'Flour is a powder which is made by grinding cereal grains, beans, or other seeds or roots (like cassava). It is the main ingredient of bread, which is a staple food for many cultures, making the availability of adequate supplies of flour a major economic and political issue at various times throughout history. Wheat flour is one of the most important ingredients in European, North American, Middle Eastern, Indian and North African cultures, and is the defining ingredient in most of their styles of breads and pastries.','ganiko'),(4,'Cocoa powder',150,NULL,'Cocoa solids are a mixture of many substances remaining after cocoa butter is extracted from cacao beans. When sold as an end product, it may also be called cocoa powder, cocoa, and cacao. In contrast, the fatty component of chocolate is cocoa butter. Cocoa butter is 50% to 57% of the weight of cocoa beans and gives chocolate its characteristic melting properties.[1] Cocoa liquor or cocoa mass is a paste of roasted cocoa beans with cocoa butter and solids in their natural proportions. Chocolate requires the addition of extra cocoa butter to cocoa liquor, and the excess cocoa solids resulting from the chocolate industry dictate the relatively cheap supply of cocoa powder. This contrasts with the earliest European usage of cocoa where, before chocolate was popularized, cocoa powder was the primary product and cocoa butter was little more than a waste product.','ganiko'),(5,'Yeast',300,NULL,'Yeasts are eukaryotic microorganisms classified in the kingdom Fungi, with 1,500 species currently described[1] (estimated to be 1% of all fungal species).[2] Yeasts are unicellular, although some species with yeast forms may become multicellular through the formation of strings of connected budding cells known as pseudohyphae, or false hyphae, as seen in most molds.[3] Yeast size can vary greatly depending on the species, typically measuring 34 µm in diameter, although some yeasts can reach over 40 µm.[4] Most yeasts reproduce asexually by mitosis, and many do so by an asymmetric division process called budding.','ganiko'),(6,'Butter',120,NULL,'Butter is a dairy product made by churning fresh or fermented cream or milk, to separate the butterfat from the buttermilk. It is generally used as a spread and a condiment, as well as in cooking, such as baking, sauce making, and pan frying. Butter consists of butterfat, milk proteins and water.','ganiko'),(7,'Baking Powder',308,NULL,'Baking powder is a dry chemical leavening agent, a mixture of a carbonate or bicarbonate and a weak acid, and is used for increasing the volume and lightening the texture of baked goods. Baking powder works by releasing carbon dioxide gas into a batter or dough through an acid-base reaction, causing bubbles in the wet mixture to expand and thus leavening the mixture. It is used instead of yeast for end-products where fermentation flavors would be undesirable or where the batter lacks the elastic structure to hold gas bubbles for more than a few minutes, or for convenience. Because carbon dioxide is released at a faster rate through the acid-base reaction than through fermentation, breads made by chemical leavening are called quick breads.','ganiko'),(8,'Egg',3500,NULL,'An egg is the organic vessel containing the zygote, resulting from fertilization of the ovum, in which an animal embryo develops until it can survive on its own, at which point the animal hatches. Most arthropods, vertebrates, and mollusks lay eggs, although some do not, e.g. scorpions and most mammals.','botose'),(9,'Milk',18,NULL,'Milk is a white liquid produced by the mammary glands of mammals. It is the primary source of nutrition for young mammals before they are able to digest other types of food. Early-lactation milk contains colostrum, which carries the mother\'s antibodies to the baby and can reduce the risk of many diseases in the baby. It also contains many other nutrients.','botose'),(10,'Oil',60,NULL,'Cooking oil is plant, animal, or synthetic fat used in frying, baking, and other types of cooking. It is also used in food preparation and flavouring that doesn\'t involve heat, such as salad dressings and bread dips, and in this sense might be more accurately termed edible oil.','botose'),(11,'Black Pepper',1200,NULL,'Black pepper (Piper nigrum) is a flowering vine in the family Piperaceae, cultivated for its fruit, which is usually dried and used as a spice and seasoning. The fruit, known as a peppercorn when dried, is approximately 5 millimetres (0.20 in) in diameter, dark red when fully mature, and, like all drupes, contains a single seed. Peppercorns, and the ground pepper derived from them, may be described simply as pepper, or more precisely as black pepper (cooked and dried unripe fruit), green pepper (dried unripe fruit) and white pepper (ripe fruit seeds).','botose'),(12,'Lemon Zest',150,NULL,'Zest is a food ingredient that is prepared by scraping or cutting from the outer, colorful skin of unwaxed citrus fruits such as lemon, orange, citron, and lime. Zest is used to add flavor (\"zest\") to foods.\r\n\r\nIn terms of fruit anatomy, zest is obtained from the flavedo (exocarp) which is also referred to as zest. The flavedo and white pith (albedo) of a citrus fruit together makes up its peel. The amounts of both flavedo and pith are variable among citrus fruits, and may be adjusted by the manner in which they are prepared. Citrus peel may be used fresh, dried, candied, or pickled in salt.','botose'),(13,'Lemon Juice',280,NULL,'The lemon (Citrus × limon) is a small evergreen tree native to Asia. The tree\'s ellipsoidal yellow fruit is used for culinary and non-culinary purposes throughout the world, primarily for its juice, though the pulp and rind (zest) are also used in cooking and baking. The juice of the lemon is about 5% to 6% citric acid, which gives lemons a sour taste. The distinctive sour taste of lemon juice makes it a key ingredient in drinks and foods such as lemonade.','botose'),(14,'Double cream',125,NULL,'Cream is a dairy product that is composed of the higher-butterfat layer skimmed from the top of milk before homogenization. In un-homogenized milk, the fat, which is less dense, will eventually rise to the top. In the industrial production of cream, this process is accelerated by using centrifuges called \"separators\". In many countries, cream is sold in several grades depending on the total butterfat content. Cream can be dried to a powder for shipment to distant markets.','botose'),(15,'Brown Sugar',240,NULL,'Brown sugar is a sucrose sugar product with a distinctive brown color due to the presence of molasses. It is either an unrefined or partially refined soft sugar consisting of sugar crystals with some residual molasses content, or it is produced by the addition of molasses to refined white sugar (so-called Molasses Sugar).','gbalazs'),(16,'Maple Syrup',1500,NULL,'Maple syrup is a syrup usually made from the xylem sap of sugar maple, red maple, or black maple trees, although it can also be made from other maple species. In cold climates, these trees store starch in their trunks and roots before the winter; the starch is then converted to sugar that rises in the sap in the spring. Maple trees can be tapped by boring holes into their trunks and collecting the exuded sap. The sap is processed by heating to evaporate much of the water, leaving the concentrated syrup.','gbalazs'),(17,'Vanilla Extract',2440,NULL,'Vanilla extract is a solution containing the flavor compound vanillin as the primary ingredient. Pure vanilla extract is made by macerating and percolating vanilla beans in a solution of ethyl alcohol and water. In the United States, in order for a vanilla extract to be called pure, the U.S. Food and Drug Administration requires that the solution contains a minimum 35% of alcohol and 100g of vanilla beans per litre (13.35 ounces per gallon). Double and triple strength (up to 20-fold) vanilla extracts are available.','gbalazs'),(18,'Banana',50,NULL,'A banana is an edible fruit, botanically a berry, produced by several kinds of large herbaceous flowering plants in the genus Musa. (In some countries, bananas used for cooking may be called plantains.) The fruit is variable in size, color and firmness, but is usually elongated and curved, with soft flesh rich in starch covered with a rind which may be green, yellow, red, purple, or brown when ripe. The fruits grow in clusters hanging from the top of the plant. Almost all modern edible parthenocarpic (seedless) bananas come from two wild species  Musa acuminata and Musa balbisiana. The scientific names of most cultivated bananas are Musa acuminata, Musa balbisiana, and Musa × paradisiaca for the hybrid Musa acuminata × M. balbisiana, depending on their genomic constitution. The old scientific name Musa sapientum is no longer used.','gbalazs'),(19,'Crème fraîche',299,NULL,'Crème fraîche (English pronunciation : /&#716;kr&#603;m&#712;fr&#603;&#643;/, French pronunciation: &#8203;[k&#641;&#603;m f&#641;&#603;&#720;&#643;], Quebec French pronunciation : [k&#641;&#603;m f&#641;a&#618;&#815;&#643;], lit. \"fresh cream\") is a soured cream containing 3045% butterfat and having a pH of around. It is soured with bacterial culture, but is less sour than U.S.-style sour cream, and has a lower viscosity and a higher fat content. European labeling regulation disallows any ingredients other than cream and bacterial culture.\r\n\r\nThe name \"crème fraîche\" is French, but similar soured creams are found in much of northern Europe.','gbalazs'),(20,'Cinnamon (ground)',300,NULL,'Cinnamon (/&#712;s&#618;n&#601;m&#601;n/ sin-&#601;-m&#601;n) is a spice obtained from the inner bark of several trees from the genus Cinnamomum that is used in both sweet and savoury foods. While Cinnamomum verum is sometimes considered to be \"true cinnamon\", most cinnamon in international commerce is derived from related species, which are also referred to as \"cassia\" to distinguish them from \"true cinnamon\".\r\n\r\nCinnamon is the name for perhaps a dozen species of trees and the commercial spice products that some of them produce. All are members of the genus Cinnamomum in the family Lauraceae. Only a few of them are grown commercially for spice.','gbalazs'),(21,'Parsley',80,NULL,'Parsley or garden parsley (Petroselinum crispum) is a species of Petroselinum in the family Apiaceae, native to the central Mediterranean region (southern Italy, Algeria, and Tunisia), naturalized elsewhere in Europe, and widely cultivated as a herb, a spice, and a vegetable.','ganiko'),(22,'Redcurrant',80,NULL,'The redcurrant (or red currant), Ribes rubrum, is a member of the genus Ribes in the gooseberry family Grossulariaceae, native to parts of western Europe (Belgium, France, Norway, Sweden, Germany, Netherlands, northern Italy, northern Spain, Portugal and Poland). It is a deciduous shrub normally growing to 11.5 m (3-5 feet) tall, occasionally 2 m (6.5 feet), with five-lobed leaves arranged spirally on the stems. The flowers are inconspicuous yellow-green, in pendulous 48 cm (1.5-3 inch) racemes, maturing into bright red translucent edible berries about 812 mm (.3-.8 inch) diameter, with 310 berries on each raceme. An established bush can produce 34 kilos (6.5-9 lbs) of berries from mid to late summer.','ganiko'),(23,'Tomato purée',101,NULL,'Tomato purée or passata is a thick liquid made by cooking and straining tomatoes. The difference between tomato paste, tomato purée, and tomato sauce is consistency, and the thicker the consistency, the deeper the flavor.','ganiko'),(24,'Rosemary',400,NULL,'Rosmarinus officinalis, commonly known as rosemary, is a woody, perennial herb with fragrant, evergreen, needle-like leaves and white, pink, purple, or blue flowers, native to the Mediterranean region. It is a member of the mint family Lamiaceae, which includes many other herbs. The name \"rosemary\" derives from the Latin for \"dew\" (ros) and \"sea\" (marinus), or \"dew of the sea\".[2] The plant is also sometimes called anthos, from the ancient Greek word &#7940;&#957;&#952;&#959;&#962;, meaning \"flower\".[3] Rosemary has a fibrous root system.','ganiko'),(25,'Pork meat',120,NULL,'Pork is the culinary name for meat from the domestic pig (Sus domesticus). It is the most commonly consumed meat worldwide, with evidence of pig husbandry dating back to 5000 BC.','ganiko'),(26,'Egg white',40,NULL,'Egg white is the common name for the clear liquid (also called the albumen or the glair/glaire) contained within an egg. In chickens it is formed from the layers of secretions of the anterior section of the hen\'s oviduct during the passage of the egg. It forms around either fertilized or unfertilized egg yolks. The primary natural purpose of egg white is to protect the yolk and provide additional nutrition for the growth of the embryo (when fertilized). Egg white consists primarily of about 90% water into which is dissolved 10% proteins (including albumins, mucoproteins, and globulins). Unlike the yolk, which is high in lipids (fats), egg white contains almost no fat, and carbohydrate content is less than 1%. Egg whites contain just over 50% of the protein in the egg. Egg white has many uses in food (e.g. mousse) and also many other uses (e.g. in the preparation of vaccines such as those for influenza).','ganiko'),(27,'Bread crumbs',100,NULL,'Bread crumbs or breadcrumbs (regional variants: breading, crispies) are small particles of dry bread, used for breading or crumbing foods, topping casseroles, stuffing poultry, thickening stews, adding inexpensive bulk to meatloaves and similar foods, and making a crisp and crunchy coating for fried foods, especially breaded cutlets like tonkatsu and schnitzel. The Japanese variety of bread crumbs is called panko.','ganiko');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_recipe`
--

DROP TABLE IF EXISTS `ingredient_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient_recipe` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `INGREDIENT_ID` int(10) NOT NULL,
  `RECIPE_ID` int(10) NOT NULL,
  `AMOUNT` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INGREDIENT_ID` (`INGREDIENT_ID`),
  KEY `RECIPE_ID` (`RECIPE_ID`),
  CONSTRAINT `ingredient_recipe_ibfk_1` FOREIGN KEY (`INGREDIENT_ID`) REFERENCES `ingredient` (`ID`),
  CONSTRAINT `ingredient_recipe_ibfk_2` FOREIGN KEY (`RECIPE_ID`) REFERENCES `recipe` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_recipe`
--

LOCK TABLES `ingredient_recipe` WRITE;
/*!40000 ALTER TABLE `ingredient_recipe` DISABLE KEYS */;
INSERT INTO `ingredient_recipe` VALUES (5,6,2,150),(6,12,2,5),(7,13,2,80),(8,1,2,315),(9,3,2,115),(10,9,2,375),(11,8,2,4),(12,14,2,200),(13,8,3,3),(14,6,3,125),(15,15,3,200),(16,16,3,60),(17,17,3,3),(18,18,3,600),(19,19,3,60),(20,3,3,225),(21,7,3,5),(22,20,3,2),(23,6,3,60),(24,15,3,150),(25,18,3,300),(26,14,3,80),(33,21,5,20),(34,22,5,20),(35,23,5,40),(36,24,5,2),(37,2,5,2),(38,25,5,1000),(39,26,5,1),(40,27,5,50),(41,9,5,100);
/*!40000 ALTER TABLE `ingredient_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` text,
  `AUTHOR_ID` varchar(50) NOT NULL,
  `CREATION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CATEGORY_ID` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `AUTHOR_ID` (`AUTHOR_ID`),
  KEY `CATEGORY_ID` (`CATEGORY_ID`),
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`AUTHOR_ID`) REFERENCES `users` (`username`),
  CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (2,'Lemon Delicious','Step 1\nPreheat oven to 180C/160C fan forced. Grease six 250ml (1 cup) ovenproof dishes or teacups.\nStep 2\nPlace the butter, lemon rind, lemon juice, sugar, flour, milk and egg yolks in a bowl. Whisk to combine.\nStep 3\nUse electric beaters to beat egg whites on high until soft peaks form. Use a metal spoon to fold one-quarter of the egg white into the lemon mixture. Gently fold in the remaining egg white.\nStep 4\nSpoon mixture into prepared dishes and place in a large baking dish. Pour enough boiling water into baking dish to come halfway up the sides of the smaller dishes. Bake for 25-30 minutes or until golden and just set. Dust with icing sugar, top with cream and sprinkle with extra zest.','botose','2014-09-16 12:12:54',7),(3,'Maple banana cake with caramel bananas','Step 1\nFor the bananas, place butter and sugar in a pan over low heat, stirring to dissolve the sugar. Add banana and cook, turning to coat in the caramel, for 2-3 minutes until caramelised. Add the cream, then remove from heat. Set aside and keep warm.\nStep 2\nPreheat the oven to 180°C. Grease a 2L bundt cake pan and dust with flour.\nStep 3\nBeat eggs, butter, brown sugar, maple syrup and vanilla in an electric mixer for 5 minutes or until thick. Beat banana and creme fraiche into the batter. Sift in flour, baking powder and cinnamon, then mix until combined. Spread into the pan and bake for 35 minutes or until a skewer comes out clean. Cool for 5 minutes, then transfer to a wire rack. Dust with icing sugar and drizzle with caramel. Serve warm with caramel bananas and yoghurt.','gbalazs','2014-09-16 12:28:54',8),(5,'Italian meatloaf','Step 1\nPreheat oven to 180C. Line a shallow roasting dish with baking paper. Combine all ingredients and press mixture firmly into a loaf tin (about 25cm x 11cm) to shape then unmould on to prepared tray.\nStep 2\nBrush meatloaf liberally with tomato ketchup. Bake until juices run clear when loaf is pricked and it feels bouncy when pressed, about 1 hour.','ganiko','2014-09-16 14:29:26',9);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','youShallNotPass',1),('Anonymus','admin',0),('botose','1234',1),('Fanni','Elemer',1),('ganiko','ganiko',1),('gbalazs','gbalazs',1),('Jani','pillinger',1),('joe','12345',1),('Laci','12345',1);
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

-- Dump completed on 2014-09-17  8:20:43
