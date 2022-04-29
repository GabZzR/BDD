create database myfirst_sql;
use myfirst_sql;
create table infos(
nom varchar(120),
prenom varchar(120),
date_naissance date
);
insert into infos(nom,prenom,date_naissance)
values  ("Boubi","Night","1984/05/02"),
		("Rambo","John","1969/08/03"),
		("Mitchum","Robert","1942/01/01");
        
        select * from infos; 

select nom,date_naissance from infos;

select 
* 
from infos 
where nom = "Rambo";

select 
* 
from infos 
where nom = "Rambo" or nom = "Mitchum" ;

select 
* 
from infos 
where nom in ("Rambo","Mitchum");

insert into infos(nom,prenom)
values  ("Mitchum Rambo","John"),
		("Rambo Mitchum","Robert");
        
select * from infos where nom like "Mitchum%";

select * from infos where nom like "%Mitchum";

select * from infos where nom like "%Mitchum%";


select 
concat(nom,space(1),prenom) as "Nom",
date_naissance as "Naissance",
year(curdate())-year(date_naissance) as "Age",
floor(datediff(curdate(),date_naissance) / 365.25)as "Age2",
timestampdiff(year,date_naissance,now()) as "Age3"
from infos;

select count(*) from infos
where (nom is not null) and (prenom is not null);

select * from infos order by 1,2 desc;

create table new_infos( id_infos int auto_increment primary key,
nom varchar(60),
prenom varchar(60),
date_naiss date,
email varchar(255),
cp varchar(5),
tel varchar(10));