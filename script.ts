import { Book, PrismaClient } from "@prisma/client";
import { parse } from "csv-parse/sync";
import { open, readFile, readFileSync } from "fs";

const prisma = new PrismaClient();

interface BookFromCsv {
  isbn: string;
  title: string;
  author: string;
  series: string;
  entry: string;
  language: string;
  version: string;
}

export type BookCreate = {
  isbn: number | null;
  title: string;
  author: string;
  series: string;
  entry: string | null;
  language: string;
  version: string;
};

function convertBook(book: BookFromCsv): BookCreate {
  return {
    isbn: book.isbn ? parseInt(book.isbn) : null,
    title: book.title,
    author: book.author,
    series: book.series,
    entry: book.entry,
    language: book.language,
    version: book.version,
  };
}

async function main() {
  /*
  const csv = readFileSync("./books.csv").toString();

  const records: BookFromCsv[] = parse(csv, {
    columns: true,
    skip_empty_lines: true,
  });

  records.forEach(async (record) => {
    await prisma.book.create({
      data: convertBook(record),
    });
  });

  const books: Book[] = await prisma.book.findMany({
    where: {
      language: "English",
    },
  });

  console.log(books);
  */
}

await main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
