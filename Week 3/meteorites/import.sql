-- 1. Створюємо тимчасову таблицю
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "fall" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

-- 2. Налаштування режиму імпорту
.mode csv
.import meteorites.csv meteorites_temp

-- 3. Очищення порожніх значень
UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = '' OR "mass" = ' ';
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = '' OR "year" = ' ';
UPDATE "meteorites_temp" SET "lat" = NULL WHERE "lat" = '' OR "lat" = ' ';
UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" = '' OR "long" = ' ';

-- 4. Округлення
UPDATE "meteorites_temp" SET "mass" = ROUND("mass", 2) WHERE "mass" IS NOT NULL;
UPDATE "meteorites_temp" SET "lat" = ROUND("lat", 2) WHERE "lat" IS NOT NULL;
UPDATE "meteorites_temp" SET "long" = ROUND("long", 2) WHERE "long" IS NOT NULL;

-- 5. Створення фінальної таблиці
CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

-- 6. Перенесення даних з сортуванням
INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "fall", "year", "lat", "long"
FROM "meteorites_temp"
WHERE "nametype" NOT LIKE 'Relict'
ORDER BY "year" ASC, "name" ASC;

-- 7. Видалення тимчасової таблиці
DROP TABLE "meteorites_temp";
