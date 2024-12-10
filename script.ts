import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

// A `main` function so that we can use async/await
async function main() {
 
  const tag = await prisma.tag.create({
    data: {
      name: "Technology",
      posts: {
        create: {
          title: "Prisma and Atlas are a killer combo!"
        }
      }
    }
  })
  console.log(tag)

}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })
