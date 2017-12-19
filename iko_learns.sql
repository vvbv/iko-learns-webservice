-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-12-2017 a las 01:32:59
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `iko_learns`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numeros_ronda`
--

CREATE TABLE `numeros_ronda` (
  `id` bigint(20) NOT NULL,
  `numero_ronda` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `numeros_ronda`
--

INSERT INTO `numeros_ronda` (`id`, `numero_ronda`, `descripcion`) VALUES
(1, 1, 'Ronda número 1'),
(2, 2, 'Ronda número 2'),
(3, 3, 'Ronda número 3'),
(4, 4, 'Ronda número 4'),
(5, 5, 'Ronda número 5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `palabras`
--

CREATE TABLE `palabras` (
  `id` bigint(20) NOT NULL,
  `palabra_ingles` varchar(80) NOT NULL,
  `palabra_ingles_yolo` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `palabras`
--

INSERT INTO `palabras` (`id`, `palabra_ingles`, `palabra_ingles_yolo`) VALUES
(40, 'A', ''),
(49, 'A boy', ''),
(50, 'A girl', ''),
(46, 'A man', ''),
(48, 'A woman', ''),
(41, 'am', ''),
(42, 'An', ''),
(51, 'An apple', ''),
(47, 'An orange', ''),
(7, 'apple', 'apple'),
(33, 'are', ''),
(56, 'bed', 'bed'),
(5, 'book', 'book'),
(9, 'boy', ''),
(57, 'car', 'car'),
(61, 'cellphone', 'cell_phone'),
(4, 'chair', 'chair'),
(63, 'clock', 'clock'),
(1, 'computer', 'computer'),
(58, 'cup', 'cup'),
(59, 'dog', 'dog'),
(52, 'eat', ''),
(38, 'from', ''),
(10, 'girl', 'girl'),
(20, 'good', ''),
(28, 'good morning', ''),
(26, 'goodbye', ''),
(34, 'he', ''),
(37, 'he', ''),
(54, 'He eats an apple', ''),
(44, 'He is', ''),
(55, 'He is eats an orange', ''),
(39, 'I', ''),
(43, 'I am', ''),
(31, 'is', ''),
(60, 'laptop', 'laptop'),
(11, 'man', 'man'),
(21, 'morning', ''),
(67, 'motorbike', 'motorbike'),
(36, 'my', ''),
(15, 'name', ''),
(2, 'orange', 'orange'),
(8, 'piano', 'piano'),
(23, 'refrigerator', 'refrigerator'),
(69, 'scissors', 'scissors'),
(35, 'she', ''),
(53, 'She eats an apple', ''),
(45, 'Speak', ''),
(3, 'table', 'table'),
(24, 'thanks', ''),
(27, 'thanks you', ''),
(6, 'tv', 'tvmonitor'),
(16, 'what', ''),
(14, 'what you name', ''),
(29, 'what your name?', ''),
(12, 'woman', 'woman'),
(25, 'you', ''),
(17, 'your', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `powerups`
--

CREATE TABLE `powerups` (
  `id_powerup` int(11) NOT NULL,
  `accion` varchar(45) DEFAULT NULL,
  `icono` blob,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `powerups`
--

INSERT INTO `powerups` (`id_powerup`, `accion`, `icono`, `nombre`, `descripcion`) VALUES
(1, 'intentos_restantes', NULL, 'vidas', 'Adiciona una vida mas.'),
(2, 'repetir_prueba', NULL, 'masmelos', 'Permite repetir la prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos`
--

CREATE TABLE `puntos` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `puntos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puntos`
--

INSERT INTO `puntos` (`id`, `id_usuario`, `puntos`) VALUES
(1, 1, 90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trivias`
--

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
-- Volcado de datos para la tabla `trivias`
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
-- Estructura de tabla para la tabla `trivias_retos`
--

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
-- Disparadores `trivias_retos`
--
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
-- Estructura de tabla para la tabla `trivias_solo_resueltas`
--

CREATE TABLE `trivias_solo_resueltas` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_trivia` bigint(20) NOT NULL,
  `fecha_hora_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trivia_reto_ronda`
--

CREATE TABLE `trivia_reto_ronda` (
  `id` bigint(20) NOT NULL,
  `id_trivia` bigint(20) NOT NULL,
  `id_palabra_respuesta_usuario_retador` bigint(20) NOT NULL,
  `id_palabra_respuesta_usuario_retado` bigint(20) NOT NULL,
  `fecha_hora_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `id_facebook` varchar(120) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nivel` int(11) NOT NULL,
  `fecha_hora_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `id_facebook`, `username`, `nombres`, `apellidos`, `password`, `nivel`, `fecha_hora_registro`) VALUES
(1, '123456789', NULL, NULL, NULL, NULL, 0, '2017-11-04 23:29:13'),
(2, '987654321', NULL, NULL, NULL, NULL, 0, '2017-11-04 23:29:13'),
(3, '1533632516732830', 'user1533632516732830', 'xx', 'xx', 'xx', 0, '2017-12-19 00:29:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_powerups`
--

CREATE TABLE `usuarios_powerups` (
  `user_id` bigint(20) NOT NULL,
  `power_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios_powerups`
--

INSERT INTO `usuarios_powerups` (`user_id`, `power_id`, `fecha`, `cantidad`) VALUES
(2, 1, '2017-11-06 00:00:00', 2),
(2, 2, '2017-11-06 00:00:00', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vidas`
--

CREATE TABLE `vidas` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `vidas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `numeros_ronda`
--
ALTER TABLE `numeros_ronda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numero_ronda` (`numero_ronda`);

--
-- Indices de la tabla `palabras`
--
ALTER TABLE `palabras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `palabra_ingles` (`palabra_ingles`,`palabra_ingles_yolo`);

--
-- Indices de la tabla `powerups`
--
ALTER TABLE `powerups`
  ADD PRIMARY KEY (`id_powerup`);

--
-- Indices de la tabla `puntos`
--
ALTER TABLE `puntos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `trivias`
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
-- Indices de la tabla `trivias_retos`
--
ALTER TABLE `trivias_retos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario_retador` (`id_usuario_retador`);

--
-- Indices de la tabla `trivias_solo_resueltas`
--
ALTER TABLE `trivias_solo_resueltas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`,`id_trivia`),
  ADD KEY `id_trivia` (`id_trivia`);

--
-- Indices de la tabla `trivia_reto_ronda`
--
ALTER TABLE `trivia_reto_ronda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_trivia` (`id_trivia`),
  ADD KEY `id_trivia_2` (`id_trivia`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombres` (`nombres`);

--
-- Indices de la tabla `usuarios_powerups`
--
ALTER TABLE `usuarios_powerups`
  ADD PRIMARY KEY (`user_id`,`power_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`power_id`),
  ADD KEY `power_id` (`power_id`);

--
-- Indices de la tabla `vidas`
--
ALTER TABLE `vidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `numeros_ronda`
--
ALTER TABLE `numeros_ronda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `palabras`
--
ALTER TABLE `palabras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `puntos`
--
ALTER TABLE `puntos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `trivias`
--
ALTER TABLE `trivias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `trivias_retos`
--
ALTER TABLE `trivias_retos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `trivias_solo_resueltas`
--
ALTER TABLE `trivias_solo_resueltas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trivia_reto_ronda`
--
ALTER TABLE `trivia_reto_ronda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `vidas`
--
ALTER TABLE `vidas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `puntos`
--
ALTER TABLE `puntos`
  ADD CONSTRAINT `fk_puntos_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `trivias`
--
ALTER TABLE `trivias`
  ADD CONSTRAINT `trivias_ibfk_1` FOREIGN KEY (`opcion_a`) REFERENCES `palabras` (`id`),
  ADD CONSTRAINT `trivias_ibfk_2` FOREIGN KEY (`opcion_b`) REFERENCES `palabras` (`id`),
  ADD CONSTRAINT `trivias_ibfk_3` FOREIGN KEY (`opcion_c`) REFERENCES `palabras` (`id`),
  ADD CONSTRAINT `trivias_ibfk_4` FOREIGN KEY (`opcion_d`) REFERENCES `palabras` (`id`),
  ADD CONSTRAINT `trivias_ibfk_5` FOREIGN KEY (`respuesta_correcta`) REFERENCES `palabras` (`id`);

--
-- Filtros para la tabla `trivias_retos`
--
ALTER TABLE `trivias_retos`
  ADD CONSTRAINT `trivias_retos_ibfk_1` FOREIGN KEY (`id_usuario_retador`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `trivias_solo_resueltas`
--
ALTER TABLE `trivias_solo_resueltas`
  ADD CONSTRAINT `trivias_solo_resueltas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `trivias_solo_resueltas_ibfk_2` FOREIGN KEY (`id_trivia`) REFERENCES `trivias` (`id`);

--
-- Filtros para la tabla `trivia_reto_ronda`
--
ALTER TABLE `trivia_reto_ronda`
  ADD CONSTRAINT `trivia_reto_ronda_ibfk_1` FOREIGN KEY (`id_trivia`) REFERENCES `trivias` (`id`);

--
-- Filtros para la tabla `usuarios_powerups`
--
ALTER TABLE `usuarios_powerups`
  ADD CONSTRAINT `usuarios_powerups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `usuarios_powerups_ibfk_2` FOREIGN KEY (`power_id`) REFERENCES `powerups` (`id_powerup`);

--
-- Filtros para la tabla `vidas`
--
ALTER TABLE `vidas`
  ADD CONSTRAINT `fk_vidas_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
