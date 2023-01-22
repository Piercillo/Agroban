-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 18-01-2023 a las 09:57:29
-- Versión del servidor: 10.6.8-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agrobane_tvirtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesoria`
--

CREATE TABLE `asesoria` (
  `idasesoria` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL,
  `idformulariodet` varchar(500) NOT NULL,
  `finca` varchar(100) DEFAULT '',
  `estado` varchar(100) DEFAULT '',
  `codigo` varchar(100) DEFAULT '',
  `status` varchar(1) DEFAULT '1',
  `comentario` varchar(500) NOT NULL DEFAULT '',
  `idproductos` varchar(500) NOT NULL DEFAULT '',
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asesoria`
--

INSERT INTO `asesoria` (`idasesoria`, `idpersona`, `idformulariodet`, `finca`, `estado`, `codigo`, `status`, `comentario`, `idproductos`, `fecha`) VALUES
(1, 5, '[\"7\"]', '', '1', '63c4792ace11a', '1', '3123', '', '2023-01-15 17:22:02'),
(2, 5, '[\"5\"]', '', '1', '63c47978ba8cf', '1', '6575', '', '2023-01-15 17:22:02'),
(3, 1, '[\"4\",\" 6\"]', '', '1', '63c47ccf50201', '1', 'Prueba', '', '2023-01-15 17:23:11'),
(4, 5, '[\"4\",\" 5\"]', '', '1', '63c47e7c0ce8b', '1', 'ffdgfff', '', '2023-01-15 17:30:20'),
(5, 1, '[\"1\",\" 3\",\" 4\",\" 5\",\" 6\",\" 7\"]', '', '1', '63c5f4f2c7cb8', '1', '23', '', '2023-01-16 20:08:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
(1, 'Fertilizantes Organicos', 'Proveniente de la descomposición y mineralización de los restos orgánicos de animales y plantas', 'img_ae62539c5241145894725b45aaaba66e.jpg', '2022-06-16 03:04:04', 'fertilizantes-organicos', 1),
(2, 'Fertilizante Inorgánico', 'Fertilizantes químicos que son añadidos al césped o jardín en una fórmula de gránulos.', 'img_cae3cc3808b8c5a29d5ee04f26a13035.jpg', '2022-08-10 00:47:10', 'fertilizante-inorganico', 1),
(3, 'NPK', 'Fertilizante que contiene nitrógeno (N), fósforo (P) y potasio (K). Elementos más que necesarios en el suelo para que las plantas puedan crecer y generar frutos.', 'img_25809147fabd26edf5f463ff9e1a5561.jpg', '2022-11-30 15:56:21', 'npk', 1),
(4, 'Foliar', 'Suministra nutrientes a las plantas a través de su follaje, ya sea mediante su disolución en agua o rociándolos directamente sobre las hojas.', 'img_82cb94d8267be1f99fa0f6b2681f7612.jpg', '2023-01-16 22:57:40', 'foliar', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `mensaje` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_swedish_ci NOT NULL,
  `dispositivo` varchar(25) COLLATE utf8mb4_swedish_ci NOT NULL,
  `useragent` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id`, `nombre`, `email`, `mensaje`, `ip`, `dispositivo`, `useragent`, `datecreated`) VALUES
(1, 'Fernando Herrera', 'toolsfordeveloper@gmail.com', 'Mensaje del primer suscriptor!', '127.0.0.1', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0', '2022-09-28 04:06:18'),
(2, 'Arley', 'pierrecontreras92@gmail.com', 'adshuagsdugauggsadguugdas', '181.39.22.182', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', '2022-11-30 16:00:10'),
(3, 'Pierre', 'hola@gmail.com', '1que pasa', '181.112.206.249', 'PC', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-13 09:00:58'),
(4, 'Pierre', 'pierrecontreras92@gmail.com', 'Es necesario realizar un análisis de suelo para establecer la cantidad de fertilizante que debo usar?', '45.226.205.6', 'PC', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', '2022-12-18 18:01:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` bigint(20) NOT NULL,
  `pedidoid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `pedidoid`, `productoid`, `precio`, `cantidad`) VALUES
(1, 1, 2, '200.00', 1),
(2, 1, 1, '100.00', 2),
(3, 2, 1, '100.00', 3),
(4, 3, 3, '300.00', 1),
(5, 3, 2, '200.00', 1),
(6, 4, 4, '48.00', 1),
(7, 4, 3, '300.00', 1),
(8, 4, 2, '200.00', 1),
(9, 5, 2, '200.00', 1),
(10, 5, 1, '100.00', 1),
(11, 6, 4, '48.00', 1),
(12, 7, 3, '300.00', 1),
(13, 7, 2, '200.00', 1),
(14, 8, 3, '300.00', 1),
(15, 8, 2, '200.00', 1),
(16, 9, 3, '300.00', 2),
(17, 9, 2, '200.00', 6),
(18, 10, 4, '48.00', 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` bigint(20) NOT NULL,
  `personaid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `transaccionid` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario`
--

CREATE TABLE `formulario` (
  `idformulario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT '',
  `status` varchar(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `formulario`
--

INSERT INTO `formulario` (`idformulario`, `nombre`, `status`) VALUES
(1, 'ASESORÍA', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulariodet`
--

CREATE TABLE `formulariodet` (
  `idformulariodet` int(11) NOT NULL,
  `idpregunta` varchar(200) NOT NULL,
  `respuesta` varchar(200) DEFAULT '',
  `status` varchar(1) DEFAULT '1',
  `idproducto` varchar(100) NOT NULL DEFAULT '',
  `idformulario` int(11) NOT NULL DEFAULT 1,
  `contenido` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `formulariodet`
--

INSERT INTO `formulariodet` (`idformulariodet`, `idpregunta`, `respuesta`, `status`, `idproducto`, `idformulario`, `contenido`) VALUES
(1, '1', 'Clorosis o amarillamiento de las hojas', '1', '[\"4\"]', 1, '<p><strong>Raz&oacute;n</strong></p>\r\n<p>Generalmente esto es debido la deficiencia de nitr&oacute;geno en las plantas de banano donde ocurre la clor&oacute;sis o amarillamiento de las hojas o en los peciolos, tintes de color rosa y en las vainas foliares,&nbsp; al final esto produce un retraso del crecimiento del banano.</p>'),
(3, '1', 'Clorosis, manchas marrones, purpureas o hojas rizadas', '1', '[\"2\"]', 1, '<p><strong>Raz&oacute;n</strong></p>\r\n<p>Los s&iacute;ntomas de deficiencia de f&oacute;sforo muestran la aparici&oacute;n en las hojas viejas, clorosis en sus bordes. Tambi&eacute;n se desarrollan manchas marrones y purp&uacute;reas. Cuando hay una severa deficiencia, las hojas afectadas se rizan, los peciolos se quiebran y las hojas m&aacute;s j&oacute;venes toman un color verde profundo, es importante el uso de f&oacute;sforo para el cultivo.&nbsp;</p>'),
(4, '1', 'Hojas naranjas, apariencia arrugada y racimos delgados ', '1', '[\"6\"]', 1, '<p><strong>Raz&oacute;n</strong></p>\r\n<p>Falta de K que es potasio proboca que las puntas de las hojas m&aacute;s viejas se vuelven amarillas, las hojas m&aacute;s viejas luego se tornan naranja y se secan, las hojas se pueden desgarrar, doblarse hacia abajo y presentan una apariencia con arrugas, los racimos de frutas en plantas con deficiencia de K son cortos, delgados y deformados debido al pobre llenado de los frutos, es una de los principales macronutrientes.</p>'),
(5, '1', 'Amarilleo de los bordes manchas azuladas', '1', '[\"7\"]', 1, '<p><strong>Raz&oacute;n</strong></p>\r\n<p>Es com&uacute;n en el banano, ocurre en plantaciones viejas donde se ha aplicado muy poco Mg, donde se ha aplicado potasio en exceso, se presenta con amarilleo de los bordes de la planta, manchas \"azuladas\" a p&uacute;rpuras en los peciolos osea la linea media de la hoja.</p>'),
(6, '1', 'Franjas amarillentas en forma paralela a la nervadura', '1', '[\"1\"]', 1, '<p><strong>Raz&oacute;n</strong></p>\r\n<p>El estr&eacute;s por humedad es la principal causa de la deficiencia de calcio dado que interrumpe la absorci&oacute;n por parte de la ra&iacute;z del calcio y lleva a deficiencias localizadas en los frutos.</p>'),
(7, '1', 'Lámina completa se torna amarilla, ondulación en los bordes de la hoja, necrosis a lo largo del borde', '1', '[\"8\"]', 1, '<p style=\"text-align: left;\"><strong>Raz&oacute;n</strong></p>\r\n<p style=\"text-align: left;\">El azufre tambi&eacute;n es un nutriente secundario de la planta y es esencial para la formaci&oacute;n de prote&iacute;nas, las hojas son clor&oacute;ticas y reducidas en tama&ntilde;o, con un engrosamiento en las venas secundarias, ondulaci&oacute;n en los bordes de la hoja, necrosis a lo largo del borde de las hojas inferiores</p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `img` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id`, `productoid`, `img`) VALUES
(31, 2, 'pro_4a1df0f696754c459214a86c6f2b0169.jpg'),
(32, 3, 'pro_78d70eabca90b6c0dfaff9897ec41c22.jpg'),
(33, 4, 'pro_49cee73a57b3d3aed8b85184a41f993d.jpg'),
(34, 5, 'pro_c925fccc45982967af545b5f621097b7.jpg'),
(35, 6, 'pro_97d739be6fb1d99aa9621b8d796c7f2d.jpg'),
(36, 7, 'pro_7165b000e619f6e7b5edb0b4e90a2a33.jpg'),
(37, 1, 'pro_12ea9c10d4cc5859223fefdae9044804.jpg'),
(38, 8, 'pro_27b635f79792ab372701eabc8bb49790.jpg'),
(39, 9, 'pro_1ef9bd98c5946121405c8a8c189a2af1.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `idmodulo` bigint(20) NOT NULL,
  `titulo` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`idmodulo`, `titulo`, `descripcion`, `status`) VALUES
(1, 'Dashboard', 'Dashboard', 1),
(2, 'Usuarios', 'Usuarios del sistema', 1),
(3, 'Clientes', 'Clientes de tienda', 1),
(4, 'Productos', 'Todos los productos', 1),
(5, 'Pedido', 'Pedidos', 1),
(6, 'Caterogías', 'Caterogías Productos', 1),
(7, 'Suscriptores', 'Suscriptores del sitio web', 1),
(8, 'Contactos', 'Mensajes del formulario contacto', 1),
(9, 'Páginas', 'Páginas del sitio web', 1),
(10, 'Nutricion', 'Páginas nutricion', 1),
(11, 'Crecimiento', 'Anotaciones de optimo crecimiento', 1),
(12, 'Fertilizacion', 'Fertilizar de manera optima', 1),
(13, 'Pedidos', 'todos los pedidos', 1),
(14, 'ASESORIAS PREGUNTAS', 'ASESORIAS PREGUNTAS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idpedido` bigint(20) NOT NULL,
  `referenciacobro` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `idtransaccionpaypal` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datospaypal` text COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `personaid` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `costo_envio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `monto` decimal(11,2) NOT NULL,
  `tipopagoid` bigint(20) NOT NULL,
  `direccion_envio` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idpedido`, `referenciacobro`, `idtransaccionpaypal`, `datospaypal`, `personaid`, `fecha`, `costo_envio`, `monto`, `tipopagoid`, `direccion_envio`, `status`) VALUES
(1, '4561654687', NULL, NULL, 3, '2022-07-21 03:41:57', '50.00', '450.00', 3, 'El Triunfo, Ecuador', 'Completo'),
(2, NULL, '8XD37465755620710', '{\"id\":\"4S6284553D668511R\",\"intent\":\"CAPTURE\",\"status\":\"COMPLETED\",\"purchase_units\":[{\"reference_id\":\"default\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"350.00\"},\"payee\":{\"email_address\":\"sb-6z0da4580133@business.example.com\",\"merchant_id\":\"ULNZF7CTTE748\"},\"description\":\"Compra de artículos en Tienda Virtual por $350 \",\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\",\"shipping\":{\"name\":{\"full_name\":\"John Doe\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Guatemala City\",\"admin_area_1\":\"Guatemala City\",\"postal_code\":\"01001\",\"country_code\":\"GT\"}},\"payments\":{\"captures\":[{\"id\":\"8XD37465755620710\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"350.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"create_time\":\"2021-08-20T09:48:38Z\",\"update_time\":\"2021-08-20T09:48:38Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"John\",\"surname\":\"Doe\"},\"email_address\":\"sb-iimwo4579006@personal.example.com\",\"payer_id\":\"ZTA3QXTY5JS6Q\",\"address\":{\"country_code\":\"GT\"}},\"create_time\":\"2021-08-20T09:46:25Z\",\"update_time\":\"2021-08-20T09:48:38Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v2/checkout/orders/4S6284553D668511R\",\"rel\":\"self\",\"method\":\"GET\"}]}', 3, '2022-10-27 03:48:39', '50.00', '350.00', 1, 'El Triunfo, Ecuador', 'Completo'),
(3, NULL, NULL, NULL, 5, '2022-11-12 14:31:16', '5.00', '505.00', 4, 'El Triunfo', 'Pendiente'),
(4, NULL, NULL, NULL, 1, '2022-11-25 18:56:33', '5.00', '553.00', 2, 'pruebas@g.com, mi casa', 'Pendiente'),
(5, NULL, NULL, NULL, 5, '2022-11-29 20:12:38', '5.00', '305.00', 3, '12, 091601', 'Pendiente'),
(6, NULL, NULL, NULL, 5, '2022-11-29 20:13:21', '5.00', '53.00', 4, '12, 091601', 'Pendiente'),
(7, NULL, NULL, NULL, 5, '2022-12-01 17:05:46', '15.00', '515.00', 3, 'av patria nueva, 091601', 'Pendiente'),
(8, NULL, NULL, NULL, 7, '2022-12-01 17:30:07', '15.00', '515.00', 5, 'av patria nueva, 091601', 'Pendiente'),
(9, '434234223', NULL, NULL, 9, '2022-12-14 17:29:09', '0.00', '1800.00', 3, 'olasdoas, adasdasasd', 'Completo'),
(10, '232234', NULL, NULL, 1, '2022-12-23 16:56:07', '0.00', '2880.00', 3, '12, 123', 'Completo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermiso` bigint(20) NOT NULL,
  `rolid` bigint(20) NOT NULL,
  `moduloid` bigint(20) NOT NULL,
  `r` int(11) NOT NULL DEFAULT 0,
  `w` int(11) NOT NULL DEFAULT 0,
  `u` int(11) NOT NULL DEFAULT 0,
  `d` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
(1, 1, 1, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1, 1),
(3, 1, 3, 1, 1, 1, 1),
(4, 1, 4, 1, 1, 1, 1),
(5, 1, 5, 1, 1, 1, 1),
(6, 1, 6, 1, 1, 1, 1),
(7, 1, 7, 1, 1, 1, 1),
(8, 1, 8, 1, 1, 1, 1),
(9, 1, 9, 1, 1, 1, 1),
(10, 1, 10, 1, 1, 1, 1),
(11, 1, 11, 1, 1, 1, 1),
(12, 1, 12, 1, 1, 1, 1),
(13, 2, 1, 1, 1, 1, 1),
(14, 2, 2, 0, 0, 0, 0),
(15, 2, 3, 1, 1, 1, 0),
(16, 2, 4, 1, 1, 1, 0),
(17, 2, 5, 1, 1, 1, 0),
(18, 2, 6, 1, 1, 1, 0),
(19, 2, 7, 1, 0, 0, 0),
(20, 2, 8, 1, 0, 0, 0),
(21, 2, 9, 1, 1, 1, 1),
(22, 2, 10, 1, 1, 1, 1),
(23, 2, 11, 1, 1, 1, 1),
(24, 2, 12, 1, 1, 1, 1),
(37, 4, 1, 1, 0, 0, 0),
(38, 4, 2, 0, 0, 0, 0),
(39, 4, 3, 1, 1, 1, 0),
(40, 4, 4, 1, 0, 0, 0),
(41, 4, 5, 1, 0, 1, 0),
(42, 4, 6, 0, 0, 0, 0),
(43, 4, 7, 1, 0, 0, 0),
(44, 4, 8, 1, 0, 0, 0),
(45, 4, 9, 0, 0, 0, 0),
(46, 4, 10, 1, 1, 1, 1),
(47, 4, 11, 1, 1, 1, 1),
(48, 4, 12, 1, 1, 1, 1),
(49, 1, 13, 1, 1, 1, 1),
(50, 3, 1, 1, 0, 0, 0),
(51, 3, 2, 0, 0, 0, 0),
(52, 3, 3, 0, 0, 0, 0),
(53, 3, 4, 0, 0, 0, 0),
(54, 3, 5, 1, 0, 0, 0),
(55, 3, 6, 0, 0, 0, 0),
(56, 3, 7, 0, 0, 0, 0),
(57, 3, 8, 0, 0, 0, 0),
(58, 3, 9, 0, 0, 0, 0),
(59, 3, 10, 1, 1, 1, 1),
(60, 3, 11, 1, 1, 1, 1),
(61, 3, 12, 1, 1, 1, 1),
(62, 3, 13, 0, 0, 0, 0),
(64, 1, 14, 1, 1, 1, 1),
(65, 3, 14, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` bigint(20) NOT NULL,
  `identificacion` varchar(30) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombres` varchar(80) COLLATE utf8mb4_swedish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `email_user` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(75) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nit` varchar(20) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `nombrefiscal` varchar(80) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `direccionfiscal` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `token` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `rolid` bigint(20) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `identificacion`, `nombres`, `apellidos`, `telefono`, `email_user`, `password`, `nit`, `nombrefiscal`, `direccionfiscal`, `token`, `rolid`, `datecreated`, `status`) VALUES
(1, '000000000', 'Elizabeth', 'Freire', 1111111, 'agroban@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'CF', 'PPPP', 'Ciudad', NULL, 1, '2022-07-12 01:34:15', 1),
(2, '24091990', 'Alex', 'Arana', 456878977, 'alex@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 2, '2022-08-24 02:58:47', 1),
(3, '84654864', 'Ricardo', 'Hernández Pérez', 4687987, 'hr@info.com', '62862604c542a3296d506cf1a95419f167f52801fe53408ad3ea8adb00f25431', '468798', 'Ricardo HP', 'Guayaquil', NULL, 3, '2022-10-20 03:41:28', 1),
(4, '798465877', 'Fernando', 'Guerra', 468498, 'fer@info.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, NULL, NULL, NULL, 4, '2022-10-20 18:07:00', 1),
(5, '0978845295', 'Aily', 'Vargas', 122222, 'pierrecontreras93@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '12', '12313', '123123', '', 3, '2022-11-10 14:07:47', 1),
(6, NULL, 'Gladys', 'Rivera', 12345658, 'pierrecontrerass@gmail.com', '34ed9b21a1873907c69c904831bd5507bbae28a2ab8575030887e8fb873ef156', NULL, NULL, NULL, NULL, 3, '2022-11-12 16:55:19', 1),
(7, '097884529600', 'Piero', 'Contreras', 987463423, 'pierrecontreras92@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', NULL, NULL, NULL, '', 1, '2022-12-01 17:22:56', 1),
(8, '123123', 'Shiro', 'Fernando', 234123234, 'xxshiro77@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '12312', '132', '132', NULL, 3, '2022-12-06 18:06:42', 1),
(9, '12312312', 'Thalia', 'Lozado', 392214, 'thalialozadoo@gmail.com', '71cac54f563a9e0718c0ede66f4c159e52baceb5dca6544a62c35e5756dcaefc', NULL, NULL, NULL, NULL, 1, '2022-12-14 17:28:09', 1),
(10, NULL, 'Pierre', 'Pierre', 1234, 'pierrecontreras95@gmail.com', '859f4a177fcf7d50c6d8c2196d6f806ae0eb6f143c75e776ae808f1a9662d962', NULL, NULL, NULL, NULL, 3, '2023-01-09 13:47:36', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE `post` (
  `idpost` bigint(20) NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `contenido` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `portada` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datecreate` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `post`
--

INSERT INTO `post` (`idpost`, `titulo`, `contenido`, `portada`, `datecreate`, `ruta`, `status`) VALUES
(1, 'Inicio', '<div class=\"p-t-80\"> <h3 class=\"ltext-103 cl5\">Nuestras marcas</h3> </div> <div> <p>Trabajamos con estas marcas ...</p> </div> <div class=\"row\"> <div class=\"col-md-3\"><img src=\"Assets/images/m1.png\" alt=\"Marca 1\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m2.png\" alt=\"Marca 2\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m3.png\" alt=\"Marca 3\" /></div> <div class=\"col-md-3\"><img src=\"Assets/images/m4.png\" alt=\"Marca 4\" /></div> </div>', '', '2022-10-04 02:40:15', 'inicio', 1),
(2, 'Tienda', '<p>Contenido p&aacute;gina!</p>', 'img_f40a54294d7e98b186a2c0a80dcd7da8.jpg', '2022-11-09 01:21:27', 'tienda', 1),
(3, 'Carrito', '<p>Contenido p&aacute;gina!</p>', '', '2022-11-01 01:21:52', 'carrito', 1),
(4, 'Nosotros', '<section class=\"bg0 p-t-75 p-b-120\"> <div class=\"container\"> <div class=\"row p-b-148\"> <div class=\"col-md-7 col-lg-8\"> <div class=\"p-t-7 p-r-85 p-r-15-lg p-r-0-md\"> <h3 class=\"mtext-111 cl2 p-b-16\">Vision</h3> <p class=\"stext-113 cl6 p-b-26\" style=\"font-size: 20px;\">Estamos ubicados en la Av. 8 de abril cruzando la calle junto al local decoHogar, hemos estado brindando nuestro servicio a la comunidad por ya m&aacute;s de 20 a&ntilde;os, somos una de las principales tiendas de insumos agron&oacute;micos para el cant&oacute;n, siempre al servicio del agricultor</p> <p class=\"stext-113 cl6 p-b-26\">&nbsp;</p> <p class=\"stext-113 cl6 p-b-26\">&nbsp;</p> </div> </div> <div class=\"col-11 col-md-5 col-lg-4 m-lr-auto\"> <div class=\"how-bor1 \"> <div class=\"hov-img0\"><img src=\"https://th.bing.com/th/id/OIP.0wM-tv0gK7xRmSdiKQqFLQHaFJ?pid=ImgDet&amp;rs=1\" alt=\"IMG\" width=\"500\" height=\"333\" /></div> </div> </div> </div> <div class=\"row\"> <div class=\"order-md-2 col-md-7 col-lg-8 p-b-30\"> <div class=\"p-t-7 p-l-85 p-l-15-lg p-l-0-md\"> <h2 class=\"mtext-111 cl2 p-b-16\"><span style=\"color: #236fa1;\">Nuestra Misi&oacute;n</span></h2> <p class=\"stext-113 cl6 p-b-26\" style=\"font-size: 20px;\">Nuestra mision es brindar a la comunidad variedad tanto economicamente como variedades de fertilizantes e insumos agricolas, asi como ayudar a la comunidad en el mejoramiento de sus pr&aacute;cticas y el mejoramiento de sus cultivos</p> <div class=\"bor16 p-l-29 p-b-9 m-t-22\"> <p class=\"stext-114 cl6 p-r-40 p-b-11\" style=\"font-size: 20px;\">La vida nos pone obst&aacute;culos pero los limites nos los ponemos nosotros.</p> <span class=\"stext-111 cl8\"> - Agrobana </span></div> </div> </div> <div class=\"order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30\"> <div class=\"how-bor2\"> <div class=\"hov-img0\"><img src=\"https://th.bing.com/th/id/R.46398d9e40ac270aba2e19461227c160?rik=ztXQhT2rPj87pw&amp;riu=http%3a%2f%2fwww.faculdadedofuturo.edu.br%2fwp-content%2fuploads%2f2017%2f09%2fshutterstock_agtech.jpg&amp;ehk=APmLIX63JYxH8i2noQUJQR4r%2fAjp9Xza6tGz8ITWSA8%3d&amp;risl=&amp;pid=ImgRaw&amp;r=0\" alt=\"IMG\" width=\"500\" height=\"333\" /></div> </div> </div> </div> </div> </section>', 'img_bbaf4b1c01544a4a9fefcb7944749848.jpg', '2022-07-13 03:09:44', 'nosotros', 1),
(5, 'Asesoria', '<p><span style=\"color: #ecf0f1;\">.puntito</span></p>', 'img_28340e9413ed3db5fba1ee05b43c1014.jpg', '2022-11-07 03:11:08', 'contacto', 1),
(6, 'Preguntas frecuentes', '<ol> <li> <ol> <li><strong>&iquest;Cu&aacute;l es el tiempo de entrega del producto? </strong>Nosotros estaremos al pendiente de tu pedido, para despachar y separar tu pedido env&iacute;enos un mensaje para confirmar su pedido.</li> <li><strong>&iquest;C&oacute;mo es la forma de env&iacute;o de los productos?</strong> Por ahora no realizamos env&iacute;os, esperamos realizar env&iacute;os a las localidades vecinas dentro pocos meses.</li> <li><strong>&iquest;Cu&aacute;l es el tiempo m&aacute;ximo para solicitar un reembolso?</strong> Damos un plazo de 3 d&iacute;as h&aacute;biles.</li> </ol> <p>Otras preguntas</p> <ul> <li><strong>&iquest;Qu&eacute; formas de pago? </strong>Estimado para utilizar las opciones avanzadas para calcular y solicitar un pedido deber&aacute; de registrarse e iniciar sesi&oacute;n.</li> </ul> </li> </ol>', 'img_d3396d0d91498f71253e6608139e7123.jpg', '2022-11-17 01:24:19', 'preguntas-frecuentes', 1),
(7, 'Términos y Condiciones', '<p>Esperando...</p>', 'img_521c66b24c3e9f4741b5e9ca75fce9ed.jpg', '2022-11-01 01:51:06', 'terminos-y-condiciones', 1),
(8, 'Sucursales', '<section class=\"py-5 text-center\" > <div class=\"container\" > <p>Visitanos y obten los mejores precios del mercado, cualquier producto para el agro</p> <a class=\"btn btn-info\" href=\"../../tienda_virtual/tienda\">VER PRODUCTOS</a></div> </section> <div class=\"py-2 bg-light\" > <div class=\"container\" > <div class=\"row\" >\r\n<div class=\"col-sm></div> \r\n<div class=\"col-sm col-align-self-center\" > <div class=\"card mb-4 box-shadow hov-img0\"  ><img src=\"../../tienda_virtual/Assets/images/agrobana.jpg\" alt=\"Tienda Uno\" style=\"width=20%;height=20%; /> <div > <p class=\"card-text\">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quaerat necessitatibus eligendi, soluta ipsa natus, at earum qui enim, illum doloremque, accusantium autem nemo est esse nulla neque eaque repellendus amet.</p> <p>Direcci&oacute;n: El Triunfo <br />Tel&eacute;fono: 4654645 <br />Correo: Agrobana@gmail.com</p>  </div></div></div></div></div>', 'img_d72cb5712933863e051dc9c7fac5e253.jpg', '2022-11-09 02:26:45', 'sucursales', 0),
(9, 'Not Found', '<h1>Error 404: P&aacute;gina no encontrada</h1> <p>No se encuentra la p&aacute;gina que ha solicitado.</p>', '', '2022-09-21 02:30:49', 'not-found', 1),
(10, 'Nutrición', '<p>&nbsp;</p> <p>&nbsp;</p> <p></p> <! Favicons > <p> </p> <! Google Fonts > <p></p> <! Vendor CSS Files > <p> </p> <! Template Main CSS File > <p></p> <! = * Template Name: Bootslander - v4.9.1 * Template URL: https://bootstrapmade.com/bootslander-free-bootstrap-landing-page-template/ * Author: BootstrapMade.com * License: https://bootstrapmade.com/license/  ><! = Gallery Section = > <section id=\"gallery\" class=\"gallery\"> <div class=\"container\"> <div class=\"section-title\" data-aos=\"fade-up\"> <h2>Deficiencias</h2> <p>Resultados de la falta de macro y micronutrientes</p> </div> <div class=\"row g-0\" data-aos=\"fade-left\"> <div class=\"col-lg-3 col-md-4\"> <div class=\"gallery-item\" data-aos=\"zoom-in\" data-aos-delay=\"100\"> <p>Nitrogeno</p> <a class=\"gallery-lightbox\" href=\"../../../paginas/editar/Tp/img/gallery/gallery-1.jpg\"> <img class=\"img-fluid\" src=\"../../../paginas/editar/Tp/img/gallery/gallery-1.jpg\" alt=\"\" /> </a></div> </div> <div class=\"col-lg-3 col-md-4\"> <div class=\"gallery-item\" data-aos=\"zoom-in\" data-aos-delay=\"150\"> <p>Fosforo</p> <a class=\"gallery-lightbox\" href=\"../../../paginas/editar/Tp/img/gallery/gallery-2.jpg\"> <img class=\"img-fluid\" src=\"../../../paginas/editar/Tp/img/gallery/gallery-2.jpg\" alt=\"\" /> </a></div> </div> <div class=\"col-lg-3 col-md-4\"> <div class=\"gallery-item\" data-aos=\"zoom-in\" data-aos-delay=\"200\"> <p>Potasio</p> <a class=\"gallery-lightbox\" href=\"../../../paginas/editar/Tp/img/gallery/gallery-3.jpg\"> <img class=\"img-fluid\" src=\"../../../paginas/editar/Tp/img/gallery/gallery-3.jpg\" alt=\"\" /> </a></div> </div> <div class=\"col-lg-3 col-md-4\"> <div class=\"gallery-item\" data-aos=\"zoom-in\" data-aos-delay=\"250\"> <p>Magnesio</p> <a class=\"gallery-lightbox\" href=\"../../../paginas/editar/Tp/img/gallery/gallery-4.jpg\"> <img class=\"img-fluid\" src=\"../../../paginas/editar/Tp/img/gallery/gallery-4.jpg\" alt=\"\" /> </a></div> </div> <div class=\"col-lg-3 col-md-4\"> <div class=\"gallery-item\" data-aos=\"zoom-in\" data-aos-delay=\"300\"> <p>Calcio</p> <a class=\"gallery-lightbox\" href=\"../../../paginas/editar/Tp/img/gallery/gallery-5.jpg\"> <img class=\"img-fluid\" src=\"../../../paginas/editar/Tp/img/gallery/gallery-5.jpg\" alt=\"\" /> </a></div> </div> <div class=\"col-lg-3 col-md-4\"> <div class=\"gallery-item\" data-aos=\"zoom-in\" data-aos-delay=\"350\"> <p>Azufre</p> <a class=\"gallery-lightbox\" href=\"../../../paginas/editar/Tp/img/gallery/gallery-6.jpg\"> <img class=\"img-fluid\" src=\"../../../paginas/editar/Tp/img/gallery/gallery-6.jpg\" alt=\"\" /> </a></div> </div> <div class=\"col-lg-3 col-md-4\"> <div class=\"gallery-item\" data-aos=\"zoom-in\" data-aos-delay=\"400\"> <p>Hierro</p> <a class=\"gallery-lightbox\" href=\"../../../paginas/editar/Tp/img/gallery/gallery-7.jpg\"> <img class=\"img-fluid\" src=\"../../../paginas/editar/Tp/img/gallery/gallery-7.jpg\" alt=\"\" /> </a></div> </div> <div class=\"col-lg-3 col-md-4\"> <div class=\"gallery-item\" data-aos=\"zoom-in\" data-aos-delay=\"450\"> <p>Manganeso</p> <a class=\"gallery-lightbox\" href=\"../../../paginas/editar/Tp/img/gallery/gallery-8.jpg\"> <img class=\"img-fluid\" src=\"../../../paginas/editar/Tp/img/gallery/gallery-8.jpg\" alt=\"\" /> </a></div> </div> <div class=\"col-lg-3 col-md-4\"> <div class=\"gallery-item\" data-aos=\"zoom-in\" data-aos-delay=\"450\"> <p>Zinc</p> <a class=\"gallery-lightbox\" href=\"../../../paginas/editar/Tp/img/gallery/gallery-9.jpg\"> <img class=\"img-fluid\" src=\"../../../paginas/editar/Tp/img/gallery/gallery-9.jpg\" alt=\"\" /> </a></div> </div> <div class=\"col-lg-3 col-md-4\"> <div class=\"gallery-item\" data-aos=\"zoom-in\" data-aos-delay=\"450\"> <p>Cobre</p> <a class=\"gallery-lightbox\" href=\"../../../paginas/editar/Tp/img/gallery/gallery-10.jpg\"> <img class=\"img-fluid\" src=\"../../../paginas/editar/Tp/img/gallery/gallery-10.jpg\" alt=\"\" /> </a></div> </div> </div> </div> </section> <! End Gallery Section > <p>&nbsp;</p> <! = Gallery Section = > <section id=\"gallery\" class=\"gallery\"> <div class=\"container\"> <div class=\"section-title\" data-aos=\"fade-up\"> <h2>Sobrecarga</h2> <p>Resultados de los excesos de los macro y micronutrientes</p> </div> <div class=\"row g-0\" data-aos=\"fade-left\"> <div class=\"col-lg-3 col-md-4\"> <div class=\"gallery-item\" data-aos=\"zoom-in\" data-aos-delay=\"100\"> <p>Nitrogeno</p> <a class=\"gallery-lightbox\" href=\"../../../paginas/editar/Tp/img/gallery/gallery-11.jpg\"> <img class=\"img-fluid\" src=\"../../../paginas/editar/Tp/img/gallery/gallery-11.jpg\" alt=\"\" /> </a></div> </div> <div class=\"col-lg-3 col-md-4\"> <div class=\"gallery-item\" data-aos=\"zoom-in\" data-aos-delay=\"150\"> <p>Potasio</p> <a class=\"gallery-lightbox\" href=\"../../../paginas/editar/Tp/img/gallery/gallery-12.jpg\"> <img class=\"img-fluid\" src=\"../../../paginas/editar/Tp/img/gallery/gallery-12.jpg\" alt=\"\" /> </a></div> </div> </div> </div> </section> <! End Gallery Section > <p>&nbsp;</p> <! Vendor JS Files > <p>&nbsp;</p> <! Template Main JS File >', 'img_5b9755b9f6ecf53c23c0e27a0b5dcf49.jpg', '2022-11-13 01:21:27', 'nutricion', 1),
(11, 'Crecimiento', '<!DOCTYPE html>\r\n\r\n<head>\r\n \r\n  <!-- Favicons -->\r\n  <link href=\"Tp/img/favicon.png\" rel=\"icon\">\r\n  <link href=\"Tp/img/apple-touch-icon.png\" rel=\"apple-touch-icon\">\r\n\r\n  <!-- Google Fonts -->\r\n  <link href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i\" rel=\"stylesheet\">\r\n\r\n  <!-- Vendor CSS Files -->\r\n  <link href=\"Tp/vendor/aos/aos.css\" rel=\"stylesheet\">\r\n  <link href=\"Tp/vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n  <link href=\"Tp/vendor/bootstrap-icons/bootstrap-icons.css\" rel=\"stylesheet\">\r\n  <link href=\"Tp/vendor/boxicons/css/boxicons.min.css\" rel=\"stylesheet\">\r\n  <link href=\"Tp/vendor/glightbox/css/glightbox.min.css\" rel=\"stylesheet\">\r\n  <link href=\"Tp/vendor/remixicon/remixicon.css\" rel=\"stylesheet\">\r\n  <link href=\"Tp/vendor/swiper/swiper-bundle.min.css\" rel=\"stylesheet\">\r\n\r\n  <!-- Template Main CSS File -->\r\n  <link href=\"Tp/css/style.css\" rel=\"stylesheet\">\r\n\r\n  <!-- =======================================================\r\n  * Template Name: Bootslander - v4.9.1\r\n  * Template URL: https://bootstrapmade.com/bootslander-free-bootstrap-landing-page-template/\r\n  * Author: BootstrapMade.com\r\n  * License: https://bootstrapmade.com/license/\r\n  ======================================================== -->\r\n</head>\r\n\r\n<body>\r\n\r\n  \r\n\r\n  <!-- ======= Hero Section ======= -->\r\n  <section id=\"hero\">\r\n\r\n    <div class=\"container\">\r\n      <div class=\"row justify-content-between\">\r\n        <div class=\"col-lg-7 pt-5 pt-lg-0 order-2 order-lg-1 d-flex align-items-center\">\r\n          <div data-aos=\"zoom-out\">\r\n            <h1>Infórmate, analiza y calcula con <span>Agrobana</span></h1>\r\n            <h2>Estamos surcando en nuevas técnologias</h2>\r\n            <div class=\"text-center text-lg-start\">\r\n              <a href=\"#about\" class=\"btn-get-started scrollto\" data-toggle=\"modal\" data-target=\"#modalAyuda\">Más información</a>\r\n            </div>\r\n          </div>\r\n        </div>\r\n        <div class=\"col-lg-4 order-1 order-lg-2 hero-img\" data-aos=\"zoom-out\" data-aos-delay=\"300\">\r\n          <img src=\"Tp/img/hero-img.svg\" class=\"img-fluid animated\" alt=\"\">\r\n        </div>\r\n      </div>\r\n    </div>\r\n\r\n    <svg class=\"hero-waves\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" viewBox=\"0 24 150 28 \" preserveAspectRatio=\"none\">\r\n      <defs>\r\n        <path id=\"wave-path\" d=\"M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z\">\r\n      </defs>\r\n      <g class=\"wave1\">\r\n        <use xlink:href=\"#wave-path\" x=\"50\" y=\"3\" fill=\"rgba(255,255,255, .1)\">\r\n      </g>\r\n      <g class=\"wave2\">\r\n        <use xlink:href=\"#wave-path\" x=\"50\" y=\"0\" fill=\"rgba(255,255,255, .2)\">\r\n      </g>\r\n      <g class=\"wave3\">\r\n        <use xlink:href=\"#wave-path\" x=\"50\" y=\"9\" fill=\"#fff\">\r\n      </g>\r\n    </svg>\r\n\r\n  </section><!-- End Hero -->\r\n\r\n  <main id=\"main\">\r\n\r\n\r\n\r\n    <!-- ======= F.A.Q Section ======= -->\r\n    <section id=\"faq\" class=\"faq section-bg\">\r\n      <div class=\"container\">\r\n\r\n        <div class=\"section-title\" data-aos=\"fade-up\">\r\n          <h2>Seccion informática</h2>\r\n          <p>¿Cuales son las condiciones para el crecimiento óptimo de mi cultivo de banano?</p>\r\n        </div>\r\n\r\n        <div class=\"faq-list\">\r\n          <ul>\r\n            <li data-aos=\"fade-up\">\r\n              <i class=\"bx bx-help-circle icon-help\"></i> <a data-bs-toggle=\"collapse\" class=\"collapse\" data-bs-target=\"#faq-list-1\">Indicaciones:<i class=\"bx bx-chevron-down icon-show\"></i><i class=\"bx bx-chevron-up icon-close\"></i></a>\r\n              <div id=\"faq-list-1\" class=\"collapse show\" data-bs-parent=\".faq-list\">\r\n                <p>\r\n                Si desea una valoración de su cultivo de banano, debera registrarse e iniciar sesión, presione el siguiente enlace:\r\n                </p>\r\n                <div data-aos=\"zoom-out\">\r\n                <div class=\"text-center text-lg-start\">\r\n                <a href=\"https://agroban-ec.com//nutricion\" class=\"btn-get-started scrollto\" >Más información</a>\r\n                </div>\r\n                </div>\r\n              </div>\r\n            </li>\r\n\r\n          </ul>\r\n        </div>\r\n\r\n      </div>\r\n      </section><!-- End F.A.Q Section -->\r\n\r\n\r\n\r\n    <!-- ======= About Section ======= -->\r\n    <section id=\"about\" class=\"about\">\r\n      <div class=\"container-fluid\">\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-xl-5 col-lg-6 video-box d-flex justify-content-center align-items-stretch\" data-aos=\"fade-right\">\r\n            <a href=\"\" class=\" \"></a>\r\n          </div>\r\n\r\n          <div class=\"col-xl-7 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5\" data-aos=\"fade-left\">\r\n            <h3>Tipo de suelo y climatización</h3>\r\n            <p>El banano a nivel mundial se produce en más de 130 países ubicados cerca del ecuador terrestre. Las regiones tropicales y sub-tropicales concentran la producción mundial de banano, ya que son las condiciones donde está adaptado el cultivo (INTAGRI, 2018).</p>\r\n            <div class=\"icon-box\" data-aos=\"zoom-in\" data-aos-delay=\"100\">\r\n              <div class=\"icon\"><i class=\"bi bi-flower1\"></i></div>\r\n              <h4 class=\"title\"><a href=\"\">Suelo:</a></h4>\r\n              <p class=\"description\">Franco arenoso, franco arcilloso, franco arcillo limosa y franco limosa.</p>\r\n            </div>\r\n\r\n            <div class=\"icon-box\" data-aos=\"zoom-in\" data-aos-delay=\"200\">\r\n              <div class=\"icon\"><i class=\"bi bi-brightness-high\"></i></div>\r\n              <h4 class=\"title\"><a href=\"\">Temperatura:</a></h4>\r\n              <p class=\"description\">21 a 30oC.</p>\r\n            </div>\r\n\r\n            <div class=\"icon-box\" data-aos=\"zoom-in\" data-aos-delay=\"300\">\r\n              <div class=\"icon\"><i class=\"bx bx-atom\"></i></div>\r\n              <h4 class=\"title\"><a href=\"\">PH:</a></h4>\r\n              <p class=\"description\">6.0 a 7.5.</p>\r\n            </div>\r\n\r\n            <div class=\"icon-box\" data-aos=\"zoom-in\" data-aos-delay=\"300\">\r\n              <div class=\"icon\"><i class=\"bi bi-arrow-up-right\"></i></div>\r\n              <h4 class=\"title\"><a href=\"\">Altitud:</a></h4>\r\n              <p class=\"description\">0 a 300 msnm.</p>\r\n            </div>\r\n\r\n            <div class=\"icon-box\" data-aos=\"zoom-in\" data-aos-delay=\"300\">\r\n              <div class=\"icon\"><i class=\"bi bi-arrow-down-right\"></i></div>\r\n              <h4 class=\"title\"><a href=\"\">Precipitación:</a></h4>\r\n              <p class=\"description\">100 mm a 180 mm.</p>\r\n            </div>\r\n\r\n          </div>\r\n        </div>\r\n\r\n      </div>\r\n    </section><!-- End About Section -->\r\n\r\n\r\n\r\n    <!-- ======= Details Section ======= -->\r\n    <section id=\"details\" class=\"details\">\r\n      <div class=\"container\">\r\n\r\n        <div class=\"row content\">\r\n          <div class=\"col-md-4\" data-aos=\"fade-right\">\r\n            <img src=\"Tp/img/details-1.png\" class=\"img-fluid\" alt=\"\">\r\n          </div>\r\n          <div class=\"col-md-8 pt-4\" data-aos=\"fade-up\">\r\n            <h3>Irrigacion</h3>\r\n            <p class=\"fst-italic\">\r\n            El cultivo del banano exige un suministro de agua abundante y frecuente a lo largo del ciclo de producción para asegurar la productividad y la calidad de la fruta. Los tipos de riego utilizados para el banano pueden ser aspersión subfoliar, aspersión supra foliar, goteo o gravedad. La selección del sistema de riego depende de la disponibilidad de recursos y del acceso a la tecnología. Aspectos como la retención de humedad, la infiltración básica, la evaporación y el potencial de equilibrio hídrico también deben ser considerados(FAO, 2020).\r\n            </p>\r\n          </div>\r\n\r\n          <div class=\"col-md-4\" data-aos=\"fade-right\">\r\n            <img src=\"Tp/img/details-2.png\" class=\"img-fluid\" alt=\"\">\r\n          </div>\r\n          <div class=\"col-md-8 pt-4\" data-aos=\"fade-up\">\r\n            <h3>Densidad de la siembra</h3>\r\n            <ul>\r\n              <li><i class=\"bi bi-check\"></i> Las plantas de banano generalmente no se plantan a menos de 2 a 3 m de distancia.</li>\r\n              <li><i class=\"bi bi-check\"></i> La densidad de siembra depende de las variedades de banano plantadas y de las prácticas de manejo.</li>\r\n              <li><i class=\"bi bi-check\"></i> El número de hijos que se desarrollan debe mantenerse a un máximo de 4 o 5 por estera</li>\r\n            </ul>\r\n          </div>\r\n\r\n\r\n        </div>\r\n      </div>\r\n    </section>\r\n\r\n  </main><!-- End #main -->\r\n  <!-- ======= F.A.Q Section ======= -->\r\n    <section id=\"faq\" class=\"faq section-bg\">\r\n      <div class=\"container\">\r\n\r\n        <div class=\"section-title\" data-aos=\"fade-up\">\r\n          <h2></h2>\r\n          <p>¿Cuál es el rendimiento establecido del cultivo y que contiene el cultivo de banano?</p>\r\n        </div>\r\n\r\n        <div class=\"faq-list\">\r\n          <ul>\r\n            <li data-aos=\"fade-up\" data-aos-delay=\"100\">\r\n              <i class=\"bx bx-help-circle icon-help\"></i> <a data-bs-toggle=\"collapse\" data-bs-target=\"#faq-list-2\" class=\"collapsed\">¿Cuál es el rendimiento esperado del cultivo de banano? <i class=\"bx bx-chevron-down icon-show\"></i><i class=\"bx bx-chevron-up icon-close\"></i></a>\r\n              <div id=\"faq-list-2\" class=\"collapse\" data-bs-parent=\".faq-list\">\r\n                <p>\r\n                El número de retoños en desarrollo debe mantenerse a un máximo de 4 o 5 por estera, dependiendo de la distancia de plantación y otras prácticas.\r\n                Normalmente se pueden obtener rendimientos de 15, 20 y hasta 45 ton/ha para las variedades \'Brazilian\', \'Bluefields\' y \'Cavendish\', respectivamente. Se han reportado rendimientos de 84 ton/ha en condiciones óptimas (HAIFAGROUP,2022).\r\n                </p>\r\n              </div>\r\n            </li>\r\n\r\n            <li data-aos=\"fade-up\" data-aos-delay=\"200\">\r\n              <i class=\"bx bx-help-circle icon-help\"></i> <a data-bs-toggle=\"collapse\" data-bs-target=\"#faq-list-3\" class=\"collapsed\">¿Cuál es el contenido de los nutrientes en mi cultivo de banano (N, P2O5, K2O) (Kg/ha)? <i class=\"bx bx-chevron-down icon-show\"></i><i class=\"bx bx-chevron-up icon-close\"></i></a>\r\n              <div id=\"faq-list-3\" class=\"collapse\" data-bs-parent=\".faq-list\">\r\n                <p>\r\n                Esta tabla de contenido de nutrientes nos permite calcular las medidas a usar de los fertilizantes, para producir 40 toneladas de banano deberemos contar con esta cantidad en kilos de materia\r\n                <table class=\"table\">\r\n                <thead>\r\n                  <tr>\r\n                    <th scope=\"col\">Cultivo</th>\r\n                    <th scope=\"col\">Producir (ton/ha)</th>\r\n                    <th scope=\"col\">Nitrogeno (kg/ha)</th>\r\n                    <th scope=\"col\">P2O5 (kg/ha)</th>\r\n                    <th scope=\"col\">K2O (kg/ha)</th>\r\n                  </tr>\r\n                </thead>\r\n                <tbody>\r\n                  <tr>\r\n                    <td>Banano</td>\r\n                    <td>40</td>\r\n                    <td>320</td>\r\n                    <td>60</td>\r\n                    <td>1000</td>\r\n                  </tr>\r\n                 </tbody>\r\n                 </table>\r\n\r\n                </p>\r\n              </div>\r\n            </li>\r\n\r\n            <li data-aos=\"fade-up\" data-aos-delay=\"300\">\r\n              <i class=\"bx bx-help-circle icon-help\"></i> <a data-bs-toggle=\"collapse\" data-bs-target=\"#faq-list-4\" class=\"collapsed\">¿Cuál es el contenido relativo de nutrientes vegetales en hojas de banano? <i class=\"bx bx-chevron-down icon-show\"></i><i class=\"bx bx-chevron-up icon-close\"></i></a>\r\n              <div id=\"faq-list-4\" class=\"collapse\" data-bs-parent=\".faq-list\">\r\n                <p>\r\n                Después de un análisis químico foliar, su cultivo deberá encontrarse constituido por los siguientes porcentajes:\r\n                <img src=\"Tp/img/gallery/figure-1.jpg\" class=\"img-fluid\" alt=\"\">\r\n                <p>Análisis: la gráfica nos muestra la cantidad en porcentaje del contenido de las hojas de nuestro cultivo banano, debera estar constituida por nitrogeno (N), fósforo (P), potasio (K), calcio (Ca), magnesio (Mg), azufre(S) .</p>\r\n                </p>\r\n              </div>\r\n            </li>\r\n\r\n            <li data-aos=\"fade-up\" data-aos-delay=\"400\">\r\n              <i class=\"bx bx-help-circle icon-help\"></i> <a data-bs-toggle=\"collapse\" data-bs-target=\"#faq-list-5\" class=\"collapsed\">¿Cuáles son los contenidos relativos de nutrientes vegetales en frutos de banano? <i class=\"bx bx-chevron-down icon-show\"></i><i class=\"bx bx-chevron-up icon-close\"></i></a>\r\n              <div id=\"faq-list-5\" class=\"collapse\" data-bs-parent=\".faq-list\">\r\n                <p>\r\n                De igual manera un análisis químico le mostrara los porcentajes</p>\r\n                <img src=\"Tp/img/gallery/figure-2.jpg\" class=\"img-fluid\" alt=\"\">\r\n                <p>Análisis: la gráfica nos muestra la cantidad en porcentaje del contenido que deberia tener su fruta de banano, las nomenclaturas son las mismas, siguenm constituidas de la misma forma: nitrogeno (N), fósforo (P), potasio (K), calcio (Ca), magnesio (Mg), azufre(S) .</p>\r\n                </p>\r\n              </div>\r\n            </li>\r\n          </ul>\r\n        </div>\r\n\r\n      </div>\r\n    </section><!-- End F.A.Q Section -->\r\n\r\n  \r\n\r\n  <!-- Vendor JS Files -->\r\n  <script src=\"Tp/vendor/purecounter/purecounter_vanilla.js\"></script>\r\n  <script src=\"Tp/vendor/aos/aos.js\"></script>\r\n  <script src=\"Tp/vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\r\n  <script src=\"Tp/vendor/glightbox/js/glightbox.min.js\"></script>\r\n  <script src=\"Tp/vendor/swiper/swiper-bundle.min.js\"></script>\r\n  <script src=\"Tp/vendor/php-email-form/validate.js\"></script>\r\n\r\n  <!-- Template Main JS File -->\r\n  <script src=\"Tp/js/main.js\"></script>\r\n\r\n</body>\r\n\r\n</html>', 'img_0115ef39d43cfa9b34ef32b36b9df6e3.jpg', '2022-11-13 01:21:27', 'crecimiento', 1),
(12, 'Fertilización', '', 'img_3898bfbb9aee0ef9c46aad19f5dc5151.jpg', '2022-11-13 01:21:27', 'fertilizacion', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `idpregunta` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT '',
  `status` varchar(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`idpregunta`, `nombre`, `status`) VALUES
(1, 'PREGUNTAS NUTRICIONALES', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` bigint(20) NOT NULL,
  `categoriaid` bigint(20) NOT NULL,
  `codigo` varchar(30) COLLATE utf8mb4_swedish_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `categoriaid`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
(1, 4, '2417984565', 'Basfoliar Calcio 1 lt', '<p>Es un fertilizante foliar que ayuda al control integrado de hongos. Mejora la vida post cosecha de frutas y hortalizas, que esta constituido de Calcio (CaCl2) en un 17%;</p>', '9.00', 100, NULL, '2022-10-28 03:12:14', 'basfoliar-calcio-1-lt', 1),
(2, 2, '456879878', 'DAP 50kg Fertilizante simple', '<p>Es uno de los fertilizantes con el mayor contenido de unidades nutritivas. Contiene 18% de Nitr&oacute;geno y 46% de F&oacute;sforo que minimizan los costos de embarque debido a este otorgar al cultivo mejores rendimientos debido a su doble conbinaci&oacute;n</p>', '65.00', 100, NULL, '2022-11-18 03:14:10', 'dap-50kg-fertilizante-simple', 1),
(3, 2, '4658798787', 'Blaukorn Fertilizante Edáfico', '<p>Es un abono complejo granulado con magnesio, azufre, y microelementos de coloraci&oacute;n azul. Dan solubilidad a los nutrientes y al suelo en su totalidad.</p> <ul> <li>Nitr&oacute;geno total 12%;</li> <li>F&oacute;sforo 8%;</li> <li>Potasio 16%;</li> <li>Magnesio 3%;</li> <li>Azufre 25%;</li> <li>Boro 0.02%;</li> <li>Hierro 0.06%;</li> <li>Zinc 0.01%;</li> </ul>', '85.00', 100, NULL, '2022-08-26 00:48:21', 'blaukorn-fertilizante-edafico', 1),
(4, 1, '234234234', 'UREA Gr 50Kg Fertilizante Simple', '<p>Es un fertilizante que contiene ureico o am&iacute;dico. Producto de la reacci&oacute;n del amoniaco con CO2.</p> <ul> <li>Nitr&oacute;geno (N) 46%;</li> </ul> <p>La urea es el fertilizante m&aacute;s popular. Es el s&oacute;lido granulado de mayor concentraci&oacute;n de nitr&oacute;geno (N). El Nitr&oacute;geno es esencial en la planta. Forma parte de cada c&eacute;lula viva.</p>', '48.00', 100, NULL, '2022-11-08 02:13:39', 'urea-gr-50kg-fertilizante-simple', 1),
(5, 2, '12345', 'Abono NPK 15-15-15 La Colina', '<p>15-15-15 Enriquecido aporta Nitr&oacute;geno que forma parte de la clorofila, coenzimas, &aacute;cidos nucleicos y prote&iacute;nas; F&oacute;sforo que se destaca en la generaci&oacute;n de energ&iacute;a; Potasio encargado de activar la fotos&iacute;ntesis, translocaci&oacute;n de carbohidratos, s&iacute;ntesis de prote&iacute;nas</p>', '45.00', 100, NULL, '2022-12-23 21:15:43', 'abono-npk-15-15-15-la-colina', 1),
(6, 1, '91601', 'Muriato de Potasio', '<p>Es un fertilizante con un alto contenido de Potasio (K), recomendado para corregir deficiencias de este nutriente para obtener un buen peso y llenado de frutos u &oacute;rganos cosechables de los vegetales.</p>', '48.00', 100, NULL, '2022-12-27 20:05:51', 'muriato-de-potasio', 1),
(7, 4, '123124', 'Basfoliar Magnesio 1LT', '<p>Fertilizante de aplicaci&oacute;n foliar, concentrado de magnesio en suspensi&oacute;n con un 30% de magnesio. Para el tratamiento preventivo y curativo en cultivos agr&iacute;colas y hort&iacute;colas.</p>', '12.00', 100, NULL, '2023-01-16 23:02:12', 'basfoliar-magnesio-1lt', 1),
(8, 2, '34534', 'Sulfato de Amonio Granulado 50 Kg', '<p>Fertilizante simple y en formulaciones para uso agr&iacute;cola, tambi&eacute;n es una buena fuente de Nitr&oacute;geno 21% y Azufre 24% para los suelos deficientes en este elemento.</p>', '32.00', 100, NULL, '2023-01-16 23:37:39', 'sulfato-de-amonio-granulado-50-kg', 1),
(9, 1, '123123', 'Yaratera Kristalon', '<p>Kristalon&nbsp; 18-18-18 es un fertilizante fabricado con materia prima premium que ha sido seleccionada cuidadosamente. Contiene un rango equilibrado de micro nutrientes (B,Cu,Fe,Mn,Mo,Zn,), est&aacute;n libres de componentes insolubles y fito-t&oacute;xicos.</p>', '68.00', 100, NULL, '2023-01-17 22:31:08', 'yaratera-kristalon', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reembolso`
--

CREATE TABLE `reembolso` (
  `id` bigint(20) NOT NULL,
  `pedidoid` bigint(20) NOT NULL,
  `idtransaccion` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datosreembolso` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `observacion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(150) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` bigint(20) NOT NULL,
  `nombrerol` varchar(50) COLLATE utf8mb4_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombrerol`, `descripcion`, `status`) VALUES
(1, 'Administrador', 'Acceso a todo el sistema', 1),
(2, 'Supervisor', 'Supervisor de tienda', 1),
(3, 'Cliente', 'Clientes en general acceso restringido a alguas funciones', 1),
(4, 'Vendedor', 'Operador de tienda', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripciones`
--

CREATE TABLE `suscripciones` (
  `idsuscripcion` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `suscripciones`
--

INSERT INTO `suscripciones` (`idsuscripcion`, `nombre`, `email`, `datecreated`) VALUES
(2, 'Aily', 'pierrecontreras93@gmail.com', '2022-12-23 21:03:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `idtipopago` bigint(20) NOT NULL,
  `tipopago` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`idtipopago`, `tipopago`, `status`) VALUES
(1, 'PayPal', 1),
(2, 'Efectivo', 1),
(3, 'Tarjeta', 1),
(4, 'Cheque', 1),
(5, 'Despósito Bancario', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`iduser`, `nombre`, `apellido`, `telefono`, `correo`) VALUES
(29, '', '', '', ''),
(28, 'asd', 'sd', '333', 'asd@ac.ss'),
(27, 'r', 'r', '222', 'eee@ca.cc'),
(26, 'aa', 'dd', '222', 'asd@s.cc'),
(25, 'a', 'a', '333', 'aa@asc.cc'),
(24, 'sd', 'as', '222', 'asd@asd.ccc'),
(23, 'sd', 'as', '222', 'asd@asd.ccc'),
(22, 'asd', 'asd', '2222', '3asd@s.cc'),
(21, 'asd', 'asd', '222', 'asd@asdc.ccc'),
(20, '1', '1', '2', '26@asd.cc'),
(19, '1', '1', '1', 'asd@asc.cc'),
(18, 'd', 'd', '222', 'as@asd.cc'),
(30, '', '', '', ''),
(31, 'Pierre', 'Contreras', '0978845296', 'pierrecontreras92@gmail.com'),
(32, 'Pierre', 'Pierre', '0978845296', 'pierrecontreras94@gmail.com'),
(33, '', '', '', ''),
(34, '', '', '', ''),
(35, '', '', '', ''),
(36, '', '', '', ''),
(37, '', '', '', ''),
(38, '', '', '', ''),
(39, '', '', '', ''),
(40, '', '', '', ''),
(41, '', '', '', ''),
(42, '', '', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asesoria`
--
ALTER TABLE `asesoria`
  ADD PRIMARY KEY (`idasesoria`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidoid` (`pedidoid`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`),
  ADD KEY `personaid` (`personaid`);

--
-- Indices de la tabla `formulario`
--
ALTER TABLE `formulario`
  ADD PRIMARY KEY (`idformulario`);

--
-- Indices de la tabla `formulariodet`
--
ALTER TABLE `formulariodet`
  ADD PRIMARY KEY (`idformulariodet`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`idmodulo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `personaid` (`personaid`),
  ADD KEY `tipopagoid` (`tipopagoid`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermiso`),
  ADD KEY `rolid` (`rolid`),
  ADD KEY `moduloid` (`moduloid`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `rolid` (`rolid`);

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`idpost`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`idpregunta`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `categoriaid` (`categoriaid`);

--
-- Indices de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidoid` (`pedidoid`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  ADD PRIMARY KEY (`idsuscripcion`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`idtipopago`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asesoria`
--
ALTER TABLE `asesoria`
  MODIFY `idasesoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formulario`
--
ALTER TABLE `formulario`
  MODIFY `idformulario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `formulariodet`
--
ALTER TABLE `formulariodet`
  MODIFY `idformulariodet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `idmodulo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermiso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `idpost` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `idpregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  MODIFY `idsuscripcion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `idtipopago` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
