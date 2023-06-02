-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2023 at 10:30 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `BookingID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `RoomID` int(11) DEFAULT NULL,
  `CheckInDate` date DEFAULT NULL,
  `CheckOutDate` date DEFAULT NULL,
  `Adults` int(11) DEFAULT NULL,
  `Children` int(11) DEFAULT NULL,
  `Requests` text DEFAULT NULL,
  `NightsToStay` int(11) DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingID`, `CustomerID`, `RoomID`, `CheckInDate`, `CheckOutDate`, `Adults`, `Children`, `Requests`, `NightsToStay`, `TotalPrice`) VALUES
(1, 2, 2, '2023-04-25', '2023-04-27', 2, 0, 'Lactose and Gluten no no', 2, '520.00'),
(8, 17, 2, '2023-04-17', '2023-04-23', 2, 1, 'No windows operating system in my room!', 6, '1500.00'),
(11, 20, 3, '2023-04-13', '2023-04-20', 2, 4, 'No apple in this shit!', 7, '1610.00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Birthday` date NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `password_hash` varchar(100) DEFAULT NULL,
  `password_salt` varchar(100) DEFAULT NULL,
  `Gender` varchar(20) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` text NOT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `FirstName`, `LastName`, `Birthday`, `Username`, `password_hash`, `password_salt`, `Gender`, `Email`, `Phone`, `Address`, `isAdmin`) VALUES
(2, 'Mario', 'Stura', '1993-02-21', 'mario', NULL, NULL, 'Male', 'mariostura@example.com', '987-654-3210', 'Zagreb, 10000', 0),
(17, 'Steve', 'Jobs', '1999-05-05', NULL, NULL, NULL, 'male', 'stevejobs@apple.com', '0992441382', 'California', 0),
(20, 'Bill', 'Gates', '2023-03-27', NULL, NULL, NULL, 'male', 'bill@microsoft.com', '1231231231', 'London, UK', 0),
(32, 'Denim', 'Behn', '2023-04-13', 'denim', '6c6926e2480e46f1750b4fad16f1d718239766e6f60724c6f76b9293d5f812d6', '294160528f6b8af7ae53eb1445f2798b', 'male', 'denim@test.com', '21321312', 'Yes street 123', 1),
(33, 'blendi', 's', '2023-04-11', 'blendi', '901861096dfc010cc5ca9f64a872f82bae053118715c7884def58cd7a6c56be4', 'd7ec70b5d633ec706ecd4991940ba7f0', 'male', 'blendi@test.com', '321321', 'Yes street 123', 1),
(34, 'Mario', 'm', '2023-04-13', 'mario', '31bb39a2d484e6dc14c934e868d3a833cd42b07786fa9f46b4a8716463b7750e', 'c3614a795f59b3259de4109a8133aa23', 'male', 'mario@test.com', '123123', 'Yes street 123', 1),
(35, 'Andrea', 'a', '2023-04-13', 'andrea', '8db42194a634e55555ff137a8f7039a2f7741027d6c9a3d31fcaef9ea71cb7ce', 'e21d19fa151d667ed731ed5b76858e82', 'female', 'andrea@test.com', '21312', 'Yes street 123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `RoomID` int(11) NOT NULL,
  `RoomNumber` varchar(20) DEFAULT NULL,
  `RoomName` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Sleeps` int(11) NOT NULL,
  `Picture` text NOT NULL,
  `PricePerNight` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`RoomID`, `RoomNumber`, `RoomName`, `Description`, `Sleeps`, `Picture`, `PricePerNight`) VALUES
(1, '101', 'Blue Room', 'Sleeps 2 and features a wall of south facing windows overlooking the deck and back yard. The private bath features an oversized standup shower.', 2, '/assets/images/blue-room/blue8.jpg', '230.00'),
(2, '201', 'Bolero Room', 'The Bolero is our premium, private, romantic suite. It sleeps two in style and comfort with a king bed, a sitting area and an oversized bath featuring a two person jacuzzi tub and individual shower.', 2, '/assets/images/bolero-room/bolero3.webp', '250.00'),
(3, '301', 'Rose Suite', 'The Rose Suite is a two bedroom suite that sleeps up to 6 individuals. It also has large windows overlooking the deck and back yard. It has a second door that opens directly onto the deck. The private bath features an oversized standup shower.', 6, 'assets/images/rose-suite/rose3.webp', '230.00'),
(4, '401', 'Lodge Suite', 'The Lodge is a two bedroom suite that sleeps up to 6 individuals. It is trimmed in rough sawn cedar and features a traditonal bath with a tub and shower combination.', 6, '/assets/images/lodge-suite/lodge9.webp', '230.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `RoomID` (`RoomID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`RoomID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
