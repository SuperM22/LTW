-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 03, 2021 alle 12:10
-- Versione del server: 10.1.36-MariaDB
-- Versione PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `netflix`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `attore`
--

CREATE TABLE `attore` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `attore`
--

INSERT INTO `attore` (`id`, `nome`, `cognome`) VALUES
(16, 'Bruce', 'Willis'),
(17, 'Frank', 'Grillo'),
(18, 'Perrey ', 'Reeves'),
(19, 'Tom', 'Hardy'),
(20, 'Charlize', 'Theron'),
(21, 'Nicholas', 'Hoult'),
(22, 'Daniel', 'Craig'),
(23, 'Javier', 'Bardem'),
(24, 'Judi', 'Dench'),
(25, 'Michael ', 'Keaton'),
(26, 'Zach ', 'Galifianakis'),
(27, 'Edward ', 'Norton'),
(28, 'Jack', 'Black'),
(29, 'Joan ', 'Cusack'),
(30, 'Mike', 'White'),
(31, 'Jim', 'Carrey'),
(32, 'Zooey', 'Deschanel'),
(33, 'Bradley', 'Cooper'),
(34, 'Tommy Lee', 'Jones'),
(35, 'Javier', 'Bardem'),
(36, 'Josh', 'Brolin'),
(37, 'Robert', 'de Niro'),
(38, 'Al', 'Pacino'),
(39, 'Joe', 'Pesci'),
(40, 'Robert Jr.', 'Downey'),
(41, 'Jake', 'Gyllenhall'),
(42, 'Mark', 'Ruffalo'),
(43, 'Amy', 'Adams'),
(44, 'Jeremy', 'Jenner'),
(45, 'Forest', 'Whitaker'),
(46, 'Sam', 'Worthington'),
(47, 'Zoe', 'Saldana'),
(48, 'Stephen', 'Lang'),
(49, 'Domhnall', 'Gleeson'),
(50, 'Alicia', 'Vikander'),
(51, 'Oscar', 'Isaac'),
(52, 'Sandra', 'Bullock'),
(53, 'George', 'Clooney'),
(54, 'Leonardo', 'Di Caprio'),
(55, 'Joseph', 'Gordon-Levitt'),
(56, 'Ellen', 'Page'),
(57, 'Matthew', 'McConaughey'),
(58, 'Anne', 'Hathaway'),
(59, 'Jessica', 'Chastain'),
(60, 'Joseph', 'Gordon-Levitt'),
(61, 'Bruce', 'Willis'),
(62, 'Emily', 'Blunt'),
(63, 'Matt', 'Damon'),
(64, 'Jessica', 'Chastain'),
(65, 'Kristen', 'Wiig'),
(67, 'Chris', 'Hemsworth'),
(68, 'Natalie', 'Portman'),
(69, 'Tom', 'Hiddleston'),
(70, 'Finn', 'Wolfhard'),
(71, 'Jaeden', 'Lieberher'),
(72, 'Sophia', 'Lillis'),
(73, 'Ivan', 'Massague\''),
(74, 'Antonia', 'San Juan'),
(75, 'Zorion', 'Eguileor'),
(76, 'Robert', 'Pattinson'),
(77, 'Willem', 'Dafoe'),
(78, 'Valeriia', 'Karaman'),
(79, 'Daniel', 'Kaluuya'),
(80, 'Allison', 'Williams'),
(81, 'Bradley', 'Whitford'),
(82, 'Elizabeth', 'Lail'),
(83, 'Jordan', 'Calloway'),
(84, 'Peter', 'Facinelli'),
(85, 'Bryan', 'Cranston'),
(86, 'Aaron', 'Paul'),
(87, 'Anna', 'Gunn'),
(88, 'Ursula', 'Corbero\''),
(89, 'Alvaro', 'Morte'),
(90, 'Alba', 'Flores'),
(91, 'Kevin', 'Spacey'),
(92, 'Robin', 'Wright'),
(93, 'Micheal', 'Kelly'),
(94, 'Henry', 'Cavill'),
(95, 'Freya', 'Allan'),
(96, 'Joey', 'Batey'),
(97, 'Andrew', 'Lincoln'),
(98, 'Norman', 'Reedus'),
(99, 'Keanu', 'Reeves'),
(100, 'Halle', 'Berry'),
(101, 'Rose', 'Mclver'),
(102, 'David', 'Anders'),
(103, 'Takayuki', 'Yamada'),
(104, 'Wyatt', 'Russel'),
(105, 'Cristin', 'Milioti'),
(106, 'Jim', 'Caviezel'),
(107, 'Micheal', 'Emerson');

-- --------------------------------------------------------

--
-- Struttura della tabella `cast`
--

CREATE TABLE `cast` (
  `attore_id` int(11) NOT NULL,
  `regista_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `cast`
--

INSERT INTO `cast` (`attore_id`, `regista_id`, `film_id`) VALUES
(16, 6, 6),
(17, 6, 6),
(18, 6, 6),
(19, 7, 7),
(20, 7, 7),
(21, 7, 7),
(22, 8, 8),
(23, 8, 8),
(24, 8, 8),
(25, 9, 9),
(26, 9, 9),
(27, 9, 9),
(28, 10, 10),
(29, 10, 10),
(30, 10, 10),
(31, 11, 11),
(32, 11, 11),
(33, 11, 11),
(34, 12, 12),
(35, 12, 12),
(36, 12, 12),
(37, 13, 13),
(38, 13, 13),
(39, 13, 13),
(40, 14, 14),
(41, 14, 14),
(42, 14, 14),
(43, 15, 15),
(44, 15, 15),
(45, 15, 15),
(46, 16, 16),
(47, 16, 16),
(48, 16, 16),
(49, 17, 17),
(50, 17, 17),
(51, 17, 17),
(52, 18, 18),
(53, 18, 18),
(54, 19, 19),
(55, 19, 19),
(56, 19, 19),
(57, 19, 20),
(58, 19, 20),
(59, 19, 20),
(60, 21, 21),
(61, 21, 21),
(62, 21, 21),
(63, 22, 22),
(63, 28, 25),
(64, 22, 22),
(65, 22, 22),
(67, 26, 23),
(67, 27, 24),
(67, 28, 25),
(68, 26, 23),
(68, 27, 24),
(69, 26, 23),
(69, 27, 24),
(69, 28, 25),
(70, 29, 26),
(70, 29, 27),
(71, 29, 26),
(71, 29, 27),
(72, 29, 26),
(72, 29, 27),
(73, 30, 28),
(74, 30, 28),
(75, 30, 28),
(76, 31, 29),
(77, 31, 29),
(78, 31, 29),
(79, 32, 30),
(80, 32, 30),
(81, 32, 30),
(82, 33, 31),
(83, 33, 31),
(84, 33, 31),
(85, 34, 32),
(86, 34, 32),
(87, 34, 32),
(88, 35, 33),
(89, 35, 33),
(90, 35, 33),
(91, 36, 34),
(92, 36, 34),
(93, 36, 34),
(94, 37, 35),
(95, 37, 35),
(96, 37, 35),
(97, 38, 36),
(98, 38, 36),
(99, 39, 37),
(100, 39, 37),
(101, 40, 38),
(102, 40, 38),
(103, 41, 39),
(104, 42, 40),
(105, 42, 40),
(106, 43, 41),
(107, 43, 41);

-- --------------------------------------------------------

--
-- Struttura della tabella `film`
--

CREATE TABLE `film` (
  `ID` int(11) NOT NULL,
  `titolo` varchar(50) NOT NULL,
  `durata` time NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `descrizione` text NOT NULL,
  `annopubblicazione` year(4) NOT NULL,
  `minutaggio` time NOT NULL,
  `video` varchar(200) DEFAULT NULL,
  `anteprima` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `film`
--

INSERT INTO `film` (`ID`, `titolo`, `durata`, `categoria`, `descrizione`, `annopubblicazione`, `minutaggio`, `video`, `anteprima`) VALUES
(6, 'Cosmic Sin', '00:02:34', 'azione', 'Un gruppo di guerrieri e scienziati collaborano.', 2021, '00:00:00', './Media/Cosmic.mp4', './images/film/Cosmic.jpg'),
(7, 'Mad Max: Fury Road', '00:02:20', 'azione', 'Australia, in un futuro distopico post apocalittico in cui benzina ed acqua sono le risorse piu\' rare e preziose.', 2015, '00:00:00', './Media/Mad.mp4', './images/film/Mad.jpg'),
(8, '007 Skyfall', '00:02:29', 'azione', 'In seguito al fallimento di una missione recente, Il celebre agente segreto britannico e\' costretto ad essere testimone di una serie terribile di eventi: la MI6 deve trasferirsi al piu\' presto mentre i dipendenti sotto copertura vedono le proprie identita\' venire rivelate. M e\' disperata e si rivolge a James Bond in cerca di un aiuto immediato.', 2012, '00:01:05', './Media/007.mp4', './images/film/007.jpg'),
(9, 'Birdman', '00:02:35', 'commedia', 'L\'ex stella del cinema Riggan Thomson e\' occupato ad allestire un\'ambizioso spettacolo teatrale per Broadway e spera che la nuova produzione possa ravvivare la sua stagnante carriera. Il lavoro si rivela essere particolarmente difficile ma l\'uomo desidera provare ai critici di essere un vero artista e non soltanto un attore capace di ruoli secondari.', 2014, '00:00:00', './Media/Birdman.mp4', './images/film/Bird.jpg'),
(10, 'School of Rock', '00:02:33', 'commedia', 'Dewey Finn, eccentrico chitarrista costantemente al verde, viene cacciato dalla sua band e si ritrova a fare il supplente in una scuola per fortunati rampolli.\r\n', 2003, '00:00:00', './Media/School.mp4', './images/film/School.jpg'),
(11, 'Yes Man', '00:02:30', 'commedia', 'Un uomo che dice sempre di no aderisce a un programma basato sul semplice impegno di dire si a tutto. Da quel momento la sua vita cambia in maniera inaspettata.', 2008, '00:00:00', './Media/Yes.mp4', './images/film/Yes.jpg'),
(12, 'Non e un paese per vecchi', '00:04:54', 'crime', 'Durante una battuta di caccia in solitaria, un saldatore del Texas trova e si impossessa di una somma di denaro precedentemente rubata. L\'uomo diventa cosi\' preda di una banda di criminali.', 2007, '00:00:00', './Media/Non.mp4', './images/film/Non.jpg'),
(13, 'The Irishman', '00:02:23', 'crime', 'La storia di Frank Sheeran, veterano di guerra e camionista, divenuto un sicario al soldo della malavita di Filadelfia e assoldato per uccidere il popolare sindacalista Jimmy Hoffa.', 2019, '00:00:00', './Media/The Irish.mp4', './images/film/TheIrish.jpg'),
(14, 'Zodiac', '00:02:23', 'crime', 'Estate 1968. Nell\'area di San Francisco inizia a colpire un serial killer che rivendica i propri omicidi con lettere inviate ai principali quotidiani locali. Dopo aver assunto un nome riconoscibile, Zodiac, l\'assassino sfida la polizia.', 2007, '00:00:00', './Media/Zodia.mp4', './images/film/Zodiac.jpg'),
(15, 'Arrival', '00:02:34', 'fantascienza', 'Alcune misteriose astronavi aliene arrivano sulla Terra: una linguista viene contattata dall\'esercito per determinare se gli extraterrestri hanno intenzioni pacifiche o se rappresentano invece una minaccia per l\'umanita\'.', 2016, '00:02:34', './Media/Arrival.mp4', './images/film/Arrival.jpg'),
(16, 'Avatar', '00:03:25', 'fantascienza', 'L\'ex marine Jake Sully e\' stato reclutato per una missione sul pianeta Pandora con lo scopo di recuperare risorse naturali in esaurimento sulla Terra. Inaspettatamente si ritrova a voler proteggere il mondo magico al quale si sente stranamente legato.', 2009, '00:00:29', './Media/Avatar.mp4', './images/film/Avatar.jpg'),
(17, 'Ex Machina', '00:03:13', 'fantascienza', 'Caleb, giovane programmatore della piu\' grande compagnia di internet al mondo, vince un concorso per trascorrere una settimana nel rifugio di montagna di proprieta\' del CEO della societa\'. Presto Caleb scopre di dover prendere parte a uno strano ed affascinante esperimento.', 2015, '00:00:00', './Media/Ex.mp4', './images/film/Ex.jpg'),
(18, 'Gravity', '00:02:30', 'fantascienza', 'In missione a bordo dell\'Explorer, l\'astronauta Matt Kowalski e la dottoressa Ryan Stone, esperta di ingegneria medica, cercano di sopravvivere alla distruzione della navicella sulla quale si trovavano.', 2013, '00:00:00', './Media/Gravity.mp4', './images/film/Gravity.jpg'),
(19, 'Inception', '00:02:18', 'fantascienza', 'Dom Cobb possiede una qualifica speciale: e\' in grado di inserirsi nei sogni altrui per prelevare i segreti nascosti nel piu\' profondo del subconscio. Viene contattato da Saito, un potentissimo industriale giapponese.', 2010, '00:00:00', './Media/Inception.mp4', './images/film/Ince.jpg'),
(20, 'Interstellar', '00:02:30', 'fantascienza', 'In un futuro non precisato, un drastico cambiamento climatico colpisce duramente l\'agricoltura. Il granturco e\' l\'unica coltivazione ancora in grado di crescere ed un gruppo di scienziati e\' intenzionato ad attraversare lo spazio per trovare nuovi luoghi adatti a coltivarlo.\r\n', 2014, '00:00:00', './Media/Inter.mp4', './images/film/Inter.jpg'),
(21, 'Looper', '00:01:15', 'fantascienza', 'Anno 2074. Grazie all\'invenzione di una macchina del tempo, un gruppo di assassini viene ingaggiato per uccidere vittime nel passato. Uno di loro, pero\', un giorno, deve affrontare se stesso.', 2012, '00:00:00', './Media/Loop.mp4', './images/film/Loop.jpg'),
(22, 'Sopravvissuto- The Martian', '00:03:43', 'fantascienza', 'L\'equipaggio della Nasa Ares 3 e\' in missione su Marte, quando una violenta tempesta di sabbia costringe tutti ad abbandonare la base e tornare a casa. Ma l\'astronauta Mark Watney, ingegnere meccanico e botanico, viene colpito in pieno da un detrito e allontanato dalla squadra, che lo ritiene morto.', 2015, '00:00:00', './Media/Sopra.mp4', './images/film/Sopra.jpg'),
(23, 'Thor', '00:02:32', 'fantasy', 'Dopo che le sue azioni sconsiderate hanno riacceso un\'antica guerra, il dio nordico Thor viene spogliato dei propri poteri, scacciato dal regno di Asgard, e costretto a vivere tra gli umani.', 2011, '00:02:32', './Media/Thor.mp4', './images/film/Thor.jpg'),
(24, 'Thor: The dark world', '00:02:24', 'fantasy', 'Dal personaggio della Marvel, Thor si allea con il perfido Loki per salvare la Terra dei Nove Regni da un antico nemico nato prima ancora dell\'universo.', 2013, '00:00:00', './Media/ThorT.mp4', './images/film/ThorT.jpg'),
(25, 'Thor: Ragnarok', '00:02:28', 'fantasy', 'Thor viene imprigionato e, privato del proprio martello, si ritrova a dover combattere contro Hulk ed Hela. Inoltre deve riuscire a raggiungere Asgard e fermare Ragnarok, la distruzione del suo proprio mondo.', 2017, '00:00:00', './Media/ThorR.mp4', './images/film/ThorR.jpg'),
(26, 'IT', '00:02:32', 'horror', 'Un gruppo di adolescenti scopre l\'esistenza di un\'entita\' malvagia che si nutre delle paure degli esseri umani e che ha le sembianze di un pagliaccio di nome Pennywise. L\'essere, che dimora nelle profondita\' della rete fognaria, e\' solo uno dei volti della creatura millenaria nota come It.', 2017, '00:00:00', './Media/It.mp4', './images/film/It.jpg'),
(27, 'IT: Capitolo due', '00:02:28', 'horror', 'Nella sonnacchiosa cittadina di Derry, il malvagio clown Pennywise ritorna dopo ventisette anni per tormentare di nuovo i membri del Club dei Perdenti, che da tempo si sono persi di vista.', 2019, '00:00:00', './Media/It2.mp4', './images/film/It2.jpg'),
(28, 'Il buco', '00:01:59', 'horror', 'In una sorta di prigione che si sviluppa in verticale su un gran numero di livelli, al piano 0, situato in cima all\'edificio, e\' presente una cucina attrezzatissima il cui personale ha il compito di imbandire ogni giorno una larga tavola, la piattaforma, con i piatti preferiti di tutte le persone imprigionate nei piani sottostanti.', 2019, '00:00:00', './Media/buco.mp4', './images/film/Il buco.jpg'),
(29, 'The lighthouse', '00:01:45', 'thriller', 'L\'accanirsi del maltempo costringe i due guardiani del faro di un\'isola sperduta ad una convivenza forzata che porta in superficie demoni personali, timori ancestrali e nuove, tormentate pulsioni, in un crescendo di follia e claustrofobia.\r\n', 2019, '00:00:40', './Media/TheL.mp4', './images/film/The.jpg'),
(30, 'Scappa', '00:02:32', 'thriller', 'Chris decide di far visita a Rose nella tenuta della sua famiglia. Quando incontra i genitori della ragazza pensa che il loro strano comportamento sia dovuto alla natura interraziale del proprio rapporto e scopre uno sconvolgente segreto.', 2019, '00:00:00', './Media/Scappa.mp4', './images/film/Scappa.jpg'),
(31, 'Countdown', '00:02:40', 'thriller', 'Una giovane infermiera scarica un\'applicazione che prevede la data di morte delle persone, e scopre di avere solo tre giorni di vita. La donna corre contro il tempo per trovare il modo di salvare la propria vita.', 2019, '00:00:00', './Media/Count.mp4', './images/film/Count.jpg'),
(32, 'Breaking Bad', '00:02:07', 'consigliati', 'Walter White e\' un professore di chimica.', 2013, '00:00:00', './Media/Break.mp4', './Media/img1.jpg'),
(33, 'Money Heist', '00:01:31', 'consigliati', 'La storia narra gli sviluppi di una rapina estremamente ambiziosa e originale.', 2018, '00:00:00', './Media/Money.mp4', './Media/img2.jpg'),
(34, 'House of Cards', '00:02:29', 'consigliati', 'Battaglie contro Raymond Tusk (Gerald McRaney) cerca di mantenere la sua posizione.', 2013, '00:00:25', './Media/House.mp4', './Media/img3.jpg'),
(35, 'The Witcher', '00:02:10', 'consigliati', 'In un mondo abitato da esseri umani, elfi, nani e altre specie magiche.', 2019, '00:02:10', './Media/Witch.mp4', './Media/img4.jpg'),
(36, 'The Walking Dead', '00:02:19', 'consigliati', 'Rick Grimes e\' un vice sceriffo vittima di un incidente.', 2013, '00:00:00', './Media/Dead.mp4', './Media/img5.jpg'),
(37, 'Jhon Wick III', '00:02:35', 'consigliati', 'In fuga con una taglia da 14 milioni di dollari sul capo, il celebre sicario John Wick cerca di sopravvivere dopo aver perso la protezione del Sindacato degli Assassini.', 2019, '00:00:19', './Media/Jhon.mp4', './Media/img6.jpg'),
(38, 'IZombie', '00:01:40', 'consigliati', 'Un detective di Seattle appena trasferito dalla buon costume alla omicidi, si fa aiutare da Liv per risolvere i casi di omicidio e viene tenuto all\'oscuro del segreto della giovane, che afferma di essere una sensitiva.', 2015, '00:00:00', './Media/IZombie.mp4', './Media/img7.jpg'),
(39, 'The Naked Director', '00:02:32', 'consigliati', 'Ambientata a Sapporo negli anni \'80, la serie segue l\'insolita e drammatica vita del regista e imprenditore Toru Muranishi.', 2019, '00:00:00', './Media/Naked.mp4', './Media/img8.jpg'),
(40, 'Black Mirror', '00:02:29', 'consigliati', 'La fiction, ambientata nel futuro, ma in realta\' ispirata al mondo di oggi, e\' incentrata sui problemi di attualita\' e sulle sfide poste dall\'introduzione di nuove tecnologie.', 2011, '00:00:00', './Media/Black.mp4', './Media/img9.jpg'),
(41, 'Person of Interest', '00:03:23', 'consigliati', 'Crime ambientato a New York che vede l\'ex agente della CIA e presunto cadavere John Reese stringere un\'improbabile alleanza con il misterioso miliardario Mr. Finch.', 2015, '00:00:00', './Media/Person.mp4', './Media/img10.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `preferito`
--

CREATE TABLE `preferito` (
  `ID` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `utente_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `preferito`
--

INSERT INTO `preferito` (`ID`, `film_id`, `utente_id`) VALUES
(2, 14, 'lorenzo.ciarpaglini@gmail.com'),
(4, 33, 'lorenzo.ciarpaglini@gmail.com'),
(5, 35, 'prova@prova.it'),
(6, 37, 'prova@prova.it'),
(7, 39, 'lorenzo.ciarpaglini@gmail.com'),
(8, 38, 'lorenzo.ciarpaglini@gmail.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `regista`
--

CREATE TABLE `regista` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `regista`
--

INSERT INTO `regista` (`id`, `nome`, `cognome`) VALUES
(6, 'Edward', 'Drake'),
(7, 'George', 'Miller'),
(8, 'Sam', 'Mendes'),
(9, 'Alejandro G.', 'Inarritu'),
(10, 'Richard', 'Linklater'),
(11, 'Peyton', 'Reed'),
(12, 'Joel e Ethan', 'Coen'),
(13, 'Martin', 'Scorsese'),
(14, 'David', 'Fincher'),
(15, 'Denis', 'Villenueve'),
(16, 'James', 'Cameron'),
(17, 'Alex', 'Garland'),
(18, 'Alfonso', 'Cuaron'),
(19, 'Cristopher', 'Nolan'),
(21, 'Rian', 'Johnson'),
(22, 'Ridley', 'Scott'),
(26, 'Kenneth', 'Branagh'),
(27, 'Alan', 'Taylor'),
(28, 'Taika', 'Waititi'),
(29, 'Andy', 'Muschietti'),
(30, 'Galder', 'Gaztelu-Urrutia'),
(31, 'Robert', 'Eggers'),
(32, 'Jordan', 'Peele'),
(33, 'Justin', 'Dec'),
(34, 'Vince', 'Gilligan'),
(35, 'Alex', 'Pina'),
(36, 'Paul', 'Seed'),
(37, 'Mike', 'Ostrowski'),
(38, 'Frank', 'Darabont'),
(39, 'Chad', 'Stahelski'),
(40, 'Daine', 'Ruggero'),
(41, 'Eiji', 'Uchida'),
(42, 'Charlie', 'Brooker'),
(43, 'Jonathan', 'Nolan');

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cookie` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`email`, `password`, `cookie`) VALUES
('ciarpaglini.lorenzo@gmail.com', 'f5db60041d29b319fd101c7434c8da57', 'mplvZZJoa5tma2iSkmWTlGVpaZaWa2VtbGeVlmlra2Nvb2ZslWuWbJRpZpxnaZttZWloZnFplmttaJ5jZJpkYpKTcWSWamaVZGdul5Rtk5NkZmual2xqaWdpl5dsbWJjbGtlcJtql2eUcGSWa2SYbmZqbGRtbZdqbGuWYmeWaGaam2pqkWRmnWplcJaZaJGUZGFpmppoa2dqbpmbbGdpaGxqYm+abplnmGtmnWVpmGphbGpnameWZ21omWdkmmZomJNpY5piZ51kaWualmeTlmZlZJuVcWpsaW2Vmm9kaGdmaWZsm2yZZ5dqZZ5qZpVpYmxmZWlmlGpoap5raZZjZA=='),
('lorenzo.ciarpaglini@gmail.com', '106aa755edf05f76a0fc7086d70df41c', 'l5VuaJRmbZVqbnCRmmSak2xma5aUaGVtZ2yTk25tYmZnbGVvnWWWaJFrYp9kZJtqYm5pZ2lrmWptZZZpYZhmZ5WUcmmUaWmcZWhqlJttkZNnZWmWmWtua2Ztm5doZWZhamxka5ttmGyRbGeaZmGVaWZuZWJwa5hlbGmXaWieYmeUmmxkmGNlmGRsbJqYbZiWaWZjnpZvamVoZpOXbmZqZGhqZW2VaphqmGlpmGVjl2doamVicG2Za25ll2Rhl2NrlZpraZdqbpZpa2mTlGqTl2ZlapiWbGZlbWmVk2dra2FpZ2VvmWqRcJptZZZjaJRsZm9sYW9mk2NrbJ5maZZkZA=='),
('prova@prova.it', '106aa755edf05f76a0fc7086d70df41c', 'lZVvY5NrbpZpZmiTmmualWZjZJyXaW1qaW+XmWpkaGptbWVtlmeSbZVyZ5toZZlpYW1tZ3FsmmlraZlnZplmZJWabGGWZmmbam5slJpnlpRnZ2qemWtsamhtlJhuZGdjbmtmcJVlmG2YbmWfa2OUamVsamVyZpljbmqbaWSeaGuYlnFplmJnm2lnaZmTaJmYamJpnJhwbWVvZpOcbGZkZGZrZXKdaJhrlGtklmJpm2tibmxqa2aVaG5ummtll2VnmJRsYpliZpdla2uVk2qZmWxmaJuSa2hqbWqUmWlqaGhramRxnWWacJpyaJhmapptYmpoZ3BplGZpZZhlZZ5oYw==');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `attore`
--
ALTER TABLE `attore`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `cast`
--
ALTER TABLE `cast`
  ADD PRIMARY KEY (`attore_id`,`regista_id`,`film_id`),
  ADD KEY `fk_regista` (`regista_id`),
  ADD KEY `fk_film` (`film_id`);

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `preferito`
--
ALTER TABLE `preferito`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_film` (`film_id`) USING BTREE,
  ADD KEY `fk_utente` (`utente_id`);

--
-- Indici per le tabelle `regista`
--
ALTER TABLE `regista`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `attore`
--
ALTER TABLE `attore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT per la tabella `film`
--
ALTER TABLE `film`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT per la tabella `preferito`
--
ALTER TABLE `preferito`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `regista`
--
ALTER TABLE `regista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cast`
--
ALTER TABLE `cast`
  ADD CONSTRAINT `fk_attore` FOREIGN KEY (`attore_id`) REFERENCES `attore` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_regista` FOREIGN KEY (`regista_id`) REFERENCES `regista` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `preferito`
--
ALTER TABLE `preferito`
  ADD CONSTRAINT `fk_utente` FOREIGN KEY (`utente_id`) REFERENCES `utente` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
