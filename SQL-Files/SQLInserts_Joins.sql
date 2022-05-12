use DisUnemp;
go

--Inserts
--Change all filenames to name of raw imported table
--Add Sensus Data Column Names

insert into SensusData (column1, column2, column3, column4)
select distinct Category
from [filename]

insert into DisasterData (SBAPhysical, SBAEIDL, SBADisaster)
select distinct SBAPhysical, SBAEIDL, SBADisaster
from [filename]

insert into LocationData (County, Statename )
select distinct County, Statename
from [filename]

insert into PredictorData (DisasterId, SensusID, LocationID, Year, UnemployementRate, SP500, LoanMinusLoss, VerifiedLossRealEstate, VerifiedLossContent, AmountApprovedRealEstate, ApprovedAmountEIDL)
select DisasterData.DisasterID, SensusData.SensusID, LocationData.LocationId, Year, UnemployementRate, SP500, LoanMinusLoss, VerifiedLossRealEstate, VerifiedLossContent, AmountApprovedRealEstate, ApprovedAmountEIDL
from [filename] as f 
join DisasterData on f.SBADisaster = DisasterData.SBADisaster
left join LocationData on f.County = LocationData.County
join SensusData on f.column1 = SensusData.column1

--May need to test Join statements