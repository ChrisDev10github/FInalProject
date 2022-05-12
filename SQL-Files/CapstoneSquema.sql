use master; 
go
drop database if exists DisUnemp;
go
create database DisUnemp;
go
use DisUnemp;
go

create table CensusData (
    CensusId    int primary key identity(1, 1),
    Colmun1      varchar(50) not null,
    Colmun2      varchar(50) not null,
    Colmun3      varchar(50) not null,
    Colmun4      varchar(50) not null,
);


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
    UnemployementRate       float not null,
    SP500    float not null,
    LoanMinusLoss    float null,
    VerifiedLossRealEstate float null ,
    VerifiedLossContent float null , 
    AmountApprovedRealEstate float null , 
    ApprovedAmountEIDL float null ,  
    constraint fk_CensusId
        foreign key (CensusId)
        references CensusData(CensusId),
    constraint fk_DisasterId
        foreign key (DisasterId)
        references DisasterData(DisasterId),
    constraint fk_LocationId
        foreign key (LocationId)
        references LocationData(LocationId)
);