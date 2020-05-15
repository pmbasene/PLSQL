drop table fournisseur;
drop table Client;

Create table fournisseur ( id_f  integer , 
							nom_piece  varchar2(30), 
							type_piece varchar2(30), 
							prix_unite number(10,2) ,
Constraint pk_fornisseur primary key (id_f)
) ;

Create table Client (id_c  integer ,	
					nom varchar2(30) , 
					prenom varchar2(30) , 
					prix_total number(10,2) ,
					quantitie number(5) , 
					nom_piece varchar2(30) , 
					id_f   integer ,
CONSTRAINT fk_forni_client  FOREIGN KEY (id_f) REFERENCES fournisseur(id_f)
);

drop table produit;
drop table produit2000;
create table produit ( numprod integer not null,
		       desi varchar2(30),
		     prixuni number(10,2),
		   numfour integer ) ;

create table produit2000 ( numprod integer not null,
		       desi varchar2(30),
		     prixuni number(10,2),
		   numfour integer ) ;


--- DATA
INSERT INTO FOURNISSEUR (id_f, nom_piece, type_piece, prix_unite)
VALUES
  (1, 'Scarabero', 'Moto', '1962'),
  (2, 'Renault', 'Auto', '1776'),
  (3, 'Levier', 'Plombier', '1184'),
  (4, 'vis', 'Accessoire', '1564'),
  (5, 'Boeing', 'Avion', '1354'),
  (6, 'Gilera', 'Moto', '1798'),
  (7, 'Marteau', 'Accessoire', '1546'),
  (8, 'Easy', 'Avion', '1528');
 

 insert into CLIENT values 
(1,'sene', 'baba', 34200, 31, 'Scarabero', 1)
(2,'youri', 'armand', 12300, 5, 'Renault', 2)
(3,'ismael', 'nesk', 43340, 8, 'Scarabero', 1)
(1,'fall', 'basene', 5000, 3, 'Levier', 3)
(1,'gueye', 'Khalil', 2000, 3, 'Gilera', 6)
(1,'sene', 'Aliou', 2000, 3, 'Renault', 2);

--- SOLUTION SCRIPT

set SERVEROUTPUT ON;
  ACCEPT indent_c number prompt 'Donner le id client';
  ACCEPT nm       char   prompt 'Donner le nom client';
  ACCEPT pr       char   prompt 'Donner le prenom client';
  ACCEPT prix_tt  number prompt 'Donner le prix total';
  ACCEPT qte      number prompt 'Donner la quantite';
  ACCEPT nom_piece char  prompt 'Donner le nom de la piece';
  ACCEPT indent_f number prompt 'Donner le id de la piece referant';

declare 
  v_indent_c  number ;
  v_nm        varchar(20)  ;
  v_pr        varchar(20)  ;
  v_prix_tt   number;
  v_qte       number;
  v_nom_piece varchar(20) ;
  v_indent_f  number;

vcur_nom_piece varchar(20);
cursor c1 is 
      select nom_piece 
      from fournisseur 
        where prix_unite < 10000;
begin

    v_indent_c  := &indent_c ;
    v_nm        := '&nm'       ;
    v_pr        := '&pr'       ;
    v_prix_tt   := &prix_tt  ;
    v_qte       := &qte      ;
    v_nom_piece := '&nom_piece';
    v_indent_f  := &indent_f ;

    open c1 ;
    loop
    fetch c1 into vcur_nom_piece;   
        if v_nom_piece = vcur_nom_piece THEN     
         INSERT INTO client values (v_indent_c, v_nm, v_pr, v_prix_tt, v_qte, v_nom_piece, v_indent_f) ;
            dbms_output.put_line(vcur_nom_piece);
            DBMS_OUTPUT.PUT_LINE(' Donneée sauvergadé');
        end if;
    exit when c1%NOTFOUND ;
    end loop;
close c1;
end;