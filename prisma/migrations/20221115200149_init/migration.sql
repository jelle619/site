-- CreateTable
CREATE TABLE "Book" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "isbn" INTEGER,
    "title" TEXT NOT NULL,
    "author" TEXT NOT NULL,
    "entry" TEXT,
    "language" TEXT NOT NULL,
    "version" TEXT NOT NULL
);
