## インデックスの作成方法
CREATE INDEX カラム ON TABLE;
```
CREATE INDEX birthday 
ON employees (birth_date);

EXPLAIN ANALYZE 
SELECT birth_date = '1961-08-03' 
FROM employees;
+------------------------------------------------------------------------------------------------------+
| EXPLAIN                                                                                              |
+------------------------------------------------------------------------------------------------------+
| -> Table scan on employees  (cost=30183 rows=299512) (actual time=0.0662..73.5 rows=300024 loops=1)
 |
+------------------------------------------------------------------------------------------------------+
1 row in set (0.1020 sec)

SHOW INDEX FROM employees;
+-----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| employees |          0 | PRIMARY  |            1 | emp_no      | A         |      299512 |     NULL | NULL   |      | BTREE      |         |               | YES     | NULL       |
| employees |          1 | birthday |            1 | birth_date  | A         |        4747 |     NULL | NULL   |      | BTREE      |         |               | YES     | NULL       |
+-----------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
Table: インデックスが作成されたテーブルの名前。
Non_unique: インデックスが一意かどうかを示します。0は一意、1は非一意を意味します。
Key_name: インデックスの名前。
Seq_in_index: インデックス内の列の順序番号。
Column_name: インデックスに含まれる列の名前。
Collation: 列の並べ替え順序（昇順または降順）。
Cardinality: インデックス内の一意な値の数。
Sub_part: インデックスに含まれる列のプレフィックス長。
Packed: インデックスが圧縮されているかどうか。
Null: 列がNULL値を含むことができるかどうか。
Index_type: インデックスの種類（BTREE、HASHなど）。
Comment: インデックスに関するコメント。
Index_comment: インデックスに関する追加コメント。
Visible: インデックスが可視かどうか。
Expression: 生成された列式。



CREATE INDEX birthday ON employees (birth_date);
Query OK, 0 rows affected (1.5830 sec)

Records: 0  Duplicates: 0  Warnings: 0
 MySQL  localhost:3306 ssl  employees  SQL > EXPLAIN ANALYZE SELECT birth_date = '1961-08-03' FROM employees;
+----------------------------------------------------------------------------------------------------------------------------+
| EXPLAIN                                                                                                                    |
+----------------------------------------------------------------------------------------------------------------------------+
| -> Covering index scan on employees using birthday  (cost=30183 rows=299512) (actual time=0.056..119 rows=300024 loops=1)
 |
+----------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.1525 sec)

```
