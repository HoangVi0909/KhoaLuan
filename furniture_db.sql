-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2026 at 02:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `furniture_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `description`, `image_url`, `name`) VALUES
(1, 'Bộ sưu tập sofa cao cấp, ghế thư giãn và ghế ăn sang trọng', 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc', 'Sofa & Ghế'),
(2, 'Bàn ăn, bàn làm việc, bàn coffee đa dạng phong cách', 'https://images.unsplash.com/photo-1565538810643-b5bdb714032a', 'Bàn'),
(3, 'Giường ngủ, nệm cao cấp cho giấc ngủ hoàn hảo', 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85', 'Giường & Nệm'),
(4, 'Tủ quần áo, kệ sách, tủ tivi hiện đại', 'https://images.unsplash.com/photo-1594620302200-9a762244a156', 'Tủ & Kệ'),
(5, 'Đèn chùm, đèn bàn, đèn sàn tạo điểm nhấn', 'https://images.unsplash.com/photo-1513506003901-1e6a229e2d15', 'Đèn Trang Trí'),
(6, 'Tranh treo tường, gối trang trí, thảm, cây cảnh', 'https://images.unsplash.com/photo-1615529182904-14819c35db37', 'Phụ Kiện Decor');

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `response` text NOT NULL,
  `role` varchar(255) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Lưu trữ lịch sử chat của chatbot AI';

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `message`, `response`, `role`, `session_id`, `timestamp`, `user_id`) VALUES
(27, 'cho tôi ds ghế', 'Xin chào! Tôi có thể giúp gì cho bạn về các mẫu nội thất mới nhất không?', 'user', 'session_1769678337764_nqxnrez02', '2026-01-29 09:44:57.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount_value` double DEFAULT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_method` enum('COD','VNPAY','MOMO','BANK_TRANSFER') NOT NULL,
  `payment_status` enum('UNPAID','PAID','REFUNDED') NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `recipient_phone` varchar(255) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `status` enum('PENDING','CONFIRMED','PROCESSING','SHIPPING','DELIVERED','CANCELLED') NOT NULL,
  `total_amount` decimal(38,2) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `note`, `order_number`, `payment_method`, `payment_status`, `recipient_name`, `recipient_phone`, `shipping_address`, `status`, `total_amount`, `updated_at`, `user_id`) VALUES
(3, '2026-01-28 09:23:58.000000', '', 'ORD-57B0C757', 'COD', 'UNPAID', 'a', '0123456789', 'abc, Xã Văn Hội, Huyện Ninh Giang, Tỉnh Hải Dương', 'PENDING', 13900000.00, '2026-01-28 09:23:58.000000', 8),
(4, '2026-01-28 09:44:52.000000', '', 'ORD-A3423F77', 'COD', 'PAID', 'a', '0123456789', 'abc, Xã Tiên Động, Huyện Tứ Kỳ, Tỉnh Hải Dương', 'DELIVERED', 38900000.00, '2026-01-28 10:07:08.000000', 8),
(5, '2026-01-28 11:14:46.000000', '', 'ORD-CA592579', 'VNPAY', 'UNPAID', 'a', '0123456789', 'abc, Xã Văn Hội, Huyện Ninh Giang, Tỉnh Hải Dương', 'PENDING', 13900000.00, '2026-01-28 11:14:46.000000', 8),
(6, '2026-01-28 11:15:56.000000', '', 'ORD-DAC411BF', 'VNPAY', 'PAID', 'a', '0123456789', 'abc, Xã Văn Hội, Huyện Ninh Giang, Tỉnh Hải Dương', 'CONFIRMED', 13900000.00, '2026-01-28 11:16:44.000000', 8),
(7, '2026-01-29 06:56:38.000000', '', 'ORD-EE02D803', 'VNPAY', 'PAID', 'binh', '0123456789', 'abc, Thị trấn Bắc Lý, Huyện Hiệp Hòa, Tỉnh Bắc Giang', 'CANCELLED', 13900000.00, '2026-01-29 06:58:36.000000', 10),
(8, '2026-01-29 09:31:30.000000', '', 'ORD-A2A2E29F', 'VNPAY', 'PAID', 'dsa', '0123456789', 'abc, Xã Đoan Bái, Huyện Hiệp Hòa, Tỉnh Bắc Giang', 'CANCELLED', 38900000.00, '2026-01-29 09:32:55.000000', 11),
(9, '2026-01-29 09:33:32.000000', '', 'ORD-608FF22C', 'COD', 'PAID', 'dsa', '0123456789', 'a, Xã Đoan Bái, Huyện Hiệp Hòa, Tỉnh Bắc Giang', 'DELIVERED', 187200000.00, '2026-01-29 09:34:21.000000', 11);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `price` decimal(38,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(38,2) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `price`, `quantity`, `subtotal`, `order_id`, `product_id`) VALUES
(3, 13900000.00, 1, 13900000.00, 3, 1),
(4, 38900000.00, 1, 38900000.00, 4, 2),
(5, 13900000.00, 1, 13900000.00, 5, 1),
(6, 13900000.00, 1, 13900000.00, 6, 1),
(7, 13900000.00, 1, 13900000.00, 7, 1),
(8, 38900000.00, 1, 38900000.00, 8, 2),
(9, 38900000.00, 4, 155600000.00, 9, 2),
(10, 13900000.00, 1, 13900000.00, 9, 1),
(11, 6800000.00, 1, 6800000.00, 9, 4),
(12, 10900000.00, 1, 10900000.00, 9, 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_token`
--

CREATE TABLE `password_reset_token` (
  `id` bigint(20) NOT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_reset_token`
--

INSERT INTO `password_reset_token` (`id`, `expiry_date`, `token`, `user_id`) VALUES
(1, '2026-01-29 04:00:02.000000', 'fdcf87ec-35ae-4928-b3d0-01407d6a3f31', 7);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `discount_price` decimal(38,2) DEFAULT NULL,
  `is_available` bit(1) NOT NULL,
  `material` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(38,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `color`, `description`, `dimensions`, `discount_price`, `is_available`, `material`, `name`, `price`, `stock_quantity`, `weight`, `category_id`) VALUES
(1, '2026-01-23 07:48:26.000000', '2026-01-29 09:33:32.000000', 'Xám nhạt', 'Sofa phong cách Bắc Âu với chất liệu vải bố cao cấp, thiết kế tối giản nhưng sang trọng. Khung gỗ sồi tự nhiên bền vững.', '220cm x 90cm x 85cm', 13900000.00, b'1', 'Vải bố cao cấp, Gỗ sồi', 'Sofa Vải Bố Scandinavian 3 Chỗ', 15900000.00, 20, '65kg', 1),
(2, '2026-01-23 07:48:26.000000', '2026-01-29 09:33:32.000000', 'Nâu cognac', 'Sofa góc da bò thật nhập khẩu Italy, thiết kế hiện đại với tay vịn thấp. Phù hợp không gian rộng.', '280cm x 180cm x 90cm', 38900000.00, b'1', 'Da bò thật Italy, Khung gỗ tự nhiên', 'Sofa Da Thật Italian L-Shape', 42900000.00, 6, '120kg', 1),
(3, '2026-01-23 07:48:26.000000', '2026-01-23 07:48:26.000000', 'Xanh navy', 'Ghế đơn thiết kế tối giản với đệm mút memory foam êm ái. Chân gỗ sồi chắc chắn.', '75cm x 80cm x 85cm', 4900000.00, b'1', 'Vải nhung, Mút memory foam', 'Ghế Đơn Armchair Minimalist', 5900000.00, 40, '18kg', 1),
(4, '2026-01-23 07:48:26.000000', '2026-01-29 09:33:32.000000', 'Trắng kem', 'Bộ 4 ghế ăn khung thép sơn tĩnh điện, đệm da PU cao cấp. Dễ vệ sinh và bảo quản.', '45cm x 50cm x 95cm', NULL, b'1', 'Da PU, Khung thép', 'Ghế Ăn Hiện Đại (Bộ 4)', 6800000.00, 49, '6kg/ghế', 1),
(5, '2026-01-23 07:48:26.000000', '2026-01-29 09:33:32.000000', 'Xám đậm', 'Sofa kiêm giường ngủ thông minh, dễ dàng chuyển đổi. Có ngăn chứa đồ bên dưới.', '200cm x 95cm x 85cm', 10900000.00, b'1', 'Vải polyester, Khung thép', 'Sofa Bed Đa Năng', 12500000.00, 17, '55kg', 1),
(6, '2026-01-23 07:48:26.000000', '2026-01-23 07:48:26.000000', 'Vàng gỗ tự nhiên', 'Bàn ăn gỗ sồi tự nhiên nguyên khối, bề mặt phủ sơn PU chống nước. Thiết kế chân chữ A chắc chắn.', '180cm x 90cm x 75cm', 16900000.00, b'1', 'Gỗ sồi tự nhiên', 'Bàn Ăn Gỗ Sồi 6 Chỗ', 18900000.00, 15, '45kg', 2),
(7, '2026-01-23 07:48:26.000000', '2026-01-23 07:48:26.000000', 'Trắng vân đen', 'Bàn sofa mặt đá marble trắng cao cấp, chân inox mạ vàng sang trọng. Điểm nhấn cho phòng khách.', '120cm x 60cm x 45cm', 7500000.00, b'1', 'Đá marble, Inox mạ vàng', 'Bàn Coffee Mặt Đá Marble', 8900000.00, 22, '35kg', 2),
(8, '2026-01-23 07:48:26.000000', '2026-01-23 07:48:26.000000', 'Trắng/Gỗ sồi', 'Bàn làm việc hiện đại với ngăn kéo tiện dụng. Bề mặt chống xước, chịu lực tốt.', '120cm x 60cm x 75cm', 3900000.00, b'1', 'Gỗ MDF phủ Melamine', 'Bàn Làm Việc Gỗ Công Nghiệp', 4500000.00, 35, '28kg', 2),
(9, '2026-01-23 07:48:26.000000', '2026-01-23 07:48:26.000000', 'Trong suốt', 'Bàn ăn tròn mặt kính cường lực 8mm, chân gỗ tự nhiên. Phù hợp không gian nhỏ.', '110cm đường kính x 75cm', NULL, b'1', 'Kính cường lực, Gỗ tự nhiên', 'Bàn Ăn Tròn Mặt Kính', 7200000.00, 20, '32kg', 2),
(10, '2026-01-23 07:48:26.000000', '2026-01-28 08:30:03.000000', 'Đen mờ', 'Bàn console mỏng gọn, lý tưởng đặt cạnh tường hoặc sau sofa. Có ngăn để đồ.', '120cm x 35cm x 80cm', 3200000.00, b'1', 'Gỗ MFC', 'Bàn Console Trang Trí', 3800000.00, 30, '18kg', 2),
(11, '2026-01-23 07:48:26.000000', '2026-01-28 08:30:47.000000', 'Nâu óc chó', 'Giường ngủ gỗ sồi tự nhiên cao cấp, đầu giường bọc nệm êm ái. Có 2 ngăn kéo lưu trữ.', '180cm x 200cm x 110cm', 19900000.00, b'1', 'Gỗ sồi, Vải nhung', 'Giường Ngủ Gỗ Sồi Queen Size', 22900000.00, 10, '85kg', 3),
(12, '2026-01-23 07:48:26.000000', '2026-01-28 08:31:11.000000', 'Trắng', 'Nệm foam memory cao 25cm, chống khuẩn và chống thấm. Bảo hành 10 năm.', '180cm x 200cm x 25cm', 7900000.00, b'1', 'Foam memory, Vải knit', 'Nệm Foam Cao Cấp 1m8', 8900000.00, 25, '35kg', 3),
(13, '2026-01-23 07:48:26.000000', '2026-01-28 08:31:46.000000', 'Trắng/Xanh', 'Giường tầng an toàn cho bé, có cầu thang và lan can bảo vệ. Chất liệu thân thiện môi trường.', '120cm x 200cm x 160cm', 10900000.00, b'1', 'Gỗ thông + MDF', 'Giường Tầng Trẻ Em', 12500000.00, 8, '75kg', 3),
(14, '2026-01-23 07:48:26.000000', '2026-01-28 08:33:01.000000', 'Xám', 'Giường gấp tiết kiệm diện tích, có bánh xe di chuyển dễ dàng. Tặng kèm nệm.', '90cm x 190cm x 35cm', NULL, b'1', 'Khung thép, Vải polyester', 'Giường Gấp Đa Năng', 5900000.00, 15, '22kg', 3),
(15, '2026-01-23 07:48:26.000000', '2026-01-28 08:35:25.000000', 'Trắng ngà', 'Nệm lò xo túi độc lập, êm ái và nâng đỡ tốt. Vỏ nệm tháo rời giặt được.', '160cm x 200cm x 28cm', 9900000.00, b'1', 'Lò xo túi, Foam, Vải jacquard', 'Nệm Lò Xo Túi 1m6', 11900000.00, 18, '42kg', 3),
(16, '2026-01-23 07:48:26.000000', '2026-01-28 08:36:37.000000', 'Trắng/Gỗ sồi', 'Tủ áo 3 cánh lùa hiện đại, bên trong có thanh treo và ngăn kéo. Gương soi toàn thân.', '180cm x 60cm x 220cm', 14900000.00, b'1', 'Gỗ MFC, Gương', 'Tủ Quần Áo 3 Cánh Lùa', 16900000.00, 12, '95kg', 4),
(17, '2026-01-23 07:48:26.000000', '2026-01-28 08:38:06.000000', 'Óc chó', 'Kệ sách đa năng 5 tầng, chịu lực tốt. Thiết kế mở tạo cảm giác thoáng đãng.', '80cm x 30cm x 180cm', 3200000.00, b'1', 'Gỗ MDF', 'Kệ Sách Gỗ 5 Tầng', 3900000.00, 28, '25kg', 4),
(18, '2026-01-23 07:48:26.000000', '2026-01-28 08:41:19.000000', 'Trắng bóng', 'Tủ tivi phong cách hiện đại với ngăn kệ mở và ngăn tủ đóng. Hệ thống quản lý dây điện.', '180cm x 40cm x 50cm', 7200000.00, b'1', 'Gỗ công nghiệp', 'Tủ Tivi Hiện Đại 1m8', 8500000.00, 20, '38kg', 4),
(19, '2026-01-23 07:48:26.000000', '2026-01-28 08:42:02.000000', 'Xám/Trắng', 'Tủ giày đa tầng có cửa lưới thoáng khí, chống ẩm mốc. Dễ dàng lắp ráp.', '100cm x 35cm x 120cm', NULL, b'1', 'Gỗ MDF, Lưới thép', 'Tủ Giày Thông Minh', 2900000.00, 40, '18kg', 4),
(20, '2026-01-23 07:48:26.000000', '2026-01-28 08:46:22.000000', 'Đen mờ', 'Bộ 3 kệ treo tường thiết kế độc đáo, lắp đặt dễ dàng. Tạo điểm nhấn cho không gian.', '40/50/60cm x 20cm x 5cm', 990000.00, b'1', 'Gỗ MDF', 'Kệ Trang Trí Treo Tường', 1200000.00, 50, '3kg/bộ', 6);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `product_id` bigint(20) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`product_id`, `image_url`) VALUES
(1, 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800'),
(1, 'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?w=800'),
(1, 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800'),
(2, 'https://images.unsplash.com/photo-1540574163026-643ea20ade25?w=800'),
(2, 'https://images.unsplash.com/photo-1550581190-9c1c48d21d6c?w=800'),
(3, 'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?w=800'),
(3, 'https://images.unsplash.com/photo-1592078615290-033ee584e267?w=800'),
(4, 'https://images.unsplash.com/photo-1503602642458-232111445657?w=800'),
(6, 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?w=800'),
(6, 'https://images.unsplash.com/photo-1617806118233-18e1de247200?w=800'),
(7, 'https://images.unsplash.com/photo-1551298370-9d3d53740c72?w=800'),
(8, 'https://images.unsplash.com/photo-1518455027359-f3f8164ba6bd?w=800'),
(9, 'https://images.unsplash.com/photo-1545128485-c400e7702796?w=800'),
(5, 'https://tse4.mm.bing.net/th/id/OIP.y-bVeuQCtkoqvfoxYTSlLQHaHa?pid=Api&P=0&h=220'),
(10, 'https://noithatm8.com/wp-content/uploads/ban-console-trang-tri-dep.jpg'),
(11, 'https://golathanh.vn/wp-content/uploads/2021/04/giuong-queen-size-10.jpg'),
(12, 'https://khonemthangloi.com.vn/wp-content/uploads/2024/09/DSCF1036-600x600-1.jpg'),
(13, 'https://noithatmanhhe.vn/media/20650/giuong-tang-phong-ngu-be-noi-that-manh-he.jpg?width=700&height=700'),
(14, 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyq6v5i9cash59'),
(15, 'https://nhaxinh.com/wp-content/uploads/2021/10/nem-lo-xo-isabelle2.1.jpg'),
(16, 'https://noithathpro.com/uploads/tu-quan-ao-3-canh-7.jpg'),
(17, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-liia4l224fyq0d'),
(18, 'https://khonggiantiennghi.vn/wp-content/uploads/2019/05/Ke-tivi-1m8-bang-go-don-gian-Vifuta-012KTV-PK005-600x600.jpg'),
(19, 'https://noithatmanhhe.vn/media/9351/tu_giay_tien_loi.jpg?width=622.2222222222222&height=700'),
(20, 'https://smlife.vn/wp-content/uploads/2020/10/Ke-go-treo-tuong-trang-tri-hien-dai-Waldemar-3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `rating` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `comment`, `created_at`, `rating`, `product_id`, `user_id`) VALUES
(1, 'ok', '2026-01-26 10:31:01.000000', 5, 1, 8),
(2, 'do', '2026-01-29 06:34:29.000000', 1, 1, 10),
(3, 'ok', '2026-01-29 09:27:08.000000', 4, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','CUSTOMER') NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `address`, `created_at`, `email`, `full_name`, `is_active`, `password`, `phone`, `role`, `updated_at`) VALUES
(7, 'abc', '2026-01-25 02:08:37.000000', 'abc123@gmail.com', 'nguyen van a', b'1', '$2a$10$oubBvA8GNd0ra//C312Smu/xE8RPWJRvsWN6j4t5B2a5bSzCcv47S', '0123456789', 'ADMIN', '2026-01-25 02:08:37.000000'),
(8, 'abc', '2026-01-25 02:41:05.000000', 'user1@gmail.com', 'a', b'1', '$2a$10$Wur4aXDvu0cbrDM3FgM5u.OvpP1l6Qn7s54mniUJNXzj1k.znPNt6', '0123456788', 'CUSTOMER', '2026-01-29 03:34:32.000000'),
(9, 'abc', '2026-01-27 11:36:09.000000', 'user2@gmail.com', 'Nguyen Thi B', b'1', '$2a$10$1pIQ1HRZcQJh3nB.3uCSYOgEZS5IUQCkAB5o5nx2j/PTYAk3.S5dK', '0123456789', 'CUSTOMER', '2026-01-27 11:36:09.000000'),
(10, 'abc', '2026-01-29 06:31:30.000000', 'bbb@gmail.com', 'binh', b'1', '$2a$10$XBHMs5tg5LyWCgMp.HIuc.d0rWAWOl38zRvBPxVHe7fM0UDUoP8v.', '0123456789', 'CUSTOMER', '2026-01-29 06:31:30.000000'),
(11, 'abc', '2026-01-29 09:25:37.000000', 'bcb@gmail.com', 'dsa', b'1', '$2a$10$SBKC0ZoGv/qlUmSKHBdgYektqLXfhh7f.Tyo38hoMjs7rLixJQMP2', '0123456789', 'CUSTOMER', '2026-01-29 09:26:42.000000');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlog64k5g2l1679hjl2wuyyk5n` (`author_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`),
  ADD KEY `FK709eickf3kc0dujx3ub9i7btf` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_t8o6pivur7nn124jehx7cygw5` (`name`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6f0y4l43ihmgfswkgy9yrtjkh` (`user_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_eplt0kkm9yf2of2lnx6c1oy9b` (`code`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_nthkiu7pgmnqnu86i2jyoe2v7` (`order_number`),
  ADD KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbioxgbv59vetrxe0ejfubep1w` (`order_id`),
  ADD KEY `FKocimc7dtr037rh4ls4l95nlfi` (`product_id`);

--
-- Indexes for table `password_reset_token`
--
ALTER TABLE `password_reset_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_f90ivichjaokvmovxpnlm5nin` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpl51cejpw4gy5swfar8br9ngi` (`product_id`),
  ADD KEY `FKcgy7qjc1r99dp117y9en6lxye` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKl7ao98u2bm8nijc1rv4jobcrx` (`product_id`),
  ADD KEY `FK330pyw2el06fn5g28ypyljt16` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `password_reset_token`
--
ALTER TABLE `password_reset_token`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `FKlog64k5g2l1679hjl2wuyyk5n` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK709eickf3kc0dujx3ub9i7btf` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `FK6f0y4l43ihmgfswkgy9yrtjkh` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `FKbioxgbv59vetrxe0ejfubep1w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FKocimc7dtr037rh4ls4l95nlfi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `password_reset_token`
--
ALTER TABLE `password_reset_token`
  ADD CONSTRAINT `FK83nsrttkwkb6ym0anu051mtxn` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `FKcgy7qjc1r99dp117y9en6lxye` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKpl51cejpw4gy5swfar8br9ngi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `FK330pyw2el06fn5g28ypyljt16` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKl7ao98u2bm8nijc1rv4jobcrx` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
