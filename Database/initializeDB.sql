/**
 * Author:  Artian Kica, Tom Paolillo
 * Created: Jan 21, 2016
 * Most recent update: Jan 26, 2016
 * Version 1.1
 */
######################################
# .sql File for creating a database  #
# suitable for the lolcrawler MQP.   #
# To be used only when initially     #
# creating the database as running   #
# this will clear all data.          #
######################################

SET foreign_key_checks=0;

DROP TABLE IF EXISTS patch_note;
DROP TABLE IF EXISTS champion;
DROP TABLE IF EXISTS patch;
DROP TABLE IF EXISTS patch_note_type;
DROP TABLE IF EXISTS rate;
DROP TABLE IF EXISTS rate_type;

SET foreign_key_checks=1;

######################################
# TABLE CREATION                     #
######################################
#
######################################
# CREATE TABLE: champion             #
# Note: the id and cname fields are  #
# determined by the Riot API         #
######################################
CREATE TABLE champion(
id int,
picname varchar(255),
cname varchar(255),
PRIMARY KEY (id)
);
######################################
# CREATE TABLE: patch                #
######################################
CREATE TABLE patch(
id int AUTO_INCREMENT,
pname varchar(255),
PRIMARY KEY (id)
);
######################################
# CREATE TABLE: patch_note_type      #
######################################
CREATE TABLE patch_note_type(
id int AUTO_INCREMENT,
type varchar(255),
PRIMARY KEY (id)
);
######################################
# CREATE TABLE: patch_note           #
######################################
CREATE TABLE patch_note(
id int AUTO_INCREMENT,
note TEXT,
champion_id int,
patch_id int,
type_id int,
PRIMARY KEY (id),
FOREIGN KEY (champion_id) REFERENCES champion(id),
FOREIGN KEY (patch_id) REFERENCES patch(id),
FOREIGN KEY (type_id) REFERENCES patch_note_type(id)
);
######################################
# CREATE TABLE: rate_type            #
######################################
CREATE TABLE rate_type(
id int AUTO_INCREMENT,
type varchar(255),
PRIMARY KEY (id)
);
######################################
#  CREATE TABLE: rate                #
######################################
CREATE TABLE rate(
id int AUTO_INCREMENT,
percentage double,
champion_id int,
patch_id int,
type_id int,
PRIMARY KEY (id),
FOREIGN KEY (champion_id) REFERENCES champion(id),
FOREIGN KEY (patch_id) REFERENCES patch(id),
FOREIGN KEY (type_id) REFERENCES rate_type(id)
);
######################################
# INSERTING PATCH NOTE TYPES         #
######################################
INSERT INTO patch_note_type (type) VALUES ('Number buff');
INSERT INTO patch_note_type (type) VALUES ('Number neutral');
INSERT INTO patch_note_type (type) VALUES ('Number nerf');
INSERT INTO patch_note_type (type) VALUES ('Utility buff');
INSERT INTO patch_note_type (type) VALUES ('Utility neutral');
INSERT INTO patch_note_type (type) VALUES ('Utility nerf');
INSERT INTO patch_note_type (type) VALUES ('QoL buff');
INSERT INTO patch_note_type (type) VALUES ('QoL neutral');
INSERT INTO patch_note_type (type) VALUES ('QoL nerf');
INSERT INTO patch_note_type (type) VALUES ('Bug Fix');
INSERT INTO patch_note_type (type) VALUES ('Visual Update');
INSERT INTO patch_note_type (type) VALUES ('Released');


######################################
# INSERTING PATCHES                  #
######################################
INSERT INTO patch (pname) VALUES ('Alpha Week 2');
INSERT INTO patch (pname) VALUES ('Alpha Week 3');
INSERT INTO patch (pname) VALUES ('Alpha Week 4');
INSERT INTO patch (pname) VALUES ('Alpha Week 5');
INSERT INTO patch (pname) VALUES ('Alpha Week 6');
INSERT INTO patch (pname) VALUES ('Alpha Week 7');
INSERT INTO patch (pname) VALUES ('April 11, 2009 Patch');
INSERT INTO patch (pname) VALUES ('April 18, 2009 Patch');
INSERT INTO patch (pname) VALUES ('April 25, 2009 Patch');
INSERT INTO patch (pname) VALUES ('May 1, 2009 Patch');
INSERT INTO patch (pname) VALUES ('May 9, 2009 Patch');
INSERT INTO patch (pname) VALUES ('May 15, 2009 Patch');
INSERT INTO patch (pname) VALUES ('May 23, 2009 Patch');
INSERT INTO patch (pname) VALUES ('May 29, 2009 Patch');
INSERT INTO patch (pname) VALUES ('June 6, 2009 Patch');
INSERT INTO patch (pname) VALUES ('June 12, 2009 Patch');
INSERT INTO patch (pname) VALUES ('June 19, 2009 Patch');
INSERT INTO patch (pname) VALUES ('June 26, 2009 Patch');
INSERT INTO patch (pname) VALUES ('July 10, 2009 Patch');
INSERT INTO patch (pname) VALUES ('V0.8.21.110');
INSERT INTO patch (pname) VALUES ('V0.8.21.115');
INSERT INTO patch (pname) VALUES ('V0.9.22.4');
INSERT INTO patch (pname) VALUES ('V0.9.22.7');
INSERT INTO patch (pname) VALUES ('V0.9.22.9');
INSERT INTO patch (pname) VALUES ('V0.9.22.15');
INSERT INTO patch (pname) VALUES ('V0.9.22.16');
INSERT INTO patch (pname) VALUES ('V0.9.22.18');
INSERT INTO patch (pname) VALUES ('V0.9.25.21');
INSERT INTO patch (pname) VALUES ('V0.9.25.24');
INSERT INTO patch (pname) VALUES ('V0.9.25.34');
INSERT INTO patch (pname) VALUES ('V1.0.0.32');
INSERT INTO patch (pname) VALUES ('V1.0.0.52');
INSERT INTO patch (pname) VALUES ('V1.0.0.58');
INSERT INTO patch (pname) VALUES ('V1.0.0.61');
INSERT INTO patch (pname) VALUES ('V1.0.0.63');
INSERT INTO patch (pname) VALUES ('V1.0.0.70');
INSERT INTO patch (pname) VALUES ('V1.0.0.72');
INSERT INTO patch (pname) VALUES ('V1.0.0.74');
INSERT INTO patch (pname) VALUES ('V1.0.0.75');
INSERT INTO patch (pname) VALUES ('V1.0.0.79');
INSERT INTO patch (pname) VALUES ('V1.0.0.81');
INSERT INTO patch (pname) VALUES ('V1.0.0.82');
INSERT INTO patch (pname) VALUES ('V1.0.0.83');
INSERT INTO patch (pname) VALUES ('V1.0.0.85');
INSERT INTO patch (pname) VALUES ('V1.0.0.86');
INSERT INTO patch (pname) VALUES ('V1.0.0.87');
INSERT INTO patch (pname) VALUES ('V1.0.0.94(b)');
INSERT INTO patch (pname) VALUES ('V1.0.0.94');
INSERT INTO patch (pname) VALUES ('V1.0.0.96');
INSERT INTO patch (pname) VALUES ('V1.0.0.97');
INSERT INTO patch (pname) VALUES ('V1.0.0.98');
INSERT INTO patch (pname) VALUES ('V1.0.0.99');
INSERT INTO patch (pname) VALUES ('V1.0.0.100');
INSERT INTO patch (pname) VALUES ('V1.0.0.101');
INSERT INTO patch (pname) VALUES ('V1.0.0.102');
INSERT INTO patch (pname) VALUES ('V1.0.0.103');
INSERT INTO patch (pname) VALUES ('V1.0.0.104');
INSERT INTO patch (pname) VALUES ('V1.0.0.105');
INSERT INTO patch (pname) VALUES ('V1.0.0.106');
INSERT INTO patch (pname) VALUES ('V1.0.0.107');
INSERT INTO patch (pname) VALUES ('V1.0.0.108');
INSERT INTO patch (pname) VALUES ('V1.0.0.109');
INSERT INTO patch (pname) VALUES ('V1.0.0.110');
INSERT INTO patch (pname) VALUES ('V1.0.0.111');
INSERT INTO patch (pname) VALUES ('V1.0.0.112');
INSERT INTO patch (pname) VALUES ('V1.0.0.113');
INSERT INTO patch (pname) VALUES ('V1.0.0.114');
INSERT INTO patch (pname) VALUES ('V1.0.0.115');
INSERT INTO patch (pname) VALUES ('V1.0.0.116');
INSERT INTO patch (pname) VALUES ('V1.0.0.117');
INSERT INTO patch (pname) VALUES ('V1.0.0.118(b)');
INSERT INTO patch (pname) VALUES ('V1.0.0.118');
INSERT INTO patch (pname) VALUES ('V1.0.0.119');
INSERT INTO patch (pname) VALUES ('V1.0.0.120');
INSERT INTO patch (pname) VALUES ('V1.0.0.121');
INSERT INTO patch (pname) VALUES ('V1.0.0.122');
INSERT INTO patch (pname) VALUES ('V1.0.0.123');
INSERT INTO patch (pname) VALUES ('V1.0.0.124');
INSERT INTO patch (pname) VALUES ('V1.0.0.125');
INSERT INTO patch (pname) VALUES ('V1.0.0.126');
INSERT INTO patch (pname) VALUES ('V1.0.0.127');
INSERT INTO patch (pname) VALUES ('V1.0.0.128');
INSERT INTO patch (pname) VALUES ('V1.0.0.129');
INSERT INTO patch (pname) VALUES ('V1.0.0.130');
INSERT INTO patch (pname) VALUES ('V1.0.0.131');
INSERT INTO patch (pname) VALUES ('V1.0.0.132');
INSERT INTO patch (pname) VALUES ('V1.0.0.133');
INSERT INTO patch (pname) VALUES ('V1.0.0.134');
INSERT INTO patch (pname) VALUES ('V1.0.0.135');
INSERT INTO patch (pname) VALUES ('V1.0.0.136');
INSERT INTO patch (pname) VALUES ('V1.0.0.137');
INSERT INTO patch (pname) VALUES ('V1.0.0.138');
INSERT INTO patch (pname) VALUES ('V1.0.0.139');
INSERT INTO patch (pname) VALUES ('V1.0.0.140(b)');
INSERT INTO patch (pname) VALUES ('V1.0.0.140');
INSERT INTO patch (pname) VALUES ('V1.0.0.141');
INSERT INTO patch (pname) VALUES ('V1.0.0.142');
INSERT INTO patch (pname) VALUES ('V1.0.0.143');
INSERT INTO patch (pname) VALUES ('V1.0.0.144');
INSERT INTO patch (pname) VALUES ('V1.0.0.145');
INSERT INTO patch (pname) VALUES ('V1.0.0.146');
INSERT INTO patch (pname) VALUES ('V1.0.0.147');
INSERT INTO patch (pname) VALUES ('V1.0.0.148');
INSERT INTO patch (pname) VALUES ('V1.0.0.149');
INSERT INTO patch (pname) VALUES ('V1.0.0.150');
INSERT INTO patch (pname) VALUES ('V1.0.0.151');
INSERT INTO patch (pname) VALUES ('V1.0.0.152');
INSERT INTO patch (pname) VALUES ('V1.0.0.153');
INSERT INTO patch (pname) VALUES ('V1.0.0.154');
INSERT INTO patch (pname) VALUES ('V3.01');
INSERT INTO patch (pname) VALUES ('V3.02');
INSERT INTO patch (pname) VALUES ('V3.03');
INSERT INTO patch (pname) VALUES ('V3.04');
INSERT INTO patch (pname) VALUES ('V3.5');
INSERT INTO patch (pname) VALUES ('V3.5(Balance update)');
INSERT INTO patch (pname) VALUES ('V3.6');
INSERT INTO patch (pname) VALUES ('V3.7');
INSERT INTO patch (pname) VALUES ('V3.8');
INSERT INTO patch (pname) VALUES ('V3.9');
INSERT INTO patch (pname) VALUES ('V3.10');
INSERT INTO patch (pname) VALUES ('V3.11');
INSERT INTO patch (pname) VALUES ('V3.12');
INSERT INTO patch (pname) VALUES ('V3.13');
INSERT INTO patch (pname) VALUES ('V3.14');
INSERT INTO patch (pname) VALUES ('V3.15');
INSERT INTO patch (pname) VALUES ('V4.1');
INSERT INTO patch (pname) VALUES ('V4.2');
INSERT INTO patch (pname) VALUES ('V4.3');
INSERT INTO patch (pname) VALUES ('V4.4');
INSERT INTO patch (pname) VALUES ('V4.5');
INSERT INTO patch (pname) VALUES ('V4.6');
INSERT INTO patch (pname) VALUES ('V4.7');
INSERT INTO patch (pname) VALUES ('V4.8');
INSERT INTO patch (pname) VALUES ('V4.9');
INSERT INTO patch (pname) VALUES ('V4.10');
INSERT INTO patch (pname) VALUES ('V4.11');
INSERT INTO patch (pname) VALUES ('V4.12');
INSERT INTO patch (pname) VALUES ('V4.13');
INSERT INTO patch (pname) VALUES ('V4.14');
INSERT INTO patch (pname) VALUES ('V4.15');
INSERT INTO patch (pname) VALUES ('V4.16');
INSERT INTO patch (pname) VALUES ('V4.17');
INSERT INTO patch (pname) VALUES ('V4.18');
INSERT INTO patch (pname) VALUES ('V4.19');
INSERT INTO patch (pname) VALUES ('V4.20');
INSERT INTO patch (pname) VALUES ('V4.21');
INSERT INTO patch (pname) VALUES ('V5.1');
INSERT INTO patch (pname) VALUES ('V5.2');
INSERT INTO patch (pname) VALUES ('V5.3');
INSERT INTO patch (pname) VALUES ('V5.4');
INSERT INTO patch (pname) VALUES ('V5.5');
INSERT INTO patch (pname) VALUES ('V5.6');
INSERT INTO patch (pname) VALUES ('V5.7');
INSERT INTO patch (pname) VALUES ('V5.8');
INSERT INTO patch (pname) VALUES ('V5.9');
INSERT INTO patch (pname) VALUES ('V5.10');
INSERT INTO patch (pname) VALUES ('V5.11');
INSERT INTO patch (pname) VALUES ('V5.12');
INSERT INTO patch (pname) VALUES ('V5.13');
INSERT INTO patch (pname) VALUES ('V5.14');
INSERT INTO patch (pname) VALUES ('V5.15');
INSERT INTO patch (pname) VALUES ('V5.16');
INSERT INTO patch (pname) VALUES ('V5.17');
INSERT INTO patch (pname) VALUES ('V5.18');
INSERT INTO patch (pname) VALUES ('V5.19');
INSERT INTO patch (pname) VALUES ('V5.20');
INSERT INTO patch (pname) VALUES ('V5.21');
INSERT INTO patch (pname) VALUES ('V5.22');
INSERT INTO patch (pname) VALUES ('V5.23');
INSERT INTO patch (pname) VALUES ('V5.24');
INSERT INTO patch (pname) VALUES ('V6.1');
INSERT INTO patch (pname) VALUES ('V6.2');
INSERT INTO patch (pname) VALUES ('V6.3');

######################################
# INSERTING RATE TYPES               #
######################################
INSERT INTO rate_type (type) VALUES ('Win Rate');
INSERT INTO rate_type (type) VALUES ('Pick Rate');
INSERT INTO rate_type (type) VALUES ('Ban Rate');

######################################
# INSERTING CHAMPIONS                #
######################################
INSERT INTO champion (picname, cname, id) VALUES ('Aatrox','Aatrox',266);
INSERT INTO champion (picname, cname, id) VALUES ('Ahri','Ahri',103);
INSERT INTO champion (picname, cname, id) VALUES ('Akali','Akali',84);
INSERT INTO champion (picname, cname, id) VALUES ('Alistar','Alistar',12);
INSERT INTO champion (picname, cname, id) VALUES ('Amumu','Amumu',32);
INSERT INTO champion (picname, cname, id) VALUES ('Anivia','Anivia',34);
INSERT INTO champion (picname, cname, id) VALUES ('Annie','Annie',1);
INSERT INTO champion (picname, cname, id) VALUES ('Ashe','Ashe',22);
INSERT INTO champion (picname, cname, id) VALUES ('Azir','Azir',268);
INSERT INTO champion (picname, cname, id) VALUES ('Bard','Bard',432);
INSERT INTO champion (picname, cname, id) VALUES ('Blitzcrank','Blitzcrank',53);
INSERT INTO champion (picname, cname, id) VALUES ('Brand','Brand',63);
INSERT INTO champion (picname, cname, id) VALUES ('Braum','Braum',201);
INSERT INTO champion (picname, cname, id) VALUES ('Caitlyn','Caitlyn',51);
INSERT INTO champion (picname, cname, id) VALUES ('Cassiopeia','Cassiopeia',69);
INSERT INTO champion (picname, cname, id) VALUES ('Chogath',"Cho'Gath",31);
INSERT INTO champion (picname, cname, id) VALUES ('Corki','Corki',42);
INSERT INTO champion (picname, cname, id) VALUES ('Darius','Darius',122);
INSERT INTO champion (picname, cname, id) VALUES ('Diana','Diana',131);
INSERT INTO champion (picname, cname, id) VALUES ('DrMundo','Dr. Mundo',36);
INSERT INTO champion (picname, cname, id) VALUES ('Draven','Draven',119);
INSERT INTO champion (picname, cname, id) VALUES ('Ekko','Ekko',245);
INSERT INTO champion (picname, cname, id) VALUES ('Elise','Elise',60);
INSERT INTO champion (picname, cname, id) VALUES ('Evelynn','Evelynn',28);
INSERT INTO champion (picname, cname, id) VALUES ('Ezreal','Ezreal',81);
INSERT INTO champion (picname, cname, id) VALUES ('Fiddlesticks','Fiddlesticks',9);
INSERT INTO champion (picname, cname, id) VALUES ('Fiora','Fiora',114);
INSERT INTO champion (picname, cname, id) VALUES ('Fizz','Fizz',105);
INSERT INTO champion (picname, cname, id) VALUES ('Galio','Galio',3);
INSERT INTO champion (picname, cname, id) VALUES ('Gangplank','Gangplank',41);
INSERT INTO champion (picname, cname, id) VALUES ('Garen','Garen',86);
INSERT INTO champion (picname, cname, id) VALUES ('Gnar','Gnar',150);
INSERT INTO champion (picname, cname, id) VALUES ('Gragas','Gragas',79);
INSERT INTO champion (picname, cname, id) VALUES ('Graves','Graves',104);
INSERT INTO champion (picname, cname, id) VALUES ('Hecarim','Hecarim',120);
INSERT INTO champion (picname, cname, id) VALUES ('Heimerdinger','Heimerdinger',74);
INSERT INTO champion (picname, cname, id) VALUES ('Illaoi','Illaoi',420);
INSERT INTO champion (picname, cname, id) VALUES ('Irelia','Irelia',39);
INSERT INTO champion (picname, cname, id) VALUES ('Janna','Janna',40);
INSERT INTO champion (picname, cname, id) VALUES ('JarvanIV','Jarvan IV',59);
INSERT INTO champion (picname, cname, id) VALUES ('Jax','Jax',24);
INSERT INTO champion (picname, cname, id) VALUES ('Jayce','Jayce',126);
INSERT INTO champion (picname, cname, id) VALUES ('Jinx','Jinx',222);
INSERT INTO champion (picname, cname, id) VALUES ('Kalista','Kalista',429);
INSERT INTO champion (picname, cname, id) VALUES ('Karma','Karma',43);
INSERT INTO champion (picname, cname, id) VALUES ('Karthus','Karthus',30);
INSERT INTO champion (picname, cname, id) VALUES ('Kassadin','Kassadin',38);
INSERT INTO champion (picname, cname, id) VALUES ('Katarina','Katarina',55);
INSERT INTO champion (picname, cname, id) VALUES ('Kayle','Kayle',10);
INSERT INTO champion (picname, cname, id) VALUES ('Kennen','Kennen',85);
INSERT INTO champion (picname, cname, id) VALUES ('Khazix',"Kha'Zix",121);
INSERT INTO champion (picname, cname, id) VALUES ('Kindred','Kindred',203);
INSERT INTO champion (picname, cname, id) VALUES ('KogMaw',"Kog'Maw",96);
INSERT INTO champion (picname, cname, id) VALUES ('Leblanc','Leblanc',7);
INSERT INTO champion (picname, cname, id) VALUES ('LeeSin','Lee Sin',64);
INSERT INTO champion (picname, cname, id) VALUES ('Leona','Leona',89);
INSERT INTO champion (picname, cname, id) VALUES ('Lissandra','Lissandra',127);
INSERT INTO champion (picname, cname, id) VALUES ('Lucian','Lucian',236);
INSERT INTO champion (picname, cname, id) VALUES ('Lulu','Lulu',117);
INSERT INTO champion (picname, cname, id) VALUES ('Lux','Lux',99);
INSERT INTO champion (picname, cname, id) VALUES ('Malphite','Malphite',54);
INSERT INTO champion (picname, cname, id) VALUES ('Malzahar','Malzahar',90);
INSERT INTO champion (picname, cname, id) VALUES ('Maokai','Maokai',57);
INSERT INTO champion (picname, cname, id) VALUES ('MasterYi','Master Yi',11);
INSERT INTO champion (picname, cname, id) VALUES ('MissFortune','Miss Fortune',21);
INSERT INTO champion (picname, cname, id) VALUES ('Mordekaiser','Mordekaiser',82);
INSERT INTO champion (picname, cname, id) VALUES ('Morgana','Morgana',25);
INSERT INTO champion (picname, cname, id) VALUES ('Nami','Nami',267);
INSERT INTO champion (picname, cname, id) VALUES ('Nasus','Nasus',75);
INSERT INTO champion (picname, cname, id) VALUES ('Nautilus','Nautilus',111);
INSERT INTO champion (picname, cname, id) VALUES ('Nidalee','Nidalee',76);
INSERT INTO champion (picname, cname, id) VALUES ('Nocturne','Nocturne',56);
INSERT INTO champion (picname, cname, id) VALUES ('Nunu','Nunu',20);
INSERT INTO champion (picname, cname, id) VALUES ('Olaf','Olaf',2);
INSERT INTO champion (picname, cname, id) VALUES ('Orianna','Orianna',61);
INSERT INTO champion (picname, cname, id) VALUES ('Pantheon','Pantheon',80);
INSERT INTO champion (picname, cname, id) VALUES ('Poppy','Poppy',78);
INSERT INTO champion (picname, cname, id) VALUES ('Quinn','Quinn',133);
INSERT INTO champion (picname, cname, id) VALUES ('Rammus','Rammus',33);
INSERT INTO champion (picname, cname, id) VALUES ('RekSai',"Rek'Sai",421);
INSERT INTO champion (picname, cname, id) VALUES ('Renekton','Renekton',58);
INSERT INTO champion (picname, cname, id) VALUES ('Rengar','Rengar',107);
INSERT INTO champion (picname, cname, id) VALUES ('Riven','Riven',92);
INSERT INTO champion (picname, cname, id) VALUES ('Rumble','Rumble',68);
INSERT INTO champion (picname, cname, id) VALUES ('Ryze','Ryze',13);
INSERT INTO champion (picname, cname, id) VALUES ('Sejuani','Sejuani',113);
INSERT INTO champion (picname, cname, id) VALUES ('Shaco','Shaco',35);
INSERT INTO champion (picname, cname, id) VALUES ('Shen','Shen',98);
INSERT INTO champion (picname, cname, id) VALUES ('Shyvana','Shyvana',102);
INSERT INTO champion (picname, cname, id) VALUES ('Singed','Singed',27);
INSERT INTO champion (picname, cname, id) VALUES ('Sion','Sion',14);
INSERT INTO champion (picname, cname, id) VALUES ('Sivir','Sivir',15);
INSERT INTO champion (picname, cname, id) VALUES ('Skarner','Skarner',72);
INSERT INTO champion (picname, cname, id) VALUES ('Sona','Sona',37);
INSERT INTO champion (picname, cname, id) VALUES ('Soraka','Soraka',16);
INSERT INTO champion (picname, cname, id) VALUES ('Swain','Swain',50);
INSERT INTO champion (picname, cname, id) VALUES ('Syndra','Syndra',134);
INSERT INTO champion (picname, cname, id) VALUES ('TahmKench','Tahm Kench',223);
INSERT INTO champion (picname, cname, id) VALUES ('Talon','Talon',91);
INSERT INTO champion (picname, cname, id) VALUES ('Taric','Taric',44);
INSERT INTO champion (picname, cname, id) VALUES ('Teemo','Teemo',17);
INSERT INTO champion (picname, cname, id) VALUES ('Thresh','Thresh',412);
INSERT INTO champion (picname, cname, id) VALUES ('Tristana','Tristana',18);
INSERT INTO champion (picname, cname, id) VALUES ('Trundle','Trundle',48);
INSERT INTO champion (picname, cname, id) VALUES ('Tryndamere','Tryndamere',23);
INSERT INTO champion (picname, cname, id) VALUES ('TwistedFate','Twisted Fate',4);
INSERT INTO champion (picname, cname, id) VALUES ('Twitch','Twitch',29);
INSERT INTO champion (picname, cname, id) VALUES ('Udyr','Udyr',77);
INSERT INTO champion (picname, cname, id) VALUES ('Urgot','Urgot',6);
INSERT INTO champion (picname, cname, id) VALUES ('Varus','Varus',110);
INSERT INTO champion (picname, cname, id) VALUES ('Vayne','Vayne',67);
INSERT INTO champion (picname, cname, id) VALUES ('Veigar','Veigar',45);
INSERT INTO champion (picname, cname, id) VALUES ('VelKoz',"Vel'koz",161);
INSERT INTO champion (picname, cname, id) VALUES ('Vi','Vi',254);
INSERT INTO champion (picname, cname, id) VALUES ('Viktor','Viktor',112);
INSERT INTO champion (picname, cname, id) VALUES ('Vladimir','Vladimir',8);
INSERT INTO champion (picname, cname, id) VALUES ('Volibear','Volibear',106);
INSERT INTO champion (picname, cname, id) VALUES ('Warwick','Warwick',19);
INSERT INTO champion (picname, cname, id) VALUES ('Wukong','Wukong',62);
INSERT INTO champion (picname, cname, id) VALUES ('Xerath','Xerath',101);
INSERT INTO champion (picname, cname, id) VALUES ('XinZhao','Xin Zhao',5);
INSERT INTO champion (picname, cname, id) VALUES ('Yasuo','Yasuo',157);
INSERT INTO champion (picname, cname, id) VALUES ('Yorick','Yorick',83);
INSERT INTO champion (picname, cname, id) VALUES ('Zac','Zac',154);
INSERT INTO champion (picname, cname, id) VALUES ('Zed','Zed',238);
INSERT INTO champion (picname, cname, id) VALUES ('Ziggs','Ziggs',115);
INSERT INTO champion (picname, cname, id) VALUES ('Zilean','Zilean',26);
INSERT INTO champion (picname, cname, id) VALUES ('Zyra','Zyra',143);















