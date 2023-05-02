```
給与の合計 sum
SELECT SUM(salary) FROM salaries;
+--------------+
| SUM(salary)  |
+--------------+
| 181480757419 |
+--------------+

給与の平均 average
 SELECT AVG(salary) FROM salaries;
+-------------+
| AVG(salary) |
+-------------+
|  63810.7448 |
+-------------+

四捨五入
SELECT ROUND(AVG(salary)) FROM salaries;
+--------------------+
| ROUND(AVG(salary)) |
+--------------------+
|              63811 |
+--------------------+

列の最大値
 SELECT MAX(salary) FROM salaries;
+-------------+
| MAX(salary) |
+-------------+
|      158220 |
+-------------+

給与データの行数をカウント
SELECT COUNT(*) FROM salaries;
+----------+
| COUNT(*) |
+----------+
|  2844047 |
+----------+

1986年6月26日入社の中で給与が一番多い額
 SELECT MAX(salary) FROM salaries WHERE from_date = '1986-06-26';
+-------------+
| MAX(salary) |
+-------------+
|      103344 |
+-------------+

1991年6月26日代謝の
SELECT ROUND(AVG(salary),1) FROM salaries WHERE to_date = '1991-06-26';
+----------------------+
| ROUND(AVG(salary),1) |
+----------------------+
|              57371.6 |
+----------------------+

