-- 1. Інгредієнти
CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "price_per_unit" REAL NOT NULL,
    "unit" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- 2. Донати
CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "is_gluten_free" INTEGER NOT NULL CHECK("is_gluten_free" IN (0, 1)),
    "price" REAL NOT NULL,
    PRIMARY KEY("id")
);

-- 3. Рецепти (зв'язок Багато-до-Багатьох: Донати <-> Інгредієнти)
CREATE TABLE "donut_ingredients" (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    PRIMARY KEY("donut_id", "ingredient_id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

-- 4. Клієнти
CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- 5. Замовлення
CREATE TABLE "orders" (
    "id" INTEGER,
    "customer_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

-- 6. Деталі замовлення (зв'язок Багато-до-Багатьох: Замовлення <-> Донати з кількістю)
CREATE TABLE "order_donuts" (
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "qty" INTEGER NOT NULL,
    PRIMARY KEY("order_id", "donut_id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);
