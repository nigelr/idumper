CREATE TABLE "bits" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255) DEFAULT NULL NULL, "content" text DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL, "user_id" integer);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "taggings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "tag_id" integer DEFAULT NULL NULL, "taggable_id" integer DEFAULT NULL NULL, "taggable_type" varchar(255) DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL);
CREATE TABLE "tags" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255) DEFAULT NULL NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "login" varchar(255) DEFAULT NULL NULL, "email" varchar(255) DEFAULT NULL NULL, "crypted_password" varchar(40) DEFAULT NULL NULL, "salt" varchar(40) DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL, "remember_token" varchar(255) DEFAULT NULL NULL, "remember_token_expires_at" datetime DEFAULT NULL NULL);
CREATE INDEX "index_taggings_on_tag_id" ON "taggings" ("tag_id");
CREATE INDEX "index_taggings_on_taggable_id_and_taggable_type" ON "taggings" ("taggable_id", "taggable_type");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20080621004106');

INSERT INTO schema_migrations (version) VALUES ('20080621025427');

INSERT INTO schema_migrations (version) VALUES ('20080621043618');

INSERT INTO schema_migrations (version) VALUES ('20080621053627');