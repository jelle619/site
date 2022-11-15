/*
  Warnings:

  - You are about to alter the column `isbn` on the `Book` table. The data in that column could be lost. The data in that column will be cast from `Int` to `BigInt`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Book" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "isbn" BIGINT,
    "title" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "series" TEXT NOT NULL,
    "entry" TEXT,
    "language" TEXT NOT NULL,
    "version" TEXT NOT NULL
);
INSERT INTO "new_Book" ("author", "entry", "id", "isbn", "language", "series", "title", "version") SELECT "author", "entry", "id", "isbn", "language", "series", "title", "version" FROM "Book";
DROP TABLE "Book";
ALTER TABLE "new_Book" RENAME TO "Book";
CREATE UNIQUE INDEX "Book_isbn_key" ON "Book"("isbn");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
