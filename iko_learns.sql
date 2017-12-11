-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 11, 2017 at 08:09 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iko_learns`
--

-- --------------------------------------------------------

--
-- Table structure for table `numeros_ronda`
--

DROP TABLE IF EXISTS `numeros_ronda`;
CREATE TABLE `numeros_ronda` (
  `id` bigint(20) NOT NULL,
  `numero_ronda` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `numeros_ronda`
--

INSERT INTO `numeros_ronda` (`id`, `numero_ronda`, `descripcion`) VALUES
(1, 1, 'Ronda número 1'),
(2, 2, 'Ronda número 2'),
(3, 3, 'Ronda número 3'),
(4, 4, 'Ronda número 4'),
(5, 5, 'Ronda número 5');

-- --------------------------------------------------------

--
-- Table structure for table `palabras`
--

DROP TABLE IF EXISTS `palabras`;
CREATE TABLE `palabras` (
  `id` bigint(20) NOT NULL,
  `palabra_ingles` varchar(80) NOT NULL,
  `palabra_ingles_yolo` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `palabras`
--

INSERT INTO `palabras` (`id`, `palabra_ingles`, `palabra_ingles_yolo`) VALUES
(40, 'A', 'null'),
(49, 'A boy', 'null'),
(50, 'A girl', 'null'),
(46, 'A man', 'null'),
(48, 'A woman', 'null'),
(41, 'am', 'null'),
(42, 'An', 'null'),
(51, 'An apple', 'null'),
(47, 'An orange', 'null'),
(7, 'apple', 'apple'),
(33, 'are', 'null'),
(56, 'bed', 'bed'),
(5, 'book', 'book'),
(9, 'boy', 'null'),
(57, 'car', 'car'),
(61, 'cellphone', 'cell_phone'),
(4, 'chair', 'chair'),
(63, 'clock', 'clock'),
(1, 'computer', 'computer'),
(58, 'cup', 'cup'),
(59, 'dog', 'dog'),
(52, 'eat', 'null'),
(38, 'from', 'null'),
(10, 'girl', 'girl'),
(20, 'good', 'null'),
(28, 'good morning', 'null'),
(26, 'goodbye', 'null'),
(34, 'he', 'null'),
(37, 'he', 'null'),
(54, 'He eats an apple', 'null'),
(44, 'He is', 'null'),
(55, 'He is eats an orange', 'null'),
(39, 'I', 'null'),
(43, 'I am', 'null'),
(31, 'is', 'null'),
(60, 'laptop', 'laptop'),
(11, 'man', 'man'),
(21, 'morning', 'null'),
(67, 'motorbike', 'motorbike'),
(36, 'my', 'null'),
(15, 'name', 'null'),
(2, 'orange', 'orange'),
(8, 'piano', 'piano'),
(23, 'refrigerator', 'refrigerator'),
(69, 'scissors', 'scissors'),
(35, 'she', 'null'),
(53, 'She eats an apple', 'null'),
(45, 'Speak', 'null'),
(3, 'table', 'table'),
(24, 'thanks', 'null'),
(27, 'thanks you', 'null'),
(6, 'tv', 'tvmonitor'),
(16, 'what', 'null'),
(14, 'what you name', 'null'),
(29, 'what your name?', 'null'),
(12, 'woman', 'woman'),
(25, 'you', 'null'),
(17, 'your', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `powerups`
--

DROP TABLE IF EXISTS `powerups`;
CREATE TABLE `powerups` (
  `id_powerup` int(11) NOT NULL,
  `accion` varchar(45) DEFAULT NULL,
  `icono` blob,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `powerups`
--

INSERT INTO `powerups` (`id_powerup`, `accion`, `icono`, `nombre`, `descripcion`) VALUES
(1, 'intentos_restantes', NULL, 'vidas', 'Adiciona una vida mas.'),
(2, 'repetir_prueba', NULL, 'masmelos', 'Permite repetir la prueba');

-- --------------------------------------------------------

--
-- Table structure for table `puntos`
--

DROP TABLE IF EXISTS `puntos`;
CREATE TABLE `puntos` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `puntos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `puntos`
--

INSERT INTO `puntos` (`id`, `id_usuario`, `puntos`) VALUES
(1, 1, 90);

-- --------------------------------------------------------

--
-- Table structure for table `trivias`
--

DROP TABLE IF EXISTS `trivias`;
CREATE TABLE `trivias` (
  `id` bigint(20) NOT NULL,
  `pregunta` text NOT NULL,
  `opcion_a` bigint(20) NOT NULL,
  `opcion_b` bigint(20) NOT NULL,
  `opcion_c` bigint(20) NOT NULL,
  `opcion_d` bigint(20) NOT NULL,
  `respuesta_correcta` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trivias`
--

INSERT INTO `trivias` (`id`, `pregunta`, `opcion_a`, `opcion_b`, `opcion_c`, `opcion_d`, `respuesta_correcta`) VALUES
(1, '¿Ordenador en inglés?', 2, 3, 4, 1, 1),
(2, 'La combinación de amarillo y rojo da ...', 3, 2, 1, 5, 2),
(3, 'A Sir Isaac Newton lo golpeó una ...', 1, 3, 5, 7, 7),
(4, 'Beethoven tocaba el ...', 8, 3, 2, 7, 8),
(5, 'Cuando me quiero relajar un rato, me pongo a leer un ... de aventuras.', 2, 5, 6, 7, 5),
(6, '¿Cual es tu nombre?', 29, 28, 15, 14, 29),
(7, 'nombre', 15, 2, 10, 25, 15),
(8, 'tu o usted ', 6, 25, 17, 26, 25),
(9, 'Yo soy ó Yo estoy', 9, 39, 41, 43, 43),
(10, 'Cuál o Qué', 20, 17, 16, 33, 16),
(11, 'El es ó El esta', 43, 44, 34, 35, 44),
(12, 'Ella', 37, 35, 36, 11, 35),
(13, 'Hablar', 44, 23, 45, 20, 45),
(14, 'Un hombre', 15, 11, 46, 10, 46),
(15, 'Naranja', 2, 37, 17, 7, 2),
(16, 'Un o Una', 31, 41, 40, 35, 40),
(17, 'Un o Una', 42, 46, 39, 34, 42),
(18, 'Una naranja', 46, 2, 47, 43, 47),
(19, 'Una manzana', 47, 49, 7, 51, 51),
(20, 'Una chica', 49, 10, 50, 51, 50),
(21, 'Un chico', 46, 49, 48, 35, 49),
(22, 'niña o chica', 10, 48, 9, 27, 10),
(23, 'comer', 1, 8, 52, 25, 52),
(24, 'Ella come una manzana', 53, 54, 55, 28, 53),
(25, 'El come una naranja', 54, 55, 28, 27, 55),
(26, 'El come una manzana', 29, 54, 53, 27, 54),
(27, 'Gracias', 27, 50, 26, 29, 27),
(28, 'adiós', 28, 27, 26, 52, 26);

-- --------------------------------------------------------

--
-- Table structure for table `trivias_retos`
--

DROP TABLE IF EXISTS `trivias_retos`;
CREATE TABLE `trivias_retos` (
  `id` bigint(20) NOT NULL,
  `id_usuario_retador` bigint(20) NOT NULL,
  `id_usuario_retado` bigint(20) DEFAULT NULL,
  `id_ronda_1` bigint(20) DEFAULT NULL,
  `id_ronda_2` bigint(20) DEFAULT NULL,
  `id_ronda_3` bigint(20) DEFAULT NULL,
  `id_ronda_4` bigint(20) DEFAULT NULL,
  `id_ronda_5` bigint(20) DEFAULT NULL,
  `id_usuario_ganador` bigint(20) DEFAULT NULL,
  `fecha_hora_Registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activa_hace` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `trivias_retos`
--
DROP TRIGGER IF EXISTS `electorAutomaticoTrivias`;
DELIMITER $$
CREATE TRIGGER `electorAutomaticoTrivias` BEFORE INSERT ON `trivias_retos` FOR EACH ROW BEGIN

	DECLARE id_ronda_1 BIGINT;
    DECLARE id_ronda_2 BIGINT;
    DECLARE id_ronda_3 BIGINT;
    DECLARE id_ronda_4 BIGINT;
    DECLARE id_ronda_5 BIGINT;

	SET id_ronda_1 = (SELECT id FROM trivias ORDER BY RAND() LIMIT 1);
    
	SET id_ronda_2 = (SELECT id FROM trivias WHERE trivias.id <> id_ronda_1 ORDER BY RAND() LIMIT 1);
    
	SET id_ronda_3 = (SELECT id FROM trivias WHERE trivias.id <> id_ronda_1 AND trivias.id <> id_ronda_2 ORDER BY RAND() LIMIT 1);
    
	SET id_ronda_4 = (SELECT id FROM trivias WHERE trivias.id <> id_ronda_1 AND trivias.id <> id_ronda_2 AND trivias.id <> id_ronda_3 ORDER BY RAND() LIMIT 1);
    
	SET id_ronda_5 = (SELECT id FROM trivias WHERE trivias.id <> id_ronda_1 AND trivias.id <> id_ronda_2 AND trivias.id <> id_ronda_3 AND trivias.id <> id_ronda_4 ORDER BY RAND() LIMIT 1);
	
    SET NEW.id_ronda_1 = id_ronda_1;
    SET NEW.id_ronda_2 = id_ronda_2;
    SET NEW.id_ronda_3 = id_ronda_3;
    SET NEW.id_ronda_4 = id_ronda_4;
    SET NEW.id_ronda_5 = id_ronda_5;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `trivias_solo_resueltas`
--

DROP TABLE IF EXISTS `trivias_solo_resueltas`;
CREATE TABLE `trivias_solo_resueltas` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_trivia` bigint(20) NOT NULL,
  `fecha_hora_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trivia_reto_ronda`
--

DROP TABLE IF EXISTS `trivia_reto_ronda`;
CREATE TABLE `trivia_reto_ronda` (
  `id` bigint(20) NOT NULL,
  `id_trivia` bigint(20) NOT NULL,
  `id_palabra_respuesta_usuario_retador` bigint(20) NOT NULL,
  `id_palabra_respuesta_usuario_retado` bigint(20) NOT NULL,
  `fecha_hora_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `id_facebook` varchar(120) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `fecha_hora_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `id_facebook`, `username`, `nombres`, `apellidos`, `password`, `fecha_hora_registro`) VALUES
(1, '123456789', NULL, NULL, NULL, NULL, '2017-11-04 23:29:13'),
(2, '987654321', NULL, NULL, NULL, NULL, '2017-11-04 23:29:13');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_powerups`
--

DROP TABLE IF EXISTS `usuarios_powerups`;
CREATE TABLE `usuarios_powerups` (
  `user_id` bigint(20) NOT NULL,
  `power_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios_powerups`
--

INSERT INTO `usuarios_powerups` (`user_id`, `power_id`, `fecha`, `cantidad`) VALUES
(2, 1, '2017-11-06 00:00:00', 2),
(2, 2, '2017-11-06 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `vidas`
--

DROP TABLE IF EXISTS `vidas`;
CREATE TABLE `vidas` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `vidas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `numeros_ronda`
--
ALTER TABLE `numeros_ronda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numero_ronda` (`numero_ronda`);

--
-- Indexes for table `palabras`
--
ALTER TABLE `palabras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `palabra_ingles` (`palabra_ingles`,`palabra_ingles_yolo`);

--
-- Indexes for table `powerups`
--
ALTER TABLE `powerups`
  ADD PRIMARY KEY (`id_powerup`);

--
-- Indexes for table `puntos`
--
ALTER TABLE `puntos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `trivias`
--
ALTER TABLE `trivias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opcion_a` (`opcion_a`,`opcion_b`,`opcion_c`,`opcion_d`,`respuesta_correcta`),
  ADD KEY `opcion_a_2` (`opcion_a`),
  ADD KEY `opcion_b` (`opcion_b`),
  ADD KEY `opcion_c` (`opcion_c`),
  ADD KEY `opcion_d` (`opcion_d`),
  ADD KEY `respuesta_correcta` (`respuesta_correcta`);

--
-- Indexes for table `trivias_retos`
--
ALTER TABLE `trivias_retos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario_retador` (`id_usuario_retador`);

--
-- Indexes for table `trivias_solo_resueltas`
--
ALTER TABLE `trivias_solo_resueltas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`,`id_trivia`),
  ADD KEY `id_trivia` (`id_trivia`);

--
-- Indexes for table `trivia_reto_ronda`
--
ALTER TABLE `trivia_reto_ronda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_trivia` (`id_trivia`),
  ADD KEY `id_trivia_2` (`id_trivia`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombres` (`nombres`);

--
-- Indexes for table `usuarios_powerups`
--
ALTER TABLE `usuarios_powerups`
  ADD PRIMARY KEY (`user_id`,`power_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`power_id`),
  ADD KEY `power_id` (`power_id`);

--
-- Indexes for table `vidas`
--
ALTER TABLE `vidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `numeros_ronda`
--
ALTER TABLE `numeros_ronda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `palabras`
--
ALTER TABLE `palabras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `puntos`
--
ALTER TABLE `puntos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trivias`
--
ALTER TABLE `trivias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `trivias_retos`
--
ALTER TABLE `trivias_retos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `trivias_solo_resueltas`
--
ALTER TABLE `trivias_solo_resueltas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trivia_reto_ronda`
--
ALTER TABLE `trivia_reto_ronda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vidas`
--
ALTER TABLE `vidas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `puntos`
--
ALTER TABLE `puntos`
  ADD CONSTRAINT `fk_puntos_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `trivias`
--
ALTER TABLE `trivias`
  ADD CONSTRAINT `trivias_ibfk_1` FOREIGN KEY (`opcion_a`) REFERENCES `palabras` (`id`),
  ADD CONSTRAINT `trivias_ibfk_2` FOREIGN KEY (`opcion_b`) REFERENCES `palabras` (`id`),
  ADD CONSTRAINT `trivias_ibfk_3` FOREIGN KEY (`opcion_c`) REFERENCES `palabras` (`id`),
  ADD CONSTRAINT `trivias_ibfk_4` FOREIGN KEY (`opcion_d`) REFERENCES `palabras` (`id`),
  ADD CONSTRAINT `trivias_ibfk_5` FOREIGN KEY (`respuesta_correcta`) REFERENCES `palabras` (`id`);

--
-- Constraints for table `trivias_retos`
--
ALTER TABLE `trivias_retos`
  ADD CONSTRAINT `trivias_retos_ibfk_1` FOREIGN KEY (`id_usuario_retador`) REFERENCES `usuarios` (`id`);

--
-- Constraints for table `trivias_solo_resueltas`
--
ALTER TABLE `trivias_solo_resueltas`
  ADD CONSTRAINT `trivias_solo_resueltas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `trivias_solo_resueltas_ibfk_2` FOREIGN KEY (`id_trivia`) REFERENCES `trivias` (`id`);

--
-- Constraints for table `trivia_reto_ronda`
--
ALTER TABLE `trivia_reto_ronda`
  ADD CONSTRAINT `trivia_reto_ronda_ibfk_1` FOREIGN KEY (`id_trivia`) REFERENCES `trivias` (`id`);

--
-- Constraints for table `usuarios_powerups`
--
ALTER TABLE `usuarios_powerups`
  ADD CONSTRAINT `usuarios_powerups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `usuarios_powerups_ibfk_2` FOREIGN KEY (`power_id`) REFERENCES `powerups` (`id_powerup`);

--
-- Constraints for table `vidas`
--
ALTER TABLE `vidas`
  ADD CONSTRAINT `fk_vidas_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
