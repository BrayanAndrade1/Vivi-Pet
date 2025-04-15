-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-12-2023 a las 13:46:28
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
-- Base de datos: `pets`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand_list`
--

CREATE TABLE `brand_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `image_path` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `brand_list`
--

INSERT INTO `brand_list` (`id`, `name`, `image_path`, `delete_flag`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Yamaha', 'uploads/brands/1.png?v=1642731446', 1, 1, '2023-07-01 10:03:12', '2023-07-26 07:54:51'),
(2, 'Kawasaki', 'uploads/brands/2.png?v=1642731379', 1, 1, '2023-07-01 10:03:12', '2023-07-26 07:53:10'),
(3, 'BMW', 'uploads/brands/3.png?v=1648648449', 1, 1, '2023-07-01 10:03:12', '2023-07-26 07:53:10'),
(4, 'Harley Davidson', 'uploads/brands/4.png?v=1642731495', 1, 1, '2023-07-01 10:03:12', '2023-07-26 07:53:10'),
(5, 'Ducati', 'uploads/brands/5.png?v=1648651402', 1, 1, '2023-07-01 10:03:12', '2023-07-26 07:53:10'),
(6, 'Oil Company', 'uploads/brands/6.jpg?v=1642744467', 1, 1, '2023-07-01 10:03:12', '2023-07-26 07:53:10'),
(7, 'Maxxis', 'uploads/brands/7.jpg?v=1642744509', 1, 1, '2022-01-21 13:55:09', '2022-03-30 09:47:11'),
(8, 'Hurtta', 'uploads/brands/8.jpeg?v=1703004302', 0, 0, '2023-07-01 10:03:12', '2023-12-19 11:45:02'),
(9, 'Feliway', 'uploads/brands/9.jpeg?v=1703004441', 0, 1, '2023-07-01 10:03:12', '2023-12-19 11:47:21'),
(10, 'Ruffwear', 'uploads/brands/10.jpeg?v=1703004214', 0, 1, '2023-07-01 10:03:12', '2023-12-19 11:43:34'),
(11, 'Kong', 'uploads/brands/11.jpeg?v=1703004123', 0, 1, '2023-07-01 10:03:12', '2023-12-19 11:42:03'),
(12, 'PetFusion', 'uploads/brands/12.jpeg?v=1703004836', 0, 1, '2023-08-30 08:19:30', '2023-12-19 11:53:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `category`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Accesorios para Perros', 1, 0, '2023-07-01 10:03:12'),
(2, 'Accesorios para Gatos', 1, 0, '2023-07-01 10:03:12'),
(3, 'Monitores', 1, 1, '2023-07-01 10:03:12'),
(5, 'Memorias', 1, 1, '2023-07-01 10:03:12'),
(6, 'Impresoras', 1, 1, '2023-07-01 10:03:12'),
(7, 'Licenciamiento', 1, 1, '2023-07-01 10:03:12'),
(8, 'Equipo Computo', 1, 1, '2023-07-01 10:03:12'),
(9, 'Higiene y Cuidado', 1, 0, '2023-07-01 10:03:12'),
(10, 'Protección de Poder', 1, 1, '2023-07-01 10:03:12'),
(11, 'Redes', 1, 1, '2023-07-01 10:03:12'),
(12, 'Repuestos', 1, 1, '2023-07-01 10:03:12'),
(13, 'Telefonía IP', 1, 1, '2022-03-30 08:21:32'),
(14, 'Móviles', 1, 1, '2023-07-01 10:03:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_added` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `dni` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `client_list`
--

INSERT INTO `client_list` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `status`, `delete_flag`, `date_created`, `date_added`, `dni`) VALUES
(1, 'Juan', '', 'Cliente', 'Male', '0963256849', 'Calle 98 98 98', 'jcliente@cweb.com', '4b67deeb9aba04a5b54632ad19934f26', 1, 1, '2023-07-01 10:03:12', '2023-12-19 13:17:57', '1720819281'),
(3, 'cosme', 'yovani', 'Masculino', '', '0982916360', 'quito', 'dj-cosme@hotmail.com', '21232f297a57a5a743894a0e4a801fc3', 1, 1, '2023-07-28 10:56:33', '2023-12-19 13:18:01', '1720819281'),
(4, 'pepe', 'miguel', 'Masculino', '', '0982916360', 'ddd', 'pepe@hotmail.com', '202cb962ac59075b964b07152d234b70', 1, 1, '2023-07-28 11:21:24', '2023-12-19 13:18:53', '1720819281'),
(5, 'Jhon', 'Alexander', 'Masculino', '', '0982916360', 'Quito', '12345@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 1, 1, '2023-08-30 08:12:03', '2023-12-19 13:18:07', '17202819281'),
(6, 'Eli', 'Nayeli', 'Femenino', '', '099894845', 'Quito', 'naye18@mail.com', 'abb41e8bbc100d46036a91983f4cb480', 1, 0, '2023-12-19 13:20:27', NULL, '1753017712');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mechanics_list`
--

CREATE TABLE `mechanics_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mechanics_list`
--

INSERT INTO `mechanics_list` (`id`, `name`, `dni`, `contact`, `email`, `status`, `date_created`) VALUES
(2, 'Pedro Técnico', '2043532245', '0923578541', 'ptecnico@cweb.com', 1, '2023-07-26 07:53:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_items`
--

CREATE TABLE `order_items` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `date_added`) VALUES
(15, 11, 8, 2, '2023-08-28 18:00:31'),
(16, 12, 6, 2, '2023-08-30 08:14:18'),
(17, 13, 10, 1, '2023-12-19 13:21:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `total_amount` float NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,1 = packed, 2 = for delivery, 3 = on the way, 4 = delivered, 5=cancelled',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `order_list`
--

INSERT INTO `order_list` (`id`, `ref_code`, `client_id`, `total_amount`, `delivery_address`, `status`, `date_created`, `date_updated`) VALUES
(11, '202308-00001', 3, 160, 'quito', 0, '2023-08-28 18:00:31', '2023-08-28 18:00:31'),
(12, '202308-00002', 5, 80, 'Quito', 0, '2023-08-30 08:14:18', '2023-08-30 08:14:18'),
(13, '202312-00001', 6, 25, 'Quito', 0, '2023-12-19 13:21:57', '2023-12-19 13:21:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `models` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `image_path` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `product_list`
--

INSERT INTO `product_list` (`id`, `brand_id`, `category_id`, `name`, `models`, `description`, `price`, `status`, `image_path`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 1, 3, 'Crash Guard', 'Nmax V2', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mattis, ex in commodo rhoncus, magna felis malesuada mi, et pharetra justo enim eu sapien. Nam fermentum viverra risus, in eleifend libero ultricies sit amet. Etiam gravida lacinia tellus eget vehicula. Nunc vel risus quis leo ornare cursus. Curabitur consectetur placerat ex, nec vestibulum arcu fermentum sed. Proin ipsum ipsum, consectetur sed aliquam a, tincidunt a sapien. Proin viverra ultricies tellus id volutpat. Integer cursus ligula id massa cursus, ut commodo ipsum venenatis. Maecenas et dui sit amet lorem fermentum imperdiet. Nulla a porta urna. Vivamus ut magna nisl.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Donec condimentum lacus nec nulla condimentum fermentum. Quisque tincidunt turpis tellus. Pellentesque pretium egestas ipsum molestie dictum. Quisque eu magna id erat fermentum pharetra vel vitae risus. Suspendisse potenti. Nullam mauris dolor, sollicitudin ut leo rutrum, dictum rutrum magna. Curabitur ut laoreet mi, scelerisque pulvinar leo. Phasellus id neque aliquam, posuere nisl sed, malesuada nibh. In euismod risus eu elit pharetra, id consequat lorem iaculis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus nec eros est. Nunc nec erat at lectus blandit condimentum. Sed sit amet mi nisi. Donec ullamcorper, metus vulputate viverra porta, nisl lectus porta elit, eget dictum quam ipsum cursus massa. Vestibulum eget purus nec augue bibendum facilisis ac sed lacus.&lt;/p&gt;', 2500, 1, 'uploads/products/1.png?v=1642735227', 1, '2023-07-01 10:03:12', '2023-07-26 07:53:10'),
(2, 5, 3, 'Steering Dumper', 'Sample', '&lt;p&gt;sample&lt;/p&gt;', 15000, 1, 'uploads/products/2.png?v=1642736907', 1, '2023-07-01 10:03:12', '2023-07-26 07:53:10'),
(3, 3, 7, 'Oil 4T 10W-40 (1L)', 'Sample', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Maecenas eget condimentum metus, et faucibus turpis. Sed elementum commodo hendrerit. Nulla maximus tincidunt mi, ut convallis mauris congue sit amet. Morbi nec tincidunt sapien. Nulla metus urna, facilisis eget bibendum quis, auctor a tortor. Vestibulum eros urna, euismod ut aliquam ac, cursus sed quam. Donec accumsan tortor at velit malesuada molestie. Aenean porttitor quam nibh, pulvinar pellentesque justo tristique in. Proin nec lacinia metus. Aliquam erat volutpat. Proin egestas, ante vitae rutrum malesuada, erat nisi ultricies leo, eu viverra sem nisl in metus. Phasellus vitae risus malesuada, cursus metus ac, eleifend metus. Morbi ornare sodales fringilla. Nulla venenatis dictum felis varius commodo. Proin eu leo in eros consectetur viverra dignissim ac justo. Curabitur euismod velit sit amet ex condimentum, ut iaculis nisi consectetur.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Ut id volutpat nulla. Aliquam eu orci at ipsum mattis mollis vel eu est. Mauris sit amet finibus tortor. Phasellus sodales massa sed erat varius, non hendrerit eros hendrerit. Pellentesque eu turpis odio. Aenean viverra justo eget eros sollicitudin porttitor. Duis convallis suscipit odio sit amet facilisis. Suspendisse nec tempus leo. Aliquam tincidunt arcu quis justo posuere ullamcorper. Integer sagittis nisi id suscipit semper. Vestibulum tempor pretium ligula, in bibendum orci tincidunt eget. Mauris aliquet porttitor consectetur. In ut neque magna. Phasellus purus elit, pretium et imperdiet eu, ultrices sit amet libero. Praesent ac ligula rhoncus massa aliquet maximus sit amet rhoncus quam. Phasellus eget tempor nisi, quis dapibus dui.&lt;/p&gt;', 520, 1, 'uploads/products/3.png?v=1648648478', 1, '2023-07-01 10:03:12', '2023-07-26 07:53:10'),
(4, 7, 5, 'Tire 101 110/70/17', 'Any', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Vivamus euismod porttitor nisl eu tincidunt. Nulla ac enim ut risus pretium rutrum vel at augue. Nullam eu arcu luctus, elementum sapien sed, blandit mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sodales imperdiet mauris, tincidunt molestie elit tristique sit amet. Mauris sit amet erat quis leo laoreet facilisis. Donec a egestas nibh, eget auctor ligula. Pellentesque ut nisi varius mauris dictum dictum sed nec nulla. Curabitur condimentum eros sagittis eros eleifend accumsan. Sed eu sapien sit amet nisl viverra tincidunt. Interdum et malesuada fames ac ante ipsum primis in faucibus.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;In pretium, tortor et fermentum eleifend, ante tortor rhoncus magna, ac eleifend odio libero id nibh. Etiam rutrum purus vel mattis mattis. Praesent sit amet ligula pulvinar, dapibus lorem eu, luctus augue. Cras sed libero finibus, posuere libero a, dapibus purus. Quisque dolor risus, sollicitudin nec finibus ut, ullamcorper tempor enim. Nulla auctor semper ullamcorper. Sed fringilla lectus finibus mauris ultrices cursus. Vivamus laoreet eros a purus blandit fermentum. Suspendisse ornare ipsum dictum lacus ornare, sed viverra enim pretium. Vivamus pulvinar commodo porttitor.&lt;/p&gt;', 4500, 1, 'uploads/products/4.jpg?v=1642745034', 1, '2023-07-01 10:03:12', '2023-07-26 07:53:10'),
(5, 5, 6, 'Product 101', 'Any', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Phasellus dapibus et massa quis interdum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aenean et nisl justo. Etiam condimentum nulla condimentum lectus vestibulum porta. Etiam maximus gravida nibh, rutrum pulvinar nulla posuere congue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec vel ante sem. Proin suscipit rhoncus felis.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Proin varius libero ut venenatis dictum. Cras finibus nibh quis egestas vestibulum. Integer pharetra dictum libero non maximus. Praesent imperdiet malesuada ante, quis tincidunt ligula. Vestibulum suscipit blandit porta. Praesent et urna neque. Nulla hendrerit nisl et diam pharetra pharetra. Sed maximus, nunc quis luctus facilisis, ex mauris aliquet magna, sit amet consectetur est dolor ac est. Integer venenatis nisl odio, nec varius lacus ornare ac. Fusce sit amet laoreet est. Suspendisse potenti.&lt;/p&gt;', 10000, 1, 'uploads/products/5.png?v=1642828905', 1, '2023-07-01 10:03:12', '2023-07-26 07:53:10'),
(6, 11, 1, 'Correa para perros', 'LUX W', '&lt;p&gt;Caracter&iacute;sticas destacadas&lt;/p&gt;&lt;p&gt;1.50mt&lt;/p&gt;&lt;p&gt;Morado&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 40, 1, 'uploads/products/6.jpg?v=1703008341', 0, '2023-07-01 10:03:12', '2023-12-19 12:52:21'),
(7, 9, 2, 'KIT CUIDADO GATOS', 'JNFKFKDFJF', '&lt;p&gt;JHSJDKHASD&lt;/p&gt;', 270, 0, 'uploads/products/7.jpg?v=1703009042', 0, '2023-07-01 10:03:12', '2023-12-19 13:04:53'),
(8, 8, 2, 'Traje completo', 'A400', '&lt;p&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Impermeable&lt;/span&gt;&lt;/p&gt;', 80, 1, 'uploads/products/8.jpeg?v=1703008502', 0, '2023-07-01 10:03:12', '2023-12-19 12:55:02'),
(9, 9, 2, 'Correa para Gatos', 'HF4', '&lt;p style=&quot;text-align: left; font-family: SamsungOne; margin-right: 0px; margin-bottom: 52px; margin-left: 0px; padding: 0px; vertical-align: top; font-size: 48px; color: rgb(34, 36, 37);&quot;&gt;&lt;span style=&quot;font-size: 14px; font-family: Helvetica;&quot;&gt;HDJSHJGSAKDGSYUDGSA&lt;/span&gt;&lt;/p&gt;&lt;div class=&quot;vtex-store-components-3-x-container relative&quot; style=&quot;margin: 0px auto; padding: 0px; vertical-align: top; position: relative; max-width: 1440px; min-width: 320px; height: 220px; color: rgb(0, 0, 0); font-family: SamsungOne, arial, sans-serif; transition: all 600ms ease-in-out 0s; overflow: hidden;&quot;&gt;&lt;/div&gt;', 179, 1, 'uploads/products/9.jpg?v=1703008840', 0, '2023-07-01 10:03:12', '2023-12-19 13:00:40'),
(10, 12, 1, 'Jaula Cerrada', 'sp4', '&lt;p&gt;jjsadasdjsdsadj&lt;/p&gt;', 25, 1, 'uploads/products/10.jpeg?v=1703007655', 0, '2023-08-30 08:21:42', '2023-12-19 12:40:55'),
(11, 11, 1, 'Correa Full', 'GH6', '&lt;p&gt;nfkjdzfjksdf&lt;/p&gt;', 22, 1, 'uploads/products/11.jpg?v=1703009744', 0, '2023-12-19 13:15:44', '2023-12-19 13:15:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `request_meta`
--

CREATE TABLE `request_meta` (
  `request_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `request_meta`
--

INSERT INTO `request_meta` (`request_id`, `meta_field`, `meta_value`) VALUES
(7, 'vehicle_type', 'Tablet'),
(7, 'vehicle_name', 'Samsung Galaxy Note 13 23'),
(7, 'vehicle_registration_number', '258749'),
(7, 'vehicle_model', 'Galaxy Note 13 23'),
(7, 'service_id', '1'),
(7, 'pickup_address', 'Calle 78 78 78'),
(8, 'vehicle_type', 'arreglo '),
(8, 'vehicle_name', 'portátil'),
(8, 'vehicle_registration_number', 'jdjadjka'),
(8, 'vehicle_model', 'idiaodia'),
(8, 'service_id', '1'),
(8, 'pickup_address', ''),
(9, 'vehicle_type', 'portatil'),
(9, 'vehicle_name', 'hp'),
(9, 'vehicle_registration_number', '123456'),
(9, 'vehicle_model', 's25'),
(9, 'service_id', '1'),
(9, 'pickup_address', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `service` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `service_list`
--

INSERT INTO `service_list` (`id`, `service`, `description`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Limpieza de Virus', '&lt;p style=&quot;text-align: justify;&quot;&gt;La limpieza funciona utilizando jab&oacute;n (o detergente) y agua para quitar f&iacute;sicamente los g&eacute;rmenes de las superficies. Este proceso no mata necesariamente los g&eacute;rmenes, pero al sacarlos, disminuye la cantidad y el riesgo de propagar la enfermedad. La desinfecci&oacute;n mata los g&eacute;rmenes en superficies u objetos.&lt;br&gt;&lt;/p&gt;', 1, 1, '2023-07-01 10:03:12'),
(2, 'Recuperación Datos', '&lt;p style=&quot;text-align: justify;&quot;&gt;En inform&aacute;tica, la recuperaci&oacute;n de datos es el conjunto de t&eacute;cnicas y procedimientos utilizados para acceder y extraer la informaci&oacute;n almacenada en medios de almacenamiento digital que por da&ntilde;o o aver&iacute;a no pueden ser accesibles de manera usual.&lt;br&gt;&lt;/p&gt;', 1, 1, '2023-07-01 10:03:12'),
(3, 'Re instalación de Sistema Operativo', '&lt;p style=&quot;text-align: justify; &quot;&gt;Para volver a instalar el SO Windows en tu nueva computadora, debes crear un disco de recuperaci&oacute;n que esta pueda utilizar para iniciar el disco en blanco luego de su instalaci&oacute;n. Puedes hacerlo si buscas tu versi&oacute;n del sistema operativo en la p&aacute;gina de Windows y lo descargas en un disco compacto o un dispositivo USB.&lt;br&gt;&lt;/p&gt;', 1, 1, '2023-07-01 10:03:12'),
(4, 'Estilismo para Mascota', '&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(55, 65, 81); font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, Ubuntu, Cantarell, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; text-align: start; white-space-collapse: preserve;&quot;&gt;Nuestro exclusivo servicio de estilismo para mascotas, donde la belleza y el confort de tus amigos peludos son nuestra principal prioridad! Nuestro talentoso equipo de estilistas caninos y felinos est&aacute; dedicado a brindar cortes de pelo personalizados que resalten la elegancia y vitalidad de tus adorables compa&ntilde;eros. Utilizando t&eacute;cnicas de vanguardia y productos de alta calidad, transformamos la experiencia del aseo en un momento placentero para tus mascotas. Ya sea un elegante corte de raza, un estilo creativo o un cuidado especializado, estamos aqu&iacute; para consentir a tus peludos amigos y hacer que luzcan y se sientan espectaculares. &iexcl;Conf&iacute;a en nosotros para proporcionar un servicio de estilismo excepcional que realce la belleza natural de tus mascotas y les brinde la atenci&oacute;n que merecen!&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-07-01 10:03:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_requests`
--

CREATE TABLE `service_requests` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `service_type` text NOT NULL,
  `mechanic_id` int(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `service_requests`
--

INSERT INTO `service_requests` (`id`, `client_id`, `service_type`, `mechanic_id`, `status`, `date_created`) VALUES
(7, 1, 'Dejarlo', 2, 0, '2022-03-31 11:07:15'),
(8, 3, 'Dejarlo', 2, 1, '2023-07-28 11:18:40'),
(9, 5, 'Recogerlo', NULL, 0, '2023-08-30 08:15:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_list`
--

CREATE TABLE `stock_list` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= IN, 2= Out',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stock_list`
--

INSERT INTO `stock_list` (`id`, `product_id`, `quantity`, `type`, `date_created`) VALUES
(1, 1, 10, 1, '2022-01-21 13:07:47'),
(2, 1, 5, 1, '2022-01-21 13:07:55'),
(4, 3, 30, 1, '2022-01-24 14:17:28'),
(5, 5, 25, 1, '2022-01-24 14:17:35'),
(8, 4, 50, 1, '2022-01-24 15:49:45'),
(9, 8, 10, 1, '2022-03-30 20:10:35'),
(10, 6, 11, 1, '2022-03-30 20:22:17'),
(11, 10, 15, 1, '2023-08-30 08:22:51'),
(12, 11, 6, 1, '2023-12-19 13:22:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Pet´ Vivis'),
(6, 'short_name', 'Vivis'),
(11, 'logo', 'uploads/1703002500_zyro.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1702997580_portada1.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `dni`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Administrador', 'Vivis', '999999999', 'Administrador', '2a2e9a58102784ca18e2605a4e727b5f', 'uploads/1648611420_chatbot.png', NULL, 1, '2021-01-20 14:02:37', '2023-12-19 11:26:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brand_list`
--
ALTER TABLE `brand_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- Indices de la tabla `mechanics_list`
--
ALTER TABLE `mechanics_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indices de la tabla `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `request_meta`
--
ALTER TABLE `request_meta`
  ADD KEY `request_id` (`request_id`);

--
-- Indices de la tabla `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `mechanic_id` (`mechanic_id`);

--
-- Indices de la tabla `stock_list`
--
ALTER TABLE `stock_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brand_list`
--
ALTER TABLE `brand_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `mechanics_list`
--
ALTER TABLE `mechanics_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `stock_list`
--
ALTER TABLE `stock_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `request_meta`
--
ALTER TABLE `request_meta`
  ADD CONSTRAINT `request_meta_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `service_requests` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `service_requests`
--
ALTER TABLE `service_requests`
  ADD CONSTRAINT `service_requests_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_requests_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics_list` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `stock_list`
--
ALTER TABLE `stock_list`
  ADD CONSTRAINT `stock_list_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
