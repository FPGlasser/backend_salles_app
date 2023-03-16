/*
  Warnings:

  - You are about to drop the column `foundation_Date` on the `Companies` table. All the data in the column will be lost.
  - Added the required column `foundation_date` to the `Companies` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Companies" DROP COLUMN "foundation_Date",
ADD COLUMN     "foundation_date" TIMESTAMP NOT NULL;
