## employee dataのインストール手順
https://github.com/datacharmer/test_dbより、downloadZipをダウンロードする。  
保存したいディレクトリで解凍する。  
sourceコマンドでemployee.sqlのファイルを実行する。  
その後ダンプファイルもsourceコマンドで実行し、データベースにデータを挿入する。



## ダンプファイルの作成方法
```
mysqldump -u [username] -p[password] employees > employees_dump.sql
```
## テーブル一覧
```
+----------------------+
| Tables_in_employees  |
+----------------------+
| current_dept_emp     |
| departments          |
| dept_emp             |
| dept_emp_latest_date |
| dept_manager         |
| employees            |
| salaries             |
| titles               |
+----------------------+

show columns from dept_manager;
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| emp_no    | int     | NO   | PRI | NULL    |       |
| dept_no   | char(4) | NO   | PRI | NULL    |       |
| from_date | date    | NO   |     | NULL    |       |
| to_date   | date    | NO   |     | NULL    |       |
+-----------+---------+------+-----+---------+-------+

SELECT dept_no FROM dept_manager; マネージャーの所属部署
+---------+
| dept_no |
+---------+
| d001    |
| d001    |
| d002    |
| d002    |
| d003    |
| d003    |
| d004    |
| d004    |
| d004    |
| d004    |
| d005    |
| d005    |
| d006    |
| d006    |
| d006    |
| d006    |
| d007    |
| d007    |
| d008    |
| d008    |
| d009    |
| d009    |
| d009    |
| d009    |
+---------+

SELECT DISTINCT dept_no FROM dept_manager;マネージャーの所属部署を重複なく出力
+---------+
| dept_no |
+---------+
| d001    |
| d002    |
| d003    |
| d004    |
| d005    |
| d006    |
| d007    |
| d008    |
| d009    |
+---------+


```














※ダンプファイルとは
データベースのデータや構造を保存したテキストファイルのことを指します。ダンプファイルは、データベースのバックアップや移行に使用されます。  
ダンプファイルには、テーブルの定義やデータの挿入文などが含まれています。MySQLでは、mysqldumpコマンドを使用して、データベースのダンプファイルを作成することができます。  
また、sourceコマンドを使用して、ダンプファイルからデータをロードすることができます。  
ダンプファイルはスナップショット形式なので、クエリにダンプファイルを作成するクエリを記載しておけば、定期的にダンプファイルを作成することでバックアップを取ることができる。
