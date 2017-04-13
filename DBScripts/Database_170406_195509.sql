-- Tipologia_Intervento [rel5]
alter table `intervento`  add column  `tipologia_oid`  integer;
alter table `intervento`   add index fk_intervento_tipologia (`tipologia_oid`), add constraint fk_intervento_tipologia foreign key (`tipologia_oid`) references `tipologia` (`oid`);


