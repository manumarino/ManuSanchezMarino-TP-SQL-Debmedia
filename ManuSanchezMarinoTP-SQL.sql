DROP DATABASE tpsql;
CREATE DATABASE tpsql;
 
USE tpsql;

/*
 * Comandos utiles
 */


DROP PROCEDURE CrearTablas;
DROP PROCEDURE InsertarDatos;
DROP PROCEDURE ClavesForaneas;
DROP TABLE Country_id,Cancellation_policy,Dept_id,Host_id,Host_id_verified,Instant_bookable,Neighbourhood,Neighbourhood_group,Publication_id,Room_type;

/*
 * 2) Crear Store Procedure que cree las tablas que considere necesarias, que alojaran la data de Airbnb, sin
 *    generar las Forean Keys desde las tablas.
 */

CREATE PROCEDURE CrearTablas
AS
BEGIN
	CREATE TABLE Publication_id (
	    publication_id INT PRIMARY KEY,
	    dept_id INT,
	    pub_name VARCHAR(200),
	    host_id BIGINT,
	    instant_bookable TINYINT,
	    cancellation_policy TINYINT,
	    room_type TINYINT,
	    price INT,
	    service_fee INT,
	    min_nights INT,
	    num_reviews INT,
	    last_review VARCHAR(20),
	    rev_per_month FLOAT,
	    rev_rate_number TINYINT,
	    cal_host_listings_count TINYINT,
	    availability_365 INT,
	    house_rules VARCHAR(500)	    
    );
    
	CREATE TABLE Host_id_verified (
		host_id_verified TINYINT IDENTITY(1,1) PRIMARY KEY,
		value VARCHAR(15)
	);
	
	CREATE TABLE Host_id (
		host_id BIGINT PRIMARY KEY,
		host_id_verified TINYINT,
		host_name VARCHAR(50)
	);
	
	CREATE TABLE Country_id (
		country_id TINYINT IDENTITY(1,1) PRIMARY KEY,
		country VARCHAR(30),
		country_code VARCHAR(2)
	);
	
	CREATE TABLE Neighbourhood_group (
		neighbourhood_group VARCHAR(50) PRIMARY KEY,
		country_id TINYINT
	);
	
	CREATE TABLE Neighbourhood (
		neighbourhood VARCHAR(50) PRIMARY KEY,
		neighbourhood_group VARCHAR(50)
	);
	
	CREATE TABLE Dept_id (
		dept_id INT IDENTITY(1,1) PRIMARY KEY,
		lat FLOAT,
		lon FLOAT,
		neighbourhood VARCHAR(50),
		construction_year INT
	);
	
	CREATE TABLE Cancellation_policy (
		cancellation_policy TINYINT IDENTITY(1,1) PRIMARY KEY,
		value VARCHAR(15)
	);
	
	CREATE TABLE Instant_bookable (
		instant_bookable TINYINT IDENTITY(1,1) PRIMARY KEY,
		value VARCHAR(5)
	);
		
	CREATE TABLE Room_type (
		room_type TINYINT IDENTITY(1,1) PRIMARY KEY,
		value VARCHAR(30)
	);
END;


    
EXEC CrearTablas;

/*
 * 3) Crear Store Procedure que inserte data en las respectivas datas creadas. Puede limitarse a 50 registros.
 */


CREATE PROCEDURE InsertarDatos
AS
BEGIN
	INSERT INTO Room_type(value) VALUES('Private Room');
	INSERT INTO Room_type(value) VALUES('Entire home/apt');
	INSERT INTO Room_type(value) VALUES('Shared room');

	INSERT INTO Instant_bookable(value) VALUES('TRUE');
	INSERT INTO Instant_bookable(value) VALUES('FALSE');
	INSERT INTO Instant_bookable(value) VALUES('0');
	
	INSERT INTO Cancellation_policy(value) VALUES('strict');
	INSERT INTO Cancellation_policy(value) VALUES('moderate');
	INSERT INTO Cancellation_policy(value) VALUES('flexible');
	
	INSERT INTO Country_id(country,country_code) VALUES('United States','US');
	
	INSERT INTO Neighbourhood_group (neighbourhood_group ,country_id) VALUES('Brooklyn',1);
	INSERT INTO Neighbourhood_group (neighbourhood_group ,country_id) VALUES('Manhattan',1);
	INSERT INTO Neighbourhood_group (neighbourhood_group ,country_id) VALUES('Queens',1);
	
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Bedford-Stuyvesant','Brooklyn')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Bushwick','Brooklyn')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Chelsea','Manhattan')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Chinatown','Manhattan')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Clinton Hill','Brooklyn')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Crown Heights','Brooklyn')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('East Harlem','Manhattan')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('East Village','Manhattan')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Flatbush','Brooklyn')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Fort Greene','Brooklyn')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Greenpoint','Brooklyn')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Harlem','Manhattan')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Hell''s Kitchen','Manhattan')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Inwood','Manhattan')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Kensington','Brooklyn')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Long Island City','Queens')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Lower East Side','Manhattan')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Midtown','Manhattan')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Murray Hill','Manhattan')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Park Slope','Brooklyn')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Prospect-Lefferts Gardens','Brooklyn')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('South Slope','Brooklyn')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Upper West Side','Manhattan')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('West Village','Manhattan')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Williamsburg','Brooklyn')
	INSERT INTO Neighbourhood (neighbourhood,neighbourhood_group) VALUES('Windsor Terrace','Brooklyn')
	

	INSERT INTO Host_id_verified(value) VALUES('verified');
	INSERT INTO Host_id_verified(value) VALUES('unconfirmed');
	INSERT INTO Host_id_verified(value) VALUES('null');
	
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(1280143094,1,'Miranda');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(2107606817,2,'Chester');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(18824631834,1,'Alan');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(19382804591,2,'Andrew');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(25066620900,1,'Alfred');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(26207748876,1,'Arthur');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(26802410424,1,'Darcy');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(31736204344,3,'Clark');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(38811420224,1,'Adrianna');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(41615406010,3,'David');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(42134614458,1,'Jared');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(45498551794,1,'Michelle');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(45597582469,3,'Charlie');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(46551725984,1,'Daniel');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(48387947293,3,'Miranda');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(49725315867,1,'Deanna');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(50357575975,1,'Alina');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(50968902783,2,'John');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(51449163855,1,'Daryl');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(52335172823,1,'Jenna');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(53343148512,1,'Brad');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(53466382920,1,'Chloe');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(53754237010,1,'Mary');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(55430108992,2,'Alford');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(57827496420,2,'Charlotte');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(57938703679,2,'Jared');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(61300605564,3,'Alberta');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(62566345680,2,'Heather');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(63131487263,2,'Byron');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(69410526955,2,'Byron');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(72145018858,3,'Martin');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(73862528370,1,'Alberta');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(75527839483,2,'Carl');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(78829239556,3,'Elise');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(79384379533,1,'Evelyn');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(79805143117,1,'Audrey');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(80014485718,2,'Madaline');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(80369762211,1,'Mary');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(80380130347,1,'Ryan');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(81253735818,2,'Victoria');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(81686279636,3,'Carlos');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(85098326012,2,'Garry');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(86424057349,2,'Tyler');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(86554611512,1,'Alissa');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(87668933180,3,'William');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(88136055909,1,'');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(88653822946,1,'Joyce');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(88920244552,1,'Leonardo');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(90821839709,2,'Emma');
	INSERT INTO Host_id (host_id,host_id_verified,host_name) VALUES(92037596077,1,'Lyndon');
	
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.64749,-73.97237,'Kensington',2020)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.75362,-73.98377,'Midtown',2007)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.80902,-73.9419,'Harlem',2005)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.68514,-73.95976,'Clinton Hill',2005)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.79851,-73.94399,'East Harlem',2009)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.74767,-73.975,'Murray Hill',2013)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.68688,-73.95596,'Bedford-Stuyvesant',2015)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.68688,-73.95596,'Bedford-Stuyvesant',2009)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.76489,-73.98493,'Hell''s Kitchen',2005)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.80178,-73.96723,'Upper West Side',2015)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.71344,-73.99037,'Chinatown',2004)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.80316,-73.96545,'Upper West Side',2008)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.76076,-73.98867,'Hell''s Kitchen',2008)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.66829,-73.98779,'South Slope',2010)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.79826,-73.96113,'Upper West Side',2019)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.7353,-74.00525,'West Village',2018)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.70837,-73.95352,'Williamsburg',2009)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.69169,-73.97185,'Fort Greene',2006)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.74192,-73.99501,'Chelsea',2008)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.67592,-73.94694,'Crown Heights',2004)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.79685,-73.94872,'East Harlem',2013)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.71842,-73.95718,'Williamsburg',2016)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.68069,-73.97706,'Park Slope',2013)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.67989,-73.97798,'Park Slope',2017)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.68001,-73.97865,'Park Slope',2005)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.68371,-73.94028,'Bedford-Stuyvesant',2006)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.65599,-73.97519,'Windsor Terrace',2021)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.86754,-73.92639,'Inwood',2017)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.76715,-73.98533,'Hell''s Kitchen',2016)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.86482,-73.92106,'Inwood',2021)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.7292,-73.98542,'East Village',2010)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.82245,-73.95104,'Harlem',2004)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.81305,-73.95466,'Harlem',2007)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.72219,-73.93762,'Greenpoint',2007)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.8213,-73.95318,'Harlem',2021)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.6831,-73.95473,'Bedford-Stuyvesant',2016)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.66869,-73.9878,'South Slope',2003)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.68876,-73.94312,'Bedford-Stuyvesant',2004)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.70186,-73.92745,'Bushwick',2005)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.63702,-73.96327,'Flatbush',2011)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.71401,-73.98917,'Lower East Side',2012)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.7229,-73.98199,'East Village',2005)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.66278,-73.97966,'South Slope',2020)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.69673,-73.97584,'Fort Greene',2008)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.79009,-73.97927,'Upper West Side',2017)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.81175,-73.94478,'Harlem',2006)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.65944,-73.96238,'Prospect-Lefferts Gardens',2007)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.74771,-73.9474,'Long Island City',2022)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.68111,-73.95591,'Bedford-Stuyvesant',2019)
	INSERT INTO Dept_id (lat,lon,neighbourhood,construction_year) VALUES(40.68554,-73.9409,'Bedford-Stuyvesant',2015)


	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1001254,1,'Clean & quiet apt home by the park',80014485718,2,1,1,966,193,10,9,2021-10-19,0.21,4,6,286,'Clean up and treat the home the way you''d like your home to be treated.  No smoking.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1002102,2,'Skylit Midtown Castle',52335172823,2,2,2,142,28,30,45,2022-05-21,0.38,4,2,228,'Pet friendly but please confirm with me if the pet you are planning on bringing with you is OK. I have a cute and quiet mixed chihuahua. I could accept more guests (for an extra fee) but this also needs to be confirmed beforehand. Also friends traveling together could sleep in separate beds for an extra fee (the second bed is either a sofa bed or inflatable bed). Smoking is only allowed on the porch.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1002403,3,'THE VILLAGE OF HARLEM....NEW YORK !',78829239556,1,3,1,620,124,3,0,0000-00-00,0,5,1,352,'I encourage you to use my kitchen, cooking and laundry facilities. There is no additional charge to use the washer/dryer in the basement.  No smoking, inside or outside. Come home as late as you want.  If you come home stumbling drunk, it''s OK the first time. If you do it again, and you wake up me or the neighbors downstairs, we will be annoyed.  (Just so you know . . . )')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1002755,4,'',85098326012,1,2,2,368,74,30,270,2019-07-05,4.64,4,1,322,'')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1003689,5,'Entire Apt: Spacious Studio/Loft by central park',92037596077,2,2,2,204,41,10,9,2018-11-19,0.1,3,1,289,'Please no smoking in the house, porch or on the property (you can go to the nearby corner).  Reasonable quiet after 10:30 pm.  Please remove shoes in the house.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1004098,6,'Large Cozy 1 BR Apartment In Midtown East',45498551794,1,3,2,577,115,3,74,2019-06-22,0.59,3,1,374,'No smoking, please, and no drugs.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1004650,7,'BlissArtsSpace!',61300605564,2,2,1,71,14,45,49,2017-10-05,0.4,5,1,224,'Please no shoes in the house so bring slippers or extra socks to keep your feet warm- especially in winter! No smoking either inside or outside. Please be considerate of neighbors from 10pm-7am in terms of noise. Please take out any trash and leave in the large blue garbage bin at the end of the driveway when you leave.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1005202,8,'BlissArtsSpace!',90821839709,2,2,1,1060,212,45,49,2017-10-05,0.4,5,1,219,'House Guidelines for our BnB We are delighted to welcome you.  Check in Sun - Thurs by 8PM and Fri, Sat by 9pm. Please bear in mind that this is not a hotel but our home and we are opening it to you.  We will do our utmost to make your stay enjoyable and fun.  We ask that you take care to respect our home and its appearance.  Thank you.  Marilyn and Alan 1.ROOMS - The bedroom is yours for the duration of your stay.  Be sure to let us know if you need something. ');
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1005754,9,'Large Furnished Room Near B''way',79384379533,1,1,1,1018,204,2,430,2019-06-24,3.47,3,1,180,'- Please clean up after yourself when using the kitchen. - When using the bathroom, please be careful to minimize the amount of water on the floor when showering and using the sink. - Please make sure to remove any strands of hair from the sink and floors with a tissue or paper towel. - Be respectful of the noise levels after 11pm.  - Please be quiet coming in late or leaving early. - No Smoking  - No Pets - No overnight guests ')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1006307,10,'Cozy Clean Guest Room - Family Apt',75527839483,2,1,1,291,58,2,118,2017-07-21,0.99,5,1,375,'NO SMOKING OR PETS ANYWHERE ON THE PROPERTY 1. Be respectful of the other tenants 2. If you use the grill, be sure to turn off the gas 3. Notify the owner of any discrepancies or things not functioning properly immediately 4. Please treat carpet stains promptly (or notify the owner) 5. Kindly turn off lights, air conditioners, and other electrical items when they aren''t needed')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1006859,11,'Cute & Cozy Lower East Side 1 bdrm',1280143094,2,3,2,319,64,1,160,2019-06-09,1.33,3,4,1,'')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1007411,12,'Beautiful 1br on Upper West Side',18824631834,1,3,2,606,121,5,53,2019-06-22,0.43,4,1,163,'My ideal guests would be warm, friendly, and respectful of sharing my home and it''s rhythms. I am allergic to cigarettes, so no smoking please, not even in the yard. A quiet homecoming is much appreciated at the end of the evening''s nightlife.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1007964,13,'Central Manhattan/near Broadway',88136055909,2,1,1,714,143,2,188,2019-06-23,1.5,4,1,258,'- One of the bedroom closets is not accessible to guests - Please be mindful of the neighbors, quiet time after 10PM  - Check-out time is at 11AM on the day of your departure.  - If you''re going to smoke outside, please clean up after yourself and do not throw cigarette butts on the ground - The refrigerator and cabinets are available for your use but please do not take food items unless explicitly permitted')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1008516,14,'Lovely Room 1, Garden, Best Area, Legal rental',26802410424,1,2,1,580,116,4,167,2019-06-24,1.34,4,3,47,'')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1009068,15,'Wonderful Guest Bedroom in Manhattan for SINGLES',88920244552,2,3,1,149,30,2,113,2019-07-05,0.91,3,1,68,'')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1009621,16,'West Village Nest - Superhost',46551725984,1,3,2,578,0,90,27,2018-10-31,0.22,3,1,100,'Arrival time can be no later than 9:00PM unless pre-arranged. No visitors allowed at anytime without prior approval. Overnight guests are not allowed at all. There is no room for guests. Don''t ask. No smoking. 11:00 PM is quiet time while watching private room tv is acceptable. No eating meals in the room. It''s too small, you''ll see what I''m saying, and there''s a nice dining table for that. Small snacks are fine. I')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1010173,17,'Only 2 stops to Manhattan studio',62566345680,3,2,2,778,0,2,148,2019-06-29,1.2,3,1,197,'Absolutely no smoking in the building, handling of art work or damaging personal property. All additional charges for movie rental are the responsibility of the renter. Shower before entering the hot tub. No glass or food in the hot tub. Turn off all lights and appliances when leaving the unit.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1010725,18,'Perfect for Your Parents + Garden',80380130347,3,3,2,656,0,2,198,2019-06-28,1.72,5,1,96,'- Please be mindful of the neighbors, quiet time after 10PM  - Check-out time is at 11AM on the day of your departure.  - If you''re going to smoke outside, please clean up after yourself and do not throw cigarette butts on the ground - The refrigerator and cabinets are available for your use but please do not take food items unless explicitly permitted')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1011277,19,'Chelsea Perfect',73862528370,3,2,1,460,0,1,260,2019-07-01,2.12,3,1,325,'x')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1011830,20,'Hip Historic Brownstone Apartment with Backyard',72145018858,3,2,2,1095,0,3,53,2019-06-22,4.44,5,1,345,'LAUNDRY - Laundry can be done by the visitor before 10 pm, preferably on weekends. - Please provide your own detergent and fabric conditioner. Keep the machine clean and remember to clean the filter before and after use. - Please ask hosts to teach you how to operate the machines if you are not familiar with it. - Please limit your load and washes as not to overload the machine. - One wash per week will be ideal.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1012382,21,'Huge 2 BR Upper East  Cental Park',79805143117,3,2,2,281,56,7,0,0000-00-00,0,3,2,347,'No smoking, No pets.  No shoes in the house. Visitors are permitted in the common area only. Please use the dining room to enjoy your meals. Also  refrain using an electronic device while having your meal. Quiet time between 10:00pm-6:00am.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1012934,22,'Sweet and Spacious Brooklyn Loft',86554611512,3,3,2,477,95,3,9,2021-12-28,0.07,3,1,193,'- No smoking or open flames on the property - Please respect the peace and privacy of our neighbors  - Access Roslindale Urban Wild from street - do not jump backyard fence - Max of 3 occupants, please!')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1013487,23,'CBG CtyBGd HelpsHaiti rm#1:1-4',53754237010,3,2,1,133,27,2,130,2019-07-01,1.09,4,6,54,'Arrival time can be no later than 10:00PM. No visitors allowed at anytime without prior approval. Overnight guests are only allowed as part of the reservation. Never more than 2 people in this room.  No smoking. 11:00 PM is quiet time while watching private room tv is acceptable. No eating meals in the room. It''s too small, you''ll see what I''m saying, and there''s a nice dining table for that. Small snacks are fine. ')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1014039,24,'CBG Helps Haiti Room#2.5',87668933180,3,2,1,1050,210,1,39,2019-01-01,0.37,3,6,9,'')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1014591,25,'CBG Helps Haiti Rm #2',57827496420,3,1,1,816,163,2,71,2019-07-02,0.61,4,6,344,'We take great care of our home and expect you to do the same.  Smoking is not permitted anywhere on the property.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1015144,26,'MAISON DES SIRENES1,bohemian apartment',48387947293,3,1,2,1175,235,2,88,2019-06-19,0.73,4,2,372,'')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1015696,27,'Sunny Bedroom Across Prospect Park',81686279636,3,2,1,530,106,1,19,2019-06-23,1.37,5,2,344,'Quiet neighborhood, middle apartment of big house, quiet after 11:00. No smoking or candles in apartment.  Clean kitchen after use.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1016248,28,'Magnifique Suite au N de Manhattan - vue Cloitres',38811420224,3,1,1,274,55,4,0,0000-00-00,0,0,1,96,'To treat our home with respect.  No smoking inside but feel free to use the front porch.  The marble in the bathroom is very easily stained. We ask that you limit drinking coffee, red wine, etc to the bedroom.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1016800,29,'Midtown Pied-a-terre',19382804591,3,2,2,209,42,10,58,2017-08-13,0.49,0,1,103,'Please no pets or smoking in the house, though you can go out on a private porch if you must indulge. Feel free to bring food and cook...I love it when guests prepare a meal.   Quiet hours 9PM to 6AM. ')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1017353,30,'SPACIOUS, LOVELY FURNISHED MANHATTAN BEDROOM',51449163855,3,1,1,432,86,3,108,2019-06-15,1.11,0,3,172,'My ideal guests would be warm, friendly, and respectful of sharing my home and it''s rhythms. I am allergic to cigarettes, so no smoking please, not even in the yard. A quiet homecoming is much appreciated at the end of the evening''s nightlife.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1017905,31,'Modern 1 BR / NYC / EAST VILLAGE',86424057349,3,3,2,666,133,14,29,2019-04-19,0.24,0,1,56,'Just be respectful, clean, and quiet after 10:00PM!')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1018457,32,'front room/double bed',69410526955,3,3,1,770,154,3,242,2019-06-01,2.04,0,3,105,'No loud noises or loud music. Please help us save the planet by shutting off all the lights when they are not needed. Make sure the coffee maker, toaster and other appliance are off when you leave every morning.  No pets. Remove your shoes and keep them inside the apartment. ABSOLUTELY NO SMOKING is allowed in the house. It is only allowed in the rear part of the building. No wild parties, this is a quiet building. ')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1019010,33,'Spacious 1 bedroom in luxe building',80369762211,3,3,1,512,102,2,88,2019-06-14,1.42,0,1,169,'')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1019562,34,'Loft in Williamsburg Area w/ Roof',50968902783,3,2,1,858,172,4,197,2019-06-15,1.65,0,3,383,'LAUNDRY - Laundry can be done by the visitor before 10 pm, preferably on weekends. - Please provide your own detergent and fabric conditioner. Keep the machine clean and remember to clean the filter before and after use. - Please ask hosts to teach you how to operate the machines if you are not familiar with it. - Please limit your load and washes as not to overload the machine. - One wash per week will be ideal. ')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1020114,35,'back room/bunk beds',25066620900,3,1,1,545,109,3,273,2019-07-01,2.37,0,3,411,'Please no smoking on the property')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1020667,36,'Large B&B Style rooms',57938703679,1,1,1,191,38,1,74,2019-05-12,0.66,0,2,76,'No smoking, this is non-negotiable.  No illegal drug use and we make no exceptions.  We do not allow additional guests or parties.  We expect respectful behavior, particularly late at night. We can allow friendly, house- trained dogs.  We have a dog of our own, so its important that your dog be under your charge at all times.  You may not leave your dog in the apartment alone.  You will be responsible for any damage pets may incur, including paying for cleaning of carpets should they be soiled.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1021219,37,'Lovely room 2 & garden; Best area, Legal rental',53343148512,1,2,1,1111,222,4,168,2019-06-21,1.41,0,3,416,'')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1021771,38,'Clean and Quiet in Brooklyn',26207748876,2,2,1,203,41,60,0,0000-00-00,0,0,1,294,'NO Shoes in the house. This is why my house is so clean!  NO Smoking inside or outside (cigarettes or anything else).  NO Parties (inside or outside). NO pets (inside or out)  This is a nice quiet neighborhood. Please be respectful of others.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1022323,39,'Cute apt in artist''s home',88653822946,1,2,2,1097,219,2,231,2019-06-22,1.96,3,2,214,'Please no shoes inside the house and no  smoking (cigarettes or anything else) either in or outside. Please be respectful of neighbors in the evening and early morning (10pm-7am). When you leave at the end of your stay, please take your trash outside to the large garbage bin at the end of the driveway.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1022876,40,'Country space in the city',49725315867,1,1,1,1020,204,1,0,0000-00-00,0,3,1,356,'House Guidelines for our BnB We are delighted to welcome you.  Check in Sun – Thurs by 8PM and Fri, Sat by 9pm. Please bear in mind that this is not a hotel but our home and we are opening it to you.  We will do our utmost to make your stay enjoyable and fun.  We ask that you take care to respect our home and its appearance.  Thank you.  Marilyn and Alan 1.ROOMS - The bedroom is yours for the duration of your stay.  Be sure to let us know if you need something.  ')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1023428,41,'LowerEastSide apt share shortterm 1',31736204344,1,2,3,1010,202,1,214,2019-07-05,1.81,5,4,110,'Not smoking, drugs, or alcoholics allow. Guest most inform the purpose of their trip and provide ID or passport upon arrival. Only 1 gust allow unless the guest consult the host first for any other type of arrangements.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1023980,42,'ENJOY Downtown NYC!',63131487263,2,1,1,563,113,2,245,2019-06-21,2.08,3,2,354,'')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1024533,43,'Beautiful Sunny Park Slope Brooklyn',50357575975,1,3,2,370,74,3,15,2019-05-27,0.39,2,1,33,'No smoking inside. Since I have a dog, there are no other pets allowed.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1025085,44,'1bdr w private bath. in lofty apt',45597582469,2,1,1,687,137,7,25,2018-09-30,0.23,1,1,405,'No smoking, No pets. No shoes in the house. Visitors are permitted in the common area only. Please use the dining room to enjoy your meals. Also please refrain using an electronic device while having your meal. Quiet time between 10:00pm-6:00am.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1025637,45,'West Side Retreat',55430108992,2,1,1,856,171,4,81,2019-06-16,0.69,3,1,86,'Free WiFi! * No smoking anywhere on property. *No out-door shoes to be worn in the house. We ask that guests be willing to be considerate and quiet while coming and going from 10 pm to 6 am, please. This is a non-smoking property. There is no smoking anywhere on the property, inside nor on the porch. We also ask guests to bring inside shoes/slippers. Thank you. ')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1026190,46,'BEST BET IN HARLEM',2107606817,1,3,2,62,12,7,97,2019-06-13,0.84,0,1,152,'- Quiet hours between 10pm-6am - Visitors in common spaces only')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1026742,47,'Entire apartment in central Brooklyn neighborhood.',41615406010,2,1,2,435,87,0,11,2019-06-05,0.49,0,1,353,'')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1027294,48,'1 Stop fr. Manhattan! Private Suite,Landmark Block',81253735818,1,3,1,916,183,0,248,2019-07-01,2.25,0,1,26,'The room is strictly non-smoking, however, you can smoke in the back porch. No drugs! No visitors without previous authorization. We do prefer adults since the house is not "child proof" and, we are full time workers. Babies OK!  Please, keep in mind that, this is not a hotel.  The room should be left in good condition and picked up when you leave.  Longer term renters use of kitchen and other facilities can be arranged.')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1027846,49,'Charming Brownstone 3 - Near PRATT',42134614458,1,2,2,459,92,0,61,2019-05-25,0.52,0,1,32,'No smoking, please. No drugs or guns allowed.  Only registered guests allowed; no other visitors please.  We cannot accommodate pets as I already have two. Cat:  OK to let Bella out of the house.  Dog:  Please don''t let Moe out of the house. He''d like to run to the street. He is also a bit noisy when visitors arrive. Please say hi and then ignore him and he''ll calm down.  No candles or incense burning. ')
	INSERT INTO Publication_id(publication_id,dept_id,pub_name,host_id,instant_bookable,cancellation_policy,room_type,price,service_fee,min_nights,num_reviews,last_review,rev_per_month,rev_rate_number,cal_host_listings_count,availability_365,house_rules) VALUES(1028399,50,'bright and stylish duplex',53466382920,2,2,2,363,73,0,11,2017-01-01,0.1,1,1,85,'No smoking. No pet. No shoes in the house. Visitors are permitted in the common area only. Please use the dining room to enjoy your meals. Also please refrain using an electronic device while having your meal. Quiet time between 10:00pm-6:00am.')
	
END;


EXEC InsertarDatos;

/*
 * 4) Crear Store Procedure que modifique la/s tabla/s y agregue las respectivas Forean Key con un ID o
 *    identificador.
 */


CREATE PROCEDURE ClavesForaneas
AS
BEGIN
	
	ALTER TABLE Publication_id  
	ADD CONSTRAINT FK_Room_type
	FOREIGN KEY (room_type) REFERENCES Room_type(room_type);
	
	
	ALTER TABLE Publication_id  
	ADD CONSTRAINT FK_Instant_bookable
	FOREIGN KEY (instant_bookable) REFERENCES Instant_bookable(instant_bookable);
	
	
	ALTER TABLE Publication_id  
	ADD CONSTRAINT FK_Cancellation_policy
	FOREIGN KEY (cancellation_policy) REFERENCES Cancellation_policy(cancellation_policy);
	
	
	ALTER TABLE Publication_id  
	ADD CONSTRAINT FK_Dept_id
	FOREIGN KEY (dept_id) REFERENCES Dept_id(dept_id);
	
	
	ALTER TABLE Publication_id  
	ADD CONSTRAINT FK_Host_id
	FOREIGN KEY (host_id) REFERENCES Host_id(host_id);
	
	
	ALTER TABLE Host_id  
	ADD CONSTRAINT FK_Host_id_verified
	FOREIGN KEY (host_id_verified) REFERENCES Host_id_verified(host_id_verified);
	
	
	ALTER TABLE Dept_id  
	ADD CONSTRAINT FK_Neighbourhood
	FOREIGN KEY (neighbourhood) REFERENCES Neighbourhood(neighbourhood);
	
	
	ALTER TABLE Neighbourhood 
	ADD CONSTRAINT FK_Neighbourhood_group
	FOREIGN KEY (neighbourhood_group) REFERENCES Neighbourhood_group(neighbourhood_group);
	
	
	ALTER TABLE Neighbourhood_group 
	ADD CONSTRAINT FK_Country_id
	FOREIGN KEY (country_id) REFERENCES Country_id(country_id);
	
END;


EXEC ClavesForaneas;

/*
 * 5) Cree una vista con el precio promedio,máximo, mínimo y total.
 */

CREATE VIEW Calculos
AS SELECT country,COUNT(publication_id) as Cantidad_de_Publicaciones, COALESCE(AVG(price),0) as Promedio, SUM(price) as Suma, COALESCE(MIN(price),0) as Minimo, MAX(price) as Maximo
FROM Publication_id, Country_id
GROUP BY country;

SELECT * FROM Calculos;

/*
 * 6) Cree una vista con todos los datos juntos como se muestra en el csv original. (JOINS)
 */



CREATE VIEW TablaOriginal
AS
SELECT  publication_id, pub_name, Publication_id.host_id, HostIDverified, host_name, neighbourhood, neighbourhood_group, lat, lon, country, country_code, Instant_bookable.value as InstantBookable, Cancellation_policy.value as CancellationPolicy, Room_type.value as RoomType, construction_year, price, service_fee, min_nights, num_reviews, last_review, rev_per_month, rev_rate_number, cal_host_listings_count, availability_365, house_rules
FROM Publication_id

INNER JOIN (
	SELECT dept_id, lat, lon, Dept_id.neighbourhood, construction_year, neighbourhood_group, country, country_code
	FROM Dept_id
	INNER JOIN (
		SELECT Neighbourhood.neighbourhood, Neighbourhood.neighbourhood_group, country, country_code 
		FROM Neighbourhood
		INNER JOIN (
			SELECT Neighbourhood_group.neighbourhood_group, country, country_code
			FROM Neighbourhood_group
			INNER JOIN Country_id ON Neighbourhood_group.country_id = Country_id.country_id) AS t1
		ON Neighbourhood.neighbourhood_group = t1.neighbourhood_group) AS t2
	ON Dept_id.neighbourhood = t2.neighbourhood) AS t3
ON Publication_id.dept_id = t3.dept_id

INNER JOIN (
	SELECT host_id, value as HostIDverified, host_name
	FROM Host_id 
	INNER JOIN Host_id_verified ON Host_id.host_id_verified = Host_id_verified.host_id_verified) AS t4
ON Publication_id.host_id = t4.host_id

INNER JOIN Cancellation_policy ON Publication_id.cancellation_policy = Cancellation_policy.cancellation_policy

INNER JOIN Instant_bookable ON Publication_id.instant_bookable = Instant_bookable.instant_bookable

INNER JOIN Room_type ON Publication_id.room_type = Room_type.room_type;



SELECT * FROM TablaOriginal;


/*
*	Manuela Sanchez Marino
*/