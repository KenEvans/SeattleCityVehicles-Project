
A = LOAD 'Active_PHEVs.csv' USING PigStorage(',') 
AS (EquipID:chararray, License:chararray, Year:int, Make:chararray, Model:chararray, Description:chararray, Dept:chararray, InServiceDate:chararray, Estimated_Replacement_Year:int, Equipment_Type:chararray, InServiceCost:float);

B = FILTER A BY InServiceCost > 0.0;

C = FILTER B BY Dept != 'OEM';

D = FOREACH C GENERATE Year, Make, Model, Description, Dept, InServiceDate, Estimated_Replacement_Year, Equipment_Type, InServiceCost, 4 AS FuelTypeID;

E = FOREACH D GENERATE Year, (CASE Make WHEN 'FORD' THEN 3
										WHEN 'CHEVROLET' THEN 36
										WHEN 'PETERBILT' THEN 37
										WHEN 'CHRYSLER' THEN 53
										WHEN 'MITSUBISHI' THEN 54 END) AS MakeID, Model, Description, Dept, InServiceDate, Estimated_Replacement_Year, Equipment_Type, InServiceCost, FuelTypeID;

ActivePHEVOutPut = FOREACH E GENERATE Year, MakeID, Model, Description, (CASE Dept WHEN 'DPR' THEN 4
																				   WHEN 'FAS' THEN 5
																				   WHEN 'SFD' THEN 8
																				   WHEN 'SPD' THEN 9
																				   WHEN 'SPU' THEN 11
																				   WHEN 'SDCI' THEN 12
																				   WHEN 'SDOT' THEN 13
																				   WHEN 'SCL' THEN 14 END) AS DeptID, InServiceDate, Estimated_Replacement_Year, Equipment_Type, InServiceCost, FuelTypeID;

STORE ActivePHEVOutPut INTO 'ActivePHEVOutPut/' USING PigStorage(',');

--DUMP ActivePHEVOutPut;

--DESCRIBE ActivePHEVOutPut;
