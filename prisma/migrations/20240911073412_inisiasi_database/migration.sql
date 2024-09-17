-- CreateTable
CREATE TABLE `medicine` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL DEFAULT '',
    `stock` INTEGER NOT NULL DEFAULT 0,
    `exp_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `type` ENUM('Syrup', 'Tablet', 'Powder') NOT NULL,
    `price` DOUBLE NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transctation` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cashier_name` VARCHAR(191) NOT NULL DEFAULT '',
    `order_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transctation_detail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `transaction_Id` INTEGER NOT NULL DEFAULT 0,
    `medicine_id` INTEGER NOT NULL DEFAULT 0,
    `qty` INTEGER NOT NULL DEFAULT 0,
    `order_price` DOUBLE NOT NULL DEFAULT 0,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `transctation_detail` ADD CONSTRAINT `transctation_detail_transaction_Id_fkey` FOREIGN KEY (`transaction_Id`) REFERENCES `transctation`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transctation_detail` ADD CONSTRAINT `transctation_detail_medicine_id_fkey` FOREIGN KEY (`medicine_id`) REFERENCES `medicine`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
