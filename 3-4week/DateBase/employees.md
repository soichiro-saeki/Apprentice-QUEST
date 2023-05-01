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

 SELECT * FROM employees LIMIT 10;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |
|  10002 | 1964-06-02 | Bezalel    | Simmel    | F      | 1985-11-21 |
|  10003 | 1959-12-03 | Parto      | Bamford   | M      | 1986-08-28 |
|  10004 | 1954-05-01 | Chirstian  | Koblick   | M      | 1986-12-01 |
|  10005 | 1955-01-21 | Kyoichi    | Maliniak  | M      | 1989-09-12 |
|  10006 | 1953-04-20 | Anneke     | Preusig   | F      | 1989-06-02 |
|  10007 | 1957-05-23 | Tzvetan    | Zielinski | F      | 1989-02-10 |
|  10008 | 1958-02-19 | Saniya     | Kalloufi  | M      | 1994-09-15 |
|  10009 | 1952-04-19 | Sumant     | Peac      | F      | 1985-02-18 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau  | F      | 1989-08-24 |
+--------+------------+------------+-----------+--------+------------+

女性従業員のみ10列取得
SELECT * FROM employees WHERE gender = "F" LIMIT 10;
+--------+------------+------------+------------+--------+------------+
| emp_no | birth_date | first_name | last_name  | gender | hire_date  |
+--------+------------+------------+------------+--------+------------+
|  10002 | 1964-06-02 | Bezalel    | Simmel     | F      | 1985-11-21 |
|  10006 | 1953-04-20 | Anneke     | Preusig    | F      | 1989-06-02 |
|  10007 | 1957-05-23 | Tzvetan    | Zielinski  | F      | 1989-02-10 |
|  10009 | 1952-04-19 | Sumant     | Peac       | F      | 1985-02-18 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau   | F      | 1989-08-24 |
|  10011 | 1953-11-07 | Mary       | Sluis      | F      | 1990-01-22 |
|  10017 | 1958-07-06 | Cristinel  | Bouloucos  | F      | 1993-08-03 |
|  10018 | 1954-06-19 | Kazuhide   | Peha       | F      | 1987-04-03 |
|  10023 | 1953-09-29 | Bojan      | Montemayor | F      | 1989-12-17 |
|  10024 | 1958-09-05 | Suzette    | Pettey     | F      | 1997-05-19 |
+--------+------------+------------+------------+--------+------------+

女性従業員以外のみ10列取得
SELECT * FROM employees WHERE NOT gender = "F" LIMIT 10;
+--------+------------+------------+-------------+--------+------------+
| emp_no | birth_date | first_name | last_name   | gender | hire_date  |
+--------+------------+------------+-------------+--------+------------+
|  10001 | 1953-09-02 | Georgi     | Facello     | M      | 1986-06-26 |
|  10003 | 1959-12-03 | Parto      | Bamford     | M      | 1986-08-28 |
|  10004 | 1954-05-01 | Chirstian  | Koblick     | M      | 1986-12-01 |
|  10005 | 1955-01-21 | Kyoichi    | Maliniak    | M      | 1989-09-12 |
|  10008 | 1958-02-19 | Saniya     | Kalloufi    | M      | 1994-09-15 |
|  10012 | 1960-10-04 | Patricio   | Bridgland   | M      | 1992-12-18 |
|  10013 | 1963-06-07 | Eberhardt  | Terkki      | M      | 1985-10-20 |
|  10014 | 1956-02-12 | Berni      | Genin       | M      | 1987-03-11 |
|  10015 | 1959-08-19 | Guoxiang   | Nooteboom   | M      | 1987-07-02 |
|  10016 | 1961-05-02 | Kazuhito   | Cappelletti | M      | 1995-01-27 |
+--------+------------+------------+-------------+--------+------------+

誕生日が1960年1月1日以降の人を10列取得
SELECT * FROM employees WHERE birth_date >= "1960-01-01" LIMIT 10;
+--------+------------+------------+-------------+--------+------------+
| emp_no | birth_date | first_name | last_name   | gender | hire_date  |
+--------+------------+------------+-------------+--------+------------+
|  10002 | 1964-06-02 | Bezalel    | Simmel      | F      | 1985-11-21 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau    | F      | 1989-08-24 |
|  10012 | 1960-10-04 | Patricio   | Bridgland   | M      | 1992-12-18 |
|  10013 | 1963-06-07 | Eberhardt  | Terkki      | M      | 1985-10-20 |
|  10016 | 1961-05-02 | Kazuhito   | Cappelletti | M      | 1995-01-27 |
|  10021 | 1960-02-20 | Ramzi      | Erde        | M      | 1988-02-10 |
|  10027 | 1962-07-10 | Divier     | Reistad     | F      | 1989-07-07 |
|  10028 | 1963-11-26 | Domenick   | Tempesti    | M      | 1991-10-22 |
|  10032 | 1960-08-09 | Jeong      | Reistad     | F      | 1990-06-20 |
|  10034 | 1962-12-29 | Bader      | Swan        | M      | 1988-09-21 |
+--------+------------+------------+-------------+--------+------------+

first_nameにviを含む10列取得
 SELECT * FROM employees WHERE first_name LIKE '%vi%' LIMIT 10;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10027 | 1962-07-10 | Divier     | Reistad   | F      | 1989-07-07 |
|  10030 | 1958-07-14 | Elvis      | Demeyer   | M      | 1994-02-17 |
|  10082 | 1963-09-09 | Parviz     | Lortz     | M      | 1990-01-03 |
|  10083 | 1959-07-23 | Vishv      | Zockler   | M      | 1987-03-31 |
|  10102 | 1959-11-04 | Paraskevi  | Luby      | F      | 1994-01-26 |
|  10200 | 1961-12-31 | Vidya      | Awdeh     | M      | 1985-10-16 |
|  10204 | 1956-12-09 | Nevio      | Ritcey    | F      | 1986-12-04 |
|  10211 | 1964-08-05 | Vishu      | Strehl    | F      | 1989-11-18 |
|  10212 | 1959-05-09 | Divier     | Esteva    | M      | 1990-07-11 |
|  10421 | 1959-03-22 | Divine     | Marzano   | M      | 1989-09-12 |
+--------+------------+------------+-----------+--------+------------+

従業員NOが10011,10021,10031の人を取得
 SELECT * FROM employees WHERE emp_no IN(10011,10021,10031);
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10011 | 1953-11-07 | Mary       | Sluis     | F      | 1990-01-22 |
|  10021 | 1960-02-20 | Ramzi      | Erde      | M      | 1988-02-10 |
|  10031 | 1959-01-27 | Karsten    | Joslin    | M      | 1991-09-01 |
+--------+------------+------------+-----------+--------+------------+

従業員番号が20,000のファーストネームとラストネームを取得
 SELECT first_name, last_name FROM employees WHERE emp_no = 20000;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Jenwei     | Matzke    |
+------------+-----------+

1951年1月生まれの人のレコード
SELECT * FROM employees WHERE birth_date LIKE "%1959-01%";
+--------+------------+---------------+------------------+--------+------------+
| emp_no | birth_date | first_name    | last_name        | gender | hire_date  |
+--------+------------+---------------+------------------+--------+------------+
|  10031 | 1959-01-27 | Karsten       | Joslin           | M      | 1991-09-01 |
|  10146 | 1959-01-12 | Chenyi        | Syang            | M      | 1988-06-28 |
|  10373 | 1959-01-08 | Hongzue       | Heijenga         | M      | 1997-04-26 |
|  10479 | 1959-01-27 | Duro          | Coney            | F      | 1987-02-28 |
|  10612 | 1959-01-01 | Gil           | Peroz            | M      | 1991-09-02 |
|  10685 | 1959-01-14 | Zongyan       | Cusworth         | M      | 1990-04-24 |
|  11231 | 1959-01-28 | Marit         | Narwekar         | F      | 1988-04-07 |
|  11281 | 1959-01-14 | Vincent       | Brookner         | M      | 1988-02-03 |
|  11462 | 1959-01-28 | Chikara       | Maginnis         | M      | 1990-04-27 |
|  11483 | 1959-01-30 | Zine          | Mateescu         | M      | 1993-12-02 |
|  11691 | 1959-01-08 | Pragnesh      | Borovoy          | M      | 1989-04-04 |
|  11843 | 1959-01-16 | Zongyan       | Slaats           | M      | 1985-05-26 |

　　　　　　　　　　　　　　　　　　　...

| 499633 | 1959-01-05 | Yurij         | Herath           | M      | 1985-04-01 |
| 499801 | 1959-01-19 | Sverrir       | Pelc             | F      | 1987-05-25 |
| 499893 | 1959-01-26 | Naftali       | Trelles          | M      | 1988-06-04 |
| 499956 | 1959-01-08 | Zhonghua      | Crooks           | F      | 1994-10-12 |
+--------+------------+---------------+------------------+--------+------------+

SELECT * FROM employees  ORDER BY birth_date LIMIT 10;
+--------+------------+------------+--------------+--------+------------+
| emp_no | birth_date | first_name | last_name    | gender | hire_date  |
+--------+------------+------------+--------------+--------+------------+
| 207658 | 1952-02-01 | Kiyokazu   | Whitcomb     | M      | 1988-07-26 |
|  87461 | 1952-02-01 | Moni       | Decaestecker | M      | 1986-10-06 |
|  65308 | 1952-02-01 | Jouni      | Pocchiola    | M      | 1985-03-10 |
| 406121 | 1952-02-01 | Supot      | Remmele      | M      | 1989-01-27 |
|  91374 | 1952-02-01 | Eishiro    | Kuzuoka      | M      | 1992-02-12 |
| 237571 | 1952-02-01 | Ronghao    | Schaad       | M      | 1988-07-10 |
|  33131 | 1952-02-02 | Reinhold   | Savasere     | M      | 1998-01-30 |
|  51486 | 1952-02-02 | Jianwen    | Sigstam      | F      | 1989-07-20 |
|  61382 | 1952-02-02 | Kristof    | Ranft        | M      | 1989-04-21 |
|  59884 | 1952-02-02 | Fan        | Przulj       | M      | 1991-09-25 |
+--------+------------+------------+--------------+--------+------------+

従業員を、年齢が高い順に並び替え、誕生日が同じなら雇った日付が最近の順で並び替え、
トップ30のレコードを取得してください。
 SELECT * FROM employees ORDER BY birth_date ASC, hire_date DESC LIMIT 30;
+--------+------------+------------+--------------+--------+------------+
| emp_no | birth_date | first_name | last_name    | gender | hire_date  |
+--------+------------+------------+--------------+--------+------------+
|  91374 | 1952-02-01 | Eishiro    | Kuzuoka      | M      | 1992-02-12 |
| 406121 | 1952-02-01 | Supot      | Remmele      | M      | 1989-01-27 |
| 207658 | 1952-02-01 | Kiyokazu   | Whitcomb     | M      | 1988-07-26 |
| 237571 | 1952-02-01 | Ronghao    | Schaad       | M      | 1988-07-10 |
|  87461 | 1952-02-01 | Moni       | Decaestecker | M      | 1986-10-06 |
|  65308 | 1952-02-01 | Jouni      | Pocchiola    | M      | 1985-03-10 |
|  48910 | 1952-02-02 | Zhongwei   | DuBourdieux  | M      | 1999-12-19 |
|  33131 | 1952-02-02 | Reinhold   | Savasere     | M      | 1998-01-30 |
| 462774 | 1952-02-02 | Moie       | Chinal       | F      | 1997-09-20 |
| 436596 | 1952-02-02 | Gou        | Pearson      | F      | 1997-08-14 |
|  12282 | 1952-02-02 | Tadahiro   | Delgrange    | M      | 1997-01-09 |
| 217446 | 1952-02-02 | Mayuri     | Barriga      | F      | 1996-06-26 |
| 462007 | 1952-02-02 | Rasiah     | Smeets       | M      | 1995-03-09 |
| 405962 | 1952-02-02 | Moto       | Staudhammer  | M      | 1995-02-20 |
| 203054 | 1952-02-02 | Hausi      | Krohn        | M      | 1994-11-23 |
|  73959 | 1952-02-02 | True       | Denny        | M      | 1994-05-25 |
| 455745 | 1952-02-02 | Moni       | Giveon       | F      | 1994-01-17 |
| 256423 | 1952-02-02 | Bodh       | Baik         | M      | 1993-12-27 |
| 494291 | 1952-02-02 | Cedric     | Tsukuda      | F      | 1993-12-12 |
| 244265 | 1952-02-02 | Pantung    | Halevi       | M      | 1993-11-12 |
| 222160 | 1952-02-02 | Mana       | Salinas      | M      | 1993-05-05 |
|  79034 | 1952-02-02 | Janalee    | Perri        | F      | 1992-12-10 |
| 449186 | 1952-02-02 | Sachar     | Loncour      | M      | 1992-12-04 |
|  29456 | 1952-02-02 | Barun      | Krohm        | F      | 1992-11-23 |
| 467994 | 1952-02-02 | Shridhar   | Horswill     | M      | 1992-10-17 |
| 429276 | 1952-02-02 | Juyoung    | Seghrouchni  | M      | 1992-08-17 |
| 103295 | 1952-02-02 | Shigehito  | Sommer       | F      | 1992-03-15 |
| 234728 | 1952-02-02 | Kolar      | Chepyzhov    | M      | 1992-01-24 |
| 423460 | 1952-02-02 | Wuxu       | Miara        | M      | 1991-10-10 |
|  59884 | 1952-02-02 | Fan        | Przulj       | M      | 1991-09-25 |
+--------+------------+------------+--------------+--------+------------+
```














※ダンプファイルとは
データベースのデータや構造を保存したテキストファイルのことを指します。ダンプファイルは、データベースのバックアップや移行に使用されます。  
ダンプファイルには、テーブルの定義やデータの挿入文などが含まれています。MySQLでは、mysqldumpコマンドを使用して、データベースのダンプファイルを作成することができます。  
また、sourceコマンドを使用して、ダンプファイルからデータをロードすることができます。  
ダンプファイルはスナップショット形式なので、クエリにダンプファイルを作成するクエリを記載しておけば、定期的にダンプファイルを作成することでバックアップを取ることができる。