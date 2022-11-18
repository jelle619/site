-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Movie" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "tmdb" BIGINT,
    "title" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "description" TEXT,
    "version" TEXT NOT NULL,
    "origin" TEXT
);
INSERT INTO "new_Movie" ("description", "id", "origin", "title", "tmdb", "version", "year") SELECT "description", "id", "origin", "title", "tmdb", "version", "year" FROM "Movie";
DROP TABLE "Movie";
ALTER TABLE "new_Movie" RENAME TO "Movie";
CREATE UNIQUE INDEX "Movie_tmdb_key" ON "Movie"("tmdb");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
