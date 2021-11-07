-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2021 a las 15:09:52
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `basedatos2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `idDepartamento` tinyint(4) NOT NULL,
  `codigoDepartamento` tinyint(3) NOT NULL,
  `nombreDepartamento` varchar(40) NOT NULL,
  `presupuestoDepartamento` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`idDepartamento`, `codigoDepartamento`, `nombreDepartamento`, `presupuestoDepartamento`) VALUES
(1, 14, 'Informática', '80000.00'),
(2, 15, 'Gestión', '120000.00'),
(3, 16, 'Comunicación', '75000.00'),
(4, 37, 'Desarrollo', '65000.00'),
(5, 77, 'Investigación', '40000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(11) NOT NULL,
  `dni` int(8) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `codigoDepartamento` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `dni`, `nombre`, `apellido`, `codigoDepartamento`) VALUES
(1, 31096678, 'Juan', 'Lopez', 14),
(2, 31096675, 'Martin', 'Zarabia', 77),
(3, 34269854, 'Jose', 'Velez', 77),
(4, 41369852, 'Paula', 'Madariaga', 77),
(5, 33698521, 'Pedro', 'Pérez', 14),
(6, 32698547, 'Mariana', 'López', 15),
(7, 42369854, 'Abril', 'Sánchez', 37),
(8, 36125896, 'Martina', 'Juarez', 14),
(9, 36985471, 'Omar', 'Diaz', 15),
(10, 32145698, 'Guadalupe', 'Pérez', 77),
(11, 32369854, 'Bernardo', 'Pantera', 37),
(12, 36125965, 'Lucia', 'Pesano', 14),
(13, 31236985, 'María', 'Donoso', 14),
(14, 32698547, 'Carmen', 'Barbieri', 16);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`idDepartamento`),
  ADD UNIQUE KEY `codigoDepartamento` (`codigoDepartamento`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `codigoDepartamento` (`codigoDepartamento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `idDepartamento` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`codigoDepartamento`) REFERENCES `departamentos` (`codigoDepartamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
