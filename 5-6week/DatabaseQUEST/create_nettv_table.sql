-- データベースを作成
CREATE DATABASE nettv_show;
USE nettv_show;

-- channels テーブルを作成
CREATE TABLE channels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- programs テーブルを作成
CREATE TABLE programs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL　UNIQUE,
    description TEXT,
    genre VARCHAR(255)
);

-- seasons テーブルを作成
CREATE TABLE seasons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number INT NOT NULL,
    program_id INT NOT NULL,
    FOREIGN KEY (program_id) REFERENCES programs(id)
);

-- episodes テーブルを作成
CREATE TABLE episodes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    duration TIME NOT NULL,
    air_date DATE NOT NULL,
    views INT NOT NULL DEFAULT 0,
    season_id INT,
    FOREIGN KEY (season_id) REFERENCES seasons(id),
    programs_id INT,
    FOREIGN KEY (programs_id) REFERENCES programs(id)
);

-- schedules テーブルを作成
CREATE TABLE schedules (
    id INT AUTO_INCREMENT PRIMARY KEY,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    channel_id INT NOT NULL,
    episode_id INT NOT NULL,
    FOREIGN KEY (channel_id) REFERENCES channels(id),
    FOREIGN KEY (episode_id) REFERENCES episodes(id)
);

CREATE TABLE viewings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    episode_id INT NOT NULL,
    viewed_at DATETIME NOT NULL,
    FOREIGN KEY (episode_id) REFERENCES episodes(id)
);
