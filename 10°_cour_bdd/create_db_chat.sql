 
 drop database chat;
 create database Chat;
 SET DEFAULT_STORAGE_ENGINE=INNODB;
 SET FOREIGN_KEY_CHECKS = 1;
 use Chat;
 SELECT * from Pers;
 
 #Table Pers
 create table Pers(
id int PRIMARY KEY AUTO_INCREMENT  NOT NULL,
nom VARCHAR(50) NOT NULL,
pseudo VARCHAR(50) NOT NULL UNIQUE,
mdp VARCHAR(50) NOT NULL,
statut VARCHAR(50) NOT NULL,
mail VARCHAR(100) NOT NULL UNIQUE,
avatar VARCHAR(50) NOT NULL);

#Table Room
create table Room(
id int PRIMARY KEY AUTO_INCREMENT  NOT NULL,
nom VARCHAR(50) NOT NULL
);
alter table Participants
ADD CONSTRAINT UQ_participantscouple UNIQUE (idpers, idroom)
;

drop table Participants;

#Table participants
create table Participants(
idpers int not null,
CONSTRAINT FK_idpers_participants FOREIGN KEY (idpers) REFERENCES Pers(id),
idroom int not null,
CONSTRAINT FK_idroom_participants FOREIGN KEY (idroom) REFERENCES Room(id)
);

#Table Message
create table Messages(
id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
idpers int NOT NULL,
CONSTRAINT FK_id_persparticipant_messages FOREIGN KEY (idpers) REFERENCES Participants(idpers),
idroom int NOT NULL,
CONSTRAINT FK_idroomparticipant_messages FOREIGN KEY (idroom) REFERENCES Participants(idroom),
message text,
datemessage datetime default now()  NOT NULL 
);
drop table PrivateMsg;

alter table Messages
modify column datemessage datetime default now() NOT NULL;

#Table MessagePrive
create table PrivateMsg(
id int PRIMARY KEY AUTO_INCREMENT  NOT NULL,
idpers int NOT NULL,
CONSTRAINT FK_idpers_privatemessage FOREIGN KEY (idpers) REFERENCES Pers(id),
iddest int NOT NULL,
CONSTRAINT FK_iddest_privatemessage FOREIGN KEY (iddest) REFERENCES Pers(id),
message text,
senddate datetime default now() NOT NULL
);
select * from Messages;


drop table Messages;
drop table PrivateMsg;

 