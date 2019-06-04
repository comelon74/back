-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2019 a las 20:26:39
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_exodus`
--
CREATE DATABASE IF NOT EXISTS `db_exodus` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_exodus`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `a_pacientes`
--

CREATE TABLE `a_pacientes` (
  `pd_id` int(11) NOT NULL,
  `pa_nombre` varchar(32) NOT NULL,
  `pa_apellido_p` varchar(32) NOT NULL,
  `pa_apellido_m` varchar(32) NOT NULL,
  `pa_ocupacion` int(1) NOT NULL,
  `pa_estado_civil` int(1) NOT NULL,
  `pa_escolaridad` int(1) NOT NULL,
  `pa_alcohol` int(1) NOT NULL,
  `pa_drogas` int(1) NOT NULL,
  `pa_tabaco` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `a_pacientes`
--

INSERT INTO `a_pacientes` (`pd_id`, `pa_nombre`, `pa_apellido_p`, `pa_apellido_m`, `pa_ocupacion`, `pa_estado_civil`, `pa_escolaridad`, `pa_alcohol`, `pa_drogas`, `pa_tabaco`) VALUES
(1, 'JORGE', 'PINEDA', 'LOPEZ', 1, 1, 3, 0, 0, 0),
(2, 'ALEJANDRO', 'PARRA', 'VILLA', 1, 1, 3, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_citas`
--

CREATE TABLE `c_citas` (
  `ci_id` int(11) NOT NULL,
  `ci_fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ci_paciente` int(11) NOT NULL,
  `ci_doctor` int(11) NOT NULL,
  `ci_consultorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `c_citas`
--

INSERT INTO `c_citas` (`ci_id`, `ci_fecha`, `ci_paciente`, `ci_doctor`, `ci_consultorio`) VALUES
(1, '2019-06-03 18:18:41', 1, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `h_historial_c`
--

CREATE TABLE `h_historial_c` (
  `hc_id` int(11) NOT NULL,
  `hc_paciente` int(11) NOT NULL,
  `hc_fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hc_doctir` int(11) NOT NULL,
  `hc_anotaciones` text NOT NULL,
  `hc_enfermedades` varchar(255) NOT NULL,
  `hc_alergias` varchar(255) NOT NULL,
  `hc_hospitalizado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_diagnostico`
--

CREATE TABLE `r_diagnostico` (
  `di_id` int(11) NOT NULL,
  `di_fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `di_paciente` int(11) NOT NULL,
  `di_doctor` int(11) NOT NULL,
  `di_resultados` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_rangos`
--

CREATE TABLE `r_rangos` (
  `ra_id` int(3) NOT NULL,
  `ra_nombre` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `r_recetas`
--

CREATE TABLE `r_recetas` (
  `re_id` int(11) NOT NULL,
  `re_paciente` int(11) NOT NULL,
  `re_contenido` text NOT NULL,
  `re_doctor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `s_salas`
--

CREATE TABLE `s_salas` (
  `sa_id` int(11) NOT NULL,
  `sa_camilla` int(11) NOT NULL,
  `sa_paciente` int(11) NOT NULL,
  `sa_doctor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `w_usuarios`
--

CREATE TABLE `w_usuarios` (
  `us_id` int(11) NOT NULL,
  `us_nombre` varchar(64) NOT NULL,
  `us_correo` varchar(64) NOT NULL,
  `us_passwd` varchar(64) NOT NULL,
  `us_rango` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_escolaridad`
--

CREATE TABLE `z_escolaridad` (
  `es_id` int(11) NOT NULL,
  `es_nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `z_escolaridad`
--

INSERT INTO `z_escolaridad` (`es_id`, `es_nombre`) VALUES
(1, 'PRIMARIA'),
(2, 'SECUNDARIA'),
(3, 'PREPARATORIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `z_estado_civil`
--

CREATE TABLE `z_estado_civil` (
  `ec_id` int(11) NOT NULL,
  `ec_nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `z_estado_civil`
--

INSERT INTO `z_estado_civil` (`ec_id`, `ec_nombre`) VALUES
(1, 'SOLTERO'),
(2, 'CASADO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `a_pacientes`
--
ALTER TABLE `a_pacientes`
  ADD PRIMARY KEY (`pd_id`);

--
-- Indices de la tabla `c_citas`
--
ALTER TABLE `c_citas`
  ADD PRIMARY KEY (`ci_id`);

--
-- Indices de la tabla `h_historial_c`
--
ALTER TABLE `h_historial_c`
  ADD PRIMARY KEY (`hc_id`);

--
-- Indices de la tabla `r_rangos`
--
ALTER TABLE `r_rangos`
  ADD PRIMARY KEY (`ra_id`);

--
-- Indices de la tabla `r_recetas`
--
ALTER TABLE `r_recetas`
  ADD PRIMARY KEY (`re_id`);

--
-- Indices de la tabla `s_salas`
--
ALTER TABLE `s_salas`
  ADD PRIMARY KEY (`sa_id`);

--
-- Indices de la tabla `w_usuarios`
--
ALTER TABLE `w_usuarios`
  ADD PRIMARY KEY (`us_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `c_citas`
--
ALTER TABLE `c_citas`
  MODIFY `ci_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `h_historial_c`
--
ALTER TABLE `h_historial_c`
  MODIFY `hc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `r_rangos`
--
ALTER TABLE `r_rangos`
  MODIFY `ra_id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `r_recetas`
--
ALTER TABLE `r_recetas`
  MODIFY `re_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `s_salas`
--
ALTER TABLE `s_salas`
  MODIFY `sa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `w_usuarios`
--
ALTER TABLE `w_usuarios`
  MODIFY `us_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
