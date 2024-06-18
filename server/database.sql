-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS TICKCHAK_DB;

-- Use the created database
USE TICKCHAK_DB;

ALTER TABLE auditoriumsparts DROP FOREIGN KEY auditoriumsparts_ibfk_1;

-- Drop tables if they exist
DROP TABLE IF EXISTS saveSeatsSoled;
DROP TABLE IF EXISTS seats;
DROP TABLE IF EXISTS seatsView;
DROP TABLE IF EXISTS partsView;
DROP TABLE IF EXISTS blocksView;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS blocks;
DROP TABLE IF EXISTS auditoriumsParts;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS auditoriums;
DROP TABLE IF EXISTS passwords;

-- Create the auditoriums table
CREATE TABLE auditoriums (
  auditoriumId INT AUTO_INCREMENT PRIMARY KEY,
  auditoriumName VARCHAR(255)
);

-- Create the events table
CREATE TABLE events (
  eventId INT AUTO_INCREMENT PRIMARY KEY,
  eventName VARCHAR(255),
  eventDate DATE NOT NULL,
  eventOpenGates TIME NOT NULL,
  eventBeginAt TIME NOT NULL,
  eventEndAt TIME NOT NULL,
  eventProducer INT,
  eventRemarks VARCHAR(255),
  auditoriumId INT,
  eventPicUrl VARCHAR(255),
  eventCategory VARCHAR(255),
  FOREIGN KEY (auditoriumId) REFERENCES auditoriums (auditoriumId)
);

-- Create the users table
CREATE TABLE users (
  userId INT AUTO_INCREMENT PRIMARY KEY,
  userName VARCHAR(255) NOT NULL,
  userPhone VARCHAR(255),
  userEmail VARCHAR(255) NOT NULL
);

-- Create the orders table
CREATE TABLE orders (
  orderId INT AUTO_INCREMENT PRIMARY KEY,
  userId INT,
  orderDate DATE,
  FOREIGN KEY (userId) REFERENCES users (userId)
);

-- Create the auditoriumsParts table
CREATE TABLE auditoriumsParts (
  partId INT AUTO_INCREMENT PRIMARY KEY,
  auditoriumId INT,
  partName VARCHAR(255),
  coords VARCHAR(255),
  FOREIGN KEY (auditoriumId) REFERENCES auditoriums (auditoriumId)
);

-- Create the seats table
-- CREATE TABLE seats (
--   seatId INT AUTO_INCREMENT PRIMARY KEY,
--   rowNumber INT,
--   seatNumber INT,
--   partId INT,
--   seatIsTaken BOOLEAN,
--   seatIsVisible BOOLEAN,
--   FOREIGN KEY (partId) REFERENCES auditoriumsParts (partId)
-- );

-- Create the seatsView table
CREATE TABLE seatsView (
  seatId INT AUTO_INCREMENT PRIMARY KEY,
  rowNumber INT,
  seatNumber INT,
  partId INT,
  blockId INT,
  seatIsVisible BOOLEAN,
  FOREIGN KEY (partId) REFERENCES auditoriumsParts (partId)
  
);

-- Create the saveSeatsSoled table
CREATE TABLE saveSeatsSoled (
  seatId INT,
  seatIsTaken BOOLEAN,
  eventId INT,
  FOREIGN KEY (seatId) REFERENCES seatsView (seatId)
);


-- Create the partsView table
CREATE TABLE partsView (
  partId INT,
  numOfBlocks INT,
  FOREIGN KEY (partId) REFERENCES auditoriumsParts (partId)
);

-- Create the blocks table
CREATE TABLE blocks (
  blockId INT AUTO_INCREMENT PRIMARY KEY,
  partId INT,
  blockName VARCHAR(255),
  numOfRows INT,
  FOREIGN KEY (partId) REFERENCES auditoriumsParts (partId)
);

-- Create the blocksView table
CREATE TABLE blocksView (
  blockId INT,
  rowsId INT,
  numOfSeatsInARow INT,
  FOREIGN KEY (blockId) REFERENCES blocks (blockId)
);

-- Insert data into the auditoriums table
INSERT INTO auditoriums (auditoriumName) VALUES
('בנייני האומה'),
('Auditorium 2'),
('Auditorium 3');

-- Insert data into the users table
INSERT INTO users (userName, userPhone, userEmail) VALUES
('User 1', '123-456-7890', 'user1@example.com'),
('User 2', '234-567-8901', 'user2@example.com'),
('User 3', '345-678-9012', 'user3@example.com');

-- Insert data into the orders table
INSERT INTO orders (userId, orderDate) VALUES
(1, '2024-06-10'),
(2, '2024-06-11'),
(3, '2024-06-12');

-- Insert data into the auditoriumsParts table
INSERT INTO auditoriumsParts (auditoriumId, partName, coords) VALUES
(1, 'אולם', '212,160 277,168 342,160 348,99 322,32 277,35 232,32 209,99'),
(1, 'גזוזטרה שמאל', '188,90 203,97 227,32 212,22'),
(1, 'גזוזטרה ימין', '351,97 366,90 342,22 327,32' ),
(1, 'יציע ימין','357,225 417,208 366,95 351,102 344,160'),
(1, 'יציע מרכז', '203,228 277,240 351,228 340,165 277,173 214,165'),
(1, 'יציע שמאל', '139,208 197,225 210,160 203,102 188,95'),
(1, 'במה', '232,25 277,32 322,25 314,2 240,2');

-- Insert data into the seats table
-- INSERT INTO seats (rowNumber, seatNumber, partId, seatIsTaken, seatIsVisible) VALUES
-- (1, 1, 1, FALSE, TRUE),
-- (1, 2, 1, FALSE, TRUE),
-- (2, 1, 2, FALSE, TRUE),
-- (2, 2, 2, FALSE, TRUE),
-- (3, 1, 3, FALSE, TRUE),
-- (3, 2, 3, FALSE, TRUE);

-- Insert data into the partsView table
INSERT INTO partsView (partId, numOfBlocks) VALUES
(2, 2),  -- גזוזטרה שמאל
(3, 2), -- גזוזטרה ימין
(1, 9), -- אולם
(4, 4),  -- יציע ימין
(5, 2), -- יציע מרכז
(6, 4), -- יציע שמאל
(7, 0); -- במה

-- Insert data into the blocks table
INSERT INTO blocks (partId, blockName, numOfRows) VALUES
(1, '1-right', 13),
(1, '1-left', 13),
(1, '1-center', 13),
(1, '2-right', 13),
(1, '2-left', 13),
(1, '2-center', 13),
(1, '3-right', 4),
(1, '3-left', 2),
(1, '3-center', 4),
(2, '1-right', 3),
(2, '1-left', 3),
(3, '1-right', 3),
(3, '1-left', 3),
(4, '1-right', 18),
(4, '1-left', 4),
(4, '2-right', 11),
(4, '2-left', 11),
(5, '1-center', 4),
(5, '2-center', 11),
(6, '1-right', 4),
(6, '1-left', 18),
(6, '2-right', 11),
(6, '2-left', 11);

-- Insert data into the blocksView table
INSERT INTO blocksView (blockId, rowsId, numOfSeatsInARow) VALUES
(1, 1, 6),
(1, 2, 10),
(1, 3, 11),
(1, 4, 12),
(1, 5, 13),
(1, 6, 13),
(1, 7, 14),
(1, 8, 14),
(1, 9, 15),
(1, 10, 16),
(1, 11, 16),
(1, 12, 17),
(1, 13, 17),
(2, 1, 6),
(2, 2, 10),
(2, 3, 11),
(2, 4, 12),
(2, 5, 12),
(2, 6, 13),
(2, 7, 13),
(2, 8, 14),
(2, 9, 14),
(2, 10, 15),
(2, 11, 15),
(2, 12, 16),
(2, 13, 17),
(3, 1, 14),
(3, 2, 16),
(3, 3, 15),
(3, 4, 17),
(3, 5, 16),
(3, 6, 17),
(3, 7, 16),
(3, 8, 17),
(3, 9, 16),
(3, 10, 17),
(3, 11, 16),
(3, 12, 17),
(3, 13, 16),

(4, 1, 17),
(4, 2, 17),
(4, 3, 17),
(4, 4, 17),
(4, 5, 17),
(4, 6, 17),
(4, 7, 17),
(4, 8, 17),
(4, 9, 16),
(4, 10, 16),
(4, 11, 16),
(4, 12, 16),
(4, 13, 16),

(5, 1, 17),
(5, 2, 17),
(5, 3, 17),
(5, 4, 17),
(5, 5, 17),
(5, 6, 17),
(5, 7, 17),
(5, 8, 17),
(5, 9, 17),
(5, 10, 16),
(5, 11, 16),
(5, 12, 16),
(5, 13, 16),

(6, 1, 17),
(6, 2, 17),
(6, 3, 17),
(6, 4, 17),
(6, 5, 17),
(6, 6, 17),
(6, 7, 17),
(6, 8, 17),
(6, 9, 17),
(6, 10, 17),
(6, 11, 17),
(6, 12, 17),
(6, 13, 17),

(7, 1, 12),
(7, 2, 13),
(7, 3, 13),
(7, 4, 16),

(8, 1, 12),
(8, 2, 13),
(8, 3, 13),
(8, 4, 16),

(9, 1, 13),
(9, 2, 13),-- אולם --

(10, 1, 16),
(10, 2, 16),
(10, 3, 16), 

(11, 1, 4),
(11, 2, 4),
(11, 3, 4),-- גזוזטרה שמאל--

(12, 1, 16),
(12, 2, 16),
(12, 3, 16), 

(13, 1, 4),
(13, 2, 4),
(13, 3, 4),  -- גזוזטרה ימין --

(14, 1, 2),
(14, 2, 3),
(14, 3, 6),
(14, 4, 6),
(14, 5, 6),
(14, 6, 6),
(14, 7, 5),
(14, 8, 6),
(14, 9, 6),
(14, 10, 7),
(14, 11, 7),
(14, 12, 12),
(14, 13, 13),
(14, 14, 13),
(14, 15, 14),
(14, 16, 14),
(14, 17, 14),
(14, 18, 14),

(15, 1, 16),
(15, 2, 16),
(15, 3, 16),
(15, 4, 16),

(16, 1, 2),
(16, 2, 3),
(16, 3, 6),
(16, 4, 6),
(16, 5, 6),
(16, 6, 6),
(16, 7, 5),
(16, 8, 6),
(16, 9, 6),
(16, 10, 7),
(16, 11, 7),

(17, 1, 2),
(17, 2, 3),
(17, 3, 6),
(17, 4, 6),
(17, 5, 6),
(17, 6, 6),
(17, 7, 5),

(17, 8, 6),
(17, 9, 6),
(17, 10, 7),
(17, 11, 7);
-- יציע ימין--







-- Insert data into the events table
INSERT INTO events (
  eventName, eventDate, eventOpenGates, eventBeginAt, eventEndAt, eventProducer, eventRemarks, auditoriumId, eventPicUrl, eventCategory
) VALUES
('Concert A', '2024-06-15', '18:00:00', '19:00:00', '22:00:00', '1', 'Remarks A', 1, 'https://www.picshare.co.il/s_pictures/img65981.jpg', 'show'),
('Play B', '2024-06-16', '19:00:00', '20:00:00', '22:30:00', '1', 'Remarks B', 1, 'https://www.picshare.co.il/s_pictures/img63008.jpg', 'conference'),
('Conference C', '2024-06-17', '08:00:00', '09:00:00', '17:00:00', '2', 'Remarks C', 1, 'https://www.picshare.co.il/s_pictures/img66886.jpg', 'Conference'),
('Conference', '2024-06-18', '08:00:00', '09:00:00', '17:00:00', '3', 'Remarks C', 3, 'https://www.picshare.co.il/m_pictures/img43817.jpg', 'Conference'),
('Conference G', '2024-06-11', '08:00:00', '09:00:00', '17:00:00', '2', 'kjb', 3, 'https://www.picshare.co.il/m_pictures/img157425.jpg', 'Conference');