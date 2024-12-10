CREATE INDEX "idx_published_posts"
ON "Post" ("id") 
WHERE "published" = true;