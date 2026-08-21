-- 1. Користувачі
CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- 2. Навчальні заклади
CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "founded_year" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

-- 3. Компанії
CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- 4. Зв'язки між людьми
CREATE TABLE "connections" (
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    PRIMARY KEY("user1_id", "user2_id"),
    FOREIGN KEY("user1_id") REFERENCES "users"("id"),
    FOREIGN KEY("user2_id") REFERENCES "users"("id")
);

-- 5. Освіта користувачів
CREATE TABLE "user_schools" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "degree" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

-- 6. Досвід роботи
CREATE TABLE "user_companies" (
    "id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "title" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
