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

