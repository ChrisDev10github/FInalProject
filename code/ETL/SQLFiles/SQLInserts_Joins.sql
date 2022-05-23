--Inserts

insert into DisasterData (SBAPhysical, SBAEIDL, SBADisaster)
select distinct [SBA Physical Declaration Number], [SBA EIDL Declaration Number], [SBA Disaster Number]
from NonNormalizedData

insert into LocationData (County, StateName)
select distinct County, [State] 
from NonNormalizedData

insert into PredictorData (DisasterId, LocationID, Year, UnemploymentRate, MarketValue, VerifiedLossRealEstate, VerifiedLossContent, AmountApprovedRealEstate, ApprovedAmountEIDL, PropertyTax, TotalSalariesWages, InterestRevenue, FinesForfeits, ApprovedAmountContent)
select DisasterData.DisasterID, LocationData.LocationId, Year, Unemployement, [Market Value], [Verified Loss Real Estate], [Verified Loss Content], [Approved Amount Real Estate], [Approved Amount EIDL], [Property Tax], [Total Salaries & Wages],  [Interest Revenue], [Fines and Forfeits], [Approved Amount Content] 
from NonNormalizedData as f 
join DisasterData on f.[SBA Disaster Number] = DisasterData.SBADisaster
join LocationData on f.County = LocationData.County and f.State = LocationData.StateName --Modify for County + Sate

--May need to test Join statements