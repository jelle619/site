/*
  Warnings:

  - You are about to drop the column `author` on the `Book` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Book" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "isbn" INTEGER,
    "title" TEXT NOT NULL,
    "entry" TEXT,
    "language" TEXT NOT NULL,
    "version" TEXT NOT NULL
);
INSERT INTO "new_Book" ("entry", "id", "isbn", "language", "title", "version") SELECT "entry", "id", "isbn", "language", "title", "version" FROM "Book";
DROP TABLE "Book";
ALTER TABLE "new_Book" RENAME TO "Book";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
