CREATE TABLE "bits" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255) DEFAULT NULL NULL, "content" text DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL, "user_id" integer);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "login" varchar(255) DEFAULT NULL NULL, "email" varchar(255) DEFAULT NULL NULL, "crypted_password" varchar(40) DEFAULT NULL NULL, "salt" varchar(40) DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL, "remember_token" varchar(255) DEFAULT NULL NULL, "remember_token_expires_at" datetime DEFAULT NULL NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20080621004106');

INSERT INTO schema_migrations (version) VALUES ('20080621025427');

INSERT INTO schema_migrations (version) VALUES ('20080621043618');