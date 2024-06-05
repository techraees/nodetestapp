/*
  Warnings:

  - A unique constraint covering the columns `[userId]` on the table `Admin` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[userId]` on the table `Company` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[userId]` on the table `Dealership` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_admin_fkey`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_company_fkey`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_dealership_fkey`;

-- AlterTable
ALTER TABLE `admin` ADD COLUMN `userId` INTEGER NULL;

-- AlterTable
ALTER TABLE `company` ADD COLUMN `userId` INTEGER NULL;

-- AlterTable
ALTER TABLE `dealership` ADD COLUMN `userId` INTEGER NULL;

-- AlterTable
ALTER TABLE `user` MODIFY `entityId` INTEGER NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Admin_userId_key` ON `Admin`(`userId`);

-- CreateIndex
CREATE UNIQUE INDEX `Company_userId_key` ON `Company`(`userId`);

-- CreateIndex
CREATE UNIQUE INDEX `Dealership_userId_key` ON `Dealership`(`userId`);

-- AddForeignKey
ALTER TABLE `Dealership` ADD CONSTRAINT `Dealership_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Admin` ADD CONSTRAINT `Admin_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Company` ADD CONSTRAINT `Company_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
