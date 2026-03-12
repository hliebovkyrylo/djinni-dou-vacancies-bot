-- CreateEnum
CREATE TYPE "Source" AS ENUM ('DJINNI', 'DOU');

-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subscription" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "source" "Source" NOT NULL,

    CONSTRAINT "Subscription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DouFilter" (
    "id" SERIAL NOT NULL,
    "subscriptionId" INTEGER NOT NULL,
    "categoryId" INTEGER,
    "experienceId" INTEGER,
    "cityId" INTEGER,
    "remote" BOOLEAN NOT NULL,

    CONSTRAINT "DouFilter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DouCategory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "DouCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniFilter" (
    "id" SERIAL NOT NULL,
    "subscriptionId" INTEGER NOT NULL,
    "salaryMin" INTEGER,
    "employmentId" INTEGER,
    "regionId" INTEGER,

    CONSTRAINT "DjinniFilter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniFiltersCategory" (
    "id" SERIAL NOT NULL,
    "filterId" INTEGER NOT NULL,
    "categoryId" INTEGER NOT NULL,

    CONSTRAINT "DjinniFiltersCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniCategory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "DjinniCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniSubCategory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL,

    CONSTRAINT "DjinniSubCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniEmployment" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "DjinniEmployment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniFilterCompanyType" (
    "id" SERIAL NOT NULL,
    "filterId" INTEGER NOT NULL,
    "typeId" INTEGER NOT NULL,

    CONSTRAINT "DjinniFilterCompanyType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniCompanyType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "DjinniCompanyType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniFilterEnglishLevel" (
    "id" SERIAL NOT NULL,
    "filterId" INTEGER NOT NULL,
    "levelId" INTEGER NOT NULL,

    CONSTRAINT "DjinniFilterEnglishLevel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniEnglishLevel" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "DjinniEnglishLevel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniFilterDomain" (
    "id" SERIAL NOT NULL,
    "filterId" INTEGER NOT NULL,
    "domainId" INTEGER NOT NULL,

    CONSTRAINT "DjinniFilterDomain_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniDomain" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "DjinniDomain_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniRegion" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "DjinniRegion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniRegionCity" (
    "id" SERIAL NOT NULL,
    "regionId" INTEGER NOT NULL,
    "cityId" INTEGER NOT NULL,

    CONSTRAINT "DjinniRegionCity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniRegionCountries" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "regionId" INTEGER NOT NULL,

    CONSTRAINT "DjinniRegionCountries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DjinniFilterExperience" (
    "id" SERIAL NOT NULL,
    "filterId" INTEGER NOT NULL,
    "experienceId" INTEGER NOT NULL,

    CONSTRAINT "DjinniFilterExperience_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UkrainianCity" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "UkrainianCity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Experience" (
    "id" SERIAL NOT NULL,
    "years" INTEGER NOT NULL,

    CONSTRAINT "Experience_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "DouFilter_subscriptionId_key" ON "DouFilter"("subscriptionId");

-- CreateIndex
CREATE UNIQUE INDEX "DouCategory_name_key" ON "DouCategory"("name");

-- CreateIndex
CREATE UNIQUE INDEX "DjinniFilter_subscriptionId_key" ON "DjinniFilter"("subscriptionId");

-- CreateIndex
CREATE UNIQUE INDEX "DjinniFiltersCategory_filterId_categoryId_key" ON "DjinniFiltersCategory"("filterId", "categoryId");

-- CreateIndex
CREATE UNIQUE INDEX "DjinniCategory_name_key" ON "DjinniCategory"("name");

-- CreateIndex
CREATE UNIQUE INDEX "DjinniEmployment_name_key" ON "DjinniEmployment"("name");

-- CreateIndex
CREATE UNIQUE INDEX "DjinniCompanyType_name_key" ON "DjinniCompanyType"("name");

-- CreateIndex
CREATE UNIQUE INDEX "DjinniFilterEnglishLevel_filterId_levelId_key" ON "DjinniFilterEnglishLevel"("filterId", "levelId");

-- CreateIndex
CREATE UNIQUE INDEX "DjinniEnglishLevel_name_key" ON "DjinniEnglishLevel"("name");

-- CreateIndex
CREATE UNIQUE INDEX "DjinniFilterDomain_filterId_domainId_key" ON "DjinniFilterDomain"("filterId", "domainId");

-- CreateIndex
CREATE UNIQUE INDEX "DjinniDomain_name_key" ON "DjinniDomain"("name");

-- CreateIndex
CREATE UNIQUE INDEX "DjinniRegion_name_key" ON "DjinniRegion"("name");

-- CreateIndex
CREATE UNIQUE INDEX "DjinniRegionCity_regionId_cityId_key" ON "DjinniRegionCity"("regionId", "cityId");

-- CreateIndex
CREATE UNIQUE INDEX "DjinniRegionCountries_name_key" ON "DjinniRegionCountries"("name");

-- CreateIndex
CREATE UNIQUE INDEX "DjinniFilterExperience_filterId_experienceId_key" ON "DjinniFilterExperience"("filterId", "experienceId");

-- CreateIndex
CREATE UNIQUE INDEX "UkrainianCity_name_key" ON "UkrainianCity"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Experience_years_key" ON "Experience"("years");

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DouFilter" ADD CONSTRAINT "DouFilter_subscriptionId_fkey" FOREIGN KEY ("subscriptionId") REFERENCES "Subscription"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DouFilter" ADD CONSTRAINT "DouFilter_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "DouCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DouFilter" ADD CONSTRAINT "DouFilter_experienceId_fkey" FOREIGN KEY ("experienceId") REFERENCES "Experience"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DouFilter" ADD CONSTRAINT "DouFilter_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "UkrainianCity"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniFilter" ADD CONSTRAINT "DjinniFilter_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES "DjinniRegion"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniFilter" ADD CONSTRAINT "DjinniFilter_employmentId_fkey" FOREIGN KEY ("employmentId") REFERENCES "DjinniEmployment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniFilter" ADD CONSTRAINT "DjinniFilter_subscriptionId_fkey" FOREIGN KEY ("subscriptionId") REFERENCES "Subscription"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniFiltersCategory" ADD CONSTRAINT "DjinniFiltersCategory_filterId_fkey" FOREIGN KEY ("filterId") REFERENCES "DjinniFilter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniFiltersCategory" ADD CONSTRAINT "DjinniFiltersCategory_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "DjinniCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniSubCategory" ADD CONSTRAINT "DjinniSubCategory_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "DjinniCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniFilterCompanyType" ADD CONSTRAINT "DjinniFilterCompanyType_filterId_fkey" FOREIGN KEY ("filterId") REFERENCES "DjinniFilter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniFilterCompanyType" ADD CONSTRAINT "DjinniFilterCompanyType_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES "DjinniCompanyType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniFilterEnglishLevel" ADD CONSTRAINT "DjinniFilterEnglishLevel_filterId_fkey" FOREIGN KEY ("filterId") REFERENCES "DjinniFilter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniFilterEnglishLevel" ADD CONSTRAINT "DjinniFilterEnglishLevel_levelId_fkey" FOREIGN KEY ("levelId") REFERENCES "DjinniEnglishLevel"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniFilterDomain" ADD CONSTRAINT "DjinniFilterDomain_filterId_fkey" FOREIGN KEY ("filterId") REFERENCES "DjinniFilter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniFilterDomain" ADD CONSTRAINT "DjinniFilterDomain_domainId_fkey" FOREIGN KEY ("domainId") REFERENCES "DjinniDomain"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniRegionCity" ADD CONSTRAINT "DjinniRegionCity_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES "DjinniRegion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniRegionCity" ADD CONSTRAINT "DjinniRegionCity_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "UkrainianCity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniRegionCountries" ADD CONSTRAINT "DjinniRegionCountries_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES "DjinniRegion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniFilterExperience" ADD CONSTRAINT "DjinniFilterExperience_filterId_fkey" FOREIGN KEY ("filterId") REFERENCES "DjinniFilter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DjinniFilterExperience" ADD CONSTRAINT "DjinniFilterExperience_experienceId_fkey" FOREIGN KEY ("experienceId") REFERENCES "Experience"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
