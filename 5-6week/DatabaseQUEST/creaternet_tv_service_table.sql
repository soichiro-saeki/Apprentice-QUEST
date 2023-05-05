-- db作成　重複していない場合に作成
CREATE DATABASE IF NOT EXISTS `internet_tv_service`;

USE `internet_tv_service`;
-- チャンネルテーブル作成
CREATE TABLE IF NOT EXISTS `channels` (
  `channel_id` INT AUTO_INCREMENT PRIMARY KEY,
  `channel_name` VARCHAR(255) NOT NULL
);

-- 番組の放映時間枠テーブル作成
CREATE TABLE IF NOT EXISTS `program_slots` (
  `program_slot_id` INT AUTO_INCREMENT PRIMARY KEY,
  `channel_id` INT NOT NULL,
  `time_slot` TIME NOT NULL,
  FOREIGN KEY (`channel_id`) REFERENCES `channels` (`channel_id`)
);
-- プログラムのテーブル作成
CREATE TABLE IF NOT EXISTS `programs` (
  `program_id` INT AUTO_INCREMENT PRIMARY KEY,
  `program_name` VARCHAR(255) NOT NULL,
  `program_details` TEXT,
  `genre` VARCHAR(255) NOT NULL
);
-- シーズンテーブル作成
CREATE TABLE IF NOT EXISTS `seasons` (
  `season_id` INT AUTO_INCREMENT PRIMARY KEY,
  `program_id` INT NOT NULL,
  `season_number` INT NOT NULL,
  FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`)
);
-- エピソードテーブル
CREATE TABLE IF NOT EXISTS `episodes` (
  `episode_id` INT AUTO_INCREMENT PRIMARY KEY,
  `season_id` INT NOT NULL,
  `episode_number` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `episode_details` TEXT,
  `video_length` TIME NOT NULL,
  `release_date` DATE NOT NULL,
  FOREIGN KEY (`season_id`) REFERENCES `seasons` (`season_id`)
);
-- 視聴数テーブル
CREATE TABLE IF NOT EXISTS `view_counts` (
  `view_count_id` INT AUTO_INCREMENT PRIMARY KEY,
  `episode_id` INT NOT NULL,
  `program_slot_id` INT NOT NULL,
  `view_count` INT NOT NULL,
  FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`episode_id`),
  FOREIGN KEY (`program_slot_id`) REFERENCES `program_slots` (`program_slot_id`)
