/*
  Warnings:

  - The values [INDIVIDUAL] on the enum `User_entityType` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the `individual` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `name` to the `Admin` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Company` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Dealership` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_admin_fk`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_company_fk`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_dealership_fk`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_individual_fk`;

-- AlterTable
ALTER TABLE `admin` ADD COLUMN `name` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `company` ADD COLUMN `name` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `dealership` ADD COLUMN `name` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `user` MODIFY `entityType` ENUM('DEALERSHIP', 'ADMIN', 'COMPANY') NOT NULL;

-- DropTable
DROP TABLE `individual`;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `user_dealership_fkey` FOREIGN KEY (`entityId`) REFERENCES `Dealership`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `user_admin_fkey` FOREIGN KEY (`entityId`) REFERENCES `Admin`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `user_company_fkey` FOREIGN KEY (`entityId`) REFERENCES `Company`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
