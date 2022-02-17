-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 17 Haz 2021, 19:27:52
-- Sunucu sürümü: 5.7.31
-- PHP Sürümü: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `filmler`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bilet`
--

DROP TABLE IF EXISTS `bilet`;
CREATE TABLE IF NOT EXISTS `bilet` (
  `bilet_ID` int(11) NOT NULL AUTO_INCREMENT,
  `film_ID` int(11) NOT NULL,
  `seans_ID` int(11) NOT NULL,
  `salon_ID` int(11) NOT NULL,
  `koltuk_ID` int(11) DEFAULT NULL,
  `uye_ID` int(11) DEFAULT NULL,
  `b_tarih` date NOT NULL,
  `b_sehir` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`bilet_ID`),
  KEY `film_ID` (`film_ID`,`seans_ID`,`salon_ID`,`koltuk_ID`,`uye_ID`),
  KEY `salon_ID` (`salon_ID`),
  KEY `uye_ID` (`uye_ID`),
  KEY `seans_ID` (`seans_ID`),
  KEY `koltuk_ID` (`koltuk_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `bilet`
--

INSERT INTO `bilet` (`bilet_ID`, `film_ID`, `seans_ID`, `salon_ID`, `koltuk_ID`, `uye_ID`, `b_tarih`, `b_sehir`) VALUES
(23, 508, 164, 904, 111, 103, '2021-07-03', 'Edirne'),
(24, 508, 164, 904, 124, 103, '2021-07-03', 'Edirne'),
(25, 508, 164, 904, 127, 102, '2021-07-03', 'Edirne'),
(30, 509, 153, 909, 137, 103, '2021-07-08', 'Sivas'),
(31, 509, 162, 909, 119, 102, '2021-06-25', 'Trabzon'),
(39, 508, 144, 907, 132, 104, '2021-07-08', 'Adana'),
(40, 503, 162, 901, 111, 103, '2021-06-26', 'Samsun'),
(41, 503, 162, 901, 115, 103, '2021-06-26', 'Samsun'),
(42, 503, 162, 901, 116, 104, '2021-06-26', 'Samsun'),
(43, 508, 163, 906, 111, 103, '2021-07-01', 'Sivas'),
(44, 508, 163, 906, 114, 103, '2021-07-01', 'Sivas'),
(45, 508, 163, 906, 116, 103, '2021-07-01', 'Sivas'),
(47, 508, 164, 904, 115, 102, '2021-06-26', 'Istanbul'),
(51, 511, 155, 913, 114, 106, '2021-06-01', 'Edirne'),
(52, 508, 158, 905, 110, 103, '2021-06-05', 'Ankara'),
(54, 503, 154, 902, 136, 105, '2021-07-15', 'Sivas'),
(55, 511, 161, 914, 129, 100, '2021-07-07', 'Balikesir'),
(56, 511, 161, 914, 130, 100, '2021-07-07', 'Balikesir'),
(57, 511, 161, 914, 131, 100, '2021-07-07', 'Balikesir'),
(58, 508, 170, 907, 130, 100, '2021-07-22', 'Edirne'),
(59, 503, 164, 902, 114, 100, '2021-06-19', 'Balikesir'),
(60, 503, 164, 902, 111, 101, '2021-07-02', 'Istanbul'),
(61, 503, 164, 902, 114, 101, '2021-07-02', 'Istanbul'),
(62, 503, 164, 902, 116, 101, '2021-07-02', 'Istanbul'),
(63, 509, 167, 910, 124, 107, '2021-06-24', 'Istanbul'),
(64, 509, 167, 910, 125, 107, '2021-06-24', 'Istanbul'),
(65, 509, 167, 910, 126, 107, '2021-06-24', 'Istanbul'),
(66, 509, 167, 910, 127, 107, '2021-06-24', 'Istanbul');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `filmler`
--

DROP TABLE IF EXISTS `filmler`;
CREATE TABLE IF NOT EXISTS `filmler` (
  `film_ID` int(11) NOT NULL AUTO_INCREMENT,
  `film_adi` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `vizyon` date NOT NULL,
  `aciklama` text COLLATE utf8_turkish_ci NOT NULL,
  `IMDB` varchar(5) COLLATE utf8_turkish_ci NOT NULL,
  `yapim_ID` int(11) DEFAULT NULL,
  `yonetmen_ID` int(11) NOT NULL,
  `tur_ID` int(11) NOT NULL,
  `kategori_ID` int(11) NOT NULL,
  `film_resim` varchar(300) COLLATE utf8_turkish_ci NOT NULL,
  `fragman` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`film_ID`),
  KEY `yapim_ID` (`yapim_ID`,`yonetmen_ID`,`tur_ID`,`kategori_ID`),
  KEY `yapim_ID_2` (`yapim_ID`),
  KEY `yonetmen_ID` (`yonetmen_ID`),
  KEY `tur_ID` (`tur_ID`),
  KEY `kategori_ID` (`kategori_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `filmler`
--

INSERT INTO `filmler` (`film_ID`, `film_adi`, `vizyon`, `aciklama`, `IMDB`, `yapim_ID`, `yonetmen_ID`, `tur_ID`, `kategori_ID`, `film_resim`, `fragman`) VALUES
(500, 'Fight Club', '2019-04-14', 'Dovus Kulubunun birinci kurali: Asla Dovus Kulubu hakkinda konusma... Dovus Kulubunun ikinci kurali: Asla ve asla dovus kulubu hakkinda konusma... Jack, hayatin siradanligina kapilmis bir sigorta memurudur. Uzun bir suredir \'insomnia\' yani uykusuzluk hastaligindan sikayetcidir. Kendi psikolojik sikintilarindan kurtulabilmek adina grup terapilerine katilmaktadir. Terapiler esnasinda Marla adinda bir kizla tanisir. Bir sure sonra da hayatini degistirecek olan Tyler Durden ile... Durden, Jack\'in ulasmak istedigi tum hedeflere ulasmis olan bir adamdir ve Jack\'i asla hakkinda konusulmamasi gereken bir organizasyon olan \'Dovus Kulubu\' ile tanistiracaktir.', '8.8', 16, 37, 83, 91, 'https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY1200_CR85,0,630,1200_AL_.jpg', 'https://www.youtube.com/embed/qtRKdVHc-cE'),
(501, '12 Angry Men', '2018-04-13', '12 Ofkeli Adam, cinayetle suclanan bir genc ile ilgili karar vermekle yukumlu 12 juri uyesinin karar verme surecini konu ediyor. Latin Amerikali bir genc adam, babasini oldurdugu gerekcesiyle cinayetle suclanir. Sanigin kaybettigini soyledigi bir bicak ise cinayetin islendigi odada bulunmustur, gencin mahkemeye sundugu savunma zayiftir ve olan biteni duyduklarini soyleyen pek cok tanik vardir. Sanik suclu bulundugu taktirde idama mahkum edilecektir.Juri sonuclari pek de sasirtici degildir: 12 juri uyesinden sadece sekiz numarali juri uyesi Davis \'sucsuz\' hukmu yonunde oy vermistir. Davis’in juri uyelerini ikna etmeye calismasi esnasinda her juri uyesinin \'suclu\' karari vermesinin arkasinda ise, aralarinda yabanci dusmanligi, kanuna asiri guven, cogunluga uyma, gecmisle hesaplasma gibi farkli kisisel sebepler oldugu ortaya cikacaktir.', '9.0', 10, 33, 80, 91, 'http://tr.web.img3.acsta.net/pictures/bzp/03/4063.jpg', 'https://www.youtube.com/embed/2L4IhbF2WK0'),
(502, 'Forrest Gump ', '2020-04-07', 'Forrest Gump, dusuk I.Q. sahibi genc bir adamdir. Jenny ile tanistiginda ona asik olur. Gump aralarinda Elvis Presley, Kennedy, Nixon’in da oldugu tarihsel kisilerle kaza eseri tanisir ve 50’lerden 70’lerin sonuna kadar gelen bir sure zarfinda olaylar gelisir. Gump tamamen tesaduf olarak Vietnam savasina ve Amerikan yakin tarihinin onemli olaylarina sahitlik eder ve hatta rol alir. Ancak bilmeden yaptiklarinin ne kadar onemli sonuclari oldugundan da haberi yoktur.', '8.8', 14, 38, 82, 91, 'http://tr.web.img2.acsta.net/c_310_420/pictures/bzp/01/10568.jpg', 'https://www.youtube.com/embed/bLvqoHBptjg'),
(503, 'The Godfather', '2021-04-26', 'Baba filmi Ikinci Dunya Savasinin bittigi yildan baslar ve on yil surer. Corleone ailesi Sicilya\'dan goc etmislerdir. Corleone ailesi guclu bir Italyan mafyasidir. New York\'da dort aileyle bir olup yeralti islerini yonetmektedir.Aile ABD\'ye yerlesmeye calisirken kendilerine surekli kaba kuvvet kullanmaya calisan ve her yaptiklari isten harac isteyen bir grup belirsiz kisilere kendilerine de onlara karsi kaba kuvvet kullanmaya calismislar fakat basarili olamamislardir.Ve kendilerini hayal bile edemeyecekleri bir hayatin icinde bulurlar. Corleone ailesi bir sure sonra ABD\'nin en korkulan mafyasi haline gelmistir. Ama kendileri mafya olduklarini reddedip,iyi bir aile olduklarini soyluyorlardir.', '9.2', 11, 31, 81, 91, 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY1200_CR107,0,630,1200_AL_.jpg', 'https://www.youtube.com/embed/sY1S34973zA'),
(504, 'The Dark Knight', '2015-07-08', '\'The Dark Knight\' da, Batman suca karsi savasini daha da ileriye goturuyor: Tegmen Jim Gordon ve Bolge Savcisi Harvey Dent’in yardimlariyla, Batman, sehir sokaklarini sarmis olan suc orgutlerinden geriye kalanlari temizlemeye girisir. Bu ortakligin etkili oldugu aciktir, ama ekip kisa sure sonra kendilerini, Joker olarak bilinen ve Gotham sehri sakinlerini daha once de dehsete bogmus olan suc dehasinin yarattigi karmasanin ortasinda bulurlar.', '9.0', 21, 32, 84, 92, 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg', 'https://www.youtube.com/embed/EXeTwQWrcwY'),
(505, 'The Lord of Rings: The Return of the King', '2011-02-02', 'Kralin Donusu, Peter Jacksonin ucunu bir arada cekerek sinemaya uyarladigi Tolkienin olumsuz eseri Yuzuklerin Efendisinin son bolumunu beyazperdeye tasiyor. Kiyamet gunu ortamini yasayan Orta Dunyada, Yuzuk Savasinin son ve en buyuk mucadelesine hosgeldiniz. Bir yanda guvenilmez Gollumun rehberlik ettigi yuzuk tasiyicisi Frodo ve yoldasi Sam, Mordora ulasip Tek Yuzuku yokedebilecekleri tek yere goturmeye calisiyorlar.', '8.9', 20, 34, 85, 92, 'https://upload.wikimedia.org/wikipedia/en/b/be/The_Lord_of_the_Rings_-_The_Return_of_the_King_%282003%29.jpg', 'https://www.youtube.com/embed/r5X-hFf6Bwo'),
(506, 'The Godfather: Part II', '2010-01-19', 'Genç Corleone, Amerika’ya yeni gelmiştir. 1917 yılında, New York şehri’nin yerel mafyalarından birinin liderini öldürünce saygınlık kazanır ve korkulan biri haline gelir. Bu arada, 50 yıl sonra, Michael Corleone, Washington’da senato komitesine aile işleriyle ilgili ifade vermektedir.', '9.0', 12, 31, 81, 93, 'https://m.media-amazon.com/images/M/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg', 'https://www.youtube.com/embed/9O1Iy9od7-A'),
(507, 'Schindler\'s List', '2019-10-16', 'Schindler’in Listesi, Oskar Schindler adli bir Alman isadaminin 2. Dunya Savasi zamaninda Polonya’da kurdugu fabrikada Yahudi iscileri calistirmasi ve bu sayede 1100 Yahudi’nin hayatini kurtarmasini konu aliyor.', '8.9', 13, 36, 87, 93, 'https://upload.wikimedia.org/wikipedia/tr/3/38/Schindler%27s_List_movie.jpg', 'https://www.youtube.com/embed/gG22XNhtnoY'),
(508, 'Inception', '2021-04-25', 'Dom Cobb (Leonardo DiCaprio) cok yetenekli bir hirsizdir. Uzmanlik alani, zihnin en savunmasiz oldugu ruya gorme aninda, bilincaltinin derinliklerindeki degerli sirlari cekip cikarmak ve onlari calmaktir. Cobb’un bu ender mahareti, onu kurumsal casuslugun tehlikeli yeni dunyasinda aranan bir oyuncu yapmistir. Ancak, ayni zamanda bu durum onu uluslararasi bir kacak yapmis ve sevdigi herseye malolmustur. Cobb’a icinde bulundugu durumdan kurtulmasini saglayacak bir firsat sunulur. Ona hayatini geri verebilecek son bir is; tabi eger imkansiz “baslangic”i tamamlayabilirse. Mukemmel soygun yerine, Cobb ve takimindaki profesyoneller bu sefer tam tersini yapmak zorundadir; gorevleri bir fikri calmak degil onu yerlestirmektir. Eger basarirlarsa, mukemmel suc bu olacaktir. Ama ne dikkatle yapilan planlamalar, ne de uzmanliklari, onlari, her hareketlerini onceden tahmin ettigi anlasilan tehlikeli dusmanlarina karsi hazirlikli kilabilir. Bu, gelisini sadece Cobb’un gorebildigi bir dusmandir.', '8.8', 24, 32, 89, 92, 'https://flxt.tmsimg.com/assets/p7825626_p_v10_af.jpg', 'https://www.youtube.com/embed/8hP9D6kZseM'),
(509, 'The Shawshank Redemption', '2021-04-24', 'Genc ve basarili bir banker olan Andy Dufresne, karisini ve onun sevgilisini oldurmek sucundan omur boyu hapse mahkum edilir ve Shawshank hapishanesine gonderilir. Iskence, tecavuz, dayak dahil her turlu kotu kosulun hukum surdugu hapishane kosullarinda, Andynin hayata bagli ve her daim iyi bir seyler bulma cabasi icindeki hali, cevresindeki herkesi cok etkileyecektir. Bir sure sonra parmakliklarin arkasinda bile ozgur bir yasam olabilecegine butun mahkumlari inandirir. Bu mahkumlardan biri olan Red ve Andy, unutulmaz bir dostluk kurarak hapishaneyi bambaska bir yer haline getirirler.', '9.3', 14, 30, 80, 93, 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY1200_CR89,0,630,1200_AL_.jpg', 'https://www.youtube.com/embed/P9mwtI82k6E'),
(510, 'Pulp Fiction', '2011-02-09', 'Odul avcisi Butch Coolidge seytanla yaptigi bir anlasmada odemeyi durdurmaya karar verir. Honey Bunny ve Pumpkin, hayatlarina biraz hareket katmak isteyen genc ve birbirlerine asik bir cift soyguncudur. Bu arada iki isi iyi bilen gangster, Vincent Vega ve Jules, gunluk islerinden biri olarak,patronlarina odemeyi geciktiren bir kac sahtekar genci vurmaya giderler. Vincent patronun genc ve guzel karisina bebek bakiciligi yapmakla da gorevlendirilirken ortagi suc yasamina son vermeye karar verir. Cesur bir boksor ise para karsiligi hile yapmayi redderek sehirden kacar. Kader bu aykiri tipleri muthesem bir raslanti sonucu bir araya getirecektir.', '8.9', 14, 35, 81, 93, 'https://prod.cdn.bbaws.net/TDC_Blockbuster_-_Production/114/676/EG-4397_po-reg-medium_orig.jpg', 'https://www.youtube.com/embed/s7EdQ4FqbhY'),
(511, 'The Lord of the Rings: The Fellowship of the Ring', '2021-04-26', 'Asirlardir kayip olan yuzuk bulunur ve kaderin garip bir cilvesi sonucu, kucuk bir Hobbit olan Frodonun eline gecer. Ihtiyar Gandalf, bu yuzugun Kara Lord Saurona ait ozel yuzuk oldugunu anlar. Frodonun yapmasi gereken, Kiyametin Catlaklari olarak anilan diyara dalarak epik bir mucadeleye girismek ve bu yuzugu ebediyen ortadan kaldirmaktir.', '8.8', 18, 34, 86, 92, 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg', 'https://www.youtube.com/embed/V75dMMIW2B4');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `film_oyuncu`
--

DROP TABLE IF EXISTS `film_oyuncu`;
CREATE TABLE IF NOT EXISTS `film_oyuncu` (
  `fo_ID` int(11) NOT NULL AUTO_INCREMENT,
  `film_ID` int(11) NOT NULL,
  `oyuncu_ID` int(11) NOT NULL,
  PRIMARY KEY (`fo_ID`),
  KEY `film_ID` (`film_ID`,`oyuncu_ID`),
  KEY `oyuncu_ID` (`oyuncu_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7044 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `film_oyuncu`
--

INSERT INTO `film_oyuncu` (`fo_ID`, `film_ID`, `oyuncu_ID`) VALUES
(7000, 500, 40),
(7001, 500, 41),
(7002, 500, 42),
(7003, 500, 43),
(7004, 501, 44),
(7005, 501, 45),
(7006, 501, 46),
(7007, 502, 47),
(7008, 502, 48),
(7009, 502, 49),
(7010, 502, 50),
(7011, 503, 51),
(7012, 503, 52),
(7013, 503, 53),
(7014, 504, 54),
(7015, 504, 55),
(7016, 504, 56),
(7017, 504, 57),
(7018, 505, 58),
(7019, 505, 59),
(7020, 505, 60),
(7021, 505, 61),
(7022, 506, 52),
(7023, 506, 62),
(7024, 506, 63),
(7025, 507, 64),
(7026, 507, 65),
(7027, 507, 66),
(7028, 508, 67),
(7029, 508, 68),
(7030, 508, 69),
(7031, 508, 70),
(7032, 509, 71),
(7033, 509, 72),
(7034, 509, 73),
(7035, 509, 74),
(7036, 510, 75),
(7037, 510, 76),
(7038, 510, 77),
(7039, 510, 78),
(7040, 511, 58),
(7041, 511, 59),
(7042, 511, 60),
(7043, 511, 79);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

DROP TABLE IF EXISTS `kategori`;
CREATE TABLE IF NOT EXISTS `kategori` (
  `kategori_ID` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`kategori_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kategori`
--

INSERT INTO `kategori` (`kategori_ID`, `kategori_adi`) VALUES
(90, 'Yerli Filmler'),
(91, 'Yabanci Filmler'),
(92, 'Turkce Dublaj'),
(93, 'Turkce Altyazi'),
(94, '2019 Filmleri'),
(95, '2020 Filmleri');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `koltuk`
--

DROP TABLE IF EXISTS `koltuk`;
CREATE TABLE IF NOT EXISTS `koltuk` (
  `koltuk_ID` int(11) NOT NULL AUTO_INCREMENT,
  `koltuk_NO` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`koltuk_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `koltuk`
--

INSERT INTO `koltuk` (`koltuk_ID`, `koltuk_NO`) VALUES
(110, 'A-1'),
(111, 'A-2'),
(112, 'A-3'),
(113, 'A-4'),
(114, 'A-5'),
(115, 'A-6'),
(116, 'B-1'),
(117, 'B-2'),
(118, 'B-3'),
(119, 'B-4'),
(120, 'B-5'),
(121, 'B-6'),
(122, 'C-1'),
(123, 'C-2'),
(124, 'C-3'),
(125, 'C-4'),
(126, 'C-5'),
(127, 'C-6'),
(128, 'D-1'),
(129, 'D-2'),
(130, 'D-3'),
(131, 'D-4'),
(132, 'D-5'),
(133, 'D-6'),
(134, 'E-1'),
(135, 'E-2'),
(136, 'E-3'),
(137, 'E-4'),
(138, 'E-5'),
(139, 'E-6');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oyuncu`
--

DROP TABLE IF EXISTS `oyuncu`;
CREATE TABLE IF NOT EXISTS `oyuncu` (
  `oyuncu_ID` int(11) NOT NULL AUTO_INCREMENT,
  `oyuncu_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `oyuncu_soyadi` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`oyuncu_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `oyuncu`
--

INSERT INTO `oyuncu` (`oyuncu_ID`, `oyuncu_adi`, `oyuncu_soyadi`) VALUES
(40, 'Brad', 'Pitt'),
(41, 'Edward', 'Norton'),
(42, 'Meat', 'Loaf'),
(43, 'Zach', 'Greiner'),
(44, 'Henry', 'Fonda'),
(45, 'Lee J.', 'Cobb'),
(46, 'Martin', 'Balsam'),
(47, 'Gary', 'Sinise'),
(48, 'Robin', 'Wright'),
(49, 'Sally', 'Field'),
(50, 'Tom', 'Hanks'),
(51, 'Marlon', 'Brando'),
(52, 'Al', 'Pacino'),
(53, 'James', 'Caan'),
(54, 'Aaron', 'Eckhart'),
(55, 'Christian', 'Bale'),
(56, 'Heath', 'Ledger'),
(57, 'Micheal', 'Caine'),
(58, 'Elijah', 'Wood'),
(59, 'Ian', 'McKellen'),
(60, 'Orlando', 'Bloom'),
(61, 'Wiggo', 'Mortensen'),
(62, 'Robert De', 'Niro'),
(63, 'Robert', 'Duvall'),
(64, 'Liam', 'Neeson'),
(65, 'Ben', 'Kingsley'),
(66, 'Ralph', 'Fiennes'),
(67, 'Ellen', 'Page'),
(68, 'Joseph', 'Gordon-Levitt'),
(69, 'Ken', 'Watanabe'),
(70, 'Leonardo', 'DiCaprio'),
(71, 'Bob', 'Gunton'),
(72, 'Morgan', 'Freeman'),
(73, 'Tim', 'Robbins'),
(74, 'William', 'Sadler'),
(75, 'Bruce', 'Willis'),
(76, 'John', 'Travolta'),
(77, 'Samuel L.', 'Jackson'),
(78, 'Uma', 'Thurman'),
(79, 'Sean', 'Bean');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `puan`
--

DROP TABLE IF EXISTS `puan`;
CREATE TABLE IF NOT EXISTS `puan` (
  `puan_ID` int(11) NOT NULL AUTO_INCREMENT,
  `uye_ID` int(11) NOT NULL,
  `puan_degeri` int(11) NOT NULL,
  `film_ID` int(11) NOT NULL,
  PRIMARY KEY (`puan_ID`),
  KEY `uye_ID` (`uye_ID`),
  KEY `film_ID` (`film_ID`),
  KEY `film_ID_2` (`film_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3022 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `puan`
--

INSERT INTO `puan` (`puan_ID`, `uye_ID`, `puan_degeri`, `film_ID`) VALUES
(3000, 100, 3, 501),
(3001, 101, 5, 501),
(3002, 102, 8, 504),
(3003, 103, 6, 504),
(3004, 104, 7, 505),
(3005, 101, 10, 508),
(3006, 102, 1, 509),
(3007, 103, 8, 506),
(3008, 103, 1, 503),
(3009, 103, 1, 503),
(3010, 103, 1, 508),
(3011, 100, 8, 509),
(3012, 101, 9, 508),
(3013, 101, 1, 508),
(3014, 103, 8, 503),
(3015, 106, 6, 511),
(3016, 103, 9, 508),
(3017, 103, 9, 510),
(3018, 103, 7, 500),
(3019, 103, 1, 507),
(3020, 103, 8, 502),
(3021, 107, 10, 507);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `salon`
--

DROP TABLE IF EXISTS `salon`;
CREATE TABLE IF NOT EXISTS `salon` (
  `salon_ID` int(11) NOT NULL AUTO_INCREMENT,
  `salon_adi` varchar(60) COLLATE utf8_turkish_ci NOT NULL,
  `film_ID` int(11) NOT NULL,
  PRIMARY KEY (`salon_ID`),
  KEY `film_ID` (`film_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=916 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `salon`
--

INSERT INTO `salon` (`salon_ID`, `salon_adi`, `film_ID`) VALUES
(900, 'Salon1 | 2D | Turkce Dublaj', 503),
(901, 'Salon2 | 2D | Turkce Altyazi', 503),
(902, 'Salon3 | 3D | Turkce Dublaj', 503),
(903, 'Salon4 | 3D | Turkce Altyazi', 503),
(904, 'Salon5 | 2D | Turkce Altyazi', 508),
(905, 'Salon6 | 2D | Turkce Dublaj', 508),
(906, 'Salon7 | 3D | Turkce Dublaj', 508),
(907, 'Salon8 | 3D | Turkce Altyazi', 508),
(908, 'Salon9 | 2D | Turkce Dublaj', 509),
(909, 'Salon10 | 2D | Turkce Altyazi', 509),
(910, 'Salon11 | 3D | Turkce Dublaj', 509),
(911, 'Salon12 | 3D | Turkce Altyazi', 509),
(912, 'Salon13 | 2D | Turkce Altyazi', 511),
(913, 'Salon14 | 2D | Turkce Dublaj', 511),
(914, 'Salon15 | 3D | Turkce Altyazi', 511),
(915, 'Salon16 | 3D | Turkce Dublaj', 511);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `salon_seans`
--

DROP TABLE IF EXISTS `salon_seans`;
CREATE TABLE IF NOT EXISTS `salon_seans` (
  `ss_ID` int(11) NOT NULL AUTO_INCREMENT,
  `seans_ID` int(11) NOT NULL,
  `salon_ID` int(11) NOT NULL,
  PRIMARY KEY (`ss_ID`),
  KEY `seans_ID` (`seans_ID`),
  KEY `salon_ID` (`salon_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1448 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `salon_seans`
--

INSERT INTO `salon_seans` (`ss_ID`, `seans_ID`, `salon_ID`) VALUES
(1400, 140, 900),
(1401, 150, 900),
(1402, 158, 900),
(1403, 144, 901),
(1404, 154, 901),
(1405, 162, 901),
(1406, 145, 902),
(1407, 154, 902),
(1408, 164, 902),
(1409, 152, 903),
(1410, 160, 903),
(1411, 168, 903),
(1412, 144, 904),
(1413, 156, 904),
(1414, 164, 904),
(1415, 141, 905),
(1416, 158, 905),
(1417, 171, 905),
(1418, 148, 906),
(1419, 163, 906),
(1420, 168, 906),
(1421, 144, 907),
(1422, 156, 907),
(1423, 170, 907),
(1424, 146, 908),
(1425, 159, 908),
(1426, 162, 908),
(1427, 153, 909),
(1428, 162, 909),
(1429, 166, 909),
(1430, 148, 910),
(1431, 157, 910),
(1432, 167, 910),
(1433, 146, 911),
(1434, 161, 911),
(1435, 170, 911),
(1436, 145, 912),
(1437, 160, 912),
(1438, 168, 912),
(1439, 150, 913),
(1440, 155, 913),
(1441, 169, 913),
(1442, 141, 914),
(1443, 151, 914),
(1444, 161, 914),
(1445, 143, 915),
(1446, 153, 915),
(1447, 163, 915);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `seans`
--

DROP TABLE IF EXISTS `seans`;
CREATE TABLE IF NOT EXISTS `seans` (
  `seans_ID` int(11) NOT NULL AUTO_INCREMENT,
  `seans_saati` varchar(10) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`seans_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `seans`
--

INSERT INTO `seans` (`seans_ID`, `seans_saati`) VALUES
(140, '10:00'),
(141, '10:15'),
(142, '10:30'),
(143, '10:45'),
(144, '12:00'),
(145, '12:15'),
(146, '12:30'),
(147, '12:45'),
(148, '13:00'),
(149, '13:15'),
(150, '13:30'),
(151, '13:45'),
(152, '15:00'),
(153, '15:15'),
(154, '15:30'),
(155, '15:45'),
(156, '17:00'),
(157, '17:15'),
(158, '17:30'),
(159, '17:45'),
(160, '19:00'),
(161, '19:15'),
(162, '19:30'),
(163, '19:45'),
(164, '21:00'),
(165, '21:15'),
(166, '21:30'),
(167, '21:45'),
(168, '22:30'),
(169, '22:45'),
(170, '23:00'),
(171, '23:30');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tur`
--

DROP TABLE IF EXISTS `tur`;
CREATE TABLE IF NOT EXISTS `tur` (
  `tur_ID` int(11) NOT NULL AUTO_INCREMENT,
  `tur_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`tur_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `tur`
--

INSERT INTO `tur` (`tur_ID`, `tur_adi`) VALUES
(80, 'Dram'),
(81, 'Suc'),
(82, 'Romantik'),
(83, 'Aksiyon'),
(84, 'Gerilim'),
(85, 'Fantastik'),
(86, 'Macera'),
(87, 'Biyografi'),
(88, 'Tarihi'),
(89, 'Bilim-Kurgu');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyeler`
--

DROP TABLE IF EXISTS `uyeler`;
CREATE TABLE IF NOT EXISTS `uyeler` (
  `uye_ID` int(11) NOT NULL AUTO_INCREMENT,
  `uye_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `uye_soyadi` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `mail` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `sifre` varchar(400) COLLATE utf8_turkish_ci NOT NULL,
  `telefon` bigint(11) NOT NULL,
  `dogum_tarihi` date DEFAULT NULL,
  PRIMARY KEY (`uye_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `uyeler`
--

INSERT INTO `uyeler` (`uye_ID`, `uye_adi`, `uye_soyadi`, `mail`, `sifre`, `telefon`, `dogum_tarihi`) VALUES
(100, 'Ecemur', 'Ozkan', 'ecemur01@gmail.com', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 12345, '2015-08-15'),
(101, 'Erva', 'Yalcin', 'erva123@gmail.com', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 12346, '2020-12-22'),
(102, 'Kadir', 'Sahin', 'kadir123@gmail.com', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 23456, '2018-10-19'),
(103, 'Doga', 'Kartal', 'doga123@gmail.com', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 34567, '2019-11-14'),
(104, 'Duygu', 'Bahar', 'duygu123@gmail.com', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', 45678, '2017-01-25'),
(105, 'memo', 'iÃ§sel', 'memo@gmail.com', 'e87261e260d830f1a7c53d121e87d1f57423db24830bcbf58fefcb25728cbc19906d2e31613bea4876dd4a1d6d165878ce9e0f92dcbd042ba25cd70a38614000', 1111111111, '1985-07-01'),
(106, 'selin', 'yudum', 'yudselin@gmail.com', '9eb5b954573e97cea7689c65f8fd1d8c12c51bd280aa9f7b3eb9cfbb3c78035c0f5aebc28388b00fdf701f0e366760eef6dd35da474e84559ca2a7f6a2ad2126', 2222222222, '1950-05-24'),
(107, 'Hazel', 'Tas', 'hazeltas@gmail.com', '780d679312132bc2b7931d53a07d8efd17851bc7e91153738ff3fd81b01f9e07ab2418c838f2027fff5281b18460c8b5a3c4baa98f6d46a86699a46722bdbf41', 4444444444, '2001-03-08');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yapim`
--

DROP TABLE IF EXISTS `yapim`;
CREATE TABLE IF NOT EXISTS `yapim` (
  `yapim_ID` int(11) NOT NULL AUTO_INCREMENT,
  `yapim_yili` year(4) NOT NULL,
  `yapim_yeri_id` int(50) NOT NULL,
  PRIMARY KEY (`yapim_ID`),
  KEY `yapim_yeri_id` (`yapim_yeri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yapim`
--

INSERT INTO `yapim` (`yapim_ID`, `yapim_yili`, `yapim_yeri_id`) VALUES
(10, 1957, 1),
(11, 1972, 1),
(12, 1974, 1),
(13, 1993, 1),
(14, 1994, 1),
(15, 1999, 1),
(16, 1999, 2),
(17, 2001, 1),
(18, 2001, 4),
(19, 2003, 1),
(20, 2003, 4),
(21, 2008, 1),
(22, 2008, 3),
(23, 2010, 1),
(24, 2010, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yapim_yeri`
--

DROP TABLE IF EXISTS `yapim_yeri`;
CREATE TABLE IF NOT EXISTS `yapim_yeri` (
  `yapim_yeri_id` int(11) NOT NULL AUTO_INCREMENT,
  `yapim_yeri_adi` varchar(25) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`yapim_yeri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yapim_yeri`
--

INSERT INTO `yapim_yeri` (`yapim_yeri_id`, `yapim_yeri_adi`) VALUES
(1, 'ABD'),
(2, 'Almanya'),
(3, 'Ingiltere'),
(4, 'Yeni Zelanda');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yonetmen`
--

DROP TABLE IF EXISTS `yonetmen`;
CREATE TABLE IF NOT EXISTS `yonetmen` (
  `yonetmen_ID` int(11) NOT NULL AUTO_INCREMENT,
  `yonetmen_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `yonetmen_soyadi` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`yonetmen_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yonetmen`
--

INSERT INTO `yonetmen` (`yonetmen_ID`, `yonetmen_adi`, `yonetmen_soyadi`) VALUES
(30, 'Frank', 'Darabont'),
(31, 'Francid Ford', 'Coppola'),
(32, 'Cristopher', 'Nolan'),
(33, 'Sidney', 'Lumet'),
(34, 'Peter', 'Jackson'),
(35, 'Quentin', 'Tarantino'),
(36, 'Steven', 'Spielberg'),
(37, 'David', 'Fincher'),
(38, 'Robert', 'Zemeckis');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorum`
--

DROP TABLE IF EXISTS `yorum`;
CREATE TABLE IF NOT EXISTS `yorum` (
  `yorum_ID` int(11) NOT NULL AUTO_INCREMENT,
  `yorum` text COLLATE utf8_turkish_ci NOT NULL,
  `uye_ID` int(11) NOT NULL,
  `film_ID` int(11) NOT NULL,
  PRIMARY KEY (`yorum_ID`),
  KEY `uye_ID` (`uye_ID`),
  KEY `film_ID` (`film_ID`),
  KEY `film_ID_2` (`film_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2011 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yorum`
--

INSERT INTO `yorum` (`yorum_ID`, `yorum`, `uye_ID`, `film_ID`) VALUES
(2000, 'Cok guzel bir film.', 101, 505),
(2001, 'Nefret ettim.', 102, 505),
(2002, 'Abiii cok iyi.', 100, 502),
(2003, 'Hem guzel hem degil karar veremedim.', 104, 502),
(2004, 'Guzel ama ne guzel anlatamam.', 103, 509),
(2005, 'Abi rezaletti yaaa.', 100, 501),
(2006, 'Çok güzellll', 101, 508),
(2007, 'Güzel ama değil... :(', 103, 503),
(2008, 'Bu nasıl film vaaaayyy', 105, 500),
(2009, 'Bu nasıl film ya', 101, 504),
(2010, '10/10 filmmiş mükemmel ', 107, 507);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `bilet`
--
ALTER TABLE `bilet`
  ADD CONSTRAINT `bilet_ibfk_1` FOREIGN KEY (`salon_ID`) REFERENCES `salon` (`salon_ID`),
  ADD CONSTRAINT `bilet_ibfk_2` FOREIGN KEY (`uye_ID`) REFERENCES `uyeler` (`uye_ID`),
  ADD CONSTRAINT `bilet_ibfk_3` FOREIGN KEY (`seans_ID`) REFERENCES `seans` (`seans_ID`),
  ADD CONSTRAINT `bilet_ibfk_4` FOREIGN KEY (`koltuk_ID`) REFERENCES `koltuk` (`koltuk_ID`),
  ADD CONSTRAINT `bilet_ibfk_5` FOREIGN KEY (`film_ID`) REFERENCES `filmler` (`film_ID`);

--
-- Tablo kısıtlamaları `filmler`
--
ALTER TABLE `filmler`
  ADD CONSTRAINT `filmler_ibfk_1` FOREIGN KEY (`yapim_ID`) REFERENCES `yapim` (`yapim_ID`),
  ADD CONSTRAINT `filmler_ibfk_2` FOREIGN KEY (`yonetmen_ID`) REFERENCES `yonetmen` (`yonetmen_ID`),
  ADD CONSTRAINT `filmler_ibfk_4` FOREIGN KEY (`tur_ID`) REFERENCES `tur` (`tur_ID`),
  ADD CONSTRAINT `filmler_ibfk_5` FOREIGN KEY (`kategori_ID`) REFERENCES `kategori` (`kategori_ID`);

--
-- Tablo kısıtlamaları `film_oyuncu`
--
ALTER TABLE `film_oyuncu`
  ADD CONSTRAINT `film_oyuncu_ibfk_1` FOREIGN KEY (`film_ID`) REFERENCES `filmler` (`film_ID`),
  ADD CONSTRAINT `film_oyuncu_ibfk_2` FOREIGN KEY (`oyuncu_ID`) REFERENCES `oyuncu` (`oyuncu_ID`);

--
-- Tablo kısıtlamaları `puan`
--
ALTER TABLE `puan`
  ADD CONSTRAINT `puan_ibfk_1` FOREIGN KEY (`uye_ID`) REFERENCES `uyeler` (`uye_ID`),
  ADD CONSTRAINT `puan_ibfk_2` FOREIGN KEY (`film_ID`) REFERENCES `filmler` (`film_ID`);

--
-- Tablo kısıtlamaları `salon`
--
ALTER TABLE `salon`
  ADD CONSTRAINT `salon_ibfk_1` FOREIGN KEY (`film_ID`) REFERENCES `filmler` (`film_ID`);

--
-- Tablo kısıtlamaları `salon_seans`
--
ALTER TABLE `salon_seans`
  ADD CONSTRAINT `salon_seans_ibfk_1` FOREIGN KEY (`salon_ID`) REFERENCES `salon` (`salon_ID`),
  ADD CONSTRAINT `salon_seans_ibfk_2` FOREIGN KEY (`seans_ID`) REFERENCES `seans` (`seans_ID`);

--
-- Tablo kısıtlamaları `yapim`
--
ALTER TABLE `yapim`
  ADD CONSTRAINT `yapim_ibfk_1` FOREIGN KEY (`yapim_yeri_id`) REFERENCES `yapim_yeri` (`yapim_yeri_id`);

--
-- Tablo kısıtlamaları `yorum`
--
ALTER TABLE `yorum`
  ADD CONSTRAINT `yorum_ibfk_1` FOREIGN KEY (`uye_ID`) REFERENCES `uyeler` (`uye_ID`),
  ADD CONSTRAINT `yorum_ibfk_2` FOREIGN KEY (`film_ID`) REFERENCES `filmler` (`film_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
