use master; 
go
drop database if exists DisasterUnemployment;
go
create database DisasterUnemployment;
go
use DisasterUnemployment;
go

create table DisasterData (

    DisasterId    int primary key identity(1, 1),
    SBAPhysical      int null,
    SBAEIDL      int null,
    SBADisaster      int null,
    constraint uq_SBADisaster
        unique (SBADisaster),
);


create table LocationData (
    LocationId     int primary key identity(1, 1),
    County       varchar(100) not null,    
    StateName    varchar(100) not null,

);

create table PredictorData (
    PlaceTimeId     int primary key identity(1, 1),
    CensusId     int not null,
    DisasterId       int not null,
    LocationId    int null,
    Year     int not null,
    UnemploymentRate       float not null,
    MarketValue    float not null,
    LoanMinusLoss    float null,
    VerifiedLossRealEstate float not null ,
    VerifiedLossContent float not null , 
    AmountApprovedRealEstate float not null , 
    ApprovedAmountEIDL float not null ,  
    PropertyTax float not null,
    TotalSalariesWages float not null,
    InterestRevenue float not null,
    FinesForfeits float not null
    constraint fk_DisasterId
        foreign key (DisasterId)
        references DisasterData(DisasterId),
    constraint fk_LocationId
        foreign key (LocationId)
        references LocationData(LocationId)
);