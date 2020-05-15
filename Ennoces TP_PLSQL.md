# PLSQL TRAINING

## TD 1 PLSQ

### TD 1 EX 1

1. Réalisez un programme PLSQL qui remplit correctement la colonne NOM_PIECE de clients par rapport à la table fournisseurs. 
2. Réalisez un programme PLSQL qui met à jour tous les prix de la table clients.

*Model* :  

Client ( id_c , nom , prenom , prix_total, quantitie , nom_piece , id_f ) 
Fournisseur( id_f, nom_piece, type, prix_unite)

```sql
Create table fournisseur ( 
id_f  integer , nom_piece  varchar2(30),
type_piece varchar2(30), prix_unite number(10,2),
Constraint pk_fornisseur primary key (id_f) );

Create table Client (id_c  integer , nom varchar2(30) ,
prenom varchar2(30) , prix_total number(10,2) ,
quantitie number(5) , nom_piece varchar2(30) ,
id_f   integer,
CONSTRAINT fk_forni_client FOREIGN KEY (id_f) REFERENCES fournisseur(id_f));
```

### TD 1 EX 2

2001, il est temps de passer à l’Euro pour l’entreprise de VPC dont la base de données CLIENTCOMMANDE-PRODUIT-FOURNISSEUR.  
Écrire un programme  PL/SQL permettant de construire, à partir de la table PRODUIT, une table PRODUIT2000 telle que : le prix unitaire en francs des produits soit converti en Euros. Le prix en Euros devra être entier (arrondir au supérieur). 
 
Cas particuliers à traiter : 
Si la table PRODUIT est vide, la table PRODUIT2000 devra contenir uniquement le tuple (0,’Pas de produit’, NULL, NULL). Si un prix de la table produit est NULL, son prix en Euros doit être 0.

*Indications*:

produit (numprod, desi, prixuni, numfour)

```sql
create table produit (
numprod integer not null,
desi varchar2(30),
prixuni number(10,2),
numfour integer ) ;
 
create table produit2000 ( numprod integer not null,
desi varchar2(30),
prixuni number(10,2),
numfour integer ) ;
```

Considérer que la structure de la table PRODUIT2000 a déjà été créée. Tester si la table PRODUIT est vide. Si ce n’est pas le cas, y accéder séquentiellement à l’aide d’un curseur, effectuer les transformations sur les champs et stocker le résultat dans la table PRODUIT2000.Taux l’échange de  francs est : 1 euros ---------- 6.5 francs

## TD 2 PLSQ

### TD 2 EX 1

Ecrire une fonction qui met une chaîne en minuscule, sauf la première lettre qui sera en Majuscule. 2) Utiliser la fonction précédente pour afficher les noms et les prénoms des adhérents de la BD. 3) Ecrire une fonction qui calcule, pour un adhérent donné, le nombre de jours restant avant D’être en retard. Si l’adhérent n’a pas d’emprunts en cours, on renvoie NULL. Si l’adhérent Est en retard, on renvoie un résultat négatif.

### TD 2 EX 2

CLIENT ( numcli, nomcli, prenomcli , adresse, tel) ; 
PERSONNEL ( numpers, nompers, prenompers, manager, salaire) ; 
TYPECCL (numtypeccl, nomtypeccl) ; 
COMPTECLIENT (numcl, numccl, numtypeccl, dateccl, numpers) ; 
TYPEOPERATION (numtypeoper, nomtypeoper) ; 
OPERATION (numcl, numccl, numoper, numtypeoper, dateoper , montantoper, libeloper) . 
 
Écrire une procédure qui affiche tous les clients, et pour chaque client, la liste des comptes, et pour chacun de ces Comptes, l'historique des opérations.



### TD 2 EX 3

Soit la base de données suivante :

- Immeuble (adresse, nbEtages, dateConstruction, nomPropriétaire)
- Appartement (adresse, n°appartement, nomOccupant, type, superficie, étage) 
- Personne (nom, adresse, n°appartement, dateArrivée, dateDépart, âge, profession) 

Ecrivez une procédure stockée PL/SQL qui permet de vérifier, avant l’ajout d’une personne dans la base,
si les contraintes suivantes sont vérifiées : dateConstruction de l’appartement occupé ≤ dateArrivée occupant < dateDépart occupant (la dateDépart peut avoir la valeur NULL).
Si une contrainte n’est pas vérifiée, la procédure doit l’indiquer par un message spécifique. 
Si les contraintes sont vérifiées, la personne est ajoutée dans la base.
La procédure prendra comme paramètres les attributs de la table Personne correspondant à la personne à ajouter (nom, adresse, n°appartement, dateArrivée, dateDépart, âge, profession).

*Remarques*

1. D’autres solutions peuvent être correctes.
2. L’adresse est clé primaire de Immeuble et ne peut donc prendre plusieurs fois une même valeur !
3. Un traitement spécifique est prévu seulement pour l’exception NO_DATA_FOUND.

