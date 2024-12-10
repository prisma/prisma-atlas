// atlas.hcl
data "external_schema" "prisma" {
    program = [ 
      "npx",
      "prisma",
      "migrate",
      "diff",
      "--from-empty",
      "--to-schema-datamodel",
      "prisma/schema.prisma",
      "--script"
    ]
}
env "local" {
  // dev = "postgresql://nikolasburk:nikolasburk@localhost:5432/atlas-prisma?sslmode=disable"
  dev = "docker://postgres/13/dev?search_path=public"
  schema {
    src = data.composite_schema.prisma-extended.url
  }
  migration {
    dir = "file://atlas/migrations"
    exclude = ["_prisma_migrations"]
  }
}

data "composite_schema" "prisma-extended" {
  schema "public" {
    url = data.external_schema.prisma.url
  }
  schema "public" {
    url = "file://atlas/published_posts_index.sql"
  }
}