--use master; 
--go
--drop database if exists DisasterUnemployment;
--go
--create database DisasterUnemployment;
--go
--use DisasterUnemployment;
--go
--drop table if exists DisasterData
--drop table if exists LocationData
--drop table if exists PredictorData


create table DisasterData (

    DisasterId    int primary key identity(1, 1),
    SBAPhysical      float null,  
    SBAEIDL      float null,  
    SBADisaster      varchar(50) not null,  
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
    DisasterId       int not null,
    LocationId    int null,
    Year     float not null, 
    UnemploymentRate       float not null,
    MarketValue    float not null,
    VerifiedLossRealEstate float not null ,
    VerifiedLossContent float not null , 
    ApprovedAmountRealEstate float not null , 
    ApprovedAmountEIDL float not null ,  
    ApprovedAmountContent float not null ,
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