#!/bin/bash
echo "***************************************"
echo "Originially written: 10-30-2020"
echo "***************************************"
database=CC_DB_SEOC_TEST
password=Passw0rd
wait_time=15s

# wait for SQL Server to come up
echo creating DB will start in $wait_time...
sleep $wait_time
echo Creating...

# run the init script to create CC_DB_SEOC_TEST
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i ./init.sql

# run the create tables in /table
echo Creating tables...
for entry in "scripts/*.sql"
do
  echo executing $entry
  /opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P $password -i $entry
done

# import the data from the csv files
for entry in "data/*.csv"
do
  # i.e: transform /data/MyTable.csv to MyTable
  shortname=$(echo $entry | cut -f 1 -d '.' | cut -f 2 -d '/')
  tableName=$database.dbo.$shortname
  echo importing $tableName from $entry
  /opt/mssql-tools/bin/bcp $tableName in $entry -c -t',' -F 2 -S 0.0.0.0 -U sa -P $password
done