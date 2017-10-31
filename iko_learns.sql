-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 31-10-2017 a las 06:16:04
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `iko`
--

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
(5, 'book', 'book'),
(4, 'chair', 'chair'),
(1, 'computer', 'computer'),
(2, 'orange', 'orange'),
(3, 'table', 'table'),
(6, 'tv', 'tvmonitor');

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
(1, 'intentos_restantes', NULL, 'vidas', 'intentos adicionales para realizar una pregunta.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos`
--

CREATE TABLE `puntos` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `puntos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, '¿Ordenador en inglés?', 2, 3, 4, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trivias_resueltas`
--

CREATE TABLE `trivias_resueltas` (
  `id` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `id_trivia` bigint(20) NOT NULL,
  `fecha_hora_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL,
  `id_facebook` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `id_facebook`) VALUES
(1, '123456789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_powerups`
--

CREATE TABLE `usuarios_powerups` (
  `usuarios_id` int(11) NOT NULL,
  `powerups_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios_powerups`
--

INSERT INTO `usuarios_powerups` (`usuarios_id`, `powerups_id`, `fecha`, `cantidad`) VALUES
(1, 1, '2017-10-31 00:00:00', 3);

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `trivias_resueltas`
--
ALTER TABLE `trivias_resueltas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`,`id_trivia`),
  ADD KEY `id_trivia` (`id_trivia`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios_powerups`
--
ALTER TABLE `usuarios_powerups`
  ADD PRIMARY KEY (`usuarios_id`,`powerups_id`),
  ADD KEY `fk_usuarios_powerups_usuario1_idx` (`usuarios_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `palabras`
--
ALTER TABLE `palabras`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `puntos`
--
ALTER TABLE `puntos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trivias`
--
ALTER TABLE `trivias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `trivias_resueltas`
--
ALTER TABLE `trivias_resueltas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
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
-- Filtros para la tabla `trivias_resueltas`
--
ALTER TABLE `trivias_resueltas`
  ADD CONSTRAINT `trivias_resueltas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `trivias_resueltas_ibfk_2` FOREIGN KEY (`id_trivia`) REFERENCES `trivias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
