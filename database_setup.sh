
# First Download and Install postgres/pgadmin and put into Sys-path



# Start postgres as superuser (on Windows as admin?)
sudo -u postgres psql 

# Create DB
postgres=# CREATE DATABASE db_ue_1;

# Create User 
postgres=# CREATE USER pezzi WITH ENCRYPTED PASSWORD 'postgres'; 
postgres=# GRANT ALL PRIVILEGES ON DATABASE db_ue_1 TO pezzi;
postgres=# ALTER USER pezzi WITH SUPERUSER;

# noch einmal (sicherheitshalber) in SQL selbst (müsste über pgadmin gehen)
CREATE DATABASE db_ue_1;
CREATE USER pezzi WITH ENCRYPTED PASSWORD 'postgres';
GRANT ALL PRIVILEGES ON DATABASE db_ue_1 TO pezzi;
ALTER USER pezzi WITH SUPERUSER;

# Alter pg_hba.conf to allow for pezzi to have pw-authentification


# impf.csv: Encoding Win-1252; Semicolon separated
# first: recode data in nicer format (long format; three columns only)
# -> R-Script 

# in shell # Ausführen des sql-Import-Codes - VORSICHT: PFAD ANPASSEN 
psql -U pezzi -d db_ue_1 -a -f create_and_import.sql





