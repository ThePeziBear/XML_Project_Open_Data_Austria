-- SQL script 
-- File: create_and_import.sql
-- Author: Christian Brandstätter 
-- Contact: bran.chri@gmail.com
-- Date:  3.03.2020
-- Copyright (C) 2020
-- Description: SQL-Script zum Erstellen der Tabelle und Importieren der Daten. 

CREATE TABLE impfung
(
  id serial PRIMARY KEY,
  Impfung character varying(100),
  Jahr smallint,
  Anzahl Integer
);

COPY impfung(Impfung, Jahr, Anzahl) 
-- PFAD ANPASSEN 
FROM '/home/christian/wd/fhwn/db_systeme/XML_Project_Open_Data_Austria/Impfung_Recode.csv' DELIMITER ',' CSV HEADER;


