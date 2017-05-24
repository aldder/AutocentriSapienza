-- Appuntamento_Autovettura [rel11]
alter table `appuntamento`  add column  `autovettura_oid`  integer;
alter table `appuntamento`   add index fk_appuntamento_autovettura (`autovettura_oid`), add constraint fk_appuntamento_autovettura foreign key (`autovettura_oid`) references `autovettura` (`oid`);


