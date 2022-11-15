/*
  Warnings:

  - Added the required column `author` to the `Book` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Book" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "isbn" INTEGER,
    "title" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "entry" TEXT,
    "language" TEXT NOT NULL,
    "version" TEXT NOT NULL
);
INSERT INTO "new_Book" ("entry", "id", "isbn", "language", "title", "version") SELECT "entry", "id", "isbn", "language", "title", "version" FROM "Book";
DROP TABLE "Book";
ALTER TABLE "new_Book" RENAME TO "Book";
CREATE UNIQUE INDEX "Book_isbn_key" ON "Book"("isbn");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
