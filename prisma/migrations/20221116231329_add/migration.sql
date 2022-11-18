-- CreateTable
CREATE TABLE "Game" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "title_id" TEXT,
    "platform" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "region" TEXT
);

-- CreateTable
CREATE TABLE "Movie" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "tmdb" BIGINT,
    "title" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "origin" TEXT
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Book" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "isbn" BIGINT,
    "title" TEXT NOT NULL,
    "author" TEXT,
    "series" TEXT,
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

-- CreateIndex
CREATE UNIQUE INDEX "Movie_tmdb_key" ON "Movie"("tmdb");
