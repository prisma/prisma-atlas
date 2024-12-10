-- Create "User" table
CREATE TABLE "User" ("id" serial NOT NULL, "email" text NOT NULL, "name" text NULL, PRIMARY KEY ("id"));
-- Create index "User_email_key" to table: "User"
CREATE UNIQUE INDEX "User_email_key" ON "User" ("email");
-- Create "Post" table
CREATE TABLE "Post" ("id" serial NOT NULL, "title" text NOT NULL, "content" text NULL, "published" boolean NOT NULL DEFAULT false, "authorId" integer NULL, PRIMARY KEY ("id"), CONSTRAINT "Post_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User" ("id") ON UPDATE CASCADE ON DELETE SET NULL);
