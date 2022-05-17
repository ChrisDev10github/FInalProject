use DisasterUnemployment;
go

--Inserts
--Change all filenames to name of raw imported table
--Add Census Data Column Names


insert into DisasterData (SBAPhysical, SBAEIDL, SBADisaster)
select distinct SBAPhysical, SBAEIDL, SBADisaster
from [filename]

insert into LocationData (County, Statename )
select distinct County, Statename --Need the destinct combination
from [filename]

insert into PredictorData (DisasterId, CensusID, LocationID, Year, UnemployementRate, SP500, LoanMinusLoss, VerifiedLossRealEstate, VerifiedLossContent, AmountApprovedRealEstate, ApprovedAmountEIDL, PropertyTax, TotalSalariesWages, InterestRevenue, FinesForfeits)
select DisasterData.DisasterID, LocationData.LocationId, Year, UnemployementRate, SP500, LoanMinusLoss, VerifiedLossRealEstate, VerifiedLossContent, AmountApprovedRealEstate, ApprovedAmountEIDL, PropertyTax, TotalSalariesWages,  InterestRevenue, FinesForfeits --VERIFY All column and table names
from [filename] as f 
join DisasterData on f.SBADisaster = DisasterData.SBADisaster
join LocationData on f.County = LocationData.County --Modify for County + Sate

--May need to test Join statements