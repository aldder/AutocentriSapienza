-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- Utente [User]
create table `utente` (
   `oid`  integer  not null,
   `nome_utente`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- Autovettura [ent1]
create table `autovettura` (
   `oid`  integer  not null,
   `prezzo`  double precision,
   `foto`  varchar(255),
   `usato`  bit,
   `disponibilita`  integer,
   `kilometri`  integer,
   `anno`  date,
   `alimentazione`  varchar(255),
   `cilindrata`  integer,
   `porte`  integer,
   `descrizione`  longtext,
   `nome`  varchar(255),
   `catalogo`  bit,
  primary key (`oid`)
);


-- Annuncio [ent10]
create table `annuncio` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- Orario [ent15]
create table `orario` (
   `oid`  integer  not null,
   `ora`  time,
  primary key (`oid`)
);


-- Appuntamento [ent2]
create table `appuntamento` (
   `oid`  integer  not null,
   `data_intervento`  date,
   `descrizione`  longtext,
   `targa`  varchar(255),
  primary key (`oid`)
);


-- Tipologia [ent3]
create table `tipologia` (
   `oid`  integer  not null,
   `nome`  varchar(255),
   `ripetizione`  integer,
   `descrizione`  longtext,
  primary key (`oid`)
);


-- Notifica [ent4]
create table `notifica` (
   `oid`  integer  not null,
   `data_notifica`  date,
   `descrizione`  longtext,
   `stato`  bit,
  primary key (`oid`)
);


-- Preferito [ent5]
create table `preferito` (
   `oid`  integer  not null,
   `notifica`  bit,
  primary key (`oid`)
);


-- Acquisto_Pendente [ent6]
create table `acquisto_pendente` (
   `oid`  integer  not null,
   `notifica`  bit,
   `quantita`  integer,
  primary key (`oid`)
);


-- Storico_Acquisto [ent7]
create table `storico_acquisto` (
   `oid`  integer  not null,
   `targa`  varchar(255),
   `data`  date,
   `prezzo`  double precision,
   `descrizione`  longtext,
  primary key (`oid`)
);


-- Intervento [ent8]
create table `intervento` (
   `oid`  integer  not null,
   `data`  date,
   `stato`  bit,
   `descrizione`  longtext,
   `targa`  varchar(255),
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `utente`  add column  `group_oid`  integer;
alter table `utente`   add index fk_utente_group (`group_oid`), add constraint fk_utente_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `utente_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`utente_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_utente (`utente_oid`), add constraint fk_user_group_utente foreign key (`utente_oid`) references `utente` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- Preferito_Utente [rel1]
alter table `preferito`  add column  `utente_oid`  integer;
alter table `preferito`   add index fk_preferito_utente (`utente_oid`), add constraint fk_preferito_utente foreign key (`utente_oid`) references `utente` (`oid`);


-- Appuntamento_Intervento [rel10]
alter table `intervento`  add column  `appuntamento_oid`  integer;
alter table `intervento`   add index fk_intervento_appuntamento (`appuntamento_oid`), add constraint fk_intervento_appuntamento foreign key (`appuntamento_oid`) references `appuntamento` (`oid`);


-- Storico_Acquisto_Utente [rel12]
alter table `storico_acquisto`  add column  `utente_oid`  integer;
alter table `storico_acquisto`   add index fk_storico_acquisto_utente (`utente_oid`), add constraint fk_storico_acquisto_utente foreign key (`utente_oid`) references `utente` (`oid`);


-- Utente_Annuncio [rel13]
alter table `annuncio`  add column  `utente_oid`  integer;
alter table `annuncio`   add index fk_annuncio_utente (`utente_oid`), add constraint fk_annuncio_utente foreign key (`utente_oid`) references `utente` (`oid`);


-- Utente_Notifica [rel14]
alter table `notifica`  add column  `utente_oid`  integer;
alter table `notifica`   add index fk_notifica_utente (`utente_oid`), add constraint fk_notifica_utente foreign key (`utente_oid`) references `utente` (`oid`);


-- Storico_Acquisto_Notifica [rel15]
alter table `notifica`  add column  `storico_acquisto_oid`  integer;
alter table `notifica`   add index fk_notifica_storico_acquisto (`storico_acquisto_oid`), add constraint fk_notifica_storico_acquisto foreign key (`storico_acquisto_oid`) references `storico_acquisto` (`oid`);


-- Notifica_Tipologia [rel16]
alter table `notifica`  add column  `tipologia_oid`  integer;
alter table `notifica`   add index fk_notifica_tipologia (`tipologia_oid`), add constraint fk_notifica_tipologia foreign key (`tipologia_oid`) references `tipologia` (`oid`);


-- Appuntamento_Orario [rel17]
alter table `appuntamento`  add column  `orario_oid`  integer;
alter table `appuntamento`   add index fk_appuntamento_orario (`orario_oid`), add constraint fk_appuntamento_orario foreign key (`orario_oid`) references `orario` (`oid`);


-- AcquistoPendenteAutovettura [rel18]
alter table `acquisto_pendente`  add column  `autovettura_oid`  integer;
alter table `acquisto_pendente`   add index fk_acquisto_pendente_autovettu (`autovettura_oid`), add constraint fk_acquisto_pendente_autovettu foreign key (`autovettura_oid`) references `autovettura` (`oid`);


-- StoricoAcquistoAutovettura [rel19]
alter table `storico_acquisto`  add column  `autovettura_oid`  integer;
alter table `storico_acquisto`   add index fk_storico_acquisto_autovettur (`autovettura_oid`), add constraint fk_storico_acquisto_autovettur foreign key (`autovettura_oid`) references `autovettura` (`oid`);


-- Utente_Acquisto_Pendente [rel2]
alter table `acquisto_pendente`  add column  `utente_oid`  integer;
alter table `acquisto_pendente`   add index fk_acquisto_pendente_utente (`utente_oid`), add constraint fk_acquisto_pendente_utente foreign key (`utente_oid`) references `utente` (`oid`);


-- PreferitoAutovettura [rel20]
alter table `preferito`  add column  `autovettura_oid`  integer;
alter table `preferito`   add index fk_preferito_autovettura (`autovettura_oid`), add constraint fk_preferito_autovettura foreign key (`autovettura_oid`) references `autovettura` (`oid`);


-- Annuncio_Autovettura [rel3]
alter table `annuncio`  add column  `autovettura_oid`  integer;
alter table `annuncio`   add index fk_annuncio_autovettura (`autovettura_oid`), add constraint fk_annuncio_autovettura foreign key (`autovettura_oid`) references `autovettura` (`oid`);


-- Utente_Intervento [rel4]
alter table `intervento`  add column  `utente_oid`  integer;
alter table `intervento`   add index fk_intervento_utente (`utente_oid`), add constraint fk_intervento_utente foreign key (`utente_oid`) references `utente` (`oid`);


-- Tipologia_Intervento [rel5]
alter table `intervento`  add column  `tipologia_oid`  integer;
alter table `intervento`   add index fk_intervento_tipologia (`tipologia_oid`), add constraint fk_intervento_tipologia foreign key (`tipologia_oid`) references `tipologia` (`oid`);


-- Utente_Appuntamento [rel6]
alter table `appuntamento`  add column  `utente_oid`  integer;
alter table `appuntamento`   add index fk_appuntamento_utente (`utente_oid`), add constraint fk_appuntamento_utente foreign key (`utente_oid`) references `utente` (`oid`);


-- Tipologia_Appuntamento [rel7]
alter table `appuntamento`  add column  `tipologia_oid`  integer;
alter table `appuntamento`   add index fk_appuntamento_tipologia (`tipologia_oid`), add constraint fk_appuntamento_tipologia foreign key (`tipologia_oid`) references `tipologia` (`oid`);


-- Appuntamento_Notifica [rel8]
alter table `notifica`  add column  `appuntamento_oid`  integer;
alter table `notifica`   add index fk_notifica_appuntamento (`appuntamento_oid`), add constraint fk_notifica_appuntamento foreign key (`appuntamento_oid`) references `appuntamento` (`oid`);


-- Autovettura_Intervento [rel9]
alter table `intervento`  add column  `autovettura_oid`  integer;
alter table `intervento`   add index fk_intervento_autovettura (`autovettura_oid`), add constraint fk_intervento_autovettura foreign key (`autovettura_oid`) references `autovettura` (`oid`);


