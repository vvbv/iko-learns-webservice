-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-11-2017 a las 01:49:15
-- Versión del servidor: 5.7.17
-- Versión de PHP: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `iko_learns`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numeros_ronda`
--

CREATE TABLE IF NOT EXISTS `numeros_ronda` (
`id` bigint(20) NOT NULL,
  `numero_ronda` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

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

CREATE TABLE IF NOT EXISTS `palabras` (
`id` bigint(20) NOT NULL,
  `palabra_ingles` varchar(80) NOT NULL,
  `palabra_ingles_yolo` varchar(80) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `palabras`
--

INSERT INTO `palabras` (`id`, `palabra_ingles`, `palabra_ingles_yolo`) VALUES
(7, 'apple', 'apple'),
(5, 'book', 'book'),
(4, 'chair', 'chair'),
(1, 'computer', 'computer'),
(2, 'orange', 'orange'),
(8, 'piano', 'piano'),
(3, 'table', 'table'),
(6, 'tv', 'tvmonitor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `powerups`
--

CREATE TABLE IF NOT EXISTS `powerups` (
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

CREATE TABLE IF NOT EXISTS `puntos` (
`id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `puntos` int(11) NOT NULL,
  `fecha_hora_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puntos`
--

INSERT INTO `puntos` (`id`, `id_usuario`, `puntos`, `fecha_hora_registro`) VALUES
(1, 1, 126080, '2017-11-19 04:51:30'),
(2, 2, 55, '2017-11-19 05:18:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trivias`
--

CREATE TABLE IF NOT EXISTS `trivias` (
`id` bigint(20) NOT NULL,
  `pregunta` text NOT NULL,
  `opcion_a` bigint(20) NOT NULL,
  `opcion_b` bigint(20) NOT NULL,
  `opcion_c` bigint(20) NOT NULL,
  `opcion_d` bigint(20) NOT NULL,
  `respuesta_correcta` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trivias`
--

INSERT INTO `trivias` (`id`, `pregunta`, `opcion_a`, `opcion_b`, `opcion_c`, `opcion_d`, `respuesta_correcta`) VALUES
(1, '¿Ordenador en inglés?', 2, 3, 4, 1, 1),
(2, 'La combinación de amarillo y rojo da ...', 3, 2, 1, 5, 2),
(3, 'A Sir Isaac Newton lo golpeó una ...', 1, 3, 5, 7, 7),
(4, 'Beethoven tocaba el ...', 8, 3, 2, 7, 8),
(5, 'Cuando me quiero relajar un rato, me pongo a leer un ... de aventuras.', 2, 5, 6, 7, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trivias_retos`
--

CREATE TABLE IF NOT EXISTS `trivias_retos` (
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Disparadores `trivias_retos`
--
DELIMITER //
CREATE TRIGGER `electorAutomaticoTrivias` BEFORE INSERT ON `trivias_retos`
 FOR EACH ROW BEGIN

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
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trivias_solo_resueltas`
--

CREATE TABLE IF NOT EXISTS `trivias_solo_resueltas` (
`id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_trivia` bigint(20) NOT NULL,
  `fecha_hora_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trivia_reto_ronda`
--

CREATE TABLE IF NOT EXISTS `trivia_reto_ronda` (
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

CREATE TABLE IF NOT EXISTS `usuarios` (
`id` bigint(20) NOT NULL,
  `id_facebook` varchar(120) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nivel` bigint(20) NOT NULL DEFAULT '0',
  `fecha_hora_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `id_facebook`, `username`, `nombres`, `apellidos`, `password`, `nivel`, `fecha_hora_registro`) VALUES
(1, '123456789', NULL, NULL, NULL, NULL, 106, '2017-11-04 23:29:13'),
(2, '987654321', NULL, NULL, NULL, NULL, 0, '2017-11-04 23:29:13'),
(15, '9512357', NULL, NULL, NULL, NULL, 0, '2017-11-19 06:33:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_powerups`
--

CREATE TABLE IF NOT EXISTS `usuarios_powerups` (
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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `numeros_ronda`
--
ALTER TABLE `numeros_ronda`
 ADD PRIMARY KEY (`id`), ADD KEY `numero_ronda` (`numero_ronda`);

--
-- Indices de la tabla `palabras`
--
ALTER TABLE `palabras`
 ADD PRIMARY KEY (`id`), ADD KEY `palabra_ingles` (`palabra_ingles`,`palabra_ingles_yolo`);

--
-- Indices de la tabla `powerups`
--
ALTER TABLE `powerups`
 ADD PRIMARY KEY (`id_powerup`);

--
-- Indices de la tabla `puntos`
--
ALTER TABLE `puntos`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_usuario_2` (`id_usuario`), ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `trivias`
--
ALTER TABLE `trivias`
 ADD PRIMARY KEY (`id`), ADD KEY `opcion_a` (`opcion_a`,`opcion_b`,`opcion_c`,`opcion_d`,`respuesta_correcta`), ADD KEY `opcion_a_2` (`opcion_a`), ADD KEY `opcion_b` (`opcion_b`), ADD KEY `opcion_c` (`opcion_c`), ADD KEY `opcion_d` (`opcion_d`), ADD KEY `respuesta_correcta` (`respuesta_correcta`);

--
-- Indices de la tabla `trivias_retos`
--
ALTER TABLE `trivias_retos`
 ADD PRIMARY KEY (`id`), ADD KEY `id_usuario_retador` (`id_usuario_retador`);

--
-- Indices de la tabla `trivias_solo_resueltas`
--
ALTER TABLE `trivias_solo_resueltas`
 ADD PRIMARY KEY (`id`), ADD KEY `id_usuario` (`id_usuario`,`id_trivia`), ADD KEY `id_trivia` (`id_trivia`);

--
-- Indices de la tabla `trivia_reto_ronda`
--
ALTER TABLE `trivia_reto_ronda`
 ADD PRIMARY KEY (`id`), ADD KEY `id_trivia` (`id_trivia`), ADD KEY `id_trivia_2` (`id_trivia`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_facebook` (`id_facebook`), ADD UNIQUE KEY `nombres` (`nombres`);

--
-- Indices de la tabla `usuarios_powerups`
--
ALTER TABLE `usuarios_powerups`
 ADD PRIMARY KEY (`user_id`,`power_id`), ADD UNIQUE KEY `user_id` (`user_id`,`power_id`), ADD KEY `power_id` (`power_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `numeros_ronda`
--
ALTER TABLE `numeros_ronda`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `palabras`
--
ALTER TABLE `palabras`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `puntos`
--
ALTER TABLE `puntos`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `trivias`
--
ALTER TABLE `trivias`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `trivias_retos`
--
ALTER TABLE `trivias_retos`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
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
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
