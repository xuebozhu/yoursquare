-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2017 a las 22:31:05
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `yoursquare`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `comm_id` int(11) NOT NULL,
  `comm_idSquare` int(11) NOT NULL,
  `comm_idCreator` int(11) NOT NULL,
  `comm_idUserSquare` int(11) NOT NULL,
  `comm_content` varchar(100) CHARACTER SET utf8 NOT NULL,
  `comm_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments_thread`
--

CREATE TABLE `comments_thread` (
  `commth_id` int(11) NOT NULL,
  `commth_commId` int(11) NOT NULL,
  `commth_content` varchar(100) CHARACTER SET utf8 NOT NULL,
  `commth_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `men_mensajeid` int(11) NOT NULL,
  `men_receptorid` int(11) DEFAULT NULL,
  `men_emisorid` int(11) DEFAULT NULL,
  `men_subject` varchar(100) DEFAULT NULL,
  `men_body` longtext,
  `men_tipo` varchar(45) DEFAULT NULL,
  `men_createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `men_abierto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`men_mensajeid`, `men_receptorid`, `men_emisorid`, `men_subject`, `men_body`, `men_tipo`, `men_createdate`, `men_abierto`) VALUES
(1, 2, 1, 'Prueba1', 'Prueba1', 'entrada', '2017-05-21 17:03:13', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relatedtags`
--

CREATE TABLE `relatedtags` (
  `retag_relatedtagid` int(11) NOT NULL,
  `retag_tagid` int(11) DEFAULT NULL,
  `retag_squareid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `relatedtags`
--

INSERT INTO `relatedtags` (`retag_relatedtagid`, `retag_tagid`, `retag_squareid`) VALUES
(1, 1, 1),
(2, 2, 1),
(9, 2, 1),
(10, 2, 1),
(11, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `square`
--

CREATE TABLE `square` (
  `sq_squareid` int(11) NOT NULL,
  `sq_createdate` datetime DEFAULT NULL,
  `sq_updatedate` datetime DEFAULT NULL,
  `sq_userip` varchar(15) DEFAULT NULL,
  `sq_userid` int(11) DEFAULT NULL,
  `sq_csscontent` longtext,
  `sq_htmlcontent` longtext,
  `sq_description` varchar(255) DEFAULT NULL,
  `sq_title` varchar(150) DEFAULT NULL,
  `sq_likes` int(11) DEFAULT NULL,
  `sq_dislikes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `square`
--

INSERT INTO `square` (`sq_squareid`, `sq_createdate`, `sq_updatedate`, `sq_userip`, `sq_userid`, `sq_csscontent`, `sq_htmlcontent`, `sq_description`, `sq_title`, `sq_likes`, `sq_dislikes`) VALUES
(1, NULL, NULL, NULL, 1, NULL, 'hlo', NULL, 'Poesia 1', NULL, NULL),
(2, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'Cocina', NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'El cielo es azúl', NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Nunca te rindas', NULL, NULL),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Mi mejor square', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE `tags` (
  `tag_tagid` int(11) NOT NULL,
  `tag_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tags`
--

INSERT INTO `tags` (`tag_tagid`, `tag_name`) VALUES
(1, 'poesia'),
(2, 'arte'),
(3, 'filosofía');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usr_id` int(11) NOT NULL,
  `usr_usuario` varchar(50) DEFAULT NULL,
  `usr_password` varchar(50) DEFAULT NULL,
  `usr_es_admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usr_id`, `usr_usuario`, `usr_password`, `usr_es_admin`) VALUES
(1, 'oscarval', 'oscarval', 1),
(2, 'juanca', 'juanca', 0);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vmensajes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vmensajes` (
`men_mensajeid` int(11)
,`men_receptorid` int(11)
,`men_emisorid` int(11)
,`men_subject` varchar(100)
,`men_body` longtext
,`men_tipo` varchar(45)
,`men_createdate` datetime
,`men_abierto` int(11)
,`receptor` varchar(50)
,`emisor` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vrelatedtagshot`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vrelatedtagshot` (
`retag_relatedtagid` int(11)
,`retag_tagid` int(11)
,`retag_squareid` int(11)
,`count` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vsquareadmin`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vsquareadmin` (
`sq_squareid` int(11)
,`sq_createdate` datetime
,`sq_updatedate` datetime
,`sq_userip` varchar(15)
,`sq_userid` int(11)
,`sq_csscontent` longtext
,`sq_htmlcontent` longtext
,`sq_description` varchar(255)
,`sq_title` varchar(150)
,`sq_likes` int(11)
,`sq_dislikes` int(11)
,`usr_id` int(11)
,`usr_usuario` varchar(50)
,`usr_password` varchar(50)
,`usr_es_admin` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vsquaredetails`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vsquaredetails` (
`sq_squareid` int(11)
,`sq_createdate` datetime
,`sq_updatedate` datetime
,`sq_userip` varchar(15)
,`sq_userid` int(11)
,`sq_csscontent` longtext
,`sq_htmlcontent` longtext
,`sq_description` varchar(255)
,`sq_title` varchar(150)
,`sq_likes` int(11)
,`sq_dislikes` int(11)
,`usr_id` int(11)
,`usr_usuario` varchar(50)
,`usr_password` varchar(50)
,`usr_es_admin` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vsquareguest`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vsquareguest` (
`sq_squareid` int(11)
,`sq_createdate` datetime
,`sq_updatedate` datetime
,`sq_userip` varchar(15)
,`sq_userid` int(11)
,`sq_csscontent` longtext
,`sq_htmlcontent` longtext
,`sq_description` varchar(255)
,`sq_title` varchar(150)
,`sq_likes` int(11)
,`sq_dislikes` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vsquareuser`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vsquareuser` (
`sq_squareid` int(11)
,`sq_createdate` datetime
,`sq_updatedate` datetime
,`sq_userip` varchar(15)
,`sq_userid` int(11)
,`sq_csscontent` longtext
,`sq_htmlcontent` longtext
,`sq_description` varchar(255)
,`sq_title` varchar(150)
,`sq_likes` int(11)
,`sq_dislikes` int(11)
,`retag_relatedtagid` int(11)
,`retag_tagid` int(11)
,`retag_squareid` int(11)
,`count` bigint(21)
,`usr_id` int(11)
,`usr_usuario` varchar(50)
,`usr_password` varchar(50)
,`usr_es_admin` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vtagssquare`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vtagssquare` (
`tag_tagid` int(11)
,`tag_name` varchar(100)
,`sq_squareid` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vmensajes`
--
DROP TABLE IF EXISTS `vmensajes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`yoursquare`@`localhost` SQL SECURITY DEFINER VIEW `vmensajes`  AS  select `mensajes`.`men_mensajeid` AS `men_mensajeid`,`mensajes`.`men_receptorid` AS `men_receptorid`,`mensajes`.`men_emisorid` AS `men_emisorid`,`mensajes`.`men_subject` AS `men_subject`,`mensajes`.`men_body` AS `men_body`,`mensajes`.`men_tipo` AS `men_tipo`,`mensajes`.`men_createdate` AS `men_createdate`,`mensajes`.`men_abierto` AS `men_abierto`,(select `usuarios`.`usr_usuario` from `usuarios` where (`usuarios`.`usr_id` = `mensajes`.`men_receptorid`)) AS `receptor`,(select `usuarios`.`usr_usuario` from `usuarios` where (`usuarios`.`usr_id` = `mensajes`.`men_emisorid`)) AS `emisor` from `mensajes` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vrelatedtagshot`
--
DROP TABLE IF EXISTS `vrelatedtagshot`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vrelatedtagshot`  AS  select `relatedtags`.`retag_relatedtagid` AS `retag_relatedtagid`,`relatedtags`.`retag_tagid` AS `retag_tagid`,`relatedtags`.`retag_squareid` AS `retag_squareid`,count(0) AS `count` from `relatedtags` group by `relatedtags`.`retag_squareid` order by count(0) desc ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vsquareadmin`
--
DROP TABLE IF EXISTS `vsquareadmin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsquareadmin`  AS  select `square`.`sq_squareid` AS `sq_squareid`,`square`.`sq_createdate` AS `sq_createdate`,`square`.`sq_updatedate` AS `sq_updatedate`,`square`.`sq_userip` AS `sq_userip`,`square`.`sq_userid` AS `sq_userid`,`square`.`sq_csscontent` AS `sq_csscontent`,`square`.`sq_htmlcontent` AS `sq_htmlcontent`,`square`.`sq_description` AS `sq_description`,`square`.`sq_title` AS `sq_title`,`square`.`sq_likes` AS `sq_likes`,`square`.`sq_dislikes` AS `sq_dislikes`,`usuarios`.`usr_id` AS `usr_id`,`usuarios`.`usr_usuario` AS `usr_usuario`,`usuarios`.`usr_password` AS `usr_password`,`usuarios`.`usr_es_admin` AS `usr_es_admin` from (`square` left join `usuarios` on((`square`.`sq_userid` = `usuarios`.`usr_id`))) order by `square`.`sq_createdate` desc ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vsquaredetails`
--
DROP TABLE IF EXISTS `vsquaredetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsquaredetails`  AS  select `square`.`sq_squareid` AS `sq_squareid`,`square`.`sq_createdate` AS `sq_createdate`,`square`.`sq_updatedate` AS `sq_updatedate`,`square`.`sq_userip` AS `sq_userip`,`square`.`sq_userid` AS `sq_userid`,`square`.`sq_csscontent` AS `sq_csscontent`,`square`.`sq_htmlcontent` AS `sq_htmlcontent`,`square`.`sq_description` AS `sq_description`,`square`.`sq_title` AS `sq_title`,`square`.`sq_likes` AS `sq_likes`,`square`.`sq_dislikes` AS `sq_dislikes`,`usuarios`.`usr_id` AS `usr_id`,`usuarios`.`usr_usuario` AS `usr_usuario`,`usuarios`.`usr_password` AS `usr_password`,`usuarios`.`usr_es_admin` AS `usr_es_admin` from (`square` left join `usuarios` on((`square`.`sq_userid` = `usuarios`.`usr_id`))) where (`square`.`sq_userid` is not null) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vsquareguest`
--
DROP TABLE IF EXISTS `vsquareguest`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsquareguest`  AS  select `square`.`sq_squareid` AS `sq_squareid`,`square`.`sq_createdate` AS `sq_createdate`,`square`.`sq_updatedate` AS `sq_updatedate`,`square`.`sq_userip` AS `sq_userip`,`square`.`sq_userid` AS `sq_userid`,`square`.`sq_csscontent` AS `sq_csscontent`,`square`.`sq_htmlcontent` AS `sq_htmlcontent`,`square`.`sq_description` AS `sq_description`,`square`.`sq_title` AS `sq_title`,`square`.`sq_likes` AS `sq_likes`,`square`.`sq_dislikes` AS `sq_dislikes` from `square` where isnull(`square`.`sq_userid`) order by `square`.`sq_likes` desc ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vsquareuser`
--
DROP TABLE IF EXISTS `vsquareuser`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsquareuser`  AS  select `square`.`sq_squareid` AS `sq_squareid`,`square`.`sq_createdate` AS `sq_createdate`,`square`.`sq_updatedate` AS `sq_updatedate`,`square`.`sq_userip` AS `sq_userip`,`square`.`sq_userid` AS `sq_userid`,`square`.`sq_csscontent` AS `sq_csscontent`,`square`.`sq_htmlcontent` AS `sq_htmlcontent`,`square`.`sq_description` AS `sq_description`,`square`.`sq_title` AS `sq_title`,`square`.`sq_likes` AS `sq_likes`,`square`.`sq_dislikes` AS `sq_dislikes`,`vrelatedtagshot`.`retag_relatedtagid` AS `retag_relatedtagid`,`vrelatedtagshot`.`retag_tagid` AS `retag_tagid`,`vrelatedtagshot`.`retag_squareid` AS `retag_squareid`,`vrelatedtagshot`.`count` AS `count`,`usuarios`.`usr_id` AS `usr_id`,`usuarios`.`usr_usuario` AS `usr_usuario`,`usuarios`.`usr_password` AS `usr_password`,`usuarios`.`usr_es_admin` AS `usr_es_admin` from ((`square` left join `vrelatedtagshot` on((`square`.`sq_squareid` = `vrelatedtagshot`.`retag_squareid`))) left join `usuarios` on((`square`.`sq_userid` = `usuarios`.`usr_id`))) order by `vrelatedtagshot`.`count` desc,`square`.`sq_likes` desc ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vtagssquare`
--
DROP TABLE IF EXISTS `vtagssquare`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtagssquare`  AS  select `tags`.`tag_tagid` AS `tag_tagid`,`tags`.`tag_name` AS `tag_name`,`square`.`sq_squareid` AS `sq_squareid` from ((`tags` left join `relatedtags` on((`tags`.`tag_tagid` = `relatedtags`.`retag_tagid`))) left join `square` on((`relatedtags`.`retag_squareid` = `square`.`sq_squareid`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comm_id`);

--
-- Indices de la tabla `comments_thread`
--
ALTER TABLE `comments_thread`
  ADD PRIMARY KEY (`commth_id`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`men_mensajeid`);

--
-- Indices de la tabla `relatedtags`
--
ALTER TABLE `relatedtags`
  ADD PRIMARY KEY (`retag_relatedtagid`),
  ADD KEY `tag_idx` (`retag_tagid`),
  ADD KEY `user_idx` (`retag_squareid`);

--
-- Indices de la tabla `square`
--
ALTER TABLE `square`
  ADD PRIMARY KEY (`sq_squareid`);

--
-- Indices de la tabla `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_tagid`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usr_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `comm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `comments_thread`
--
ALTER TABLE `comments_thread`
  MODIFY `commth_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `men_mensajeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `relatedtags`
--
ALTER TABLE `relatedtags`
  MODIFY `retag_relatedtagid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `square`
--
ALTER TABLE `square`
  MODIFY `sq_squareid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_tagid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `relatedtags`
--
ALTER TABLE `relatedtags`
  ADD CONSTRAINT `tag` FOREIGN KEY (`retag_tagid`) REFERENCES `tags` (`tag_tagid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`retag_squareid`) REFERENCES `usuarios` (`usr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;