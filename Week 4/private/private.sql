-- 1. Створюємо тимчасову таблицю з триплетами
CREATE TABLE "triplets" (
    "sentence_id" INTEGER,
    "start_char" INTEGER,
    "length" INTEGER
);

-- 2. Вставляємо значення з записки детектива
INSERT INTO "triplets" ("sentence_id", "start_char", "length")
VALUES
    (14, 98, 4),
    (114, 3, 5),
    (618, 72, 9),
    (630, 7, 3),
    (932, 12, 5),
    (2230, 50, 7),
    (2346, 44, 10),
    (3041, 14, 5);

-- 3. Створюємо фінальне представлення message
CREATE VIEW "message" AS
SELECT substr("sentences"."sentence", "triplets"."start_char", "triplets"."length") AS "phrase"
FROM "sentences"
JOIN "triplets" ON "sentences"."id" = "triplets"."sentence_id";
