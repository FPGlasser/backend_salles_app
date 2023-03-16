/*
  Warnings:

  - Added the required column `created_at` to the `Branch_Address` table without a default value. This is not possible if the table is not empty.
  - Added the required column `update_at` to the `Branch_Address` table without a default value. This is not possible if the table is not empty.
  - Added the required column `company_id` to the `Branchs` table without a default value. This is not possible if the table is not empty.
  - Added the required column `description` to the `Branchs` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `Branchs` table without a default value. This is not possible if the table is not empty.
  - Added the required column `telephone1` to the `Branchs` table without a default value. This is not possible if the table is not empty.
  - Added the required column `telephone2` to the `Branchs` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "ROLE" AS ENUM ('ADMIN', 'MANAGER', 'SALLER');

-- AlterTable
ALTER TABLE "Branch_Address" ADD COLUMN     "created_at" DATE NOT NULL,
ADD COLUMN     "update_at" TIMESTAMP NOT NULL;

-- AlterTable
ALTER TABLE "Branchs" ADD COLUMN     "company_id" TEXT NOT NULL,
ADD COLUMN     "description" VARCHAR(100) NOT NULL,
ADD COLUMN     "email" VARCHAR(24) NOT NULL,
ADD COLUMN     "telephone1" INTEGER NOT NULL,
ADD COLUMN     "telephone2" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(24) NOT NULL,
    "weight" REAL NOT NULL,
    "lenght" DECIMAL NOT NULL,
    "width" DECIMAL NOT NULL,
    "height" DECIMAL NOT NULL,
    "short_description" VARCHAR(36) NOT NULL,
    "description" VARCHAR(100) NOT NULL,
    "created_at" DATE NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Branchs_Product" (
    "id" TEXT NOT NULL,
    "branch_id" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "unit_price" MONEY NOT NULL,
    "quantity" INTEGER NOT NULL,
    "in_stock" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATE NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,

    CONSTRAINT "Branchs_Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(24) NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product_Category" (
    "id" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "category_id" TEXT NOT NULL,

    CONSTRAINT "Product_Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Sales" (
    "id" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "sold_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sales_quant" INTEGER NOT NULL,
    "sales_uni_price" MONEY NOT NULL,
    "sale_total_value" MONEY NOT NULL,
    "employee_id" TEXT NOT NULL,

    CONSTRAINT "Sales_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Employee" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "birth_date" DATE NOT NULL,
    "employee_code" VARCHAR(16) NOT NULL,
    "created_at" DATE NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    "role" "ROLE" NOT NULL,

    CONSTRAINT "Employee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Login" (
    "id" TEXT NOT NULL,
    "employee_id" TEXT NOT NULL,
    "username" VARCHAR(16) NOT NULL,
    "password" VARCHAR(16) NOT NULL,
    "updated_at" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Login_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Security_Asks" (
    "id" TEXT NOT NULL,
    "ask" VARCHAR(64) NOT NULL,
    "description" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP NOT NULL,

    CONSTRAINT "Security_Asks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Login_Security_Ask" (
    "id" TEXT NOT NULL,
    "login_id" TEXT NOT NULL,
    "ask_id" TEXT NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,

    CONSTRAINT "Login_Security_Ask_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Branchs" ADD CONSTRAINT "Branchs_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Companies"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Branchs_Product" ADD CONSTRAINT "Branchs_Product_branch_id_fkey" FOREIGN KEY ("branch_id") REFERENCES "Branchs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Branchs_Product" ADD CONSTRAINT "Branchs_Product_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product_Category" ADD CONSTRAINT "Product_Category_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product_Category" ADD CONSTRAINT "Product_Category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sales" ADD CONSTRAINT "Sales_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sales" ADD CONSTRAINT "Sales_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Login" ADD CONSTRAINT "Login_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Login_Security_Ask" ADD CONSTRAINT "Login_Security_Ask_login_id_fkey" FOREIGN KEY ("login_id") REFERENCES "Login"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Login_Security_Ask" ADD CONSTRAINT "Login_Security_Ask_ask_id_fkey" FOREIGN KEY ("ask_id") REFERENCES "Security_Asks"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
