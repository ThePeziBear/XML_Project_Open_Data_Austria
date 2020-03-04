psql -U postgres
Test

CREATE DATABASE XMLP WITH ENCODING 'UTF8' LC_COLLATE='German_Germany' LC_CTYPE='German_Germany';

CREATE TABLE impf (id serial PRIMARY KEY, impfung character varying(100), jahr smallint, anzahl Integer);

SELECT * FROM impf;

COPY impf(impfung, jahr, anzahl) FROM 'C:/Users/Dell/Github/XML_Projekt/Impfung_Recode.csv' DELIMITER ',' CSV Header;
