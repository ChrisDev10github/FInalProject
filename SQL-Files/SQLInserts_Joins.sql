--Inserts
--Fix Column Names


insert into DisasterData (SBAPhysical, SBAEIDL, SBADisaster)
select distinct [SBA Physical Declaration Number], [SBA EIDL Declaration Number], [SBA Disaster Number]
from NonNormalizedData

insert into LocationData (County, StateName)
select distinct County, State --Need the destinct combination
from NonNormalizedData

insert into PredictorData (DisasterId, CensusID, LocationID, Year, UnemploymentRate, SP500, LoanMinusLoss, VerifiedLossRealEstate, VerifiedLossContent, AmountApprovedRealEstate, ApprovedAmountEIDL, PropertyTax, TotalSalariesWages, InterestRevenue, FinesForfeits)
select DisasterData.DisasterID, LocationData.LocationId, Year, Unemployement, [Market Value], [Verified LossReal Estate], [Verified Loss Content], [Approved Amount Real Estate], [Approved Amount EIDL], [Property Tax], [Total Salaries & Wages],  [Interest Revenue], [Fines and Forfeits] 
from NonNormalizedData as f 
join DisasterData on f.[SBA Disaster Number] = DisasterData.SBADisaster
join LocationData on f.County = LocationData.County --Modify for County + Sate

--May need to test Join statements