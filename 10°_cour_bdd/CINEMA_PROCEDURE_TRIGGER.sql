use cinema;
select getPriceTotal(2);
select * from tarif;

insert into tarif values (0,"std",10);

select  getPriceTotal(tarif.prix,3) from tarif;


#REQUETE A METTRE DANS MA PROCEDURE
select   CalculPrice(qte, prix, supplement, premium) as PrixTotal from lignes_ticket 
inner join tarif on lignes_ticket.id_tarif=tarif.id
inner join type_projection on lignes_ticket.id_proj=type_projection.id
inner join abonne on lignes_ticket.id_abo=abonne.id;

select * from ticket;
select * from abonne;
select * from lignes_ticket;
insert into lignes_ticket values (0,3,1,2,1,1,1,10,2);
select * from ticket;
insert into ticket values (0,now(),1,1,0,1);
SELECT * from tarif;

 SET FOREIGN_KEY_CHECKS = 1;

 

set sql_safe_updates = 0;
 
select * from tarif;
select * from abonne;

select CalculPrice(1,10,2,1);
#Procedure
select UpdatePriceTotal;

drop trigger tr_prix_tot;

#Trigger
CREATE TRIGGER tr_prix_tot
after insert on lignes_ticket
for each row update ticket
set prix_total = (
select   sum(CalculPrice(qte, prix, supplement, premium)) as PrixTotal from lignes_ticket 
inner join tarif on lignes_ticket.id_tarif=tarif.id
inner join type_projection on lignes_ticket.id_proj=type_projection.id
left join abonne on lignes_ticket.id_abo=abonne.id
group by lignes_ticket.id_ticket
);

select lignes_ticket.id_ticket,  sum(CalculPrice(qte, prix, supplement, premium)) as PrixTotal from lignes_ticket 
inner join tarif on lignes_ticket.id_tarif=tarif.id
inner join type_projection on lignes_ticket.id_proj=type_projection.id
left join abonne on lignes_ticket.id_abo=abonne.id
group by lignes_ticket.id_ticket
;

CREATE TRIGGER tr_prix_tot
after insert on lignes_ticket
for each row
call UpdatePriceTotal();


CREATE TRIGGER tr_prix_tot2
after update on lignes_ticket
for each row
call UpdatePriceTotal();



call UpdatePriceTotal;

select * from lignes_ticket
select * from ticket