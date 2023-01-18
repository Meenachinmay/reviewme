CREATE TABLE "restaurants"(
    "id" BIGINT NOT NULL,
    "name" BIGINT NOT NULL,
    "location" BIGINT NOT NULL,
    "type" BIGINT NOT NULL,
    "menu_items" JSON NOT NULL,
    "feedback" BIGINT NOT NULL
);
ALTER TABLE
    "restaurants" ADD PRIMARY KEY("id");
CREATE TABLE "items"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "price" VARCHAR(255) NOT NULL,
    "ingredients" VARCHAR(255) NOT NULL,
    "orderCount" BIGINT NOT NULL,
    "discount" VARCHAR(255) NOT NULL,
    "feedback" BIGINT NOT NULL,
    "belongsToRestaurant" BIGINT NOT NULL
);
ALTER TABLE
    "items" ADD PRIMARY KEY("id");
CREATE TABLE "feedbacks_restaurant"(
    "id" BIGINT NOT NULL,
    "restaurantId" BIGINT NOT NULL,
    "expensiveness" VARCHAR(255) NOT NULL,
    "service" VARCHAR(255) NOT NULL,
    "location" VARCHAR(255) NOT NULL,
    "interiorVibes" VARCHAR(255) NOT NULL,
    "paymentModeAvailability" VARCHAR(255) NOT NULL,
    "staffBehave" VARCHAR(255) NOT NULL,
    "userId" BIGINT NOT NULL,
    "comment" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "feedbacks_restaurant" ADD PRIMARY KEY("id");
CREATE TABLE "users"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "feedbackGivingCount" VARCHAR(255) NOT NULL,
    "phoneNo" BIGINT NOT NULL,
    "profileImage" VARCHAR(255) NOT NULL,
    "preferredPayMethod" VARCHAR(255) NOT NULL,
    "totalDiscountOpt" INTEGER NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("id");
CREATE TABLE "feedbacks_food"(
    "id" BIGINT NOT NULL,
    "itemId" BIGINT NOT NULL,
    "taste" VARCHAR(255) NOT NULL,
    "quality" VARCHAR(255) NOT NULL,
    "texture" VARCHAR(255) NOT NULL,
    "smell" VARCHAR(255) NOT NULL,
    "freshness" VARCHAR(255) NOT NULL,
    "serving" VARCHAR(255) NOT NULL,
    "userId" BIGINT NOT NULL,
    "comment" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "feedbacks_food" ADD PRIMARY KEY("id");
CREATE TABLE "invoices"(
    "id" BIGINT NOT NULL,
    "userId" BIGINT NOT NULL,
    "belongsToRestaurant" BIGINT NOT NULL,
    "items" jsonb NOT NULL,
    "createdAt" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "updatedAt" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "totalAmt" BIGINT NOT NULL,
    "discountAmt" BIGINT NOT NULL,
    "discountOpt" BOOLEAN NOT NULL
);
ALTER TABLE
    "invoices" ADD PRIMARY KEY("id");
ALTER TABLE
    "restaurants" ADD CONSTRAINT "restaurants_feedback_foreign" FOREIGN KEY("feedback") REFERENCES "feedbacks_restaurant"("id");
ALTER TABLE
    "invoices" ADD CONSTRAINT "invoices_belongstorestaurant_foreign" FOREIGN KEY("belongsToRestaurant") REFERENCES "restaurants"("id");
ALTER TABLE
    "invoices" ADD CONSTRAINT "invoices_items_foreign" FOREIGN KEY("items") REFERENCES "items"("id");
ALTER TABLE
    "items" ADD CONSTRAINT "items_belongstorestaurant_foreign" FOREIGN KEY("belongsToRestaurant") REFERENCES "restaurants"("id");
ALTER TABLE
    "items" ADD CONSTRAINT "items_feedback_foreign" FOREIGN KEY("feedback") REFERENCES "feedbacks_food"("id");
ALTER TABLE
    "feedbacks_restaurant" ADD CONSTRAINT "feedbacks_restaurant_userid_foreign" FOREIGN KEY("userId") REFERENCES "users"("id");
ALTER TABLE
    "feedbacks_food" ADD CONSTRAINT "feedbacks_food_userid_foreign" FOREIGN KEY("userId") REFERENCES "users"("id");
ALTER TABLE
    "invoices" ADD CONSTRAINT "invoices_userid_foreign" FOREIGN KEY("userId") REFERENCES "users"("id");