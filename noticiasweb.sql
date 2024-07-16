-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-07-2024 a las 09:44:58
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `noticiasweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `video_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `titulo`, `contenido`, `fecha`, `video_url`) VALUES
(3, 'Alza del precio de la luz de Chile: las claves del ajuste que impacta en las cuentas de las familias del país', 'El Estado debe saldar su deuda con las generadoras eléctricas tras casi cinco años de un congelamiento en los precios. El incremento en la electricidad para los hogares será por tramos y alcanzará hasta el 60% al llegar\r\n al año 2025 Este lunes 1° de julio se inició de manera oficial el ajuste en la tarifa de la energía eléctrica en Chile. La medida tiene un impacto directo en los consumidores, que durante este mes podrían ver un aumento considerable en la cuenta de la luz. El alza ha inquietado a las autoridades, que buscan paliar sus efectos especialmente en los consumidores más vulnerables, los que deberán ser asistidos a través de subsidios.\r\nEl origen de esta medida, que golpea al bolsillo de las familias chilenas en pleno invierno, tiene su origen en un congelamiento de precios fijado hace casi cinco años. A ello se sumaron algunas leyes posteriores que conservaron el valor del servicio eléctrico casi inamovible. La realidad del mercado energético internacional, además de una millonaria deuda estatal con las empresas generadoras, han obligado a sincerar las cuentas.', '2024-07-16 11:37:30', 'https://www.youtube.com/watch?v=g2dLv6oOeHI'),
(4, 'Donald Trump resulta herido durante mitin en Pensilvania', 'El expresidente Donald Trump fue sacado del escenario con sangre en la oreja y la cara tras un tiroteo durante su mitin de este sábado por la noche en Butler, Pensilvania.\r\n\r\nTrump cayó al suelo, aparentemente herido, tras sonar el primer estallido de disparos. Se oían gritos de los espectadores mientras el personal de seguridad rodeaba al expresidente y lo alejaba del atril. Trump parecía estar llamando a la multitud y se le pudo ver agitando el puño mientras le ponían en pie y le llevaban en volandas a un vehículo fuera del escenario.\r\n\r\nÚltima hora de Donald Trump y su salud tras quedar herido en un tiroteo durante mitin, en vivo\r\nEl tiroteo en el mitin de Trump está siendo investigado como un posible intento de asesinato, según funcionarios encargados de hacer cumplir la ley. El atacante estaba fuera del lugar del mitin de Trump, dicen varias fuentes policiales.\r\n\r\n\"La noche del 13 de julio se produjo un incidente en un mitin de Trump en Pensilvania. El Servicio Secreto ha implementado medidas de protección y el expresidente está a salvo. Ahora se trata de una investigación activa del Servicio Secreto y se publicará más información cuando esté disponible\", dijo el portavoz jefe del Servicio Secreto, Anthony Guglielmi.\r\nEl atacante implicado en el incidente ha sido \"neutralizado\", según múltiples fuentes policiales.', '2024-07-16 12:16:26', 'https://www.youtube.com/watch?v=CCmh54xMbi0'),
(5, 'Ante nuevo y extenso sistema frontal en Chile: estas son las regiones en que lloverá esta semana (y qué pasará con Santiago)', 'Si bien durante la primera parte de julio el protagonista fue el frío, ahora son las precipitaciones las que se harán presentes en un tramo importante del territorio.\r\nTras el frío que se ha sentido durante lo que va del mes de julio, las lluvias vuelven a Chile.\r\n\r\nDe hecho, recientemente se anunció un nuevo y extenso sistema frontal para el territorio y los primeros efectos se hicieron sentir este lunes 15 en la Patagonia.\r\n\r\nDe paso rápido por el territorio, según indica el sitio Meteored, las precipitaciones líquidas de esta semana también pasarán entre Magallanes y el Ñuble con diversos niveles de intensidad.\r\nClaro que la situación también se extiende a la noche del lunes y la madrugada de este martes 16 de julio sobre Los Lagos, Los Ríos y La Araucanía, sin descartar a el Biobío y Ñuble durante las primeras horas de la segunda jornada mencionada.\r\n\r\nPero ojo, porque también se habla de un nuevo frente mal tiempo que llegaría este miércoles 17, aterrizando en principio en la Patagonia y acompañado de una masa de aire frío.\r\n\r\n“Debe dejar nevadas sobre la Patagonia y también en al zona cordillerana del sur de Chile”, precisan los expertos.\r\nSegún el mismo espacio desde Antofagasta al norte de la región de Valparaíso, la semana del 15 al 22 de julio podría tener “precipitaciones sobre lo normal”. , aunque no se precisaron las cantidades de milímetros.\r\n\r\n¿Y qué pasará con Santiago en la zona central? Bajo la óptica del meteorólogo Iván Torres, tanto el miércoles como el jueves el cielo de la capital va a estar nublado.', '2024-07-16 12:25:05', 'https://www.youtube.com/watch?v=_b0d59uwMPI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`) VALUES
(2, 'admin', '$2y$10$9pTZUz2/uEaKMJXNqG87vun.HhzHcbMU7J3my9pK6WI0fAo9L88wW'),
(3, 'prueba', '$2y$10$r68aYIiB.qRm/emeD7dPx..SfcIBZi0Wm72Q8SztHWwxdtGhObG/2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
