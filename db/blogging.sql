-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2024 a las 15:51:17
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
-- Base de datos: `blogging`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL,
  `categoria` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `categoria`) VALUES
(3, 'actualidad'),
(7, 'arte'),
(2, 'cocina'),
(8, 'educacion'),
(1, 'entretenimiento'),
(5, 'religion'),
(6, 'salud'),
(4, 'tegnologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_post`
--

CREATE TABLE `categoria_post` (
  `idCategoria` int(11) DEFAULT NULL,
  `idPublicaion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_post`
--

INSERT INTO `categoria_post` (`idCategoria`, `idPublicaion`) VALUES
(7, 1),
(2, 2),
(4, 3),
(1, 6),
(6, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `idComentario` int(11) NOT NULL,
  `idPublicacion` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `comentario` varchar(250) DEFAULT NULL,
  `FechaCreacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`idComentario`, `idPublicacion`, `idUser`, `comentario`, `FechaCreacion`) VALUES
(1, 2, 3, 'buena receta, y facil de realizar ', '2024-05-30 00:46:59'),
(2, 4, 5, 'con esa tegnologia el internaet para todos es una realizad . falta regualr el precio ', '2024-05-28 00:48:28'),
(3, 1, 7, 'vi el musical hace años , fue muy bueno ', '2024-05-30 00:48:49'),
(4, 5, 2, 'no creo en los signos , todos dicen los mismos ', '2024-05-12 00:48:49'),
(5, 8, 3, 'buen libro , mantiene el misterio hasta el final , el titulo queda bien con la historia', '2024-04-09 01:30:08'),
(6, 4, 7, 'el internet es muy rapido', '2024-05-12 08:25:45'),
(11, 2, 7, 'fue una buena pelicula, pero no se parece al libro sobre el cual esta basado  ', '2024-05-28 04:48:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion`
--

CREATE TABLE `publicacion` (
  `idPublicacion` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL,
  `titulo` varchar(250) DEFAULT NULL,
  `publicacion` varchar(500) DEFAULT NULL,
  `FechaCreacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `publicacion`
--

INSERT INTO `publicacion` (`idPublicacion`, `idUser`, `titulo`, `publicacion`, `FechaCreacion`) VALUES
(1, 1, 'el cascanueces ', 'La historia trata sobre el nuevo juguete de la joven Marie Stahlbaum, el Cascanueces, recibido la noche de Navidad que cobra vida y, después de derrotar al Rey Ratón tras una dura batalla, la lleva a un reino mágico poblado por muñecos. Variedad de las tradicionales figuritas de cascanueces.', '2024-05-01 00:33:21'),
(2, 7, 'pie de limon ', 'La tarta de limón y merengue es una de las más demandadas para servir durante las reuniones familiares y amigos, sobre todo. Normalmente acostumbramos a encargarla en la pastelería más cercana, pero, ¿por qué no hacerla en casa? El resultado será un pastel mucho más económico y realizado según nuestros gustos personales.\r\n\r\nToma nota de los ingredientes que en RecetasGratis te exponemos y aprende cómo hacer pie de limón y merengue fácil.', '2024-05-27 00:33:45'),
(3, 3, 'magic 7', 'Luego de analizar en detalle las características de ambos teléfonos, podemos decir que el Honor Magic 5 Pro es mejor. Este móvil cuenta con una pantalla ligeramente más grande y brillante, un procesador más potente, una configuración de cámara trasera más avanzada y una batería de mayor capacidad. es muy resistente casi indestructible', '2024-05-12 00:35:06'),
(4, 5, 'starlink', 'Starlink es una empresa que nació como proyecto de SpaceX para la creación de una constelación de satélites de internet​ con el objetivo de brindar un servicio de internet de banda ancha, baja latencia y cobertura mundial a bajo costo.​​ SpaceX comenzó a lanzar satélites Starlink en 2019', '2024-05-06 00:38:29'),
(5, 3, 'saguitario', 'uen día hoy, Sagitario, para el tema sentimental. Es un momento perfecto para avanzar en la relación, comprometerte o decidir irte a vivir con tu chico. A diario te preocupa demasiado el futuro junto a la persona que has elegido. Nadie sabe si un amor será para toda la vida o sólo por un tiempo. De lo único que puedes estar segura es de los sentimientos que te inspira en estos momentos y fiarte de los suyos. Si te sientes feliz, ¡adelante! Procura que las condiciones que ahora te hacen la vida t', '2024-05-28 00:37:05'),
(6, 4, 'el principito', 'El clásico de El Principito en una nueva edición que contiene las ilustraciones con los colores originales del autor.\r\n\r\nUna maravillosa reflexión de Saint-Exupéry sobre la amistad, el amor, la responsabilidad y el sentido de la vida.\r\n\r\nViví así, solo, sin nadie con quien hablar verdaderamente, hasta que tuve una avería en el desierto del Sahara, hace seis años. Algo se había roto en mi motor. Y como no tenía conmigo ni mecánico ni pasajeros, me dispuse a realizar, solo, una repa_ración difícil', '2024-04-14 00:41:07'),
(7, 5, 'sirrocis ', 'El clásico de El Principito en una nueva edición que contiene las ilustraciones con los colores originales del autor.\r\n\r\nUna maravillosa reflexión de Saint-Exupéry sobre la amistad, el amor, la responsabilidad y el sentido de la vida.\r\n\r\nViví así, solo, sin nadie con quien hablar verdaderamente, hasta que tuve una avería en el desierto del Sahara, hace seis años. Algo se había roto en mi motor. Y como no tenía conmigo ni mecánico ni pasajeros, me dispuse a realizar, solo, una repa_ración difícil', '2024-05-27 00:45:42'),
(8, 9, 'un gato entre las palomas  ', 'novela de misterio escrita por agata christie . relata la historio de un crimen en un colegio solo de señoritas, el unico sospechhoso es el jardinero pero no es lo que parece', '2024-05-01 01:29:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRoles` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRoles`, `role`) VALUES
(1, 'administrador'),
(2, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUser` int(11) NOT NULL,
  `idRoles` int(11) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `correo` varchar(200) NOT NULL,
  `contraseña` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUser`, `idRoles`, `nombre`, `apellido`, `correo`, `contraseña`) VALUES
(1, 1, 'Juan', 'Martinez', 'juan@gmail.com', '123456789'),
(2, 2, 'Jose', 'Crespo', 'jose@gmail.com', '123456789'),
(3, 2, 'criatian', 'castro', 'cristian@gmail.com', '123456789'),
(4, 1, 'luis', 'miguel', 'luis@gmail.com', '123456789'),
(5, 2, 'Pedro', 'Garcia', 'pedro@gmail.com', '123456789'),
(6, 2, 'jesus', 'fernandez', 'jesus@gmail.com', '123456789'),
(7, 2, 'diego', ' d\' l vega', 'diego@gmail.com', '123456789'),
(9, 2, 'luis', ' geurra', 'luiso@gmail.com', '123456789'),
(10, 2, 'mahonry', 'Moriancumer', 'mahjonry@gmail.com', '123456789');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`),
  ADD UNIQUE KEY `categoria` (`categoria`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `categoria_post`
--
ALTER TABLE `categoria_post`
  ADD KEY `idUser` (`idCategoria`),
  ADD KEY `idPublicaion` (`idPublicaion`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idComentario`),
  ADD KEY `idPublicaion` (`idPublicacion`),
  ADD KEY `idUser` (`idUser`);

--
-- Indices de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD PRIMARY KEY (`idPublicacion`),
  ADD UNIQUE KEY `titulo` (`titulo`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idPublicacion` (`idPublicacion`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRoles`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `idRoles` (`idRoles`),
  ADD KEY `idUser` (`idUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  MODIFY `idPublicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRoles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria_post`
--
ALTER TABLE `categoria_post`
  ADD CONSTRAINT `categoria_post_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `categoria_post_ibfk_2` FOREIGN KEY (`idPublicaion`) REFERENCES `publicacion` (`idPublicacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `usuarios` (`idUser`) ON UPDATE CASCADE,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`idPublicacion`) REFERENCES `publicacion` (`idPublicacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD CONSTRAINT `publicacion_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `usuarios` (`idUser`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRoles`) REFERENCES `roles` (`idRoles`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
