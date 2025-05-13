-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-02-2025 a las 05:29:25
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `v_farmacia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nombre`, `telefono`, `direccion`) VALUES
(1, 'Pedro', '1234567894', 'crr 321'),
(2, 'Ignacio', '6598735648', 'Crr 987'),
(3, 'Maria', '1687952648', 'Crr 65');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `email`, `direccion`) VALUES
(1, 'Sistemas Free', '98745698', 'ana.info1999@gamil.com', 'Trujillo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_permisos`
--

CREATE TABLE `detalle_permisos` (
  `id` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio_venta` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id`, `id_producto`, `id_venta`, `cantidad`, `descuento`, `precio`, `total`) VALUES
(2, 2, 2, 100, 0.00, 2500.00, 250000.00),
(3, 2, 3, 99, 0.00, 2500.00, 247500.00),
(4, 11, 4, 1, 10.00, 5900.00, 5890.00),
(5, 2, 4, 1, 0.00, 2500.00, 2500.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorios`
--

CREATE TABLE `laboratorios` (
  `id` int(11) NOT NULL,
  `laboratorio` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `laboratorios`
--

INSERT INTO `laboratorios` (`id`, `laboratorio`, `direccion`) VALUES
(1, 'Laboratorios Provet S.A.S.', 'Autopista Medellín Km 7, Parque Celta Trade Park, Planta 77, Funza, Cundinamarca'),
(2, 'Laboratorios Farmacéuticos & Nutricionales S.A.S', 'Avenida Troncal de Occidente 18-76, Parque Industrial Santo Domingo, MZ B BG 8, Mosquera, Cundinamar'),
(3, 'Laboratorios Natural Freshly Infabo S.A.S', 'Vereda Pueblo Viejo Km 1, Vía Cota-Chía, Cota, Cundinamarca'),
(4, 'Laboratorios Bagó de Colombia S.A.S', 'Calle 4 #2 Este-00, Parque K 2, Bodega 12, Chía, Cundinamarca'),
(5, 'Laboratorios Erma S.A', 'Autopista Medellín Km 7, Celta Trade Park, Edificio 112, Funza, Cundinamarca'),
(6, 'Laboratorios Koch S.A.S', 'Finca El Salvador, Vereda San Rafael, Facatativá, Cundinamarca'),
(7, 'Laboratorios Zoo S.A.S', 'Autopista Medellín Km 1, Bodega 10, Terrapuerto Industrial El Dorado, Cota, Cundinamarca'),
(8, 'Laboratorios Tierwelt S.A.S', 'Kilómetro 2 Variante Briceño, Parque Industrial Tibitoc, Bodega 63, Tocancipá, Cundinamarca'),
(9, 'Laboratorios Wacol S.A', 'Autopista Norte Km 20.04, Centro Empresarial Oikos Tocancipá, Bodega 19, Tocancipá, Cundinamarca'),
(10, 'Laboratorios de Cosméticos Vogue S.A.S', 'Kilómetro 7 Vía Autopista Medellín, Parque Industrial Interpark, Funza, Cundinamarca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`) VALUES
(1, 'configuración'),
(2, 'usuarios'),
(3, 'clientes'),
(4, 'productos'),
(5, 'ventas'),
(6, 'nueva_venta'),
(7, 'tipos'),
(8, 'presentacion'),
(9, 'laboratorios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nombre_corto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `presentacion`
--

INSERT INTO `presentacion` (`id`, `nombre`, `nombre_corto`) VALUES
(1, 'Suspensión oral de ibuprofeno 100 mg/5 ml', 'Ibuprofeno 100 mg / 5 ml'),
(2, 'Tabletas de paracetamol 500 mg', 'Paracetamol 500mg'),
(3, 'Tabletas de loratadina 10 mg', 'Loratadina 10mg'),
(4, 'Tabletas de amoxicilina 500 mg', 'Amoxicilina 500mg'),
(5, 'Inyectable de ceftriaxona 1 g', 'Ceftriaxon'),
(6, 'Tabletas de metformina 850 mg', 'Metformina 850mg'),
(7, 'Tabletas de clonazepam 2 mg', 'Clonazepam 2mg'),
(8, 'Solución oral de metadona 5 mg/ml', 'Metadona jarabe'),
(9, 'Tabletas de tramadol 50 mg', 'Tramadol 50 mg'),
(10, 'Tabletas de multivitamínico con minerales', 'Multivitamínico'),
(11, 'Cápsulas de Omega 3 1000 mg', 'Omega 3'),
(12, 'Tabletas de complejo B', 'Complejo B'),
(13, 'Cápsulas de calcio + vitamina D 600 mg', 'Calcio + D'),
(14, 'Tabletas de hierro + ácido fólico', 'Hierro + ácido folico'),
(15, 'Tabletas de zinc 50 mg', 'Zinc 50 mg'),
(16, 'Tabletas efervescentes de vitamina C 1 g', 'Vitamina C'),
(17, 'Cápsulas de equinácea y propóleo', 'Equinácea + propóleo'),
(18, 'Jarabe de miel con jengibre y limón', 'Jarabe miel-jengibre'),
(19, 'Pasta dental con flúor 90 g', ' Crema dental'),
(20, 'Enjuague bucal antiséptico 250 ml', 'Enjuague bucal'),
(21, 'Cepillo dental ultrasuave', 'Cepillo de dientes'),
(22, 'Crema hidratante facial con ácido hialurónico', 'Crema facial'),
(23, 'Protector solar SPF 50+ 100 ml', 'Bloqueador'),
(24, 'Jabón líquido dermatológico 200 ml', 'Jabón facial'),
(25, 'Toallas sanitarias nocturnas con alas 10 unidades', 'Toallas nocturnas'),
(26, 'Tampones súper absorbentes 16 unidades', 'Tampones super'),
(27, 'Copa menstrual de silicona talla M', 'Copa menstrual'),
(28, 'Fórmula láctea para lactantes de 0-6 meses 800 g', 'Leche infantil 0-6 m'),
(29, 'Fórmula hipoalergénica para bebés 400 g', 'Leche HA'),
(30, 'Cereal infantil de arroz y avena', ' Cereal bebé'),
(31, 'Pañales desechables talla M 30 unidades', 'Pañales M'),
(32, 'Toallitas húmedas sin alcohol 80 unidades', 'Toallitas bebé'),
(33, 'Crema antirozaduras con óxido de zinc', 'Crema antirozaduras'),
(34, 'Alcohol antiséptico al 70% 500 ml', 'Alcohol 70%'),
(35, 'Solución de yodo povidona 10% 120 ml', 'Yodo povidona'),
(36, 'Agua oxigenada 10 volúmenes 250 ml', 'Agua oxigenada'),
(37, 'Gasa estéril 10 x 10 cm paquete de 5 unidades', 'Gasa estéril'),
(38, 'Venda elástica 5 cm x 4 m', 'Venda elástica'),
(39, 'Apósitos adhesivos hipoalergénicos', 'Apósitos adhesivos'),
(40, 'Glucómetro digital con tiras reactivas', 'Glucómetro'),
(41, 'Tensiómetro digital de brazo', 'Tensiómetro brazo'),
(42, 'Termómetro infrarrojo sin contacto', 'Termómetro IR'),
(43, 'Jeringas desechables de 5 ml con aguja', 'Jeringa 5 ml'),
(44, 'Guantes de látex talla M 100 unidades', 'Guantes M'),
(45, 'Mascarillas quirúrgicas 50 unidades', 'Mascarillas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codproducto` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `existencia` int(11) NOT NULL,
  `id_lab` int(11) NOT NULL,
  `id_presentacion` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `vencimiento` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codproducto`, `codigo`, `descripcion`, `precio`, `existencia`, `id_lab`, `id_presentacion`, `id_tipo`, `vencimiento`) VALUES
(2, '7702003001002	', 'Paracetamol 500mg', 2500.00, 199, 1, 2, 4, '2025-03-29'),
(5, '7702003002003	', 'Ibuprofeno 400mg	', 3200.00, 80, 1, 1, 4, '2025-03-29'),
(6, '7702003003004', 'Loratadina 10mg	', 5000.00, 60, 5, 3, 4, '2025-03-29'),
(7, '7702003010005	', 'Tramadol', 9800.00, 100, 1, 9, 4, '2025-03-29'),
(8, '7702003030011	', 'Vitamina C efervescente	', 4200.00, 200, 8, 10, 6, '2025-03-29'),
(9, '7702003031012', 'Omega 3	', 12000.00, 150, 9, 11, 6, '2025-03-29'),
(10, '7702003032013', 'Ginseng en cápsulas	', 18000.00, 90, 7, 10, 6, '2025-03-29'),
(11, '7702003040014	', 'Crema dental Colgate	', 5900.00, 299, 3, 19, 3, '2025-03-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `tipo`) VALUES
(3, 'Cuidado Personal e Higiene'),
(4, 'Medicamentos'),
(5, 'Cuidado del Bebé'),
(6, 'Suplementos y Vitaminas'),
(7, 'Productos de Primeros Auxilios'),
(8, 'Dispositivos Médicos'),
(9, ' Nutrición y Bienestar'),
(10, 'Salud Sexual y Reproductiva'),
(11, 'Productos Naturales y Homeopáticos'),
(12, 'Dermocosmética');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `correo`, `usuario`, `clave`) VALUES
(1, 'Sistemas Free', 'ana.info1999@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(9, 'Maria Sanchez', 'maria@gmail.com', 'maria', '263bce650e68ab4e23f28263760b9fa5'),
(14, 'Juan', 'Juan123@gmail.com', 'vendedor-1', '0407e8c8285ab85509ac2884025dcf42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_cliente`, `total`, `id_usuario`, `fecha`) VALUES
(1, 1, 6000.00, 1, '2025-02-25 18:18:48'),
(2, 1, 250000.00, 1, '2025-02-26 03:50:27'),
(3, 1, 247500.00, 1, '2025-02-26 03:52:32'),
(4, 3, 8390.00, 1, '2025-02-26 04:04:02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_permiso` (`id_permiso`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codproducto`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  ADD CONSTRAINT `detalle_permisos_ibfk_1` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_permisos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_temp_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
