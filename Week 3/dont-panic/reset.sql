-- Повертаємо початковий хеш для admin
UPDATE "users"
SET "password" = '0a623722e0302256c70b691079fb5ff50e26f59218684ef9b8971f49615a206a'
WHERE "username" = 'admin';
