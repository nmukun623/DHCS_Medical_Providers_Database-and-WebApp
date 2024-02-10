-- Schema Creation. Run this command separately, and then we can run all of the following commands at once after selecting the
-- created schema, which will hold all of our tables
CREATE SCHEMA dhcs_medical_programs;

-- Creating the Locations table with the required attributes and constraints
CREATE TABLE Locations (
    Location_ID INT,
    Address_Line_1 VARCHAR(255),
    Address_Line_2 VARCHAR(255),
    Address_Attention VARCHAR(255),
    City VARCHAR(100),
    State CHAR(2),
    Zip_Code VARCHAR(10),
    County VARCHAR(100),
    Latitude float,
	Longitude float,
    PRIMARY KEY (Location_ID));

 -- Creating the provider specialty lookup table with the required attributes and constraints
CREATE TABLE providers_specialty_lookup_table (

    FI_Provider_Specialty_CD INT,
    FI_Provider_Specialty VARCHAR(255),
    PRIMARY KEY (FI_Provider_Specialty_CD)
);

-- Insert records into the provider specialty lookup table
INSERT INTO providers_specialty_lookup_table (FI_Provider_Specialty_CD,FI_Provider_Specialty)
VALUES 
(-1,'NOT APPLICABLE'),
(0,'General Practitioner (Dentists Only)'),
(2,'General Surgery'),
(10,'Gastroenterology (M.D. only), Oral Surgeon (Dentists Only)'),
(11,'Family Planning, Access, Care, and Treatment'),
(25,'Physical Medicine and Rehabilitation, Certified Orthodontist (Dentists Only)'),
(30,'Radiology'),
(33,'Thoracic Surgery'),
(34,'Urology and Urological Surgery');

 -- Creating the provider-type lookup table with the required attributes and constraints
CREATE TABLE providers_type_lookup_table (

    FI_Provider_Type_CD INT,
    FI_Provider_Type VARCHAR(255),
    PRIMARY KEY (FI_Provider_Type_CD)
);

-- Insert records into the provider type lookup table
INSERT INTO providers_type_lookup_table 
VALUES 
(-1,'Unknown'),
(0,'Delta Dental Rendering Provider information'),
(1,'Delta Dental Billing Provider information'),
(6,'CHIROPRACTORS'),(7,'CERTIFIED NURSE PRACTITIONER'),
(15,'COMMUNITY OUTPATIENT HOSPITAL'),
(17,'LONG TERM CARE FACILITY'),
(22,'PHYSICIANS GROUP'),
(25,'PHYSICAL THERAPISTS'),
(26,'PHYSICIANS'),
(41,'COMMUNITY CLINIC'),
(58,'HEALTH ACCESS PROGRAM'),
(70,'LICENSED CLINICAL SOCIAL WORKER INDIVIDUAL'),
(77,'MARRIAGE AND FAMILY THERAPIST INDIVIDUAL'),
(78,'MARRIAGE AND FAMILY THERAPIST GROUP');
 

-- Creating the provider language code lookup table with the required attributes and constraints
CREATE TABLE providers_language_lookup_table (

    Provider_Language_CD INT,
    Provider_Language_Desc VARCHAR(255),
    PRIMARY KEY (Provider_Language_CD)
);

-- Insert records into the provider language code lookup table
INSERT INTO providers_language_lookup_table (Provider_Language_CD,Provider_Language_Desc)
VALUES 
(1,'Spanish'),
(7,'English');


-- Insert records into the Locations table	
INSERT INTO locations (Location_ID, Address_Line_1, Address_Line_2, Address_Attention, City, State, Zip_Code, County, Latitude, Longitude)
VALUES
(0, '2191 JOHNSON AVE', NULL, 'COUNTY OF SAN LUIS OBISPO', 'SAN LUIS OBISPO', 'CA', 93401, 'San Luis Obispo', 35.27, -120.65),
(1, '13412 INGLEWOOD AVE', NULL, 'JOYNER, ARLENE M, A DENTAL C', 'HAWTHORNE', 'CA', 90250, 'Los Angeles', 33.91, -118.36),
(2, '883 SNEATH LN # 130', NULL, 'SHEN, DAVID, DENTAL CORP', 'SAN BRUNO', 'CA', 94066, 'San Mateo', 37.64, -122.42),
(3, '1130 COFFEE RD STE 7B', NULL, 'ELDER, M, DDS A PROFESSIONAL', 'MODESTO', 'CA', 95355, 'Stanislaus', 37.66, -120.98),
(4, '1412 E 31ST ST', NULL, 'ALAMEDA HEALTH SYSTEM', 'OAKLAND', 'CA', 94602, 'Alameda', 37.8, -122.23),
(5, '1411 E 31ST ST', NULL, 'ALAMEDA HEALTH SYSTEM', 'OAKLAND', 'CA', 94602, 'Alameda', 37.8, -122.23),
(6, '500 ALFRED NOBEL DR STE 125', NULL, 'SHEN, DAVID, DENTAL CORP', 'HERCULES', 'CA', 94547, 'Contra Costa', 38.02, -122.27),
(7, '4596 MISSION ST STE 4', NULL, 'SHEN, DAVID, DENTAL CORP', 'SAN FRANCISCO', 'CA', 94112, 'San Francisco', 37.72, -122.43),
(8, '3224 BALDWIN PARK BLVD', NULL, 'HWANG AND CHAN DDS APC', 'BALDWIN PARK', 'CA', 91706, 'Los Angeles', 34.07, -117.98),
(9, '3223 BALDWIN PARK BLVD', NULL, 'WU, DANNY, DMD INC', 'BALDWIN PARK', 'CA', 91706, 'LA', 34.07, -117.98),
(10, '1111 W La Palma Avenue', NULL, NULL, 'Anaheim', 'CA', '92801-2804', 'Orange', -9999, -9999),
(11, '438 W Las Tunas Drive', NULL, NULL, 'San Gabriel', 'CA', '91776-1216', 'Los Angeles', -9999, -9999),
(12, '1411 E 31st Street', NULL, NULL, 'Oakland', 'CA', '94602-1018', 'Alameda', -9999, -9999),
(13, '3800 Janes Road', NULL, NULL, 'Arcata', 'CA', '95521-4788', 'Humboldt', -9999, -9999),
(14, '1600 W Ave J', NULL, NULL, 'Lancaster', 'CA', '93534-2814', 'Los Angeles', -9999, -9999),
(15, '2825 E Barnett Road', NULL, NULL, 'Medford', 'OR', '97504-8332', NULL, -9999, -9999),
(16, '420 34th Street', NULL, NULL, 'Bakersfield', 'CA', '93301-2237', 'Kern', -9999, -9999),
(17, '1800 Spring Ridge Drive', NULL, NULL, 'Susanville', 'CA', '96130-6100', 'Lassen', -9999, -9999),
(18, '2170 South Avenue', NULL, NULL, 'S Lake Tahoe', 'CA', '96150-7026', 'El Dorado', -9999, -9999),
(19, '255 East Bonita Avenue', NULL, NULL, 'Pomona', 'CA', '91767-1923', 'Los Angeles', -9999, -9999),
(20, '5325 Broder Boulevard', NULL, NULL, 'Dublin', 'CA', '94568', 'Alameda', 37.72, -121.88),
(21, '20094 Mission Boulevard', NULL, NULL, 'Hayward', 'CA', '94541', 'Alameda', 37.69, -122.1),
(22, '1125 International Boulevard', NULL, NULL, 'Oakland', 'CA', '94606', 'Alameda', 37.79, -122.25),
(23, '1124 International Boulevard', NULL, NULL, 'Oakland', 'CA', '94606', 'Alameda', 37.79, -122.25),
(24, '795 Fletcher Lane', NULL, NULL, 'Hayward', 'CA', '94544', 'Alameda', 37.67, -122.08),
(25, '10429 International Boulevard', NULL, NULL, 'Oakland', 'CA', '94603', 'Alameda', 37.74, -122.17),
(26, '582, 584, 586, 588 & 590 Rio Lindo Ave', NULL, NULL, 'Chico', 'CA', '95926', 'Butte', 39.75, -121.85),
(27, '3709 and 3711 Sunset Lane, Suites A & B', NULL, NULL, 'Antioch-CA', 'CA', '94509', 'Contra Costa', 37.98, -121.8),
(28, '3707 and 3711 Sunset Lane, Suites A & B', NULL, NULL, 'Antioch', 'CA', '94509', 'Contra Costa', 37.98, -121.8),
(29, '1301 and 1313 Cutting Boulevard', NULL, NULL, 'Richmond', 'CA', '94804', 'Contra Costa', 37.93, -122.36),
(30, '2035 FAIRMONT DRIVE', NULL, NULL, 'SAN LEANDRO', 'CA', '94578', 'Alameda', 37.71, -122.12),
(31, '2577 SAN PABLO AVENUE', NULL, NULL, 'OAKLAND', 'CA', '94612', 'Alameda', 37.82, -122.28),
(32, '37455 PALOMARES ROAD', NULL, NULL, 'CASTRO VALLEY', 'CA', '94552', 'Alameda', 37.61, -121.95),
(33, '2545 SAN PABLO AVENUE', NULL, NULL, 'OAKLAND', 'CA', '94612', 'Alameda', 37.82, -122.28),
(34, '3845 TELEGRAPH AVENUE', NULL, NULL, 'OAKLAND', 'CA', '94609', 'Alameda', 37.83, -122.26),
(35, '3837 TELEGRAPH AVENUE', NULL, NULL, 'OAKLAND', 'CA', '94609', 'Alameda', 37.83, -122.27),
(36, '1342 EAST 27TH STREET', NULL, NULL, 'OAKLAND', 'CA', '94606', 'Alameda', 37.8, -122.23),
(37, '920 HAPPY VALLEY ROAD', NULL, NULL, 'PLEASANTON', 'CA', '94566', 'Alameda', 37.63, -121.87),
(38, '1816 SCENIC AVENUE', NULL, NULL, 'BERKELEY', 'CA', '94709', 'Alameda', 37.88, -122.26),
(39, '1777 LE ROY AVENUE', NULL, NULL, 'BERKELEY', 'CA', '94709', 'Alameda', 37.88, -122.26),
(40, '2017 1ST AVE STE 100', NULL, NULL, 'SAN DIEGO', 'CA', '92101-9001', 'San Diego', -117.16, 32.73),
(41, '4501 MISSION BAY DR STE 1C', NULL, NULL, 'San Diego', 'CA', '92109-4924', 'San Diego', -117.22, 32.8),
(42, '1964 VIA CTR', NULL, NULL, 'VISTA', 'CA', '92081-6056', 'San Diego', -117.28, 33.18),
(43, '49 111 CALIFORNIA STE 6A', NULL, NULL, 'COACHELLA', 'CA', '92236-1432', 'Riverside', -116.17, 33.67),
(44, '347 W MISSION AVE', NULL, NULL, 'ESCONDIDO', 'CA', '92025-1729', 'San Diego', -117.09, 33.13),
(45, '5838 EDISON PL STE 100', NULL, NULL, 'CARLSBAD', 'CA', '92008-5520', 'San Diego', -117.28, 33.12),
(46, '1295 BROADWAY STE 201', NULL, NULL, 'CHULA VISTA', 'CA', '91911-2975', 'San Diego', -117.08, 32.6),
(47, '10737 CAMINO RUIZ MEDICAL MALL 220', NULL, NULL, 'SAN DIEGO', 'CA', '92126-2359', 'San Diego', -117.14, 32.91),
(48, '4200 ROCKLIN RD SUITE 11B', NULL, NULL, 'ROCKLIN', 'CA', '95677-2860', 'Placer', -121.23, 38.79),
(49, '1125 10TH ST', NULL, NULL, 'SACRAMENTO', 'CA', '95814-3503', 'Sacramento', -121.49, 38.58),
(50, '900 Kiely Blvd.', NULL, NULL, 'Santa Clara', 'CA', '95051', NULL, -9999, -9999),
(51, '1509 Wilson Ter.', NULL, NULL, 'Glendale', 'CA', '91206', NULL, -9999, -9999),
(52, 'P.O. Box 221', NULL, NULL, 'Ridgewood', 'NJ', '7451', NULL, -9999, -9999),
(53, '4028 Old Topanga Canyon Rd', NULL, NULL, 'Calabasas', 'CA', '91302', NULL, -9999, -9999),
(54, '2501 Old River Road Space 34', NULL, NULL, 'Ukiah', 'CA', NULL, NULL, -9999, -9999),
(55, '2550 Ruby Ct.', NULL, NULL, 'Redding', 'CA', '96001-3733', NULL, -9999, -9999),
(56, '600 Coral Circle', NULL, NULL, 'St. Augustine', 'FL', '32080', NULL, -9999, -9999),
(57, '2950 North Santa Rosa Place', NULL, NULL, 'Tucson', 'AZ', '85712', NULL, -9999, -9999),
(58, '620 North 3rd St.', NULL, NULL, 'Montebello', 'CA', '90640', NULL, -9999, -9999),
(59, '751 Devonshire Drive', NULL, NULL, 'Redlands', 'CA', '92374', NULL, -9999, -9999),
(60, '3900 W 3RD ST', 'SAN JUDAS INC', NULL, 'LOS ANGELES', 'CA', '90020-2675', 'Los Angeles', 34.07, -118.3),
(61, '1200 B GALE WILSON BLVD', NULL, NULL, 'FAIRFIELD', 'CA', '94533-3552', 'Solano', 38.26, -122.05),
(62, '210 HOSPITAL DR', 'GREAT BEGINNINGS', NULL, 'VALLEJO', 'CA', '94589-2517', 'Solano', 38.13, -122.24),
(63, '85 SIERRA PARK RD', NULL, 'DISTRICT MAMMOTH LAKES', 'MAMMOTH LAKES', 'CA', '93546-2073', 'Mono', 37.65, -118.96),
(64, '751 LOMBARDI CT', NULL, NULL, 'SANTA ROSA', 'CA', '95407-6793', 'Sonoma', 38.43, -122.75),
(65, '2400 WIBLE RD STE 14', 'COMMUNITY HEALTH CENTER', NULL, 'BAKERSFIELD', 'CA', '93304-4734', 'Kern', 35.33, -119.04),
(66, '1550 N GAREY AVE', NULL, 'ANGELES POMONA CENTER', 'POMONA', 'CA', '91767-3826', 'Los Angeles', 34.07, -117.75),
(67, '1830 FLOWER ST', NULL, NULL, 'BAKERSFIELD', 'CA', '93305-4144', 'Kern', 35.38, -118.97),
(68, '200 C ST', 'PATTERSON MEDICAL CTR', NULL, 'PATTERSON', 'CA', '95363-2701', 'Stanislaus', 37.47, -121.13),
(69, '4600 PANAMA LANE SUITE 102B', NULL, NULL, 'BAKERSFIELD', 'CA', '93313-3509', 'Kern', 35.3, -119.05),
(70, '10 DOUGLAS DR.', '140', NULL, 'MARTINEZ', 'CA', '94553-4078', NULL, 38, -122.12),
(71, '21507 EAST CLIFF DRIVE', NULL, NULL, 'SANTA CRUZ', 'CA', '95061-4844', NULL, 36.96, -121.99),
(72, '439 W 97TH ST', NULL, NULL, 'LOS ANGELES', 'CA', '90003-4303', NULL, 33.95, -118.28),
(73, '1810 FREEDOM BLVD', NULL, NULL, 'FREEDOM', 'CA', '95019-3000', NULL, 36.93, -121.77),
(74, '43520 DIVISION ST', NULL, NULL, 'LANCASTER', 'CA', '93535-1002', NULL, 34.67, -118.13),
(75, '2110 TRUXTUN AVE SUITE 400', NULL, NULL, 'BAKERSFIELD', 'CA', '93301-3703', NULL, 35.37, -119.03),
(76, '1081 N CHINA LAKE BLVD', NULL, NULL, 'RIDGECREST', 'CA', '93555-3130', NULL, 35.64, -117.67),
(77, '759 SOUTH VAN NESS AVE', NULL, NULL, 'SAN FRANCISCO', 'CA', '94110-1908', NULL, 37.76, -122.42),
(78, '515 COLUMBIA AVENUE 100', NULL, NULL, 'LOS ANGELES', 'CA', '90017-1209', NULL, 34.06, -118.27),
(79, '2180 HARVARD ST 210', NULL, NULL, 'SACRAMENTO', 'CA', '95815-3317', NULL, 38.61, -121.43),
(80, '10833 LE CONTE AVE', NULL, NULL, 'LOS ANGELES', 'CA', '90095-3075', 'Los Angeles', 34.06, -118.44),
(81, '751 S BASCOM AVE', NULL, NULL, 'SAN JOSE', 'CA', '95128-2604', 'Santa Clara', 37.31, -121.93),
(82, '840 W OLIVE AVE STE A', NULL, NULL, 'MERCED', 'CA', '95348-2421', 'Merced', 37.32, -120.48),
(83, '9905 PROSPECT AVE CENTER', NULL, NULL, 'SANTEE', 'CA', '92071-4318', 'San Diego', 32.83, -116.98),
(84, '8700 BEVERLY BLVD', NULL, NULL, 'LOS ANGELES', 'CA', '90048-1804', 'Los Angeles', 34.08, -118.38),
(85, '23845 MCBEAN PARKWAY', NULL, NULL, 'VALENCIA', 'CA', '91355-2001', 'Los Angeles', 34.4, -118.55),
(86, '5323 HARRIS HINES BLVD', NULL, NULL, 'DALLAS', 'TX', '75390-7208', 'UNKNOWN', 32.81, -96.84),
(87, '1602 ORCHARD VIEW DR', NULL, NULL, 'SAN JOSE', 'CA', '95124-6424', 'Santa Clara', 37.23, -121.9),
(88, '1350 41ST AVE STE 100', NULL, NULL, 'CAPITOLA', 'CA', '95010-3934', 'Santa Cruz', 36.97, -121.96),
(89, '4733 W SUNSET BLVD MD', NULL, NULL, 'LOS ANGELES', 'CA', '90027-6021', 'Los Angeles', 34.1, -118.29),
(90, '8860 CENTER DRIVE', NULL, NULL, 'LA MESA', 'CA', '91942-7001', NULL, 32.78, -117.01),
(91, '8730 ALDEN DRIVE', NULL, NULL, 'LOS ANGELES', 'CA', '90048-0', NULL, 34.08, -118.38),
(92, '1714 N BUSH ST', NULL, NULL, 'SANTA ANA', 'CA', '92706-2812', NULL, 33.76, -117.87),
(93, '1400 E CHURCH ST', NULL, NULL, 'SANTA MARIA', 'CA', '93454-5906', NULL, 34.95, -120.41),
(94, '908 N ARDMORE AVE', NULL, NULL, 'LOS ANGELES', 'CA', '90029-3311', NULL, 34.09, -118.3),
(95, '1155 MILL ST', NULL, NULL, 'RENO', 'NV', '89502-1576', NULL, 39.52, -119.8),
(96, '400 PARNASSUS AVE 3RD FLOOR, SUITE 311', NULL, NULL, 'SAN FRANCISCO', 'CA', '94143-2202', NULL, 37.76, -122.46),
(97, '305 N FOXDALE AVE', NULL, NULL, 'WEST COVINA', 'CA', '91790-2111', NULL, 34.08, -117.94),
(98, '43549 AQUILA ST', NULL, NULL, 'INDIO', 'CA', '92203-2702', NULL, 33.73, -116.19),
(99, '999 SAN BERNARDINO RD', NULL, NULL, 'UPLAND', 'CA', '91786-4920', NULL, 34.1, -117.64),
(100, '4910 DIRECTORS PL', 'STE 250', NULL, 'SAN DIEGO', 'CA', '92121', NULL, 32.89, -117.212),
(101, '5360 JACKSON DR', 'STE 110', NULL, 'LA MESA', 'CA', '91942', NULL, 32.77, -117.018),
(102, '1325 N Anaheim Blvd', 'Suite 200', NULL, 'ANAHEIM', 'CA', '92801', NULL, 33.85, -117.92);

-- Creating the Providers table with the required attributes and constraints
CREATE TABLE IF NOT EXISTS providers (
    NPI INT,
    Location_ID INT,
    Provider_Source VARCHAR(50),
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    PRIMARY KEY (NPI),
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID)
);

-- Insert records into the providers table
INSERT INTO providers (NPI, Location_ID, Provider_Source, Fname, Lname) VALUES
(1003000639, 80, 'Fee-for-Service', 'PEYMAN MD', 'BENHARASH'),
(1003008772, 81, 'Fee-for-Service', 'LOUISE M NP', 'BRUCE'),
(1003012246, 82, 'Fee-for-Service', 'RYAN M DC', 'JONES'),
(1003021163, 84, 'Fee-for-Service', 'SANTEE FAMILY COUNSELING', 'SANTEE FAMILY COUNSELING'),
(1003021882, 85, 'Fee-for-Service', 'REX T MD', 'CHUNG'),
(1003024191, 86, 'Fee-for-Service', 'SRINIVAS MD', 'PEDDI'),
(1003025271, 87, 'Fee-for-Service', 'YINGHUI LIU MD', 'YINGHUI LIU MD'),
(1003027491, 88, 'Fee-for-Service', 'TUPAZ HOMES LLC', 'TUPAZ HOMES LLC'),
(1003028515, 89, 'Fee-for-Service', 'CHARLENE PT', 'NORQUIST'),
(1003029646, 12, 'Fee-for-Service', 'CHRISTOPHER F', 'TENGGARDJAJA'),
(1043497860, 41, 'Managed Care', 'ALLEN', 'JOSEPH'),
(1043497864, 40, 'Managed Care', 'HAMID', 'ZADEH'),
(1043508377, 42, 'Managed Care', 'KELLY', 'CULWELL'),
(1043508379, 43, 'Managed Care', 'KENNY', 'CULPOW'),
(1043508387, 44, 'Managed Care', 'TYLOR', 'MAXWELL'),
(1043715949, 45, 'Managed Care', 'MARILYN', 'RIVAS'),
(1063726933, 47, 'Managed Care', 'BRIAN', 'POW'),
(1063726939, 46, 'Managed Care', 'LYNN', 'NGO'),
(1083135784, 48, 'Managed Care', 'TROY', 'JOHNSON'),
(1093338873, 49, 'Managed Care', 'COURTNEY', 'WILMOT'),
(1003016288, 56, 'Suspended', 'Nika', 'Diaz'),
(1003127655, 51, 'Suspended', 'Moustafa Moataz', 'Aboshady'),
(1003174889, 59, 'Suspended', 'Linda B.', 'Matthews'),
(1003230897, 55, 'Suspended', 'Mary Stephania', 'Diamond'),
(1003350364, 53, 'Suspended', 'Bijan', 'Babaeian'),
(1003356791, 54, 'Suspended', 'Nathan Zane', 'Bevens'),
(1003859885, 52, 'Suspended', 'Ezekiel Olukayode', 'Akande'),
(1003889502, 50, 'Suspended', 'Venkat', 'Aachi'),
(1003896192, 57, 'Suspended', 'Sheldon Earl', 'Gingerich'),
(1003918939, 58, 'Suspended', 'Erasmus Dzani', 'Kotey'),
(1518005024, 4, 'Dental', 'SHAWN', 'SHEEP'),
(1518005027, 2, 'Dental', 'SHEN', 'DAVID'),
(1518005088, 5, 'Dental', 'FERRERO', 'SONA'),
(1518064948, 0, 'Dental', 'MASOORI', 'OREO'),
(1689695170, 6, 'Dental', 'CHAN', 'LINDA'),
(1689695181, 7, 'Dental', 'BORO', 'BASMATI'),
(1700087590, 5, 'Dental', 'ALAMEDA', 'B'),
(1700087597, 4, 'Dental', 'PEACH', 'VALUR'),
(1750406307, 1, 'Dental', 'LOREALI', 'GILMORE'),
(1750406377, 3, 'Dental', 'GILMORE', 'LORETTA'),
(1225254055, 60, 'FPACT', 'RICKY', 'BRADSHAW'),
(1396879680, 65, 'FPACT', 'MORTY', 'LEO'),
(1497969166, 68, 'FPACT', 'LEWIS', 'PHILIPPE'),
(1508885856, 67, 'FPACT', 'JUAN', 'LOPEZ'),
(1578766085, 64, 'FPACT', 'SAMANTA', 'FERNANDZ'),
(1710076997, 66, 'FPACT', 'RAHUL', 'SRINIVAS'),
(1780928986, 69, 'FPACT', 'OMNI', 'SHARMA'),
(1821147786, 61, 'FPACT', 'NAINA', 'TALWAR'),
(1962444059, 63, 'FPACT', 'NEHA', 'REDDY'),
(1992863096, 62, 'FPACT', 'NEGIN', 'ZHANG'),
(1003013269, 31, 'ORP', 'JILLIAN M PA', 'CHELSON'),
(1003023698, 37, 'ORP', 'BERTHA A LMFT', 'DIAZ'),
(1003092396, 23, 'ORP', 'ERIKA LCSW', 'SANCHEZ'),
(1003101676, 36, 'ORP', 'TRAM N', 'DAO'),
(1003102997, 34, 'ORP', 'YOJANNE LMFT', 'BLANCO'),
(1003105040, 44, 'ORP', 'CLAUDIA S LCSW', 'DIAZ'),
(1003114414, 26, 'ORP', 'DAVID M PA', 'PRITCHETT'),
(1003122623, 35, 'ORP', 'KAMI M PHARMD', 'HASHIMOTO'),
(1003146580, 43, 'ORP', 'OI WAN A LCSW', 'MAN'),
(1003168071, 22, 'ORP', 'JAIME R NP', 'LOEBNER'),
(1003065897, 74, 'NPMP', 'JENNIFER L PA-C', 'HANLEY'),
(1003090697, 46, 'NPMP', 'JORDAN RYAN', 'WILLIAMS'),
(1003140013, 58, 'NPMP', 'JOMARIE ESTEBAN', 'MONZON-DULLER'),
(1003159526, 28, 'NPMP', 'TIFFANY', 'PONG'),
(1003180498, 61, 'NPMP', 'GERARDO M NP', 'DE JESUS'),
(1003181926, 38, 'NPMP', 'MELLYN A NP', 'JOHNSON'),
(1003187915, 71, 'NPMP', 'MARIANA C NP', 'MOUALEM'),
(1003195827, 62, 'NPMP', 'STEPHANIE J', 'RASMUSSEN'),
(1003214297, 59, 'NPMP', 'SHANNON A', 'SRAMEK'),
(1003217605, 40, 'NPMP', 'CHRISTINE G', 'PAGUNURAN'),
(1003867565, 18, 'Child Care', 'Barton', 'Perry'),
(1275720377, 11, 'Child Care', 'Gabriel', 'San'),
(1366419517, 14, 'Child Care', 'Antelope', 'Cherry'),
(1396764353, 12, 'Child Care', 'Alameda', 'Cheril'),
(1467538520, 16, 'Child Care', 'Neha', 'Dupia'),
(1518996040, 13, 'Child Care', 'Aaryan', 'Khan'),
(1538197231, 17, 'Child Care', 'Palak', 'Kapoor'),
(1770587107, 15, 'Child Care', 'Asante', 'Vera'),
(1891938122, 10, 'Child Care', 'Arjun', 'Reddy'),
(1952777245, 19, 'Child Care', 'Casa', 'Santos'),
(1104456078, 46, 'Managed Care', 'STEVEN', 'MURRAY'),
(1265985824, 48, 'Managed Care', 'GHASSAN', 'EL KHOURY'),
(1003107152, 49, 'Managed Care', 'SHARATH', 'RENIGUNTALA');

CREATE INDEX idx_providers_provider_source ON PROVIDERS(Provider_Source);

-- Creating the FFS providers table with the required attributes and constraints
CREATE TABLE FFS_PROVIDERS (
    Provider_Source VARCHAR(255),
    NPI INT,
    Provider_Name VARCHAR(100),
    Enroll_Status_Eff_DT DATE,
    Provider_Taxonomy VARCHAR(100),
    FI_Provider_Type_CD INT,
    FI_Provider_Specialty_CD INT,
    Location_ID INT,
    PRIMARY KEY (NPI),
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID),
    FOREIGN KEY (NPI) REFERENCES PROVIDERS(NPI),
    FOREIGN KEY (Provider_Source) REFERENCES PROVIDERS(Provider_Source),
    FOREIGN KEY (FI_Provider_Type_CD) REFERENCES providers_type_lookup_table(FI_Provider_Type_CD),
    FOREIGN KEY (FI_Provider_Specialty_CD) REFERENCES providers_specialty_lookup_table(FI_Provider_Specialty_CD)
);

-- Insert records into the ffs providers table
INSERT INTO FFS_PROVIDERS (Provider_Source, NPI, Provider_Name, Enroll_Status_Eff_DT, Provider_Taxonomy, FI_Provider_Type_CD, FI_Provider_Specialty_CD, Location_ID)
VALUES
    ('Fee-for-Service', 1003000639, 'BENHARASH, PEYMAN MD', '2011-01-19', 'No Taxonomy Provided', 26, 33, 80),
    ('Fee-for-Service', 1003008772, 'BRUCE, LOUISE M NP', '2020-07-24', '363LF0000X', 7, -1, 81),
    ('Fee-for-Service', 1003012246, 'JONES, RYAN M DC', '2015-02-08', '111N00000X', 6, -1, 82),
    ('Fee-for-Service', 1003021163, 'SANTEE FAMILY COUNSELING', '2018-09-10', '106H00000X', 78, -1,  84),
    ('Fee-for-Service', 1003021882, 'CHUNG, REX T MD', '2011-08-08', 'No Taxonomy Provided', 26, 2, 85),
    ('Fee-for-Service', 1003024191, 'PEDDI, SRINIVAS MD', '2012-07-01', 'No Taxonomy Provided', 26, 30, 86),
    ('Fee-for-Service', 1003025271, 'YINGHUI LIU MD', '2015-02-08', 'No Taxonomy Provided', 26, -1,  87),
    ('Fee-for-Service', 1003027491, 'TUPAZ HOMES LLC', '2017-06-19', 'No Taxonomy Provided', 17, -1,  88),
    ('Fee-for-Service', 1003028515, 'NORQUIST, CHARLENE PT', '2018-06-28', '2251X0800X', 25, -1,  89),
    ('Fee-for-Service', 1003029646, 'TENGGARDJAJA, CHRISTOPHER F', '2014-09-15', 'No Taxonomy Provided', 26, 34, 12);

-- Creating indices on the provider type and provider specialty given that these fields would likely be used to narrow down 
-- the provider one needs to visit
CREATE INDEX idx_ffs_providers ON FFS_PROVIDERS(FI_Provider_Type_CD, FI_Provider_Specialty_CD);

-- Creating the Managed care providers table with the required attributes and constraints
CREATE TABLE Managed_Care_Providers (
    Plan_Code INT,
    Record_Type VARCHAR(50),
    NPI INT,
    Provider_Name VARCHAR(100),
    Taxonomy VARCHAR(100),
    MCNA_Provider_Group VARCHAR(100),
    MCNA_Provider_Type VARCHAR(100),
    Facility_Type VARCHAR(100),
    Licensure_Type VARCHAR(100),
    Primary_Care CHAR(1),
    Specialist CHAR(1),
    Sees_Children CHAR(1),
    Telehealth CHAR(1), 
    BHIndicator CHAR(1),
    DHCS_County_CD INT,
    FIPS_County_CD INT,
    Personnel_Name VARCHAR(100),
    Location_ID INT,
    Provider_Source VARCHAR(200),
    PRIMARY KEY (NPI),
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID),
    FOREIGN KEY (NPI) REFERENCES PROVIDERS(NPI),
    FOREIGN KEY (Provider_Source) REFERENCES PROVIDERS(Provider_Source)
);

-- Creating indices on the fields that are required to be used as a foreign key in lookup tables or the fields that users would 
-- likely filter upon these fields to narrow down the personnel one needs to visit
CREATE INDEX idx_managed_care_providers_care_plan_code ON managed_care_providers(Plan_Code);
CREATE INDEX idx_managed_care_providers_care_provider_name ON managed_care_providers(Provider_Name);
CREATE INDEX idx_managed_care_providers_care_query_optimizer ON managed_care_providers(Primary_Care, Specialist, Sees_Children, Telehealth);

-- Insert records into the managed care providers table
INSERT INTO managed_care_providers (
    Plan_Code,
    Record_Type,
    NPI,
    Provider_Name,
    Taxonomy,
    MCNA_Provider_Group,
    MCNA_Provider_Type,
    Licensure_Type,
    Primary_Care,
    Specialist,
    Sees_Children,
    Telehealth,
    BHIndicator,
    DHCS_County_CD,
    FIPS_County_CD,
    Personnel_Name,
    Location_ID,
    Provider_Source
) VALUES
( 15, 'Provider', 1043497864, 'PLANNED PARENTHOOD', '207V00000X', 'OB/GYN Primary and Specialty Care', 'Obstetrics & Gynecology',  'MD', 'N', 'Y', 'B', 'N', NULL, 37, 6073, 'HAMID ZADEH', 40, "Managed Care"),
( 15, 'Provider', 1043497860, 'PLANNED PARENTHOOD', '207V00000X', 'OB/GYN Primary and Specialty Care', 'Obstetrics & Gynecology',  'MD', 'N', 'Y', 'B', 'N', NULL, 37, 6073, 'ALLEN JOSEPH', 41, "Managed Care"),
( 15, 'Provider', 1043508377, 'PLANNED PARENTHOOD', '207V00000X', 'OB/GYN Primary and Specialty Care', 'Obstetrics & Gynecology',  'MD', 'N', 'Y', 'B', 'N', NULL, 37, 6073, 'KELLY CULWELL', 42, "Managed Care"),
( 15, 'Provider', 1043508379, 'PLANNED PARENTHOOD', '207V00000X', 'OB/GYN Primary and Specialty Care', 'Obstetrics & Gynecology',  'MD', 'N', 'Y', 'B', 'N', NULL, 37, 6073, 'KENNY CULPOW', 43, "Managed Care"),
( 15, 'Provider', 1043508387, 'PLANNED PARENTHOOD OF THE PACIFIC SOUTHWEST', '207V00000X', 'OB/GYN Primary and Specialty Care', 'Obstetrics & Gynecology',  'MD', 'N', 'Y', 'B', 'N', NULL, 37, 6073, 'TYLOR MAXWELL', 44, "Managed Care"),
( 15, 'Provider', 1043715949, 'MEMORY CHECK PSYCHOLOGICAL SERVICES APC', '1041C0700X', 'Mental Health Outpatient Services', 'Mental Health Outpatient Services',  'CSW', 'N', 'N', 'N', 'B', NULL, 37, 6073, 'MARILYN RIVAS', 45, "Managed Care"),
( 15, 'Provider', 1063726939, 'PLANNED PARENTHOOD', '207V00000X', 'OB/GYN Primary and Specialty Care', 'Obstetrics & Gynecology',  'MD', 'N', 'Y', 'B', 'N', NULL, 37, 6073, 'LYNN NGO', 46, "Managed Care"),
( 15, 'Provider', 1063726933, 'PLANNED PARENTHOOD OF THE PACIFIC SOUTHWEST', '207V00000X', 'OB/GYN Primary and Specialty Care', 'Obstetrics & Gynecology',  'MD', 'N', 'Y', 'B', 'N', NULL, 37, 6073, 'BRIAN POW', 47, "Managed Care"),
( 15, 'Provider', 1083135784, 'XCITE STEPS, INC', '103K00000X', 'Non-ANC Provider Type', 'Other',  'BCB', 'N', 'N', 'N', 'N', NULL, 31, 6061, 'TROY JOHNSON', 48, "Managed Care"),

( 167,'Provider',1104456078,'UCSD MEDICAL GROUP','171100000X','Non-ANC Provider Type','Other','OTH','N','Y','B','N', NULL, 37, 6073,'STEVEN MURRAY', 100, "Managed Care"),
( 167,'Provider',1265985824,'GMC ACUPUNCTURE CLINIC','171100000X','Non-ANC Provider Type','Other','OTH','N','Y','B','N', NULL, 37, 6073,'GHASSAN EL KHOURY',101, "Managed Care"),
( 506,'Provider',1003107152,'AltaMed Medical & Dental Group - Anaheim','207Q00000X','Adult Primary Care','Adult Primary Care','MD','Y','N','B','N', NULL, 30, 6059,'SHARATH RENIGUNTALA',102, "Managed Care");

-- Creating indices on the  fields would likely be used to narrow down the provider one needs to visit
CREATE INDEX idx_managed_care_providers ON managed_care_providers(Plan_Code, Provider_Name, Primary_Care, Specialist,Sees_Children,
Telehealth);

-- Creating the managed care plan details lookup table
CREATE TABLE managed_care_plan_details (
	Plan_Code INT,
    Managed_Care_Plan_Name VARCHAR(255),
    Sub_Network VARCHAR(255),
    number_of_people_enrolled INT,
    PRIMARY KEY (Plan_Code),
    FOREIGN KEY (Plan_Code) REFERENCES managed_care_providers(Plan_Code)
);

-- Insert records into the managed care details lookup table
INSERT INTO managed_care_plan_details (
    Plan_Code,
    Managed_Care_Plan_Name,
    Sub_Network,
    number_of_people_enrolled
) VALUES
(15,'Aetna Better Health', 'Aetna Better Health', 44000),
(167,'Blue Shield of California Promise','ASH - CA - SD MEDI-CAL',23479),
(506,'CalOptima','AltaMed Health Services, Shared Risk Medi-Cal',13201);

-- Creating the managed care facility details lookup table
CREATE TABLE managed_care_facility_details (
	faciliity_name VARCHAR(255),
    faciliity_type VARCHAR(255),
    PRIMARY KEY(faciliity_name),
    FOREIGN KEY (faciliity_name) REFERENCES managed_care_providers(Provider_Name)
);


-- Insert records into the managed care facility details lookup table
INSERT INTO managed_care_facility_details (
	faciliity_name,
    faciliity_type
) VALUES
('PLANNED PARENTHOOD', 'Clinic - Hospital Based or Independent'),
('PLANNED PARENTHOOD OF THE PACIFIC SOUTHWEST', 'Clinic - Hospital Based or Independent'),
('MEMORY CHECK PSYCHOLOGICAL SERVICES APC', 'Clinic - Hospital Based or Independent'),
('XCITE STEPS, INC', 'Clinic - Hospital Based or Independent'),
('UCSD MEDICAL GROUP', 'Clinic - Free Standing'),
('GMC ACUPUNCTURE CLINIC', 'Clinic - Free Standing'),
('AltaMed Medical & Dental Group - Anaheim', 'Clinic - Federally Qualified Health Center (FQHC)');

-- Creating the suspended providers table with the required attributes and constraints
CREATE TABLE Suspended (
    Provider_Type VARCHAR(255),
    License_Number VARCHAR(255),
    Provider_Number INT,
    Date_Of_Suspension DATE,
    Active_Period VARCHAR(255),
    Provider_Name VARCHAR(255),
    Location_ID INT,
    Provider_Source VARCHAR(200),
    PRIMARY KEY (Provider_Number),
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID),
    FOREIGN KEY (Provider_Number) REFERENCES PROVIDERS(NPI),
    FOREIGN KEY (Provider_Source) REFERENCES PROVIDERS(Provider_Source)
);

-- Insert records into the suspended providers table
INSERT INTO Suspended (
    Provider_Type,
    License_Number,
    Provider_Number,
    Date_Of_Suspension,
    Active_Period,
    Provider_Name,
    Location_ID,
    Provider_Source
) VALUES
('Physician', '85279', '1003889502', '2020-06-04', 'Deceased', 'Aachi,Venkat', 50, "Suspended"),
('Physician', 'A128437', '1003127655', '2019-10-09', 'Indefinitely effective', 'Aboshady,Moustafa Moataz', 51, "Suspended"),
('Physician', 'A85577', '1003859885', '2016-03-30', 'Indefinitely effective', 'Akande,Ezekiel Olukayode', 52, "Suspended"),
('Marriage & Family Counselor/Therapist', '108730', '1003350364', '2021-03-08', 'Indefinitely effective', 'Babaeian,Bijan', 53, "Suspended"),
('Associate Clinical Social Worker', '75856', '1003356791', '2021-03-10', 'Indefinitely effective', 'Bevens,Nathan Zane', 54, "Suspended"),
('Registered Nurse', '647777', '1003230897', '2018-08-17', 'Indefinitely effective', 'Diamond,Mary Stephania', 55, "Suspended"),
('Registered Nurse', '95217178', '1003016288', '2022-12-09', 'Indefinitely effective', 'Diaz,Nika', 56, "Suspended"),
('Physician', 'G53642', '1003896192', '2023-01-26', 'Indefinitely effective', 'Gingerich,Sheldon Earl', 57, "Suspended"),
('Physician Assistant', '11297', '1003918939', '2016-09-09', 'Indefinitely effective', 'Kotey,Erasmus Dzani', 58, "Suspended"),
('Registered Nurse', '301733', '1003174889', '2022-05-27', 'Indefinitely effective', 'Matthews,Linda B.', 59, "Suspended");

-- Creating the Dental care providers table with the required attributes and constraints
CREATE TABLE Dental_Providers (
    NPI INT PRIMARY KEY,
    Billing_Provider_Number VARCHAR(255),
    Service_Location_Number INT,
    Provider_Name VARCHAR(255),
    Enroll_Stat_Eff_DT DATE,
    FI_Provider_Type_CD INT,
    FI_Provider_Specialty_CD INT,
    Provider_Language_CD INT,
    DHCS_County_Code INT,
    Location_ID INT,
    Provider_Source VARCHAR(200),
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID),
    FOREIGN KEY (NPI) REFERENCES PROVIDERS(NPI),
    FOREIGN KEY (Provider_Source) REFERENCES PROVIDERS(Provider_Source),
    FOREIGN KEY (FI_Provider_Specialty_CD) REFERENCES providers_specialty_lookup_table(FI_Provider_Specialty_CD),
    FOREIGN KEY (FI_Provider_Type_CD) REFERENCES providers_type_lookup_table(FI_Provider_Type_CD),
    FOREIGN KEY (Provider_Language_CD) REFERENCES providers_language_lookup_table(Provider_Language_CD)
);

-- Creating indices on the  fields would likely be used to narrow down the provider one needs to visit
CREATE INDEX idx_dental_providers ON Dental_Providers(FI_Provider_Type_CD, FI_Provider_Specialty_CD);

-- Insert records into the dental providers table
INSERT INTO dental_providers (
    NPI,
    Billing_Provider_Number,
    Service_Location_Number,
    Provider_Name,
    Enroll_Stat_Eff_DT,
    FI_Provider_Type_CD,
    FI_Provider_Specialty_CD,
    Provider_Language_CD,
    DHCS_County_Code,
    Location_ID,
    Provider_Source
) VALUES
(1518005027, 1285788794, 1, 'SHEN DAVID', '1984-10-31', 0,  25,  7,  41, 2, "Dental"),
(1518005024, 1992859409, 2, 'SHAWN SHEEP', '1984-06-20', 0, 25,  7,  7, 4, "Dental"),
(1518005088, 1447304951, 3, 'FERRERO SONA', '1984-10-31', 0,  25,  7,  38, 5, "Dental"),
(1518064948, 'G87818', 1, 'MASOORI OREO', '1979-12-19', 1,  0,  7,  40, 0, "Dental"),
(1689695170, 1720282254, 1, 'CHAN LINDA', '1984-10-30', 0,  0,  7,  19, 6, "Dental"),
(1689695181, 1255900163, 1, 'BORO BASMATI', '1984-11-30', 0,  0,  7,  19, 7, "Dental"),
(1700087597, 'G01016', 1, 'PEACH VALUR', '1979-05-19', 1,  0,  1, 1, 4, "Dental"),
(1700087590, 'G01016', 1, 'ALAMEDA B', '1979-12-19', 1,  0,  7,  1, 5, "Dental"),
(1750406307, 1558573535, 2, 'LOREALI GILMORE', '1984-09-30', 0,  10,  7,  19, 1, "Dental"),
(1750406377, 1760633341, 7, 'GILMORE LORETTA', '1984-09-30', 0,  10,  7,  50, 3, "Dental");

-- Creating the FPACT providers table with the required attributes and constraints
CREATE TABLE FPACT (
    Provider_Source VARCHAR(50),
    Provider_Number INT PRIMARY KEY,
    Owner_Number INT,
    Service_Location_Number INT,
    Provider_Name VARCHAR(255),
    Business_Name VARCHAR(255),
    Enroll_Stat_Effective_Dt DATE,
    FI_Provider_Specialty_CD INT,
    Enroll_Stat_Cd INT,
    FI_Provider_Type_CD INT,
    DHCS_County_CD INT,
    FIPS_County_CD INT,
    Phone_Number VARCHAR(20),
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID),
    FOREIGN KEY (Provider_Number) REFERENCES PROVIDERS(NPI),
    FOREIGN KEY (Provider_Source) REFERENCES PROVIDERS(Provider_Source),
    FOREIGN KEY (FI_Provider_Specialty_CD) REFERENCES providers_specialty_lookup_table(FI_Provider_Specialty_CD),
    FOREIGN KEY (FI_Provider_Type_CD) REFERENCES providers_type_lookup_table(FI_Provider_Type_CD)
);

-- Creating indices on the  fields would likely be used to narrow down the provider one needs to visit
CREATE INDEX idx_fpact_providers ON FPACT(FI_Provider_Type_CD, FI_Provider_Specialty_CD);

-- Insert records into the fpact providers table
INSERT INTO FPACT (
    Provider_Source,
    Provider_Number,
    Owner_Number,
    Service_Location_Number,
    Provider_Name,
    Business_Name,
    Enroll_Stat_Effective_Dt,
    FI_Provider_Specialty_CD,
    Enroll_Stat_Cd,
    FI_Provider_Type_CD,
    DHCS_County_CD,
    FIPS_County_CD,
    Phone_Number,
    Location_ID
) VALUES
('FPACT', 1225254055, 1, 1, 'RICKY BRADSHAW', 'CLINICA MEDICA FAMILIAR', '2004-10-06', 11,  1, 22, 19, 6037, '(213) 427-0400', 60),
('FPACT', 1396879680, 1, 1, 'MORTY LEO', 'CLINICA SIERRA VISTA', '2004-09-01', 11, 1, 58, 15, 6029, '(661) 835-1240', 65),
('FPACT', 1497969166, 1, 1, 'LEWIS PHILIPPE', 'PATTERSON MEDICAL CTR', '1997-03-01', 11,  1, 58, 50, 6099, '(209) 892-8441', 68),
('FPACT', 1508885856, 1, 1, 'JUAN LOPEZ', 'LOPEZ, JUAN M MD', '2004-07-21', 11,  1, 26,  15, 6029, '(661) 322-2070', 67),
('FPACT', 1578766085, 1, 1, 'SAMANTA FERNANDZ', 'SOUTHWEST COMM HLTH CTR', '1998-04-06', 11,  1, 58, 49, 6097, '(707) 547-2220', 64),
('FPACT', 1710076997, 1, 1, 'RAHUL SRINIVAS', 'PLANNED PARENTHOOD', '1987-02-12', 11,  1, 41,  19, 6037, '(213) 284-3116', 66),
('FPACT', 1780928986, 1, 1, 'OMNI SHARMA', 'OMNI FAMILY HEALTH', '2013-02-23', 11,  1, 58, 15, 6029, '(800) 300-6664', 69),
('FPACT', 1821147786, 1, 2, 'NAINA TALWAR', 'NORTHBAY MEDICAL CENTER', '1977-12-01', 11,  1, 15,  48, 6095, '(707) 429-3600', 61),
('FPACT', 1962444059, 1, 1, 'NEHA REDDY', 'MAMMOTH HOSPITAL', '1994-09-15', 11,  1, 15,  26, 6051, '(760) 934-3311', 63),
('FPACT', 1992863096, 1, 1, 'NEGIN ZHANG', 'LA CLINICA VALLEJO', '2007-08-21', 11,  1, 58, 48, 6095, '(707) 645-7316', 62);

-- -- Creating the NPMP providers table with the required attributes and constraints
CREATE TABLE NonPhysicianMedicalPractitioner (
    Provider_Source VARCHAR(50),
    NPI INT PRIMARY KEY,
    Provider_Name VARCHAR(255),
    Enroll_Status_Eff_DT DATE,
    Provider_Taxonomy VARCHAR(255),
    ANC_Provider_Type INT,
    In_Out_State VARCHAR(50),
    FIPS_County_CD INT,
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID),
    FOREIGN KEY (NPI) REFERENCES PROVIDERS(NPI),
    FOREIGN KEY (Provider_Source) REFERENCES PROVIDERS(Provider_Source)
);

-- Insert records into the NPMP providers table
INSERT INTO NonPhysicianMedicalPractitioner (
    Provider_Source, NPI, Provider_Name, Enroll_Status_Eff_DT,
    Provider_Taxonomy, ANC_Provider_Type,
    In_Out_State, FIPS_County_CD, Location_ID) 
VALUES
('NPMP', 1003065897, 'HANLEY, JENNIFER L PA-C', '2022-02-15', 'Taxonomy not applicable', NULL, 'In state provider', 60, 74),
('NPMP', 1003090697, 'WILLIAMS, JORDAN RYAN', '2008-01-01', 'Taxonomy not applicable', NULL, 'In state provider', 60, 46),
('NPMP', 1003140013, 'MONZON-DULLER, JOMARIE ESTEBAN', '2010-08-24', 'Taxonomy not applicable', NULL, 'Out of state provider', 60, 58),
('NPMP', 1003159526, 'PONG, TIFFANY', '2013-06-25', 'Taxonomy not applicable', NULL, 'In state provider', 60, 28),
('NPMP', 1003180498, 'DE JESUS, GERARDO M NP', '2021-10-28', 'Taxonomy not applicable', NULL, 'In state provider', 60, 61),
('NPMP', 1003181926, 'JOHNSON, MELLYN A NP', '2021-04-05', 'Taxonomy not applicable', NULL, 'Out of state provider', 60, 38),
('NPMP', 1003187915, 'MOUALEM, MARIANA C NP', '2014-02-10', 'Taxonomy not applicable', NULL, 'In state provider', 60, 71),
('NPMP', 1003195827, 'RASMUSSEN, STEPHANIE J', '2011-09-01', 'Taxonomy not applicable', NULL, 'In state provider', 60, 62),
('NPMP', 1003214297, 'SRAMEK, SHANNON A', '2015-01-01', 'Taxonomy not applicable', NULL, 'In state provider', 60, 59),
('NPMP', 1003217605, 'PAGUNURAN, CHRISTINE G', '2015-01-30', 'Taxonomy not applicable', NULL, 'In state provider', 60, 40);

-- -- Creating the CCS providers table with the required attributes and constraints
CREATE TABLE ccs (
    NPI INT PRIMARY KEY,
    Provider_Name VARCHAR(255),
    Business_Name VARCHAR(255),
    Facility_Type VARCHAR(500),
    Phone_Number VARCHAR(15),
    Location_ID INT,
    Provider_Source VARCHAR(200),
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID),
    FOREIGN KEY (NPI) REFERENCES PROVIDERS(NPI),
    FOREIGN KEY (Provider_Source) REFERENCES PROVIDERS(Provider_Source)
);

-- Insert records into the ccs providers table
INSERT INTO ccs (NPI, Provider_Name, Business_Name, Facility_Type, Phone_Number, Location_ID, Provider_Source) VALUES
(1003867565, 'Barton Perry', 'Barton Memorial Hospital', 'Limited', '(530) 541-3420', 18, "Child Care"),
(1275720377, 'Gabriel San', 'San Gabriel Valley Medical', 'General Community (over 14 without pediatric license)', '(626) 289-5454', 11, "Child Care"),
(1366419517, 'Antelope Cherry', 'Antelope Valley Hospital', 'Pediatric Community', '(661) 949-5000', 14, "Child Care"),
(1396764353, 'Alameda Cheril', 'Highland General Hospital', 'General Community (over 14 without pediatric license)', '(510) 437-4800', 12, "Child Care"),
(1467538520, 'Neha Dupia', 'Bakersfield Memorial Hospita', 'Pediatric Community', '(661) 327-4647', 16, "Child Care"),
(1518996040, 'Aaryan Khan', 'Mad River Community Hospital', 'Limited', '(951) 652-2811', 13, "Child Care"),
(1538197231, 'Palak Kapoor', 'Banner Lassen Medical Ct', 'Limited', '(530) 252-2000', 17, "Child Care"),
(1770587107, 'Asante Vera', 'Rogue Valley Medical Center', 'Standard', '(541) 789-4728', 15, "Child Care"),
(1891938122, 'Arjun Reddy', 'Ahmc Anaheim Reg Med Ctr', 'Special', '(714) 774-1450', 10, "Child Care"),
(1952777245, 'Casa Santos', 'Casa Colina Hospital', 'Special', '(909) 596-7733', 19, "Child Care");

-- Creating indices on the  fields would likely be used to narrow down the provider one needs to visit
CREATE INDEX idx_ccs_providers_fi_provider_type ON ccs(Business_Name, Facility_Type);

-- Creating the ORP providers table with the required attributes and constraints
CREATE TABLE orp (
    Provider_Source_Nm VARCHAR(50),
    NPI INT PRIMARY KEY,
    Provider_Name VARCHAR(255),
    Enroll_Status_Eff_DT DATE,
    Provider_Taxonomy VARCHAR(255),
    ANC_Provider_Type INT,
    FI_Provider_Type_CD INT,
    Provider_License VARCHAR(50),
    FIPS_County_CD INT,
    Location_ID INT,
    Provider_Source VARCHAR(200),
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID),
    FOREIGN KEY (NPI) REFERENCES PROVIDERS(NPI),
    FOREIGN KEY (Provider_Source) REFERENCES PROVIDERS(Provider_Source),
    FOREIGN KEY (FI_Provider_Type_CD) REFERENCES providers_type_lookup_table(FI_Provider_Type_CD)
);

-- Creating indices on the  fields would likely be used to narrow down the provider one needs to visit
CREATE INDEX idx_orp_providers ON orp(FI_Provider_Type_CD);

-- Insert records into the ORP providers table
INSERT INTO orp (Provider_Source_Nm, NPI, Provider_Name, Enroll_Status_Eff_DT, Provider_Taxonomy, ANC_Provider_Type, FI_Provider_Type_CD, Provider_License, FIPS_County_CD, Location_ID, Provider_Source) VALUES
('Ordering, Referring, Prescribing', 1003023698, 'DIAZ, BERTHA A LMFT', '2020-06-21', 'Taxonomy not applicable', NULL, 77,  'LMFT45501', 6000, 37, "ORP"),
('Ordering, Referring, Prescribing', 1003013269, 'CHELSON, JILLIAN M PA', '2021-05-23', 'Taxonomy not applicable', NULL, -1,  '14574', 6000, 31, "ORP"),
('Ordering, Referring, Prescribing', 1003092396, 'SANCHEZ, ERIKA LCSW', '2022-01-18', 'Taxonomy not applicable', NULL, 70,  'LCSW86908', 6000, 23, "ORP"),
('Ordering, Referring, Prescribing', 1003101676, 'DAO, TRAM N', '2021-08-31', 'Taxonomy not applicable', NULL, -1,  '56042', 6000, 36, "ORP"),
('Ordering, Referring, Prescribing', 1003102997, 'BLANCO, YOJANNE LMFT', '2020-08-04', 'Taxonomy not applicable', NULL, 77,  'LMFT120656', 6000, 34, "ORP"),
('Ordering, Referring, Prescribing', 1003122623, 'HASHIMOTO, KAMI M PHARMD', '2020-06-01', 'Taxonomy not applicable', NULL, -1,  'RPH64224', 6000, 35, "ORP"),
('Ordering, Referring, Prescribing', 1003114414, 'PRITCHETT, DAVID M PA', '2019-04-19', 'Taxonomy not applicable', NULL, -1,  'PA56742', 6000, 26, "ORP"),
('Ordering, Referring, Prescribing', 1003105040, 'DIAZ, CLAUDIA S LCSW', '2020-03-18', 'Taxonomy not applicable', NULL, 70,  'LCSW25420', 6000, 44, "ORP"),
('Ordering, Referring, Prescribing', 1003146580, 'MAN, OI WAN A LCSW', '2020-05-05', 'Taxonomy not applicable', NULL, 70,  '12740', 6000, 43, "ORP"),
('Ordering, Referring, Prescribing', 1003168071, 'LOEBNER, JAIME R NP', '2020-12-09', 'Taxonomy not applicable', NULL, 7, '95013381', 6000, 22, "ORP");

-- -- Creating the treatment providers table with the required attributes and constraints
CREATE TABLE treatment (
    treatment_code VARCHAR(20),
    treatment_description VARCHAR(255),
	Program_Name VARCHAR(255),
    PRIMARY KEY (treatment_code)
);

-- Insert records into the treatment table
INSERT INTO treatment (treatment_code, treatment_description, Program_Name) VALUES
('T001', 'Narcotics Recovery', 'California Forensic Medical Group, Inc'),
('T002', 'Narcotics Recovery', 'Humanistic Alternatives to Addiction Research and Treatment, Inc.'),
('T003', 'Narcotics Recovery', 'Addiction Research and Treatment, Inc.'),
('T004', 'Narcotics Recovery', 'BAART Behavioral Health Services, Inc.'),
('T005', 'Narcotics Recovery', 'Successful Alternatives For Addiction & Counseling Services, Inc.'),
('T006', 'Narcotics Recovery', 'Lifeline Treatment Services, Inc.'),
('T007', 'Narcotics Recovery', 'Aegis Treatment Centers, LLC'),
('T008', 'Narcotics Recovery', 'Addiction Research and Treatment, Inc.'),
('T009', 'Narcotics Recovery', 'BAART Behavioral Health Services, Inc.'),
('T010', 'Narcotics Recovery', 'Addiction Research and Treatment, Inc.'),
('T011', 'Recovery Treatment Facilities', 'CHERRY HILL DETOXIFICATION SERVICES PROGRAM'),
('T012', 'Recovery Treatment Facilities', 'EBCRP OUTPATIENT OAKLAND'),
('T013', 'Recovery Treatment Facilities', 'NEWPORT ACADEMY - PALOMA'),
('T014', 'Recovery Treatment Facilities', 'EBCRP RESIDENTIAL PROGRAM FOR WOMEN AND CHILDREN'),
('T015', 'Recovery Treatment Facilities', 'CRONIN HOUSE'),
('T016', 'Recovery Treatment Facilities', 'CHRYSALIS'),
('T017', 'Recovery Treatment Facilities', 'ORCHID WOMEN\'S RECOVERY CENTER'),
('T018', 'Recovery Treatment Facilities', 'NEWPORT ACADEMY - HAPPY VALLEY'),
('T019', 'Recovery Treatment Facilities', 'NEW BRIDGE FOUNDATION'),
('T020', 'Recovery Treatment Facilities', 'NEW BRIDGE FOUNDATION - HELIOS');

-- -- Creating the narcotics treatment programs table with the required attributes and constraints
CREATE TABLE Narcotics_Treatment (
    treatment_code VARCHAR(5) PRIMARY KEY,
    License_Number VARCHAR(6),
    Phone_Number VARCHAR(20),
    Total_Slots INT,
    Operating_Hours VARCHAR(50),
    Dispensing_Hours VARCHAR(50),
    Weekend_Hours VARCHAR(50),
    Weekend_Dispensing_Hours VARCHAR(50),
    Program_Director VARCHAR(255),
    Medical_Director VARCHAR(255),
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID),
    FOREIGN KEY (treatment_code) REFERENCES TREATMENT(treatment_code)
);

-- Creating indices on the  fields would likely be used to narrow down the provider one needs to visit
CREATE INDEX idx_narcotics_treatment ON Narcotics_Treatment(Operating_Hours,Dispensing_Hours,Weekend_Hours,Weekend_Dispensing_Hours);

-- Insert records into the narcotics treatment program table
INSERT INTO Narcotics_Treatment (
    treatment_code,
    License_Number,
    Phone_Number,
    Total_Slots,
    Operating_Hours,
    Dispensing_Hours,
    Weekend_Hours,
    Weekend_Dispensing_Hours,
    Program_Director,
    Medical_Director,
    Location_ID
) VALUES
('T001', 'XA183', '(925) 551-6700', 300, '7:00am - 4:00am', '1:00am - 7:30am', '1:00am - 7:30am', '1:00am - 7:30am', 'Lisa Goodspeed', 'Kelly-Ann Kelly, M.D.', 15),
('T002', 'AN416', '(510) 727-9755', 400, '5:30am - 2:00pm', '6:00am - 9:00am; 10:00 - 12:00pm', '7:00am - 10:00am', '7:30am - 9:30am', 'Christopher Sobky, MFT', 'Mikael Martinez, M.D.', 52),
('T003', 'BN729', '(510) 533-0800', 650, '5:00am - 2:00pm', '5:00am - 1:00pm; TH 5am - 12pm', '7:15am - 10:30am', '7:15am - 10:30am', 'Lisa Fitzpatrick', 'Ian Johnson, M.D.', 49),
('T004', 'QP294', '(510) 533-0800', 50, '5:00am - 2:00pm', '5:00am - 1:00pm; TH 5am - 12pm', '7:15am - 10:30am', '7:15am - 10:30am', 'Lisa Fitzpatrick', 'Ian Johnson, M.D.', 14),
('T005', 'DE507', '(510) 247-8300', 365, '5:00am - 1:30pm', '5:00am - 1:00pm', '8:00am - 10:30am', '8:00am - 10:30am', 'Serena Urive', 'Gilbert Greene, D.O.', 68),
('T006', 'HI894', '(510) 777-8448', 225, '5:45am - 2:15pm', '6:00am - 10:00am; 10:30am - 1:30pm', '7:30am - 10:30am', '7:30am - 10:30am', 'Anna Regaldo', 'Michael Yadegari, M.D.', 51),
('T007', 'UW315', '(530) 345-3491', 625, '5:00am - 2:30pm', '5:00am - 1:00pm', '6:00am - 9:30am', '6:00am - 9:30am', 'Vida Rieschner', 'Michael Waring, M.D.', 27),
('T008', 'MY670', '(925) 522-0124', 1000, '5:30am - 2:30pm', '5:30am - 1:30pm', '7:00am - 10:30am (Closed Sunday)', '7:00am - 10:30am (Closed Sunday)', 'Candace Collins', 'William Quismoro, M.D.', 12),
('T009', 'JR017', '(925) 522-0124', 20, '5:30am - 2:30pm', '5:30am - 1:30pm', '7:00am - 10:30am', '7:00am - 10:30am', 'Candace Collins', 'William Quismoro, M.D.', 54),
('T010', 'PR901', '(510) 232-0874', 500, '6:00am - 2:00pm', '6:00am - 10:00; 11:00am - 1:00pm', '6:45am - 10:45am', '7:00am - 10:00am', 'Ulrika Williams', 'Kyle Moore, M.D.', 33);

-- -- Creating the treatment facilities table with the required attributes and constraints
CREATE TABLE TreatmentFacilities (
    treatment_code VARCHAR(10) PRIMARY KEY,
    License_Number VARCHAR(10),
    Facility_Name VARCHAR(255),
    Additional_Facility_Locations VARCHAR(255),
    Phone_Number VARCHAR(20),
    Type_of_Application VARCHAR(50),
    Service_Type VARCHAR(50),
    Resident_Capacity INT,
    Total_Occupancy INT,
    Expiration_Date DATE,
    Target_Population VARCHAR(50),
    Facility_Charges DECIMAL(10, 2),
    Adolescent_Waiver VARCHAR(3),
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID),
    FOREIGN KEY (treatment_code) REFERENCES TREATMENT(treatment_code)
);

-- Creating indices on the  fields would likely be used to narrow down the provider one needs to visit
CREATE INDEX idx_treatment_facilities ON TreatmentFacilities(Facility_Name,Resident_Capacity,Total_Occupancy);

-- Insert records into the treatment facilities table
INSERT INTO TreatmentFacilities (
    treatment_code, License_Number, Facility_Name, Additional_Facility_Locations, Phone_Number,
    Type_of_Application, Service_Type, Resident_Capacity, Total_Occupancy, Expiration_Date,
    Target_Population, Facility_Charges, Adolescent_Waiver, Location_ID
) VALUES
('T011', 'AC842', 'HORIZON SERVICES, INCORPORATED', NULL, '(510) 346-7833', 'Licensed',
 'RES-DETOX: Residential Detoxification Services', 32, 32, '2024-01-31', '1.1 --- CO-ED', 303.47, 'No', 30),
('T012', 'KG193', 'LIFELONG MEDICAL CARE', NULL, '(510) 446-7180', 'Certified',
 'NON: Non-residential', 0, 0, '2025-03-31', '1.1 --- CO-ED', 186.82, 'No', 31),
('T013', 'LM567', 'MONROE OPERATIONS, LLC', '456 Oak Ave', '(714) 310-8461', 'Certified',
 'DSS: Department of Social Services', 0, 20, '2023-12-31', '1.4 --- WOMEN/CHILDREN', 263.14, 'No', 32),
('T014', 'ZX012', 'LIFELONG MEDICAL CARE', NULL, '(510) 446-7160', 'Licensed and Certified',
 'RES: Residential', 20, 20, '2025-01-31', '1.4 --- WOMEN/CHILDREN', 86.59, 'Yes', 33),
('T015', 'QR789', 'HORIZON SERVICES, INCORPORATED', '3847 TELEGRAPH AVENUE', '(510) 784-5874', 'Licensed and Certified',
 'RES: Residential', 17, 17, '2024-02-29', '1.1 --- CO-ED', 323.73, 'Yes', 34),
('T016', 'OP246', 'HORIZON SERVICES, INCORPORATED', '3839, 3841, AND 3843 TELEGRAPH AVENUE', '(510) 450-1190', 'Licensed and Certified',
 'RES: Residential', 7, 7, '2024-10-31', '1.3 --- WOMEN ONLY', 130.24, 'No', 35),
('T017', 'BD521', 'BI-BETT', NULL, '(510) 535-0611', 'Licensed and Certified',
 'RES: Residential', 12, 12, '2024-04-30', '1.4 --- WOMEN/CHILDREN', 117.11, 'No', 36),
('T018', 'TF983', 'MONROE OPERATIONS, LLC', '789 Pine Ln, Unit C, Village Heights', '(714) 310-8461', 'Certified',
 'DSS: Department of Social Services', 0, 12, '2023-12-31', '1.5 --- YOUTH/ADOLESCENT', 306.96, 'No', 37),
('T019', 'PL632', 'THE NEW BRIDGE FOUNDATION, INC.', '1820 SCENIC AVENUE', '(510) 548-7270', 'Licensed and Certified',
 'RES-DETOX: Residential Detoxification Services', 93, 93, '2024-05-31', '1.1 --- CO-ED', 345.88, 'No', 38),
('T020', 'WX347', 'THE NEW BRIDGE FOUNDATION, INC.', NULL, '(510) 548-7270', 'Certified',
 'NON: Non-residential', 0, 0, '2024-07-31', '1.1 --- CO-ED', 153.35, 'Yes', 39);
 

 
show tables;
