/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  19/07/2023 15:24:55                      */
/*==============================================================*/


drop table if exists Administrateur;

drop table if exists Client;

drop table if exists Depense;

drop table if exists Fournisseur;

drop table if exists Mesure;

drop table if exists Model;

drop table if exists Payement;

drop table if exists Personnel;

drop table if exists Rendez_vous;

drop table if exists Role;

drop table if exists Sup_administrateur;

/*==============================================================*/
/* Table : Administrateur                                       */
/*==============================================================*/
create table Administrateur
(
   id                   int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   telephone            int,
   sex                  varchar(254),
   email                varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   id                   int not null,
   Ren_id               int not null,
   Mes_id               int not null,
   Pay_id               int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   telephone            int,
   sex                  varchar(254),
   adresse              varchar(254),
   email                varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : Depense                                              */
/*==============================================================*/
create table Depense
(
   id                   int not null,
   Adm_id               int,
   Fou_id               int,
   Pay_id               int,
   Sup_id               int,
   nom                  varchar(254),
   prenom               varchar(254),
   motif                varchar(254),
   date                 datetime,
   primary key (id)
);

/*==============================================================*/
/* Table : Fournisseur                                          */
/*==============================================================*/
create table Fournisseur
(
   id                   int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   telephone            int,
   adresse              varchar(254),
   email                varchar(254),
   article_fournis      varchar(254),
   prix                 int,
   primary key (id)
);

/*==============================================================*/
/* Table : Mesure                                               */
/*==============================================================*/
create table Mesure
(
   id                   int not null,
   Ren_id               int,
   Mod_id               int not null,
   Cli_id               int,
   poitrine             int,
   longueur_de_manche   int,
   longueur_de_pantalon int,
   ceinture             int,
   longueur_robe        int,
   bassin               int,
   tour_de_taille       int,
   bas                  int,
   entrejambe           int,
   cuisse               int,
   tour_ventrale        int,
   hanche               int,
   ecart_de_dos         int,
   primary key (id)
);

/*==============================================================*/
/* Table : Model                                                */
/*==============================================================*/
create table Model
(
   id                   int not null,
   model_pour_homme     varchar(254),
   model_pour_femme     varchar(254),
   model_pour_enfant    varchar(254),
   prix                 int,
   primary key (id)
);

/*==============================================================*/
/* Table : Payement                                             */
/*==============================================================*/
create table Payement
(
   id                   int not null,
   Per_id               int not null,
   motif                varchar(254),
   paye                 int,
   date                 datetime,
   primary key (id)
);

/*==============================================================*/
/* Table : Personnel                                            */
/*==============================================================*/
create table Personnel
(
   id                   int not null,
   Rol_id               int not null,
   Dep_id               int,
   Adm_id               int,
   nom                  varchar(254),
   prenom               varchar(254),
   telephone            int,
   adresse              varchar(254),
   role                 varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : Rendez_vous                                          */
/*==============================================================*/
create table Rendez_vous
(
   id                   int not null,
   Mes_id               int,
   motif                varchar(254),
   date                 datetime,
   primary key (id)
);

/*==============================================================*/
/* Table : Role                                                 */
/*==============================================================*/
create table Role
(
   id                   int not null,
   Couturier            varchar(254),
   blanchisseur         varchar(254),
   modeliste            varchar(254),
   styliste             varchar(254),
   secretaire           varchar(254),
   dirigeant            varchar(254),
   primary key (id)
);

/*==============================================================*/
/* Table : Sup_administrateur                                   */
/*==============================================================*/
create table Sup_administrateur
(
   id                   int not null,
   Adm_id               int,
   Per_id               int,
   nom                  varchar(254),
   prenom               varchar(254),
   telephone            int,
   email                varchar(254),
   primary key (id)
);

alter table Client add constraint FK_Association_2 foreign key (Ren_id)
      references Rendez_vous (id) on delete restrict on update restrict;

alter table Client add constraint FK_Association_3 foreign key (Mes_id)
      references Mesure (id) on delete restrict on update restrict;

alter table Client add constraint FK_Association_7 foreign key (Pay_id)
      references Payement (id) on delete restrict on update restrict;

alter table Depense add constraint FK_Association_11 foreign key (Fou_id)
      references Fournisseur (id) on delete restrict on update restrict;

alter table Depense add constraint FK_Association_5 foreign key (Pay_id)
      references Payement (id) on delete restrict on update restrict;

alter table Depense add constraint FK_Association_8 foreign key (Sup_id)
      references Sup_administrateur (id) on delete restrict on update restrict;

alter table Depense add constraint FK_Association_9 foreign key (Adm_id)
      references Administrateur (id) on delete restrict on update restrict;

alter table Mesure add constraint FK_Association_14 foreign key (Ren_id)
      references Rendez_vous (id) on delete restrict on update restrict;

alter table Mesure add constraint FK_Association_3 foreign key (Cli_id)
      references Client (id) on delete restrict on update restrict;

alter table Mesure add constraint FK_Association_4 foreign key (Mod_id)
      references Model (id) on delete restrict on update restrict;

alter table Payement add constraint FK_Association_16 foreign key (Per_id)
      references Personnel (id) on delete restrict on update restrict;

alter table Personnel add constraint FK_Association_1 foreign key (Adm_id)
      references Administrateur (id) on delete restrict on update restrict;

alter table Personnel add constraint FK_Association_10 foreign key (Dep_id)
      references Depense (id) on delete restrict on update restrict;

alter table Personnel add constraint FK_Association_15 foreign key (Rol_id)
      references Role (id) on delete restrict on update restrict;

alter table Rendez_vous add constraint FK_Association_6 foreign key (Mes_id)
      references Mesure (id) on delete restrict on update restrict;

alter table Sup_administrateur add constraint FK_Association_12 foreign key (Adm_id)
      references Administrateur (id) on delete restrict on update restrict;

alter table Sup_administrateur add constraint FK_Association_13 foreign key (Per_id)
      references Personnel (id) on delete restrict on update restrict;

