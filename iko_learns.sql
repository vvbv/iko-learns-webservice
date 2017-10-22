-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 21-10-2017 a las 21:02:20
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
-- Estructura de tabla para la tabla `palabras`
--

CREATE TABLE IF NOT EXISTS `palabras` (
`id` bigint(20) NOT NULL,
  `palabra_ingles` varchar(80) NOT NULL,
  `palabra_ingles_yolo` varchar(80) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `palabras`
--

INSERT INTO `palabras` (`id`, `palabra_ingles`, `palabra_ingles_yolo`) VALUES
(5, 'book', 'book'),
(4, 'chair', 'chair'),
(1, 'computer', 'computer'),
(2, 'orange', 'orange'),
(3, 'table', 'table'),
(6, 'tv', 'tvmonitor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos`
--

CREATE TABLE IF NOT EXISTS `puntos` (
`id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `puntos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trivias`
--

INSERT INTO `trivias` (`id`, `pregunta`, `opcion_a`, `opcion_b`, `opcion_c`, `opcion_d`, `respuesta_correcta`) VALUES
(1, '¿Ordenador en inglés?', 2, 3, 4, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trivias_resueltas`
--

CREATE TABLE IF NOT EXISTS `trivias_resueltas` (
`id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_trivia` bigint(20) NOT NULL,
  `fecha_hora_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
`id` bigint(20) NOT NULL,
  `id_facebook` varchar(120) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `id_facebook`) VALUES
(1, '123456789');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `palabras`
--
ALTER TABLE `palabras`
 ADD PRIMARY KEY (`id`), ADD KEY `palabra_ingles` (`palabra_ingles`,`palabra_ingles_yolo`);

--
-- Indices de la tabla `puntos`
--
ALTER TABLE `puntos`
 ADD PRIMARY KEY (`id`), ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `trivias`
--
ALTER TABLE `trivias`
 ADD PRIMARY KEY (`id`), ADD KEY `opcion_a` (`opcion_a`,`opcion_b`,`opcion_c`,`opcion_d`,`respuesta_correcta`), ADD KEY `opcion_a_2` (`opcion_a`), ADD KEY `opcion_b` (`opcion_b`), ADD KEY `opcion_c` (`opcion_c`), ADD KEY `opcion_d` (`opcion_d`), ADD KEY `respuesta_correcta` (`respuesta_correcta`);

--
-- Indices de la tabla `trivias_resueltas`
--
ALTER TABLE `trivias_resueltas`
 ADD PRIMARY KEY (`id`), ADD KEY `id_usuario` (`id_usuario`,`id_trivia`), ADD KEY `id_trivia` (`id_trivia`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `palabras`
--
ALTER TABLE `palabras`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `puntos`
--
ALTER TABLE `puntos`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `trivias`
--
ALTER TABLE `trivias`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `trivias_resueltas`
--
ALTER TABLE `trivias_resueltas`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
-- Filtros para la tabla `trivias_resueltas`
--
ALTER TABLE `trivias_resueltas`
ADD CONSTRAINT `trivias_resueltas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
ADD CONSTRAINT `trivias_resueltas_ibfk_2` FOREIGN KEY (`id_trivia`) REFERENCES `trivias` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
