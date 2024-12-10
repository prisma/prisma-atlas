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
  dev = "docker://postgres/16/dev?search_path=public"
  schema {
    src = data.external_schema.prisma.url
  }
  migration {
    dir = "file://atlas/migrations"
    exclude = [ "_prisma_migrations" ]
  }
}