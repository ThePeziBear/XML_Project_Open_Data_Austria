# Python script 
# File: exist_DB_query.py
# Author: Christian Brandstätter 
# Contact: bran.chri@gmail.com
# Date: 18.03.2020
# Copyright (C) 2020
# Description: Extract Data from exist DB and save to excel 

# import pyexistdb
from pyexistdb import db
import pandas as pd 
import xml.etree.ElementTree as etree

# docs:
# https://pyexistdb.readthedocs.io/en/latest/existdb.html#module-pyexistdb.db

# query existdb 
exdb = pyexistdb.db.ExistDB("http://127.0.0.1:8080/exist", username = "admin", password = "admin")

# retrieve table 
impf_table = exdb.getDocument("result_text2.xml")

# Convert query result to element-tree
root = etree.fromstring(impf_table)

# convert etree to dataframe 
columns = ["Impfung", "Jahr", "Anzahl"]
dframe = pd.DataFrame(columns = columns)

for child in root:
    impf = child[0].text
    jahr = child[1].text
    anz = child[2].text

    dframe = dframe.append(pd.Series([impf, jahr, anz], index = columns),
                                   ignore_index = True)

# export 
dframe.to_excel("./Impfung_dataframe.xlsx")
