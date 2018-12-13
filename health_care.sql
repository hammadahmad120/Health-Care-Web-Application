-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2018 at 10:34 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `health_care`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `D_id` int(11) NOT NULL,
  `D_name` varchar(30) NOT NULL,
  `D_specification` varchar(30) NOT NULL,
  `D_contact` varchar(30) NOT NULL,
  `D_city` varchar(30) NOT NULL,
  `D_location` varchar(30) NOT NULL,
  `D_username` varchar(30) NOT NULL,
  `D_charges` int(10) DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`D_id`, `D_name`, `D_specification`, `D_contact`, `D_city`, `D_location`, `D_username`, `D_charges`) VALUES
(1, 'Ahmad Bhatti', 'Heart', '0321-187461', 'Lahore', 'Defence H-Block', 'ahmad123', 500),
(5, 'Amir Ejaz', 'Brain', '0321-66571620', 'Karachi', 'shaheenColony,32street', 'amir123', 500),
(12, 'Hammad Shahid', 'Heart', '0324-4112700', 'Lahore', 'Model Town,24 HouseNo', 'hammad123', 500),
(13, 'Hamza Shahid', 'Brain', '0321-6515602', 'Lahore', 'Model Town,25 HouseNo', 'hamza123', 500),
(14, 'usama rajpoot', 'Kidney', '0321-41124213', 'Karachi', 'new SamnaAbad,street4', 'usama123', 500),
(15, 'Wasif Mirza', 'Kidney', '0321-665716205', 'Karachi', 'Model Town,24 HouseNo', 'Wasif123', 800),
(16, 'Zarnab Azam', 'Brain', '0321-41124213', 'Lahore', '1D,muhafiz Town,Multan Road', 'zarnab123', 1000),
(17, 'm', 'Eyes', '563', 'Lahore', 'kasur', 'user1', 9);

-- --------------------------------------------------------

--
-- Table structure for table `expertise`
--

CREATE TABLE `expertise` (
  `D_id` int(11) NOT NULL,
  `disease` varchar(20) NOT NULL,
  `comment` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expertise`
--

INSERT INTO `expertise` (`D_id`, `disease`, `comment`) VALUES
(5, 'Hair Fall', 'put oil on regular bases\r\nput egg and Dahi every week\r\nuse head and shoulder shampoo\r\nput allovera on regular basis\r\nuse oil of olives\r\n '),
(1, 'Fatness', 'Eat vegetables in evening\r\nDrink black Coffee every morning\r\nEat meat once in a week\r\nstop drinking cold drinks\r\nonly drink fresh fruits juice\r\n'),
(12, 'Fatness', 'Eat vegetables in evening\r\nDrink black Coffee every morning\r\nEat meat once in a week\r\nstop drinking cold drinks\r\nonly drink fresh fruits juice'),
(1, 'Eyes Weakness', 'aajga akbbdkja \r\najafjbak knlanlv lvnalnk \r\naknvna sknvk savn ananvk\r\nanasknvks svnsknv \r\nanvnsmv  s v,mnvnsnv.av .ns.nvnvs');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` varchar(20) DEFAULT 'doctor'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `status`) VALUES
('ahmad123', 'ahmad123', 'doctor'),
('amir123', 'amir12345', 'doctor'),
('hammad123', 'hammad12345', 'doctor'),
('hamza123', 'hamza12345', 'doctor'),
('usama123', 'usama12345', 'doctor'),
('user1', '123a45678', 'doctor'),
('Wasif123', 'wasif12345', 'doctor'),
('zarnab123', 'zarnab12345', 'doctor');

-- --------------------------------------------------------

--
-- Table structure for table `patientappointment`
--

CREATE TABLE `patientappointment` (
  `P_id` int(11) NOT NULL,
  `P_name` varchar(30) NOT NULL,
  `P_contact` varchar(20) DEFAULT NULL,
  `P_disease` varchar(40) NOT NULL,
  `P_apt_date` date NOT NULL,
  `P_apt_day` varchar(20) NOT NULL,
  `D_id` int(11) NOT NULL,
  `D_location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientappointment`
--

INSERT INTO `patientappointment` (`P_id`, `P_name`, `P_contact`, `P_disease`, `P_apt_date`, `P_apt_day`, `D_id`, `D_location`) VALUES
(5, 'Ahmad Faraz', '0324-4127045', 'Heart', '2018-02-06', 'Friday', 1, 'Defence H-Block'),
(6, 'javaid Imran', '0321-6574106', 'Heart', '2018-02-12', 'Monday', 1, 'Defence H-Block'),
(7, 'Tariq Imtiaz', '0321-66571620', 'Heart', '2018-02-21', 'Wednesday', 1, 'Defence H-Block'),
(8, 'Alia Majeed', '0321-4455441', 'Heart', '2018-02-06', 'Tuesday', 1, 'Defence H-Block'),
(9, 'javaid Imran', '03217229727', 'Heart', '2018-02-07', 'Wednesday', 12, 'Model Town,24 HouseNo'),
(10, 'mehmood sufyan', '0324-6844221', 'Brain', '2018-02-07', 'Wednesday', 13, 'Model Town,25 HouseNo'),
(12, 'daniyal imran', '0321-66571620', 'Heart', '2018-02-08', 'Thursday', 12, 'Model Town,24 HouseNo'),
(17, 'mughees imran', '0321-66571620', 'Heart', '2018-02-07', 'Wednesday', 12, 'Model Town,24 HouseNo'),
(18, 'Hammad Shahid', '0321-66571620', 'Heart', '2018-02-10', 'Saturday', 12, 'Model Town,24 HouseNo'),
(19, 'miles', 'hhh', 'Heart', '2018-02-06', 'Tuesday', 1, 'Defence H-Block');

-- --------------------------------------------------------

--
-- Table structure for table `timing`
--

CREATE TABLE `timing` (
  `D_id` int(11) NOT NULL,
  `time` varchar(20) NOT NULL DEFAULT '0',
  `day` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timing`
--

INSERT INTO `timing` (`D_id`, `time`, `day`) VALUES
(1, '0', 'Friday'),
(1, '0', 'Monday'),
(1, '0', 'Saturday'),
(1, '0', 'Sunday'),
(1, '0', 'Thursday'),
(1, '0', 'Tuesday'),
(1, '0', 'Wednesday'),
(5, '0', 'Friday'),
(5, '0', 'Sunday'),
(5, '13:00', 'Monday'),
(5, '14:00', 'Saturday'),
(5, '14:00', 'Thursday'),
(5, '15:00', 'Tuesday'),
(5, '15:00', 'Wednesday'),
(12, '0', 'Friday'),
(12, '0', 'Sunday'),
(12, '14:00', 'Saturday'),
(12, '15:00', 'Monday'),
(12, '15:00', 'Wednesday'),
(12, '16:00', 'Tuesday'),
(12, '17:00', 'Thursday'),
(13, '0', 'Friday'),
(13, '0', 'Sunday'),
(13, '13:00', 'Saturday'),
(13, '13:00', 'Thursday'),
(13, '14:00', 'Monday'),
(13, '15:00', 'Tuesday'),
(13, '15:00', 'Wednesday'),
(14, '0', 'Friday'),
(14, '0', 'Sunday'),
(14, '13:00', 'Saturday'),
(14, '15:00', 'Thursday'),
(14, '15:00', 'Tuesday'),
(14, '16:00', 'Wednesday'),
(14, '18:00', 'Monday'),
(15, '0', 'Friday'),
(15, '0', 'Sunday'),
(15, '14:00', 'Saturday'),
(15, '15:00', 'Tuesday'),
(15, '16:00', 'Thursday'),
(15, '17:00', 'Monday'),
(15, '20:00', 'Wednesday'),
(16, '0', 'Friday'),
(16, '0', 'Sunday'),
(16, '14:00', 'Saturday'),
(16, '15:00', 'Monday'),
(16, '16:00', 'Thursday'),
(16, '20:00', 'Tuesday'),
(16, '21:00', 'Wednesday'),
(17, '0', 'Friday'),
(17, '0', 'Monday'),
(17, '0', 'Saturday'),
(17, '0', 'Sunday'),
(17, '0', 'Thursday'),
(17, '0', 'Tuesday'),
(17, '15:57', 'Wednesday');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`D_id`),
  ADD KEY `usr_fk_doctor` (`D_username`);

--
-- Indexes for table `expertise`
--
ALTER TABLE `expertise`
  ADD KEY `FK_expertise_D_id` (`D_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `patientappointment`
--
ALTER TABLE `patientappointment`
  ADD PRIMARY KEY (`P_id`),
  ADD KEY `FK_patientAppointment_D_id` (`D_id`);

--
-- Indexes for table `timing`
--
ALTER TABLE `timing`
  ADD PRIMARY KEY (`D_id`,`time`,`day`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `D_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `patientappointment`
--
ALTER TABLE `patientappointment`
  MODIFY `P_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `expertise`
--
ALTER TABLE `expertise`
  ADD CONSTRAINT `FK_expertise_D_id` FOREIGN KEY (`D_id`) REFERENCES `doctor` (`D_id`);

--
-- Constraints for table `patientappointment`
--
ALTER TABLE `patientappointment`
  ADD CONSTRAINT `FK_patientAppointment_D_id` FOREIGN KEY (`D_id`) REFERENCES `doctor` (`D_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `timing`
--
ALTER TABLE `timing`
  ADD CONSTRAINT `FK_timing_D_id` FOREIGN KEY (`D_id`) REFERENCES `doctor` (`D_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
