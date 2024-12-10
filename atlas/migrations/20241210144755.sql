-- Create index "idx_published_posts" to table: "Post"
CREATE INDEX "idx_published_posts" ON "Post" ("id") WHERE (published = true);
