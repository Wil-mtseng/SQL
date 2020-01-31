The Umuzi database contain 5 tables. 
The Customers table contains basic information about the people who made purchases.
The Employee table contains staff members details.
The Orders table has the orders made by clients and their dates.
The Payments table has information concerning purchase amounts.
The Products table has information about the products sold. 
 

-- Adminer 4.7.5 PostgreSQL dump

DROP TABLE IF EXISTS "customers";
CREATE TABLE "public"."customers" (
    "customersid" integer NOT NULL,
    "fisrtname" character varying(50) NOT NULL,
    "lastname" character varying(50) NOT NULL,
    "gender" character varying,
    "address" character varying(200),
    "phone" integer NOT NULL,
    "email" character varying(100),
    "city" character varying(20),
    "country" character varying(50),
    CONSTRAINT "customers_pkey" PRIMARY KEY ("customersid"),
    CONSTRAINT "customers_customersid_fkey" FOREIGN KEY (customersid) REFERENCES customers(customersid) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "employees";
CREATE TABLE "public"."employees" (
    "employeeid" integer DEFAULT '1' NOT NULL,
    "firstname" character varying(50) NOT NULL,
    "lastname" character varying(50) NOT NULL,
    "email" character varying(100),
    "jobtitle" character varying(20) NOT NULL,
    CONSTRAINT "employees_employeeid_key" UNIQUE ("employeeid"),
    CONSTRAINT "employees_pkey" PRIMARY KEY ("employeeid")
) WITH (oids = false);


DROP TABLE IF EXISTS "orders";
CREATE TABLE "public"."orders" (
    "orderid" integer NOT NULL,
    "productid" integer NOT NULL,
    "paymentid" integer NOT NULL,
    "fulfilledbyemployeeid" integer,
    "daterequired" timestamp,
    "dateshipped" timestamp,
    "status" character varying(20),
    CONSTRAINT "orders_pkey" PRIMARY KEY ("orderid", "productid", "paymentid"),
    CONSTRAINT "orders_paymentid_fkey" FOREIGN KEY (paymentid) REFERENCES payments(paymentid) NOT DEFERRABLE,
    CONSTRAINT "orders_productid_fkey" FOREIGN KEY (productid) REFERENCES products(productid) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "payments";
CREATE TABLE "public"."payments" (
    "customersid" integer NOT NULL,
    "paymentid" integer NOT NULL,
    "paymentdate" timestamp NOT NULL,
    "amount" numeric NOT NULL,
    CONSTRAINT "payments_pkey" PRIMARY KEY ("paymentid"),
    CONSTRAINT "payments_paymentid_fkey" FOREIGN KEY (paymentid) REFERENCES payments(paymentid) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "payments" ("customersid", "paymentid", "paymentdate", "amount") VALUES
(1,	1,	'2018-01-09 00:00:00',	150.75),
(5,	2,	'2018-03-09 00:00:00',	150.75),
(4,	3,	'2018-03-09 00:00:00',	700.60);

DROP TABLE IF EXISTS "products";
CREATE TABLE "public"."products" (
    "productid" integer NOT NULL,
    "productname" character varying(100),
    "description" character varying(300),
    "buyprice" numeric,
    CONSTRAINT "products_pkey" PRIMARY KEY ("productid"),
    CONSTRAINT "products_productid_fkey" FOREIGN KEY (productid) REFERENCES products(productid) NOT DEFERRABLE
) WITH (oids = false);


-- 2020-01-30 10:16:23.427206+00
