CREATE TABLE "oracles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "resp_id" integer, "advice" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "responses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "quality" integer, "sayit" varchar(255), "next_state" integer, "current_state" integer, "created_at" datetime, "updated_at" datetime, "next_say" varchar(255));
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "states" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "toonsay" varchar(255), "best_resp" integer, "good_resp" integer, "bad_resp" integer, "worst_resp" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20130323203432');

INSERT INTO schema_migrations (version) VALUES ('20130323203804');

INSERT INTO schema_migrations (version) VALUES ('20130323203919');

INSERT INTO schema_migrations (version) VALUES ('20130323204405');

INSERT INTO schema_migrations (version) VALUES ('20130323234851');