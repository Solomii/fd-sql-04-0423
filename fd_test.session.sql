DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
	"firstName" VARCHAR(64) NOT NULL CHECK("firstName" !=''),
  "lastName" VARCHAR(64) NOT NULL CHECK("lastName" !=''),
  "email" VARCHAR(256) NOT NULL CHECK("email" !='') UNIQUE,
  "isMale" BOOLEAN NOT NULL,
  "birthday" DATE NOT NULL CHECK("birthday"<CURRENT_DATE),
  "height"  NUMERIC(3,2) NOT NULL CHECK("height" >=1.10 AND "height" <2.55)
);

INSERT INTO "users"("lastName", "firstName", "email", "isMale","birthday", "height") 
VALUES ('Tom', 'Test', 'tom@gamil.com', TRUE, '1992-01-08', 1.70),
('Test', 'Test', 'test@gamil.com', TRUE, '1957-09-25', 1.80)



DROP TABLE IF EXISTS "products";
CREATE TABLE "products" (
  "id" SERIAL PRIMARY KEY,
  "productName" VARCHAR(64) NOT NULL CHECK("productName"!=''),
  "price" NUMERIC(8,2) CHECK("price" >0 AND "price"<1000000) ,
  "currency" VARCHAR(3) NOT NULL CHECK(LENGTN("currency") >=2) DEFAULT "uah",
  "quantity" INT NOT NULL CHECK("quantity" >0 AND "quantity" <=1000),
  "dateOfManufacture" TIMESTAMP CHECK("dateOfManufacture" < CURRENT_TIMESTAMP),
  "expirationDate" DATE 
); 


INSERT INTO "products" ("productName", "price", "currency", "quantity", "dateOfManufacture","expirationDate")
VALUES ('bread', 20, 'uh', 5, '2023-01-01','1957-09-25'),
('salt', 19, 'uh', 20, '2022-09-25', '2023-12-02')

DROP TABLE IF EXISTS "orders";
CREATE TABLE "orders" (
 "id" SERIAL PRIMARY KEY,
 "userId" INTEGER REFERENCES "users"("id"),
 "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO "orders"("userId") VALUES (1),(1),(1),(2),(3)

-- DROP TABLE IF EXISTS "products_to_orders";
-- CREATE TABLE "products_to_orders"(
--   "productId" INT REFERENCES "products"("id"),
--   "orderId" INT REFERENCES "orders"("id"),
--   "quantity" SMALLINT NOT NULL CHECK("quantity">0),
--    PRIMARY KEY( "productId","orderId") 
--   ); 

-- INSERT INTO "products_to_orders" VALUES (1,1,2),(2,1,10)

DROP TABLE IF EXISTS "messages";
CREATE TABLE "messages" (
  "id" SERIAL PRIMARY KEY,
  "body" VARCHAR(4096) CHECK("body" !='') NOT NULL,
  "isRead" BOOLEAN NOT NULL DEFAULT FALSE,
  "userId" INTEGER REFERENCES "users"("id"),
  "author" VARCHAR (128) NOT NULL CHECK("author" !=''),
  "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "checkBodyLength" CHECK(LENGTN("body")>=2)
) 

INSERT INTO "messages" ("author", "body")
VALUES ('Test', 'hi, test'), ('Bred', 'hi, Bred'),('Tom', 'hi, Tom'), ('Mery', 'hi, Mary');

-- ALTER TABLE "users"
-- ADD CONSTRAINT "checkEmailLength" CHECK(LENGTN("email")>=4)

DROP TABLE IF EXISTS "groups";
CREATE TABLE "groups"(
  "id" SMALLSERIAL PRIMARY KEY,
  "title" VARCHAR (256) NOT NULL CHECK("title"!=''),
  "ownerId"  INT REFERENCES "users"("id"),
  "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO "groups"("title", "ownerId") VALUES('db', 1), ('back', 2)

--організувати звязок між овнерами і групами

DROP TABLE IF EXISTS "users_to_groups";
CREATE TABLE "users_to_groups"(
  "groupId" SMALLINT REFERENCES "groups"("id"),
  "userID" INT REFERENCES "users"("id"),
  PRIMARY KEY("groupId", "userID")
);

INSERT INTO  "users_to_groups"("groupId", "userID") VALUES(1,1),(1,2);