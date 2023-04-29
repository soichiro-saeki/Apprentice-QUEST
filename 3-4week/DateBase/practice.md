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
 
