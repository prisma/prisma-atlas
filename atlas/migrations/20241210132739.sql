-- Create "Tag" table
CREATE TABLE "Tag" ("id" serial NOT NULL, "name" text NOT NULL, PRIMARY KEY ("id"));
-- Create index "Tag_name_key" to table: "Tag"
CREATE UNIQUE INDEX "Tag_name_key" ON "Tag" ("name");
-- Create "_PostToTag" table
CREATE TABLE "_PostToTag" ("A" integer NOT NULL, "B" integer NOT NULL, CONSTRAINT "_PostToTag_A_fkey" FOREIGN KEY ("A") REFERENCES "Post" ("id") ON UPDATE CASCADE ON DELETE CASCADE, CONSTRAINT "_PostToTag_B_fkey" FOREIGN KEY ("B") REFERENCES "Tag" ("id") ON UPDATE CASCADE ON DELETE CASCADE);
-- Create index "_PostToTag_AB_unique" to table: "_PostToTag"
CREATE UNIQUE INDEX "_PostToTag_AB_unique" ON "_PostToTag" ("A", "B");
-- Create index "_PostToTag_B_index" to table: "_PostToTag"
CREATE INDEX "_PostToTag_B_index" ON "_PostToTag" ("B");
