-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2024 alle 20:02
-- Versione del server: 5.6.15-log
-- PHP Version: 5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_gestioneopere`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `artisti`
--

CREATE TABLE IF NOT EXISTS `artisti` (
  `idArtista` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(40) NOT NULL,
  `Cognome` varchar(40) NOT NULL,
  `Nazionalita` varchar(3) NOT NULL,
  `DataNascita` date NOT NULL,
  `DataMorte` date DEFAULT NULL,
  PRIMARY KEY (`idArtista`,`Cognome`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dump dei dati per la tabella `artisti`
--

INSERT INTO `artisti` (`idArtista`, `Nome`, `Cognome`, `Nazionalita`, `DataNascita`, `DataMorte`) VALUES
(1, 'Vincent', 'Van Gogh', 'NLD', '1853-03-30', '1890-07-29'),
(2, 'Edourad', 'Manet', 'FRA', '1832-01-23', '1883-04-30'),
(3, 'Claude', 'Monet', 'FRA', '1840-11-14', '1926-12-05'),
(4, 'Gustav', 'Klimt', 'AUS', '1862-07-14', '1918-02-06'),
(5, 'Leonardo', 'Da Vinci', 'ITA', '1452-04-15', '1519-05-02'),
(6, 'Antonio', 'Canova', 'ITA', '1757-11-01', '1822-10-13'),
(7, 'Paolo', 'Veronese', 'ITA', '1528-01-01', '1588-04-19'),
(8, 'Michelangelo', 'Buonarroti', 'ITA', '1475-03-06', '1564-02-18'),
(9, 'Michelangelo', 'Caravaggio', 'ITA', '1571-09-29', '1610-07-18'),
(10, 'Johannes', 'Vermeer', 'NLD', '1632-10-31', '1675-12-15'),
(11, 'Rembrandt', 'Harmenszoon van Rijn', 'NLD', '1606-07-15', '1669-11-04'),
(12, 'Carlo', 'Ceresa', 'ITA', '1609-01-20', '1679-01-29'),
(13, 'Adriaen', 'van de Venne', 'NLD', '1589-01-01', '1662-11-12'),
(14, 'Paulus', 'Potter', 'NLD', '1625-11-20', '1654-01-17'),
(15, 'Sandro', 'Botticelli', 'ITA', '1445-03-01', '1510-05-17'),
(16, 'Jan', 'van Eyck', 'BEL', '1390-01-01', '1441-07-09'),
(17, 'Tiziano', 'Vecellio', 'ITA', '1490-01-01', '1576-08-27'),
(18, 'Pablo', 'Picasso', 'ESP', '1881-10-25', '1973-04-08'),
(19, 'Raffaello', 'Sanzio', 'ITA', '1493-03-28', '1520-04-06'),
(20, 'Andy', 'Warhol', 'USA', '1928-08-06', '1987-02-22'),
(21, 'Paul', 'Cezanne', 'FRA', '1839-01-19', '1906-10-22'),
(22, 'Henri', 'Matisse', 'FRA', '1869-12-31', '1954-01-03'),
(23, 'Paul Jackson', 'Pollock', 'USA', '1912-01-28', '1956-08-11'),
(24, 'Roy Fox', 'Lichtenstein', 'USA', '1923-10-27', '1997-09-29'),
(25, 'Salvador', 'Dali', 'ESP', '1904-05-11', '1989-01-23'),
(26, 'Marc', 'Chagall', 'BLR', '1887-07-07', '1985-03-28'),
(27, 'Frida', 'Kahlo', 'MEX', '1907-07-06', '1954-07-13'),
(28, 'Umberto', 'Boccioni', 'ITA', '1882-10-19', '1916-08-17'),
(29, 'Giorgio', 'de Chirico', 'ITA', '1888-07-10', '1978-01-20');

-- --------------------------------------------------------

--
-- Struttura della tabella `citta`
--

CREATE TABLE IF NOT EXISTS `citta` (
  `idCitta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomeCitta` varchar(40) NOT NULL,
  `Nazione` varchar(40) NOT NULL,
  PRIMARY KEY (`idCitta`,`nomeCitta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dump dei dati per la tabella `citta`
--

INSERT INTO `citta` (`idCitta`, `nomeCitta`, `Nazione`) VALUES
(1, 'Parigi', 'FRA'),
(2, 'Londra', 'ENG'),
(3, 'Vienna', 'AUS'),
(4, 'Amsterdam', 'NLD'),
(5, 'Amburgo', 'GER'),
(6, 'New York', 'USA'),
(7, 'Aia', 'NLD'),
(8, 'Dresda', 'GER'),
(9, 'Madrid', 'SPA'),
(10, 'Monaco di Baviera', 'GER'),
(11, 'Firenze', 'ITA'),
(12, 'Praga', 'CZE'),
(13, 'Roma', 'ITA'),
(14, 'Venezia', 'ITA');

-- --------------------------------------------------------

--
-- Struttura della tabella `musei`
--

CREATE TABLE IF NOT EXISTS `musei` (
  `idMuseo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomeMuseo` varchar(40) NOT NULL,
  `idCitta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idMuseo`,`nomeMuseo`),
  KEY `idCitta` (`idCitta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dump dei dati per la tabella `musei`
--

INSERT INTO `musei` (`idMuseo`, `nomeMuseo`, `idCitta`) VALUES
(1, 'Gare d Orsay', 1),
(3, 'Louvre', 1),
(7, 'Museo Marmottan', 1),
(6, 'The National Gallery', 2),
(2, 'Galleria Austriaca Belvedere', 3),
(8, 'Museo di storia dell arte di Vienna', 3),
(4, 'Rijksmuseum', 4),
(9, 'Museo d Arte Metropolitana', 6),
(10, 'Museo d Arte Moderna (MoMA)', 6),
(5, 'Mauritshuis', 7),
(11, 'Museo Del Prado', 9),
(12, 'Nuova Pianacoteca', 10),
(13, 'Galleria degli uffizi', 11),
(14, 'Galleria nazionale di Praga', 12),
(16, 'Galleria Borghese', 13),
(17, 'Galleria Nazionale dell arte antica', 13),
(18, 'Guggenheim', 14);

-- --------------------------------------------------------

--
-- Struttura della tabella `opere`
--

CREATE TABLE IF NOT EXISTS `opere` (
  `idOpera` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(80) NOT NULL,
  `Tipo` varchar(40) NOT NULL,
  `Anno` int(4) NOT NULL,
  `Valore` float NOT NULL DEFAULT '500000',
  `idMuseo` int(10) unsigned NOT NULL,
  `idArtista` int(10) unsigned NOT NULL,
  `LinkImmagine` text,
  PRIMARY KEY (`idOpera`,`Titolo`),
  KEY `idArtista` (`idArtista`),
  KEY `idMuseo` (`idMuseo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=119 ;

--
-- Dump dei dati per la tabella `opere`
--

INSERT INTO `opere` (`idOpera`, `Titolo`, `Tipo`, `Anno`, `Valore`, `idMuseo`, `idArtista`, `LinkImmagine`) VALUES
(1, 'Autoritratto', 'Dipinto', 1889, 500000, 1, 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/SelbstPortrait_VG2.jpg/800px-SelbstPortrait_VG2.jpg'),
(2, 'Notte Stellata sul Rodano', 'Dipinto', 1888, 450000, 1, 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Vincent_van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/1024px-Vincent_van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg'),
(3, 'Colazione sull''erba', 'Dipinto', 1863, 30000, 1, 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Edouard_Manet_-_Luncheon_on_the_Grass_-_Google_Art_Project.jpg/1024px-Edouard_Manet_-_Luncheon_on_the_Grass_-_Google_Art_Project.jpg'),
(4, 'La Gazza', 'Dipinto', 1868, 200000, 1, 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Claude_Monet_-_The_Magpie_-_Google_Art_Project.jpg/1024px-Claude_Monet_-_The_Magpie_-_Google_Art_Project.jpg'),
(5, 'Il balcone', 'Dipinto', 1868, 500000, 1, 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Edouard_Manet_-_The_Balcony_-_Google_Art_Project.jpg/800px-Edouard_Manet_-_The_Balcony_-_Google_Art_Project.jpg'),
(6, 'Il bacio', 'Dipinto', 1907, 500000, 2, 4, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/The_Kiss_-_Gustav_Klimt_-_Google_Cultural_Institute.jpg/800px-The_Kiss_-_Gustav_Klimt_-_Google_Cultural_Institute.jpg'),
(7, 'Fregio di Beethoven\n', 'Dipinto', 1902, 800000, 2, 4, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Gustav_Klimt_014.jpg/800px-Gustav_Klimt_014.jpg'),
(8, 'Bisce d''acqua I', 'Dipinto', 1904, 250000, 2, 4, 'https://www.pivada.com/content/images/thumbs/000/0004374_800.jpeg'),
(9, 'Campo di papaveri', 'Dipinto', 1907, 250000, 2, 4, 'https://www.gustav-klimt.com/assets/img/paintings/Field-of-Poppies.jpg'),
(10, 'Giardino di campagna con girasoli', 'Dipinto', 1907, 100000, 2, 4, 'https://upload.wikimedia.org/wikipedia/commons/f/f2/Gustav_Klimt%2C_1907%2C_Farm_Garden_with_Sunflowers%2C_%C3%96sterreichische_Galerie_Belvedere.jpg'),
(11, 'Ritratto di signora', 'Dipinto', 1916, 600000, 2, 4, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Gustav_Klimt_061.jpg/800px-Gustav_Klimt_061.jpg'),
(12, 'Pianura di Auvers', 'Dipinto', 1890, 500000, 2, 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Vincent_van_Gogh_Ebene_bei_Auvers_1890_Neue_Pinakothek_Munich.JPG/1024px-Vincent_van_Gogh_Ebene_bei_Auvers_1890_Neue_Pinakothek_Munich.JPG'),
(13, 'Un viale del giardino di Monet a Giverny', 'Dipinto', 1902, 500000, 2, 3, 'https://www.worldhistory.org/uploads/images/15615.png?v=1649054883'),
(14, 'Gioconda', 'Dipinto', 1503, 750000, 3, 5, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/800px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg'),
(15, 'Amore Psiche', 'Scultura', 1793, 750000, 3, 6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Psych%C3%A9_ranim%C3%A9e_par_le_baiser_de_l%27Amour.jpg/800px-Psych%C3%A9_ranim%C3%A9e_par_le_baiser_de_l%27Amour.jpg'),
(16, 'Nozze di Cana', 'Dipinto', 1563, 750000, 3, 7, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Paolo_Veronese_008.jpg/1024px-Paolo_Veronese_008.jpg'),
(17, 'Schiavo morente', 'Scultura', 1513, 75000, 3, 8, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/%27Dying_Slave%27_Michelangelo_JBU001.jpg/320px-%27Dying_Slave%27_Michelangelo_JBU001.jpg'),
(18, 'Morte della Vergine', 'Dipinto', 1604, 750000, 3, 9, 'https://upload.wikimedia.org/wikipedia/commons/d/dc/Caravaggio_-_La_Morte_della_Vergine.jpg'),
(19, 'Sant''Anna, la Vergine e il Bambino con l''agnellino\n', 'Dipinto', 1510, 750000, 3, 5, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/L%C3%A9onard_de_Vinci%2C_sainte_Anne%2C_Louvre.jpg/800px-L%C3%A9onard_de_Vinci%2C_sainte_Anne%2C_Louvre.jpg'),
(20, 'Buona Ventura', 'Dipinto', 1593, 750000, 3, 9, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Caravaggio_%28Michelangelo_Merisi%29_-_Good_Luck_-_Google_Art_Project.jpg/1024px-Caravaggio_%28Michelangelo_Merisi%29_-_Good_Luck_-_Google_Art_Project.jpg'),
(21, 'Ragazza col turbante', 'Dipinto', 1665, 800000, 4, 10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/1665_Girl_with_a_Pearl_Earring.jpg/800px-1665_Girl_with_a_Pearl_Earring.jpg'),
(22, 'Lattaia', 'Dipinto', 1657, 100000, 4, 10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Johannes_Vermeer_-_Het_melkmeisje_-_Google_Art_Project.jpg/800px-Johannes_Vermeer_-_Het_melkmeisje_-_Google_Art_Project.jpg'),
(23, 'Stradina di Delft', 'Dipinto', 1657, 150000, 4, 10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Johannes_Vermeer_-_Gezicht_op_huizen_in_Delft%2C_bekend_als_%27Het_straatje%27_-_Google_Art_Project.jpg/800px-Johannes_Vermeer_-_Gezicht_op_huizen_in_Delft%2C_bekend_als_%27Het_straatje%27_-_Google_Art_Project.jpg'),
(24, 'Lettera d''amore', 'Dipinto', 1669, 240000, 4, 10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Vermeer%2C_Johannes_-_The_Loveletter.jpg/800px-Vermeer%2C_Johannes_-_The_Loveletter.jpg'),
(25, 'Ronda di notte', 'Dipinto', 1642, 450000, 4, 11, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/La_ronda_de_noche%2C_por_Rembrandt_van_Rijn.jpg/1024px-La_ronda_de_noche%2C_por_Rembrandt_van_Rijn.jpg'),
(26, 'Sei sindaci dei drappieri di Amsterdam', 'Dipinto', 1662, 350000, 4, 11, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Rembrandt_-_De_Staalmeesters-_het_college_van_staalmeesters_%28waardijns%29_van_het_Amsterdamse_lakenbereidersgilde_-_Google_Art_Project.jpg/1024px-Rembrandt_-_De_Staalmeesters-_het_college_van_staalmeesters_%28waardijns%29_van_het_Amsterdamse_lakenbereidersgilde_-_Google_Art_Project.jpg'),
(27, 'Ritratto di Bernardo Gritti', 'Dipinto', 1646, 1000, 4, 12, 'https://upload.wikimedia.org/wikipedia/commons/4/40/Carlo_Ceresa_Retrato_de_Bernardo_Gritti_Rijksmuseum.jpg'),
(28, 'Self-Portrait', 'Dipinto', 1660, 120000, 4, 11, 'https://upload.wikimedia.org/wikipedia/commons/c/ca/Rembrant_Self-Portrait%2C_1660.jpg'),
(29, 'Autoritratto con capelli scompigliati', 'Dipinto', 1628, 23000, 4, 11, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Self-portrait_%281628-1629%29%2C_by_Rembrandt.jpg/800px-Self-portrait_%281628-1629%29%2C_by_Rembrandt.jpg'),
(30, 'Pesca delle anime', 'Dipinto', 1614, 330000, 4, 13, 'https://upload.wikimedia.org/wikipedia/commons/3/35/De_zielenvisserij_-_Fishing_for_souls_%28Adriaen_Pietersz._van_de_Venne%29.jpg'),
(32, 'Veduta di Delf', 'Dipinto', 1660, 150000, 5, 10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Vermeer-view-of-delft.jpg/1024px-Vermeer-view-of-delft.jpg'),
(33, 'Lezione di anatomia del dottor Nicolaes Tulp\n', 'Dipinto', 1632, 200000, 5, 11, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/The_Anatomy_Lesson.jpg/1024px-The_Anatomy_Lesson.jpg'),
(34, 'Diana e le ninfe', 'Dipinto', 1655, 250000, 5, 10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Vermeer_-_Diana_and_Her_Companions.jpg/800px-Vermeer_-_Diana_and_Her_Companions.jpg'),
(35, 'Andromeda', 'Dipinto', 1630, 280000, 5, 11, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Rembrandt_Harmensz._van_Rijn_011.jpg/800px-Rembrandt_Harmensz._van_Rijn_011.jpg'),
(36, 'Self-Portrait', 'Dipinto', 1669, 420000, 5, 11, 'https://upload.wikimedia.org/wikipedia/commons/1/19/Rembrandt_Self_Portrait_with_Two_Circles.jpg'),
(37, 'Giovane toro', 'Dipinto', 1647, 600000, 5, 14, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Paulus_Potter_-_De_Stier.jpg/260px-Paulus_Potter_-_De_Stier.jpg'),
(38, 'Vergine delle Rocce', 'Dipinto', 1506, 650000, 6, 5, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Leonardo_Da_Vinci_-_Vergine_delle_Rocce_%28Louvre%29.jpg/800px-Leonardo_Da_Vinci_-_Vergine_delle_Rocce_%28Louvre%29.jpg'),
(39, 'I Girasoli', 'Dipinto', 1888, 350000, 6, 1, 'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tournesols_van_gogh_echantillon.jpg'),
(40, 'Ragazzo morso da un ramarro', 'Dipinto', 1593, 700000, 6, 9, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Michelangelo_Caravaggio_061.jpg/800px-Michelangelo_Caravaggio_061.jpg'),
(41, 'Lo stagno delle ninfee', 'Dipinto', 1899, 16000, 6, 3, 'https://upload.wikimedia.org/wikipedia/commons/0/00/Claude_Monet-Waterlilies.jpg'),
(42, 'Venere e Marte', 'Scultura', 1483, 50000, 6, 15, 'https://www.museocanova.it/2022/wp-content/uploads/2022/05/Museo_Gypsotheca_Canova_Venere_e_Marte.jpg'),
(43, 'Cartone di Sant''Anna', 'Disegno', 1505, 500000, 6, 5, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Leonardo_-_St._Anne_cartoon.jpg/800px-Leonardo_-_St._Anne_cartoon.jpg'),
(44, 'Natività mistica', 'Dipinto', 1501, 350000, 6, 15, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/The_Mystical_Nativity.jpg/266px-The_Mystical_Nativity.jpg'),
(45, 'Donna seduta alla spinetta', 'Dipinto', 1672, 500000, 6, 10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Johannes_Vermeer_-_Zittende_Klavecimbelspeelster_%281673-1675%29.jpg/800px-Johannes_Vermeer_-_Zittende_Klavecimbelspeelster_%281673-1675%29.jpg'),
(46, 'Musica alle Tuileries', 'Dipinto', 1862, 160000, 6, 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/MANET_-_M%C3%BAsica_en_las_Tuller%C3%ADas_%28National_Gallery%2C_Londres%2C_1862%29.jpg/1280px-MANET_-_M%C3%BAsica_en_las_Tuller%C3%ADas_%28National_Gallery%2C_Londres%2C_1862%29.jpg'),
(47, 'Festino di Baldassarre', 'Dipinto', 1635, 440000, 6, 11, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Rembrandt-Belsazar.jpg/280px-Rembrandt-Belsazar.jpg'),
(48, 'Scena di neve ad Argenteuil', 'Dipinto', 1875, 500000, 6, 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Monet_Snow_at_Argenteuil_1875.jpg/1024px-Monet_Snow_at_Argenteuil_1875.jpg'),
(49, 'La spiaggia a Trouville', 'Dipinto', 1870, 350000, 6, 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Claude_Monet_002.jpg/1024px-Claude_Monet_002.jpg'),
(50, 'Il Tamigi sotto Westminster', 'Dipinto', 1871, 500000, 6, 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Monet_The_Thames_at_Westminster_1871_Westminster.jpg/1280px-Monet_The_Thames_at_Westminster_1871_Westminster.jpg'),
(51, 'Madonna di Manchester', 'Dipinto', 1497, 160000, 6, 8, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/MICHELANGELO_-_Manchester_Madonna.JPG/800px-MICHELANGELO_-_Manchester_Madonna.JPG'),
(52, 'Ritratto dei coniugi Arnolfini', 'Dipinto', 1434, 350000, 6, 16, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/The_Arnolfini_portrait_%281434%29.jpg/256px-The_Arnolfini_portrait_%281434%29.jpg'),
(53, 'Ritratto di uomo con turbante rosso', 'Dipinto', 1433, 440000, 6, 16, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Portrait_of_a_Man_in_a_Turban_%28Jan_van_Eyck%29_with_frame.jpg/274px-Portrait_of_a_Man_in_a_Turban_%28Jan_van_Eyck%29_with_frame.jpg'),
(54, 'Bacco e Arianna', 'Dipinto', 1523, 160000, 6, 17, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Titian_-_Bacchus_and_Ariadne_-_Google_Art_Project.jpg/300px-Titian_-_Bacchus_and_Ariadne_-_Google_Art_Project.jpg'),
(55, 'Diana e Atteone', 'Dipinto', 1559, 35000, 6, 17, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Titian_-_Diana_and_Actaeon_-_1556-1559.jpg/1200px-Titian_-_Diana_and_Actaeon_-_1556-1559.jpg'),
(56, 'Allegoria della Prudenza', 'Dipinto', 1570, 500000, 6, 17, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Titian_-_Allegorie_der_Zeit.jpg/300px-Titian_-_Allegorie_der_Zeit.jpg'),
(57, 'Venere e Adone', 'Dipinto', 1554, 350000, 6, 17, 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Ashmolean_venus_adonis.jpg'),
(58, 'Impressione, levar del sole', 'Dipinto', 1872, 130000, 7, 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Monet_-_Impression%2C_Sunrise.jpg/1024px-Monet_-_Impression%2C_Sunrise.jpg'),
(59, 'Ninfee', 'Dipinto', 1916, 350000, 7, 3, 'https://upload.wikimedia.org/wikipedia/commons/b/b0/Claude_Monet_-_Nymph%C3%A9as_W1852_-_Mus%C3%A9e_Marmottan-Monet.jpg'),
(60, 'Eugène Manet all’Isola di Wight', 'Dipinto', 1875, 160000, 7, 2, 'https://lartediguardarelarte.altervista.org/wp-content/uploads/2017/12/Berthe_Morisot_1841-1895_Morisot_Berthe_Eugene_Manet_on_the_Isle_of_Wight_13454-960x791.jpg'),
(61, 'Julie Manet et son Lévrier Laerte', 'Dipinto', 1893, 500000, 7, 2, 'https://upload.wikimedia.org/wikipedia/commons/7/77/Berthe_Morisot_-_Girl_with_Greyhound_-_1893.jpg'),
(62, 'Il viale del roseto', 'Dipinto', 1922, 50000, 7, 3, 'https://upload.wikimedia.org/wikipedia/commons/2/2d/Monet-_Der_Rosenweg_in_Giverny.jpeg'),
(63, 'The Tuileries (study)', 'Dipinto', 1876, 160000, 7, 3, 'https://uploads3.wikiart.org/images/claude-monet/the-tuileries-study.jpg'),
(64, 'Concerto', 'Dipinto', 1595, 700000, 9, 9, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Caravaggio_-_I_Musici.jpg/1024px-Caravaggio_-_I_Musici.jpg'),
(65, 'Donna con brocca d''acqua', 'Dipinto', 1595, 440000, 9, 10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Johannes_Vermeer_%28Dutch%2C_Delft_1632%E2%80%931675_Delft%29_-_Young_Woman_with_a_Water_Pitcher_-_Google_Art_Project.jpg/800px-Johannes_Vermeer_%28Dutch%2C_Delft_1632%E2%80%931675_Delft%29_-_Young_Woman_with_a_Water_Pitcher_-_Google_Art_Project.jpg'),
(66, 'In barca ad Argenteuil', 'Dipinto', 1874, 350000, 9, 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Edouard_Manet_Boating.jpg/1024px-Edouard_Manet_Boating.jpg'),
(67, 'La terrazza a Sainte-Adresse', 'Dipinto', 1867, 440000, 9, 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Claude_Monet_-_Jardin_%C3%A0_Sainte-Adresse.jpg/1024px-Claude_Monet_-_Jardin_%C3%A0_Sainte-Adresse.jpg'),
(68, 'Autoritratto con cappello di paglia', 'Dipinto', 1887, 500000, 9, 1, 'https://collectionapi.metmuseum.org/api/collection/v1/iiif/436532/1671316/main-image'),
(69, 'Negazione di san Pietro', 'Dipinto', 1610, 70000, 9, 9, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Caravaggio_denial.jpg/1024px-Caravaggio_denial.jpg'),
(70, 'Campo di Grano con Cipressi', 'Dipinto', 1889, 440000, 9, 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Vincent_Willem_van_Gogh_140.jpg/1024px-Vincent_Willem_van_Gogh_140.jpg'),
(71, 'Ritratto di Gertrude Stein', 'Dipinto', 1906, 350000, 9, 18, 'https://www.arteworld.it/wp-content/uploads/2016/05/Ritratto-di-Gertrude-Stein-Pablo-Picasso-analisi.jpg'),
(72, 'Cristo morto e due angeli', 'Dipinto', 1864, 440000, 9, 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/%C3%89douard_Manet_-_Le_Christ_mort_et_les_anges.jpg/800px-%C3%89douard_Manet_-_Le_Christ_mort_et_les_anges.jpg'),
(73, 'Annunciazione', 'Tempera su tavola', 1485, 350000, 9, 15, 'https://www.researchgate.net/publication/372642109/figure/fig1/AS:11431281177312711@1690426209213/Figura-1-Ambrogio-Lorenzetti-Annunciazione-1344-tempera-e-oro-su-tavola-127x120-cm.jpg'),
(74, 'I quattro alberi', 'Dipinto', 1891, 350000, 9, 3, 'https://www.meisterdrucke.it/kunstwerke/1200w/Claude_Monet_-_The_Four_Trees_1891_-_%28MeisterDrucke-620489%29.jpg'),
(75, 'Il Parlamento, effetto di nebbia, Londra', 'Dipinto', 1904, 440000, 9, 3, 'https://upload.wikimedia.org/wikipedia/commons/d/d3/London%2C_the_Houses_of_Parliament%2C_Sunlight_Opening_in_Fog%2C_by_Claude_Monet.jpg'),
(76, 'Suonatrice di liuto', 'Dipinto', 1664, 520000, 9, 10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Vermeer_-_Woman_with_a_Lute_near_a_window.jpg/800px-Vermeer_-_Woman_with_a_Lute_near_a_window.jpg'),
(77, 'Pala Colonna', 'Dipinto', 1504, 130000, 9, 19, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Madonna_and_Child_Enthroned_with_Saints.jpg/271px-Madonna_and_Child_Enthroned_with_Saints.jpg'),
(78, 'Notte Stellata', 'Dipinto', 1889, 520000, 10, 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/1024px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg'),
(79, 'Les demoiselles d''Avignon', 'Dipinto', 1907, 520000, 10, 18, 'https://d3rf6j5nx5r04a.cloudfront.net/7Tyhr8reeUKBayWaqz_e3hvIwW0=/1120x0/product/8/c/c9d10e8f84cf4c208e250cd883b4cd10.jpg'),
(80, 'Campbell’s Soup Cans', 'Composizione di tele', 1962, 50000, 10, 20, 'https://www.filippocapurro.it/wp-content/uploads/2023/11/Campbells-Soup-Cans.jpg'),
(81, 'Bagnante', 'Dipinto', 1885, 520000, 10, 21, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Jean-Auguste-Dominique_Ingres_-_La_Baigneuse_Valpin%C3%A7on.jpg/234px-Jean-Auguste-Dominique_Ingres_-_La_Baigneuse_Valpin%C3%A7on.jpg'),
(82, 'Riflessi delle nubi sullo stagno delle ninfee', 'Dipinto', 1926, 500000, 10, 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/WLA_moma_Monet_Reflections_of_Clouds_on_the_Water-Lily_Pond.jpg/1920px-WLA_moma_Monet_Reflections_of_Clouds_on_the_Water-Lily_Pond.jpg'),
(83, 'La danza', 'Dipinto', 1909, 350000, 10, 22, 'https://on-stage.net/wp-content/uploads/2020/03/La-Danza.-Matisse.jpg'),
(84, 'One: Number 31', 'Dipinto', 1950, 130000, 10, 23, 'https://www.frammentirivista.it/wp-content/uploads/2020/12/number31-moma-pollock-1024x518.jpg'),
(85, 'Ragazza che annega', 'Dipinto', 1963, 350000, 10, 24, 'https://lh3.googleusercontent.com/proxy/gmjEBFSt9SoAx1XXqBURMj5_vnImken6sdD_THirH_qLbqKBKrewOiLf9NweGcaKtKuzUwHBrwzEe5FGXNWu8FqI7GKC5cIBf75JOAuLyZMFC3Z0DiO6rRHNKujSLUFqB2IupJZZBDN66o8SSJIYb0FNCqNQvBMt'),
(86, 'La persistenza della memoria', 'Dipinto', 1931, 500000, 10, 25, 'https://www.frammentirivista.it/wp-content/uploads/2021/05/dali-01-1.jpeg'),
(87, 'Io e il villaggio', 'Dipinto', 1911, 500000, 10, 26, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Marc_Chagall%2C_I_and_the_Village_%2850394064557%29.jpg/233px-Marc_Chagall%2C_I_and_the_Village_%2850394064557%29.jpg'),
(88, 'Ragazza di fronte allo specchio', 'Dipinto', 1932, 520000, 10, 18, 'https://cache.erashop.net/1712/img/56/53/la-ragazza-davanti-allo-specchio-copia-di-pablo-picasso.jpg'),
(89, 'Autoritratto con i capelli tagliati', 'Dipinto', 1940, 44000, 10, 27, 'https://www.kahlo.org/Self%20Portrait%20with%20Cropped%20Hair%20Frida%20Kahlo.jpg?ezimgfmt=ng%3Awebp%2Fngcb2%2Frs%3Adevice%2Frscb2-1'),
(90, 'I miei nonni, i miei genitori e io', 'Dipinto', 1936, 520000, 10, 27, 'https://kuadros.com/cdn/shop/products/52.jpg?v=1705658430'),
(91, 'Il ragazzo con il panciotto rosso', 'Dipinto', 1889, 220000, 10, 21, 'https://www.arteworld.it/wp-content/uploads/2015/03/Ragazzo-dal-panciotto-rosso-C%C3%A9zanne-analisi-significato.jpg'),
(92, 'Donna con mandolino', 'Dipinto', 1910, 350000, 10, 18, 'https://www.arteworld.it/wp-content/uploads/2016/05/Ragazza-con-Mandolino-Picasso-analisi.jpg'),
(93, 'Fulang Chang e io', 'Dipinto', 1937, 500000, 10, 27, 'https://render.fineartamerica.com/images/images-profile-flow/400/images/artworkimages/mediumlarge/3/fulang-chang-and-i-1937-frida-kahlo.jpg'),
(94, 'Head of a Woman', 'Dipinto', 1924, 280000, 10, 18, 'https://collectionapi.metmuseum.org/api/collection/v1/iiif/485406/1005024/restricted'),
(95, 'Ma Jolie', 'Dipinto', 1912, 500000, 10, 18, 'https://www.arteworld.it/wp-content/uploads/2016/05/Ma-Jolie-Pablo-Picasso-analisi.jpg'),
(96, 'La Speranza II', 'Dipinto', 1908, 35000, 10, 4, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Gustav_Klimt_-_Hope%2C_II_-_Google_Art_Project.jpg/800px-Gustav_Klimt_-_Hope%2C_II_-_Google_Art_Project.jpg'),
(98, 'Canto d''amore', 'Dipinto', 1914, 520000, 10, 29, 'https://www.arteworld.it/wp-content/uploads/2023/04/Canto-damore-De-Chirico.jpg'),
(99, 'Davide con la testa di Golia', 'Dipinto', 1610, 380000, 16, 9, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/David_with_the_Head_of_Goliath-Caravaggio_%281610%29.jpg/800px-David_with_the_Head_of_Goliath-Caravaggio_%281610%29.jpg'),
(100, 'Madonna dei palafrenieri', 'Dipinto', 1606, 700000, 13, 9, 'https://upload.wikimedia.org/wikipedia/commons/f/f5/CaravaggioSerpent.jpg'),
(101, 'Fanciullo con canestro di frutta ', 'Dipinto', 1594, 750000, 13, 9, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Boy_with_a_Basket_of_Fruit_by_Caravaggio.jpg/800px-Boy_with_a_Basket_of_Fruit_by_Caravaggio.jpg'),
(102, 'Bacchino malato', 'Dipinto', 1593, 850000, 16, 9, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Sick_young_Bacchus_by_Caravaggio.jpg/800px-Sick_young_Bacchus_by_Caravaggio.jpg'),
(103, 'L Allegoria della Pittura', 'Dipinto', 1666, 350000, 8, 10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Jan_Vermeer_-_The_Art_of_Painting_-_Google_Art_Project.jpg/505px-Jan_Vermeer_-_The_Art_of_Painting_-_Google_Art_Project.jpg'),
(104, 'Il ritratto di Baldassare Castiglione', 'Dipinto', 1515, 400000, 8, 19, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Baldassare_Castiglione%2C_by_Raffaello_Sanzio%2C_from_C2RMF_retouched.jpg/482px-Baldassare_Castiglione%2C_by_Raffaello_Sanzio%2C_from_C2RMF_retouched.jpg'),
(105, 'Madonna del Belvedere', 'Dipinto', 1506, 405000, 8, 19, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Raphael_-_Madonna_in_the_Meadow_-_Google_Art_Project.jpg/468px-Raphael_-_Madonna_in_the_Meadow_-_Google_Art_Project.jpg'),
(106, 'Nastagio degli Onesti primo episodio', 'Dipinto', 1483, 290000, 11, 15, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Botticelli_Prado_103.jpg/800px-Botticelli_Prado_103.jpg'),
(107, 'Nastagio degli Onesti secondo episodio', 'Dipinto', 1483, 290000, 11, 15, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Nastagio_Degli_Onesti_II.jpg/800px-Nastagio_Degli_Onesti_II.jpg'),
(108, 'Spasimo di Sicilia', 'Dipinto', 1517, 310000, 11, 19, 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Christ_Falling_on_the_Way_to_Calvary_-_Raphael.jpg/432px-Christ_Falling_on_the_Way_to_Calvary_-_Raphael.jpg'),
(109, 'Terrapieno', 'Dipinto', 1870, 400000, 12, 21, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/La_Tranch%C3%A9e_du_chemin_de_fer%2C_par_Paul_C%C3%A9zanne.jpg/800px-La_Tranch%C3%A9e_du_chemin_de_fer%2C_par_Paul_C%C3%A9zanne.jpg'),
(110, 'Monet che dipinge sulla sua barca', 'Dipinto', 1874, 515000, 12, 3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Edouard_Manet_010.jpg/744px-Edouard_Manet_010.jpg'),
(111, 'Violino bicchiere di vino pipa e calamaio', 'Dipinto', 1992, 540000, 14, 18, 'https://bista.sites.dmi.unipg.it/didattica/tecnologie-web/esercizi/img_grandi/violino,_bicchiere,_pipa_e_calamaio.jpg'),
(112, 'San Girolamo scrivente', 'Dipinto', 1606, 650000, 16, 9, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Caravaggio_-_San_Gerolamo.jpg/800px-Caravaggio_-_San_Gerolamo.jpg'),
(113, 'Deposizione Borghese', 'Dipinto', 1507, 400000, 16, 19, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Raffaello%2C_pala_baglioni%2C_deposizione.jpg/580px-Raffaello%2C_pala_baglioni%2C_deposizione.jpg'),
(114, 'Giuditta e Oloferne', 'Dipinto', 1602, 750000, 17, 9, 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Judith_Beheading_Holofernes_-_Caravaggio.jpg/800px-Judith_Beheading_Holofernes_-_Caravaggio.jpg'),
(115, 'La Fornarina', 'Dipinto', 1520, 500000, 17, 19, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/La_Fornarina%2C_por_RafaelFXD.jpg/425px-La_Fornarina%2C_por_RafaelFXD.jpg'),
(116, 'Sulla spiaggia', 'Dipinto', 1937, 600000, 18, 18, 'https://www.guggenheim-venice.it/site/assets/files/3257/picasso_sulla-spiaggia.jpg'),
(117, 'La nascita dei desideri liquidi', 'Dipinto', 1932, 555000, 18, 25, 'https://www.guggenheim-venice.it/site/assets/files/2971/dali_birth-of-liquid-desires.jpg'),
(118, 'Materia', 'Dipinto', 1912, 700000, 18, 28, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Boccioni_materia_1912.jpg/395px-Boccioni_materia_1912.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'Flavio', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(2, 'Andrea', '51eac6b471a284d3341d8c0c63d0f1a286262a18');

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `musei`
--
ALTER TABLE `musei`
  ADD CONSTRAINT `musei_ibfk_1` FOREIGN KEY (`idCitta`) REFERENCES `citta` (`idCitta`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
