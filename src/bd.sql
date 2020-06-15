-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2020 a las 04:10:00
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
-- Base de datos: `borradorhospital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_hospitalizacion`
--

CREATE TABLE `cita_hospitalizacion` (
  `id_hospitalizacion` int(11) NOT NULL,
  `id_cita_medica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cita_hospitalizacion`
--

INSERT INTO `cita_hospitalizacion` (`id_hospitalizacion`, `id_cita_medica`) VALUES
(70001, 330001),
(70002, 330002),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_medica`
--

CREATE TABLE `cita_medica` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_shc` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cita_medica`
--

INSERT INTO `cita_medica` (`id`, `id_paciente`, `id_shc`, `id_medico`, `valor`, `fecha`, `hora`, `id_estado`) VALUES
(330001, 52709511, 1022, 80001, 2000, '2018-03-01', '08:00:00', 5004),
(330002, 52709512, 1022, 80001, 0, '2018-03-02', '09:00:00', 5005),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermera`
--

CREATE TABLE `enfermera` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `enfermera`
--

INSERT INTO `enfermera` (`id`, `nombre`, `apellido`) VALUES
(9001, 'ADRIANA CAROLINA', 'HERNANDEZ MONTERROZA'),
(9002, 'ADRIANA MARCELA', 'REY SANCHEZ'),
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_habitacion`
--

CREATE TABLE `especialidad_habitacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `especialidad_habitacion`
--

INSERT INTO `especialidad_habitacion` (`id`, `nombre`) VALUES
(301, 'Urgencia'),
(302, 'Psiquiatria'),
(303, 'Neurocirugua'),
(304, 'Traumatologia'),
(305, 'Pediatria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_medico`
--

CREATE TABLE `especialidad_medico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `especialidad_medico`
--

INSERT INTO `especialidad_medico` (`id`, `nombre`) VALUES
(801, 'Urgencia'),
(802, 'Psiquiatria'),
(803, 'Neurocirugua'),
(804, 'Traumatologia'),
(805, 'Pediatria'),
(806, 'Medicina General'),
(807, 'Dermatologia ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_cita`
--

CREATE TABLE `estado_cita` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_cita`
--

INSERT INTO `estado_cita` (`id`, `nombre`) VALUES
(5004, 'Realizada'),
(5005, 'Cancelada'),
(5006, 'No asistio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_hospitalizacion`
--

CREATE TABLE `estado_hospitalizacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_hospitalizacion`
--

INSERT INTO `estado_hospitalizacion` (`id`, `nombre`) VALUES
(5001, 'Realizado'),
(5002, 'En curso'),
(5003, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_paciente`
--

CREATE TABLE `estado_paciente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_paciente`
--

INSERT INTO `estado_paciente` (`id`, `nombre`) VALUES
(5007, 'Afiliado'),
(5008, 'No Afiliado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `id` int(11) NOT NULL,
  `id_shh` int(11) DEFAULT NULL,
  `id_especialidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`id`, `id_shh`, `id_especialidad`) VALUES
(2001, 1001, 301),
(2002, 1001, 301),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hospitalizacion`
--

CREATE TABLE `hospitalizacion` (
  `id` int(11) NOT NULL,
  `id_enfermera` int(11) DEFAULT NULL,
  `id_habitacion` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `fecha_entrada` date DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hospitalizacion`
--

INSERT INTO `hospitalizacion` (`id`, `id_enfermera`, `id_habitacion`, `id_estado`, `valor`, `fecha_entrada`, `fecha_salida`, `hora_entrada`, `hora_salida`) VALUES
(70001, 9001, 2001, 5001, 300000, '2018-03-01', '2018-03-03', '13:00:00', '15:00:00'),
(70002, 9001, 2002, 5002, 425000, '2018-03-02', '2018-03-04', '14:00:00', '16:36:00'),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `id_especialidad` int(11) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `id_tipo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`id`, `nombre`, `apellido`, `id_especialidad`, `direccion`, `id_municipio`, `id_tipo_id`) VALUES
(80001, 'EDWIN ALFONSO', 'CASTELLANOS LOMBANA', 801, 'Carrera 27A No.40 A 28', 11108, 1100001),
(80002, 'JUAN SEBASTIAN', 'GUTIERREZ GARZON', 802, 'Carrera 27A No.40 A 29', 11108, 1100002),
(80003, 'JUAN SEBASTIAN', 'LEON CRUZ', 803, 'Carrera 27A No.40 A 30', 11108, 1100003),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id`, `nombre`) VALUES
(11101, 'Bogota'),
(11102, 'Cartagena'),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `fecha_nto` date DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `id_tipo_id` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id`, `nombre`, `apellido`, `fecha_nto`, `direccion`, `id_municipio`, `id_tipo_id`, `id_estado`) VALUES
(52709511, 'JULIAN CAMILO', 'PACHECO CUADROS', '1983-07-14', 'Carrera 75A No.40 A 174', 11108, 1100001, 5007),
(52709512, 'JUAN SEBASTIAN', 'CHAVARRO SOLORZANO', '1995-05-05', 'Carrera 75A No.40 A 175', 11108, 1100002, 5008),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `dato1` varchar(45) DEFAULT NULL,
  `dato2` varchar(45) DEFAULT NULL,
  `dato3` varchar(45) DEFAULT NULL,
  `id_medicoenc` int(11) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `dato1`, `dato2`, `dato3`, `id_medicoenc`, `create_at`) VALUES
(8, 'viejo', 'viejo1', 'viejo2', NULL, '2019-11-08 00:13:00'),
(10, 'nuevo', 'nuevo1', 'nuevo2', NULL, '2020-03-28 06:57:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('L6VCniMnYFmLyONrr2R7IXwRYqwT32nd', 1585695076, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}'),
('dDcViyEAO7pxzq9l4HKAnTzRmeuwOVXT', 1592272942, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_hospital_cita`
--

CREATE TABLE `sucursal_hospital_cita` (
  `id` int(11) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal_hospital_cita`
--

INSERT INTO `sucursal_hospital_cita` (`id`, `direccion`, `id_municipio`) VALUES
(1022, 'calle 2 # 11-45', 11101),
(1023, 'carrera 11 # 12-49', 11101),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_hospital_hospitalizacion`
--

CREATE TABLE `sucursal_hospital_hospitalizacion` (
  `id` int(11) NOT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal_hospital_hospitalizacion`
--

INSERT INTO `sucursal_hospital_hospitalizacion` (`id`, `id_municipio`, `direccion`) VALUES
(1001, 11101, 'calle 1 # 11-45'),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_enfermera`
--

CREATE TABLE `telefono_enfermera` (
  `id` int(11) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_medico`
--

CREATE TABLE `telefono_medico` (
  `id` int(11) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `telefono_medico`
--

INSERT INTO `telefono_medico` (`id`, `telefono`) VALUES
(80001, 37308961),
(80001, 37308962),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_paciente`
--

CREATE TABLE `telefono_paciente` (
  `id` int(11) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `telefono_paciente`
--

INSERT INTO `telefono_paciente` (`id`, `telefono`) VALUES
(52709511, 313089620),
(52709511, 313089621),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_shh`
--

CREATE TABLE `telefono_shh` (
  `id` int(11) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `telefono_shh`
--

INSERT INTO `telefono_shh` (`id`, `telefono`) VALUES
(1001, 3004565),
(1001, 300123456),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_sucursal_cita`
--

CREATE TABLE `telefono_sucursal_cita` (
  `id` int(11) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `telefono_sucursal_cita`
--

INSERT INTO `telefono_sucursal_cita` (`id`, `telefono`) VALUES
(1022, 31408956),
(1022, 31408957),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_visitante`
--

CREATE TABLE `telefono_visitante` (
  `id` int(11) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `telefono_visitante`
--

INSERT INTO `telefono_visitante` (`id`, `telefono`) VALUES
(77001, 333089561),
(77002, 333089562),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_id`
--

CREATE TABLE `tipo_id` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_id`
--

INSERT INTO `tipo_id` (`id`, `nombre`) VALUES
(1100001, 'Cedula Ciudadania'),
(1100002, 'Cedula Extranjeria'),
(1100003, 'Pasaporte'),
(1100004, 'Tarjeta de Identidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` char(60) DEFAULT NULL,
  `tipo` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `tipo`) VALUES
(8, 'criss', '123456789', 'admin'),
(2000, '52709511', '123456', 'paciente'),
(2001, '52709512 ', '123456', 'paciente'),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante`
--

CREATE TABLE `visitante` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `visitante`
--

INSERT INTO `visitante` (`id`, `nombre`, `apellido`) VALUES
(77001, 'JULIAN CAMILO', 'PACHECO CUADROS'),
(77002, 'JUAN SEBASTIAN', 'CHAVARRO SOLORZANO'),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita_ver`
--

CREATE TABLE `visita_ver` (
  `id_visitante` int(11) NOT NULL,
  `id_hospitalizacion` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `visita_ver`
--

INSERT INTO `visita_ver` (`id_visitante`, `id_hospitalizacion`, `fecha`, `hora`) VALUES
(77001, 70001, '2018-03-02', '08:00:00'),
(77002, 70002, '2018-03-03', '09:00:00'),
(77003, 70004, '2018-03-04', '10:00:00'),
(77004, 70005, '2018-03-05', '11:00:00'),

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita_hospitalizacion`
--
ALTER TABLE `cita_hospitalizacion`
  ADD PRIMARY KEY (`id_hospitalizacion`),
  ADD UNIQUE KEY `id_cita_medica` (`id_cita_medica`);

--
-- Indices de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_shc` (`id_shc`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `enfermera`
--
ALTER TABLE `enfermera`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especialidad_habitacion`
--
ALTER TABLE `especialidad_habitacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `especialidad_medico`
--
ALTER TABLE `especialidad_medico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_cita`
--
ALTER TABLE `estado_cita`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_hospitalizacion`
--
ALTER TABLE `estado_hospitalizacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_paciente`
--
ALTER TABLE `estado_paciente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_especialidad` (`id_especialidad`),
  ADD KEY `id_shh` (`id_shh`);

--
-- Indices de la tabla `hospitalizacion`
--
ALTER TABLE `hospitalizacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_enfermera` (`id_enfermera`),
  ADD KEY `id_habitacion` (`id_habitacion`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_tipo_id` (`id_tipo_id`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_tipo_id` (`id_tipo_id`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`id_medicoenc`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `sucursal_hospital_cita`
--
ALTER TABLE `sucursal_hospital_cita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_municipio` (`id_municipio`);

--
-- Indices de la tabla `sucursal_hospital_hospitalizacion`
--
ALTER TABLE `sucursal_hospital_hospitalizacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_municipio` (`id_municipio`);

--
-- Indices de la tabla `telefono_enfermera`
--
ALTER TABLE `telefono_enfermera`
  ADD PRIMARY KEY (`id`,`telefono`);

--
-- Indices de la tabla `telefono_medico`
--
ALTER TABLE `telefono_medico`
  ADD PRIMARY KEY (`id`,`telefono`);

--
-- Indices de la tabla `telefono_paciente`
--
ALTER TABLE `telefono_paciente`
  ADD PRIMARY KEY (`id`,`telefono`);

--
-- Indices de la tabla `telefono_shh`
--
ALTER TABLE `telefono_shh`
  ADD PRIMARY KEY (`id`,`telefono`);

--
-- Indices de la tabla `telefono_sucursal_cita`
--
ALTER TABLE `telefono_sucursal_cita`
  ADD PRIMARY KEY (`id`,`telefono`);

--
-- Indices de la tabla `telefono_visitante`
--
ALTER TABLE `telefono_visitante`
  ADD PRIMARY KEY (`id`,`telefono`);

--
-- Indices de la tabla `tipo_id`
--
ALTER TABLE `tipo_id`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `visita_ver`
--
ALTER TABLE `visita_ver`
  ADD PRIMARY KEY (`id_visitante`,`id_hospitalizacion`,`fecha`),
  ADD KEY `id_hospitalizacion` (`id_hospitalizacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3407;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita_hospitalizacion`
--
ALTER TABLE `cita_hospitalizacion`
  ADD CONSTRAINT `cita_hospitalizacion_ibfk_1` FOREIGN KEY (`id_hospitalizacion`) REFERENCES `hospitalizacion` (`id`),
  ADD CONSTRAINT `cita_hospitalizacion_ibfk_2` FOREIGN KEY (`id_cita_medica`) REFERENCES `cita_medica` (`id`);

--
-- Filtros para la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD CONSTRAINT `cita_medica_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`),
  ADD CONSTRAINT `cita_medica_ibfk_2` FOREIGN KEY (`id_shc`) REFERENCES `sucursal_hospital_cita` (`id`),
  ADD CONSTRAINT `cita_medica_ibfk_3` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`),
  ADD CONSTRAINT `cita_medica_ibfk_4` FOREIGN KEY (`id_estado`) REFERENCES `estado_cita` (`id`);

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `habitacion_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad_habitacion` (`id`),
  ADD CONSTRAINT `habitacion_ibfk_2` FOREIGN KEY (`id_shh`) REFERENCES `sucursal_hospital_hospitalizacion` (`id`);

--
-- Filtros para la tabla `hospitalizacion`
--
ALTER TABLE `hospitalizacion`
  ADD CONSTRAINT `hospitalizacion_ibfk_1` FOREIGN KEY (`id_enfermera`) REFERENCES `enfermera` (`id`),
  ADD CONSTRAINT `hospitalizacion_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitacion` (`id`),
  ADD CONSTRAINT `hospitalizacion_ibfk_3` FOREIGN KEY (`id_estado`) REFERENCES `estado_hospitalizacion` (`id`);

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`),
  ADD CONSTRAINT `medico_ibfk_2` FOREIGN KEY (`id_tipo_id`) REFERENCES `tipo_id` (`id`),
  ADD CONSTRAINT `medico_ibfk_3` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad_medico` (`id`);

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`),
  ADD CONSTRAINT `paciente_ibfk_2` FOREIGN KEY (`id_tipo_id`) REFERENCES `tipo_id` (`id`),
  ADD CONSTRAINT `paciente_ibfk_3` FOREIGN KEY (`id_estado`) REFERENCES `estado_paciente` (`id`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_medicoenc`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `sucursal_hospital_cita`
--
ALTER TABLE `sucursal_hospital_cita`
  ADD CONSTRAINT `sucursal_hospital_cita_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`);

--
-- Filtros para la tabla `sucursal_hospital_hospitalizacion`
--
ALTER TABLE `sucursal_hospital_hospitalizacion`
  ADD CONSTRAINT `sucursal_hospital_hospitalizacion_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`);

--
-- Filtros para la tabla `telefono_enfermera`
--
ALTER TABLE `telefono_enfermera`
  ADD CONSTRAINT `telefono_enfermera_ibfk_1` FOREIGN KEY (`id`) REFERENCES `enfermera` (`id`);

--
-- Filtros para la tabla `telefono_medico`
--
ALTER TABLE `telefono_medico`
  ADD CONSTRAINT `telefono_medico_ibfk_1` FOREIGN KEY (`id`) REFERENCES `medico` (`id`);

--
-- Filtros para la tabla `telefono_paciente`
--
ALTER TABLE `telefono_paciente`
  ADD CONSTRAINT `telefono_paciente_ibfk_1` FOREIGN KEY (`id`) REFERENCES `paciente` (`id`);

--
-- Filtros para la tabla `telefono_shh`
--
ALTER TABLE `telefono_shh`
  ADD CONSTRAINT `telefono_shh_ibfk_1` FOREIGN KEY (`id`) REFERENCES `sucursal_hospital_hospitalizacion` (`id`);

--
-- Filtros para la tabla `telefono_sucursal_cita`
--
ALTER TABLE `telefono_sucursal_cita`
  ADD CONSTRAINT `telefono_sucursal_cita_ibfk_1` FOREIGN KEY (`id`) REFERENCES `sucursal_hospital_cita` (`id`);

--
-- Filtros para la tabla `telefono_visitante`
--
ALTER TABLE `telefono_visitante`
  ADD CONSTRAINT `telefono_visitante_ibfk_1` FOREIGN KEY (`id`) REFERENCES `visitante` (`id`);

--
-- Filtros para la tabla `visita_ver`
--
ALTER TABLE `visita_ver`
  ADD CONSTRAINT `visita_ver_ibfk_1` FOREIGN KEY (`id_visitante`) REFERENCES `visitante` (`id`),
  ADD CONSTRAINT `visita_ver_ibfk_2` FOREIGN KEY (`id_hospitalizacion`) REFERENCES `hospitalizacion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
