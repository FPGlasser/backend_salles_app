-- CreateTable
CREATE TABLE "Companies" (
    "id" TEXT NOT NULL,
    "code" CHAR(12) NOT NULL,
    "name" VARCHAR(24) NOT NULL,
    "foundation_Date" TIMESTAMP(3) NOT NULL,
    "creation_at" TIMESTAMP(3) NOT NULL,
    "update_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Companies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Branchs" (
    "id" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" VARCHAR NOT NULL,

    CONSTRAINT "Branchs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Address" (
    "id" TEXT NOT NULL,
    "code" VARCHAR(16) NOT NULL,
    "city" VARCHAR(24) NOT NULL,
    "province" VARCHAR(24) NOT NULL,
    "av_street" VARCHAR(24) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Branch_Address" (
    "id" TEXT NOT NULL,
    "branch_id" TEXT NOT NULL,
    "address_id" TEXT NOT NULL,

    CONSTRAINT "Branch_Address_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Companies_code_key" ON "Companies"("code");

-- CreateIndex
CREATE UNIQUE INDEX "Branchs_code_key" ON "Branchs"("code");

-- CreateIndex
CREATE UNIQUE INDEX "Address_id_key" ON "Address"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Branch_Address_id_key" ON "Branch_Address"("id");

-- AddForeignKey
ALTER TABLE "Branch_Address" ADD CONSTRAINT "Branch_Address_branch_id_fkey" FOREIGN KEY ("branch_id") REFERENCES "Branchs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Branch_Address" ADD CONSTRAINT "Branch_Address_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "Address"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
