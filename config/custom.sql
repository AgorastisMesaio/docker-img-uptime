-- Sample custom SQL file to insert into "First time deployment of the container"
INSERT INTO "setting" VALUES (4,'initServerTimezone','true',NULL);
INSERT INTO "setting" VALUES (5,'serverTimezone','"Europe/Athens"','general');
INSERT INTO "setting" VALUES (6,'checkUpdate','true','general');
INSERT INTO "setting" VALUES (7,'searchEngineIndex','false','general');
INSERT INTO "setting" VALUES (8,'entryPage','"dashboard"','general');
INSERT INTO "setting" VALUES (9,'nscd','true','general');
INSERT INTO "setting" VALUES (10,'dnsCache','false','general');
INSERT INTO "setting" VALUES (11,'keepDataPeriodDays','180','general');
INSERT INTO "setting" VALUES (12,'tlsExpiryNotifyDays','[7,14,21]','general');
INSERT INTO "setting" VALUES (13,'trustProxy','false','general');
-- Disabling authentication !!
INSERT INTO "setting" VALUES (14,'disableAuth','true','general');
-- kuma, super2024
INSERT INTO "user" VALUES (1,'kuma','$2a$10$K3EiQ2lW4D4tioAWhrviSOv1Et8WgOx1Kcz3fJnIr00q1r06s7uK.',1,NULL,NULL,0,NULL);
--