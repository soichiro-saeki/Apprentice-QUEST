## SQLShellでのroot権限でサーバー接続
```
\connect root@localhost:3306
```
## データベースの作成
```
CREATE DATABASE (データベース名)　
CHARACTER SET utf8mb4 大文字小文字は同じものとして扱う一般的な照合順序
CREATE DATABASE mydb CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```
## データベースの操作
```
use [データベース名]　# dbを指定
show tables; # 指定したdbのテーブルを表示
```
## ユーザーの作成・権限・削除
```
# ユーザーの作成
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypassword'; 
#データベースmydbの全ての権限が、ユーザー名がmyuserで接続元がlocalhostのユーザーに付与
GRANT ALL PRIVILEGES ON mydb. * TO 'myuser'@'localhost';　
# ユーザーを削除
DROP USER'myuser'@'localhost';
 ```
 ## テーブルを作成
 ```
 CREATE TABLE user(
 id int,
 username varchar(255),
 email varchar(255),
 password char(30)
 );
 ```
 ## テーブルを削除
 ```
 drop table user;
 ```
 ## カラム追加
 ```
 ALTER TABLE テーブル名 ADD (新規カラム名１ 型情報, 新規カラム名２ 型情報, ...);
 ```
 ## カラム一覧表示
 ```
 show columns from テーブル名;
 ```
 ## カラム削除
 ```
 ALTER TABLE テーブル名 DROP　カラム名
 ```
 ## テーブルの再作成
```
DROP TABLE users;
CREATE TABLE users 
``` 

## データの登録
```
INSERT INTO user (id, username, email, password)
VALUES('001','aaa','aaa@gmail.com','aaa');
```

## データの検索
```
SELECT username FROM user;
```

## データの更新
```
UPDATE users
SET name = 'bbb', email = 'bbb@gmail.com'
WHERE id = '0001';
```

## データの削除
```
DELETE FROM users
WHERE id = '0001';
```

