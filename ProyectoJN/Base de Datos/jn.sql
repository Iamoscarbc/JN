-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2018 a las 00:31:46
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jn`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `idAlumno` int(10) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  `Edad` varchar(2) NOT NULL,
  `Grado` varchar(45) NOT NULL,
  `Sexo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`idAlumno`, `DNI`, `Nombres`, `Apellidos`, `Direccion`, `Telefono`, `Edad`, `Grado`, `Sexo`) VALUES
(3, '45345654', 'Oscar Manuel', 'Bravo Carbajal', 'Av.Los Andes 187', '946448040', '3', '5 años', 'Masculino'),
(8, '73260512', 'Pedro', 'Bravo', 'Jr. Francisco Bolognesi 333', '123456789', '3', '3 años', 'Femenino'),
(41, '45626545', 'Antonio', 'Alvarez Castro', 'Av.Santa Luisa 123', '958956565', '3', '3 años', 'Masculino'),
(53, '75343327', 'Juan Diego', 'Herrera Gomez', 'Jr. Los Andes 136', '949726521', '20', '5 años', 'Masculino'),
(55, '74455896', 'Rafael', 'Cordova', 'Jr.Los Andes 189', '+51956727151', '5', 'Estimulación Temprana', 'Masculino'),
(57, '73260012', 'Rafael ', 'Lopez Cordova', 'Jr. Los Quechuas Mz. K Lt. 4', '956727151', '5', '5 años', 'Masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `idCurso` int(10) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idCurso`, `Nombre`) VALUES
(9, 'Arte'),
(3, 'Ciencia  y Ambiente'),
(5, 'Computo'),
(2, 'Comunicacion Integral'),
(10, 'Educación Fisica'),
(7, 'Ingles'),
(1, 'Logico Matematico'),
(6, 'Minichef'),
(4, 'Personal Social'),
(8, 'Tutoria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(10) NOT NULL,
  `idUsuario` int(10) NOT NULL,
  `DNI` varchar(8) NOT NULL,
  `Nombres` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  `Edad` varchar(2) NOT NULL,
  `Sexo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `idUsuario`, `DNI`, `Nombres`, `Apellidos`, `Direccion`, `Telefono`, `Edad`, `Sexo`) VALUES
(20, 1, '73260012', 'Oscar Manuel', 'Bravo Carbajal', 'Jr.Los Andes 187', '946448040', '19', 'Masculino'),
(24, 1, '45456456', 'Vilma Haydee', 'Bravo Huamash', 'Jr. Francisco Bolognesi 333', '970356485', '54', 'Femenino'),
(26, 2, '54557895', 'Max Romario', 'Bravo Carbajal', 'Av.Los Andes 187', '956727151', '25', 'Masculino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `idMatricula` int(11) NOT NULL,
  `idEmpleado` int(10) NOT NULL,
  `idAlumno` int(10) NOT NULL,
  `idPagos` int(8) NOT NULL,
  `Fecha_Matricula` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`idMatricula`, `idEmpleado`, `idAlumno`, `idPagos`, `Fecha_Matricula`) VALUES
(5, 20, 41, 5, '2018-11-30'),
(6, 20, 3, 4, '2018-11-22'),
(7, 20, 41, 5, '2018-11-15'),
(8, 20, 3, 4, '2018-11-21'),
(9, 20, 3, 4, '2018-11-15'),
(10, 20, 3, 4, '2018-11-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `idNotas` int(10) NOT NULL,
  `idCurso` int(10) NOT NULL,
  `idAlumno` int(10) NOT NULL,
  `Bim_1` varchar(2) DEFAULT NULL,
  `Bim_2` varchar(2) DEFAULT NULL,
  `Bim_3` varchar(2) DEFAULT NULL,
  `Bim_4` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`idNotas`, `idCurso`, `idAlumno`, `Bim_1`, `Bim_2`, `Bim_3`, `Bim_4`) VALUES
(47, 10, 41, '17', '17', '17', '17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idPagos` int(10) NOT NULL,
  `idAlumno` int(10) NOT NULL,
  `DNI_R` varchar(8) DEFAULT NULL,
  `Concepto` varchar(45) DEFAULT NULL,
  `Importe` varchar(5) DEFAULT NULL,
  `Fecha_Pago` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idPagos`, `idAlumno`, `DNI_R`, `Concepto`, `Importe`, `Fecha_Pago`) VALUES
(4, 3, '45626565', 'Pension', '300', '2018-10-04'),
(5, 41, '54826565', 'Matricula', '300', '2018-10-04'),
(6, 3, '73260012', 'Pension', '250', '2018-11-08'),
(7, 53, '73260012', 'Matricula', '250', '2018-11-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `idTipo` int(1) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`idTipo`, `Descripcion`) VALUES
(1, 'Administrador'),
(2, 'Docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(10) NOT NULL,
  `idTipo` int(1) NOT NULL,
  `Usuario` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `idTipo`, `Usuario`, `Password`) VALUES
(1, 2, 'VilmaBH', '123456'),
(2, 1, 'OscarBH', '123456'),
(3, 1, 'RafaelLC', '123456'),
(4, 1, 'CristianPE', '123456'),
(5, 1, 'StaceyCI', '123456'),
(6, 2, 'AntonioLC', '123456'),
(7, 2, 'CarlosPE', '123456'),
(8, 2, 'SofiaCI', '123456'),
(9, 2, 'RubiLC', '123456'),
(10, 2, 'CarolPE', '123456'),
(11, 2, 'SaulCI', '123456'),
(12, 2, 'RodrigoLC', '123456'),
(13, 2, 'ConniePE', '123456'),
(14, 2, 'PedroCI', '123456'),
(15, 2, 'PercyLC', '123456'),
(16, 2, 'JesusPE', '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`idAlumno`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idCurso`),
  ADD KEY `Nombre` (`Nombre`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `fk_Empleado_Usuario1_idx` (`idUsuario`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`idMatricula`),
  ADD KEY `fk_Matricula_Empleado1_idx` (`idEmpleado`),
  ADD KEY `fk_Matricula_Alumno1_idx` (`idAlumno`),
  ADD KEY `fk_Matricula_Pagos1` (`idPagos`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`idNotas`),
  ADD KEY `fk_Notas_Curso_idx` (`idCurso`),
  ADD KEY `fk_Notas_Alumno1_idx` (`idAlumno`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPagos`),
  ADD KEY `fk_Pagos_Alumno1_idx` (`idAlumno`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Usuario_Tipo1_idx` (`idTipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `idAlumno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `idMatricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `idNotas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idPagos` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_Empleado_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `fk_Matricula_Alumno1` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Matricula_Empleado1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Matricula_Pagos1` FOREIGN KEY (`idPagos`) REFERENCES `pagos` (`idPagos`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fk_Notas_Alumno1` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Notas_Curso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_Pagos_Alumno1` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Tipo1` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`idTipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
