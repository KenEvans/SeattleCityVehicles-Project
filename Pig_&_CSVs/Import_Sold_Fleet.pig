
A = LOAD 'Sold_Fleet_Equipment.csv' USING PigStorage(',') 
AS (EQUIP_ID:chararray, YEAR:int, MAKE:chararray, MODEL:chararray, DESCRIPTION:chararray, DEPT:chararray, SALE_PRICE:float, SALE_DATE:chararray, SOLD_BY:chararray, VIN:chararray, Equipment_Type:chararray, Asset_Weight_Category:chararray, System_Group:chararray, Fuel_Type:chararray);

B = FILTER A BY Fuel_Type != 'NON';

C = FILTER B BY Fuel_Type != 'ERROR: #N/A';

D = FILTER C BY Equipment_Type != 'TRAILER';

E = FILTER D BY SALE_PRICE > 100.0;

F = FOREACH E GENERATE YEAR, MAKE, MODEL, DESCRIPTION, DEPT, SALE_PRICE, SALE_DATE, Equipment_Type, Fuel_Type;

Fuel1 = GROUP F BY Fuel_Type;

Fuel2 = RANK Fuel1;

Fuel3 = FOREACH Fuel2 GENERATE $0, FLATTEN ($2);

Fuel4 = FOREACH Fuel3 GENERATE $1 AS YEAR, $2 AS MAKE, $3 AS MODEL, $4 AS DESCRIPTION, $5 AS DEPT, $6 AS SALE_PRICE, $7 AS SALE_DATE, $8 AS Equipment_Type, (INT)$0 AS FuelTypeID, $9 AS Fuel_Type;

Dept1 = GROUP Fuel4 BY DEPT;

Dept2 = RANK Dept1;

Dept3 = FOREACH Dept2 GENERATE $0, FLATTEN ($2);

Dept4 = FOREACH Dept3 GENERATE $1 AS YEAR, $2 AS MAKE, $3 AS MODEL, $4 AS DESCRIPTION, (INT)$0 AS DeptID, $5 AS DEPT, $6 AS SALE_PRICE, $7 AS SALE_DATE, $8 AS Equipment_Type, $9 AS FuelTypeID, $10 AS Fuel_Type;

Make1 = GROUP Dept4 BY MAKE;

Make2 = RANK Make1;

Make3 = FOREACH Make2 GENERATE $0, FLATTEN ($2);

Done = FOREACH Make3 GENERATE $1 AS YEAR, (INT)$0 AS MakeID, $2 AS MAKE, $3 AS MODEL, $4 AS DESCRIPTION, $5 AS DeptID, $6 AS DEPT, $7 AS SALE_PRICE, $8 AS SALE_DATE, $9 AS Equipment_Type, $10 AS FuelTypeID, $11 AS Fuel_Type;

FuelTypeSubSet = FOREACH Done GENERATE FuelTypeID, Fuel_Type;

FuelTypeOutPut = DISTINCT FuelTypeSubSet;

STORE FuelTypeOutPut INTO 'FuelOutput/' USING PigStorage(',');

DeptSubSet = FOREACH Done GENERATE DeptID, DEPT;

DeptOutPut = DISTINCT DeptSubSet;

STORE DeptOutPut INTO 'DeptOutput/' USING PigStorage(',');

MakeSubSet = FOREACH Done GENERATE MakeID, MAKE;

MakeOutPut = DISTINCT MakeSubSet;

STORE MakeOutPut INTO 'MakeOutput/' USING PigStorage(',');

SoldFleetSubSet = FOREACH Done GENERATE YEAR, MakeID, MODEL, DESCRIPTION, DeptID, SALE_PRICE, SALE_DATE, Equipment_Type, FuelTypeID;

SoldFleetOutPut = DISTINCT SoldFleetSubSet;

STORE SoldFleetOutPut INTO 'SoldFleetOutput/' USING PigStorage(',');

STORE Done INTO 'DoneOutput/' USING PigStorage(',');

--DUMP Done;

--DESCRIBE Done;
