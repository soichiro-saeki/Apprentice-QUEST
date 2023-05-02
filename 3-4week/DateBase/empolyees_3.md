```
部署マネージャーテーブルに、従業員テーブルのデータを内部結合させた全データを取得
 SELECT *  FROM dept_manager 
 INNER JOIN dept_emp 
 ON dept_manager.emp_no = dept_emp.emp_no; emp_noを結合キーとする
+--------+---------+------------+------------+--------+---------+------------+------------+
| emp_no | dept_no | from_date  | to_date    | emp_no | dept_no | from_date  | to_date    |
+--------+---------+------------+------------+--------+---------+------------+------------+
| 110022 | d001    | 1985-01-01 | 1991-10-01 | 110022 | d001    | 1985-01-01 | 9999-01-01 |
| 110039 | d001    | 1991-10-01 | 9999-01-01 | 110039 | d001    | 1986-04-12 | 9999-01-01 |
| 110085 | d002    | 1985-01-01 | 1989-12-17 | 110085 | d002    | 1985-01-01 | 9999-01-01 |
| 110114 | d002    | 1989-12-17 | 9999-01-01 | 110114 | d002    | 1985-01-14 | 9999-01-01 |
| 110183 | d003    | 1985-01-01 | 1992-03-21 | 110183 | d003    | 1985-01-01 | 9999-01-01 |
| 110228 | d003    | 1992-03-21 | 9999-01-01 | 110228 | d003    | 1985-08-04 | 9999-01-01 |
| 110303 | d004    | 1985-01-01 | 1988-09-09 | 110303 | d004    | 1985-01-01 | 9999-01-01 |
| 110344 | d004    | 1988-09-09 | 1992-08-02 | 110344 | d004    | 1985-11-22 | 9999-01-01 |
| 110386 | d004    | 1992-08-02 | 1996-08-30 | 110386 | d004    | 1988-10-14 | 9999-01-01 |
| 110420 | d004    | 1996-08-30 | 9999-01-01 | 110420 | d004    | 1992-02-05 | 9999-01-01 |
| 110511 | d005    | 1985-01-01 | 1992-04-25 | 110511 | d005    | 1985-01-01 | 9999-01-01 |
| 110567 | d005    | 1992-04-25 | 9999-01-01 | 110567 | d005    | 1986-10-21 | 9999-01-01 |
| 110725 | d006    | 1985-01-01 | 1989-05-06 | 110725 | d006    | 1985-01-01 | 9999-01-01 |
| 110765 | d006    | 1989-05-06 | 1991-09-12 | 110765 | d006    | 1989-01-07 | 9999-01-01 |
| 110800 | d006    | 1991-09-12 | 1994-06-28 | 110800 | d006    | 1986-08-12 | 9999-01-01 |
| 110854 | d006    | 1994-06-28 | 9999-01-01 | 110854 | d006    | 1989-06-09 | 9999-01-01 |
| 111035 | d007    | 1985-01-01 | 1991-03-07 | 111035 | d007    | 1985-01-01 | 9999-01-01 |
| 111133 | d007    | 1991-03-07 | 9999-01-01 | 111133 | d007    | 1986-12-30 | 9999-01-01 |
| 111400 | d008    | 1985-01-01 | 1991-04-08 | 111400 | d008    | 1985-01-01 | 9999-01-01 |
| 111534 | d008    | 1991-04-08 | 9999-01-01 | 111534 | d008    | 1988-01-31 | 9999-01-01 |
| 111692 | d009    | 1985-01-01 | 1988-10-17 | 111692 | d009    | 1985-01-01 | 9999-01-01 |
| 111784 | d009    | 1988-10-17 | 1992-09-08 | 111784 | d009    | 1988-02-12 | 9999-01-01 |
| 111877 | d009    | 1992-09-08 | 1996-01-03 | 111877 | d009    | 1991-08-17 | 9999-01-01 |
| 111939 | d009    | 1996-01-03 | 9999-01-01 | 111939 | d009    | 1989-07-10 | 9999-01-01 |
+--------+---------+------------+------------+--------+---------+------------+------------+

部署ごとに、部署番号、歴代のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得  
・部署番号   
  departmentsテーブルのdept_no   
・歴代のマネージャーの従業員番号  
  dpte_managerテーブルのemp_no　              
・マネージャーのファーストネーム　(employees)               
　 employeesテーブルのfirst_name  
・マネージャーのラストネームを取得してください。(employees) 　
　 employeesテーブルのlast_name  
・departmentsテーブルをdに命名  
・dpte_managerテーブルをdmに命名  
・employeesテーブルをeに命名  

SELECT d.dept_no, dm.emp_no, e.first_name, e.last_name
FROM departments d 　　　　
JOIN dept_manager dm　　　
ON d.dept_no = dm.dept_no
JOIN employees e 
ON dm.emp_no = e.emp_no
ORDER BY d.dept_no;
　　
     d        dm         e               e
+---------+--------+-------------+--------------+
| dept_no | emp_no | first_name  | last_name    |
+---------+--------+-------------+--------------+
| d001    | 110022 | Margareta   | Markovitch   |
| d001    | 110039 | Vishwani    | Minakawa     |
| d002    | 110085 | Ebru        | Alpin        |
| d002    | 110114 | Isamu       | Legleitner   |
| d003    | 110183 | Shirish     | Ossenbruggen |
| d003    | 110228 | Karsten     | Sigstam      |
| d004    | 110303 | Krassimir   | Wegerle      |
| d004    | 110344 | Rosine      | Cools        |
| d004    | 110386 | Shem        | Kieras       |
| d004    | 110420 | Oscar       | Ghazalie     |
| d005    | 110511 | DeForest    | Hagimont     |
| d005    | 110567 | Leon        | DasSarma     |
| d006    | 110725 | Peternela   | Onuegbe      |
| d006    | 110765 | Rutger      | Hofmeyr      |
| d006    | 110800 | Sanjoy      | Quadeer      |
| d006    | 110854 | Dung        | Pesch        |
| d007    | 111035 | Przemyslawa | Kaelbling    |
| d007    | 111133 | Hauke       | Zhang        |
| d008    | 111400 | Arie        | Staelin      |
| d008    | 111534 | Hilary      | Kambil       |
| d009    | 111692 | Tonny       | Butterworth  |
| d009    | 111784 | Marjo       | Giarratana   |
| d009    | 111877 | Xiaobin     | Spinelli     |
| d009    | 111939 | Yuchang     | Weedman      |
+---------+--------+-------------+--------------+

部署名追加
SELECT d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name 
FROM departments d 
JOIN dept_manager dm 
ON d.dept_no = dm.dept_no 
JOIN employees e 
ON dm.emp_no = e.emp_no 
ORDER BY d.dept_no;
+---------+--------------------+--------+-------------+--------------+
| dept_no | dept_name          | emp_no | first_name  | last_name    |
+---------+--------------------+--------+-------------+--------------+
| d001    | Marketing          | 110022 | Margareta   | Markovitch   |
| d001    | Marketing          | 110039 | Vishwani    | Minakawa     |
| d002    | Finance            | 110085 | Ebru        | Alpin        |
| d002    | Finance            | 110114 | Isamu       | Legleitner   |
| d003    | Human Resources    | 110183 | Shirish     | Ossenbruggen |
| d003    | Human Resources    | 110228 | Karsten     | Sigstam      |
| d004    | Production         | 110303 | Krassimir   | Wegerle      |
| d004    | Production         | 110344 | Rosine      | Cools        |
| d004    | Production         | 110386 | Shem        | Kieras       |
| d004    | Production         | 110420 | Oscar       | Ghazalie     |
| d005    | Development        | 110511 | DeForest    | Hagimont     |
| d005    | Development        | 110567 | Leon        | DasSarma     |
| d006    | Quality Management | 110725 | Peternela   | Onuegbe      |
| d006    | Quality Management | 110765 | Rutger      | Hofmeyr      |
| d006    | Quality Management | 110800 | Sanjoy      | Quadeer      |
| d006    | Quality Management | 110854 | Dung        | Pesch        |
| d007    | Sales              | 111035 | Przemyslawa | Kaelbling    |
| d007    | Sales              | 111133 | Hauke       | Zhang        |
| d008    | Research           | 111400 | Arie        | Staelin      |
| d008    | Research           | 111534 | Hilary      | Kambil       |
| d009    | Customer Service   | 111692 | Tonny       | Butterworth  |
| d009    | Customer Service   | 111784 | Marjo       | Giarratana   |
| d009    | Customer Service   | 111877 | Xiaobin     | Spinelli     |
| d009    | Customer Service   | 111939 | Yuchang     | Weedman      |
+---------+--------------------+--------+-------------+--------------+

現時点でもマネージャーのみに絞り込み
WHERE dm.to_date >= '9999-01-01' ORDER BY d.dept_no;
'9999-01-01'は現時点でもというdate型の規則
+---------+--------------------+--------+------------+------------+
| dept_no | dept_name          | emp_no | first_name | last_name  |
+---------+--------------------+--------+------------+------------+
| d001    | Marketing          | 110039 | Vishwani   | Minakawa   |
| d002    | Finance            | 110114 | Isamu      | Legleitner |
| d003    | Human Resources    | 110228 | Karsten    | Sigstam    |
| d004    | Production         | 110420 | Oscar      | Ghazalie   |
| d005    | Development        | 110567 | Leon       | DasSarma   |
| d006    | Quality Management | 110854 | Dung       | Pesch      |
| d007    | Sales              | 111133 | Hauke      | Zhang      |
| d008    | Research           | 111534 | Hilary     | Kambil     |
| d009    | Customer Service   | 111939 | Yuchang    | Weedman    |
+---------+--------------------+--------+------------+------------+

SELECT e.emp_no, e.first_name, e.last_name, s.salary, s.from_date, s.to_date 
FROM employees e 
JOIN salaries s 
ON e.emp_no = s.emp_no 
WHERE e.emp_no 
BETWEEN 10001 AND 10010 
ORDER BY e.emp_no, s.from_date;

+--------+------------+-----------+--------+------------+------------+
| emp_no | first_name | last_name | salary | from_date  | to_date    |
+--------+------------+-----------+--------+------------+------------+
|  10001 | Georgi     | Facello   |  60117 | 1986-06-26 | 1987-06-26 |
|  10001 | Georgi     | Facello   |  62102 | 1987-06-26 | 1988-06-25 |
|  10001 | Georgi     | Facello   |  66074 | 1988-06-25 | 1989-06-25 |
|  10001 | Georgi     | Facello   |  66596 | 1989-06-25 | 1990-06-25 |
|  10001 | Georgi     | Facello   |  66961 | 1990-06-25 | 1991-06-25 |
|  10001 | Georgi     | Facello   |  71046 | 1991-06-25 | 1992-06-24 |
|  10001 | Georgi     | Facello   |  74333 | 1992-06-24 | 1993-06-24 |
|  10001 | Georgi     | Facello   |  75286 | 1993-06-24 | 1994-06-24 |
|  10001 | Georgi     | Facello   |  75994 | 1994-06-24 | 1995-06-24 |
|  10001 | Georgi     | Facello   |  76884 | 1995-06-24 | 1996-06-23 |
|  10001 | Georgi     | Facello   |  80013 | 1996-06-23 | 1997-06-23 |
|  10001 | Georgi     | Facello   |  81025 | 1997-06-23 | 1998-06-23 |
|  10001 | Georgi     | Facello   |  81097 | 1998-06-23 | 1999-06-23 |
|  10001 | Georgi     | Facello   |  84917 | 1999-06-23 | 2000-06-22 |
|  10001 | Georgi     | Facello   |  85112 | 2000-06-22 | 2001-06-22 |
|  10001 | Georgi     | Facello   |  85097 | 2001-06-22 | 2002-06-22 |
|  10001 | Georgi     | Facello   |  88958 | 2002-06-22 | 9999-01-01 |
|  10002 | Bezalel    | Simmel    |  65828 | 1996-08-03 | 1997-08-03 |
|  10002 | Bezalel    | Simmel    |  65909 | 1997-08-03 | 1998-08-03 |
|  10002 | Bezalel    | Simmel    |  67534 | 1998-08-03 | 1999-08-03 |
|  10002 | Bezalel    | Simmel    |  69366 | 1999-08-03 | 2000-08-02 |
|  10002 | Bezalel    | Simmel    |  71963 | 2000-08-02 | 2001-08-02 |
|  10002 | Bezalel    | Simmel    |  72527 | 2001-08-02 | 9999-01-01 |
|  10003 | Parto      | Bamford   |  40006 | 1995-12-03 | 1996-12-02 |
|  10003 | Parto      | Bamford   |  43616 | 1996-12-02 | 1997-12-02 |
|  10003 | Parto      | Bamford   |  43466 | 1997-12-02 | 1998-12-02 |
|  10003 | Parto      | Bamford   |  43636 | 1998-12-02 | 1999-12-02 |
|  10003 | Parto      | Bamford   |  43478 | 1999-12-02 | 2000-12-01 |
|  10003 | Parto      | Bamford   |  43699 | 2000-12-01 | 2001-12-01 |
|  10003 | Parto      | Bamford   |  43311 | 2001-12-01 | 9999-01-01 |
|  10004 | Chirstian  | Koblick   |  40054 | 1986-12-01 | 1987-12-01 |
|  10004 | Chirstian  | Koblick   |  42283 | 1987-12-01 | 1988-11-30 |
|  10004 | Chirstian  | Koblick   |  42542 | 1988-11-30 | 1989-11-30 |
|  10004 | Chirstian  | Koblick   |  46065 | 1989-11-30 | 1990-11-30 |
|  10004 | Chirstian  | Koblick   |  48271 | 1990-11-30 | 1991-11-30 |
|  10004 | Chirstian  | Koblick   |  50594 | 1991-11-30 | 1992-11-29 |
|  10004 | Chirstian  | Koblick   |  52119 | 1992-11-29 | 1993-11-29 |
|  10004 | Chirstian  | Koblick   |  54693 | 1993-11-29 | 1994-11-29 |
|  10004 | Chirstian  | Koblick   |  58326 | 1994-11-29 | 1995-11-29 |
|  10004 | Chirstian  | Koblick   |  60770 | 1995-11-29 | 1996-11-28 |
|  10004 | Chirstian  | Koblick   |  62566 | 1996-11-28 | 1997-11-28 |
|  10004 | Chirstian  | Koblick   |  64340 | 1997-11-28 | 1998-11-28 |
|  10004 | Chirstian  | Koblick   |  67096 | 1998-11-28 | 1999-11-28 |
|  10004 | Chirstian  | Koblick   |  69722 | 1999-11-28 | 2000-11-27 |
|  10004 | Chirstian  | Koblick   |  70698 | 2000-11-27 | 2001-11-27 |
|  10004 | Chirstian  | Koblick   |  74057 | 2001-11-27 | 9999-01-01 |
|  10005 | Kyoichi    | Maliniak  |  78228 | 1989-09-12 | 1990-09-12 |
|  10005 | Kyoichi    | Maliniak  |  82621 | 1990-09-12 | 1991-09-12 |
|  10005 | Kyoichi    | Maliniak  |  83735 | 1991-09-12 | 1992-09-11 |
|  10005 | Kyoichi    | Maliniak  |  85572 | 1992-09-11 | 1993-09-11 |
|  10005 | Kyoichi    | Maliniak  |  85076 | 1993-09-11 | 1994-09-11 |
|  10005 | Kyoichi    | Maliniak  |  86050 | 1994-09-11 | 1995-09-11 |
|  10005 | Kyoichi    | Maliniak  |  88448 | 1995-09-11 | 1996-09-10 |
|  10005 | Kyoichi    | Maliniak  |  88063 | 1996-09-10 | 1997-09-10 |
|  10005 | Kyoichi    | Maliniak  |  89724 | 1997-09-10 | 1998-09-10 |
|  10005 | Kyoichi    | Maliniak  |  90392 | 1998-09-10 | 1999-09-10 |
|  10005 | Kyoichi    | Maliniak  |  90531 | 1999-09-10 | 2000-09-09 |
|  10005 | Kyoichi    | Maliniak  |  91453 | 2000-09-09 | 2001-09-09 |
|  10005 | Kyoichi    | Maliniak  |  94692 | 2001-09-09 | 9999-01-01 |
|  10006 | Anneke     | Preusig   |  40000 | 1990-08-05 | 1991-08-05 |
|  10006 | Anneke     | Preusig   |  42085 | 1991-08-05 | 1992-08-04 |
|  10006 | Anneke     | Preusig   |  42629 | 1992-08-04 | 1993-08-04 |
|  10006 | Anneke     | Preusig   |  45844 | 1993-08-04 | 1994-08-04 |
|  10006 | Anneke     | Preusig   |  47518 | 1994-08-04 | 1995-08-04 |
|  10006 | Anneke     | Preusig   |  47917 | 1995-08-04 | 1996-08-03 |
|  10006 | Anneke     | Preusig   |  52255 | 1996-08-03 | 1997-08-03 |
|  10006 | Anneke     | Preusig   |  53747 | 1997-08-03 | 1998-08-03 |
|  10006 | Anneke     | Preusig   |  56032 | 1998-08-03 | 1999-08-03 |
|  10006 | Anneke     | Preusig   |  58299 | 1999-08-03 | 2000-08-02 |
|  10006 | Anneke     | Preusig   |  60098 | 2000-08-02 | 2001-08-02 |
|  10006 | Anneke     | Preusig   |  59755 | 2001-08-02 | 9999-01-01 |
|  10007 | Tzvetan    | Zielinski |  56724 | 1989-02-10 | 1990-02-10 |
|  10007 | Tzvetan    | Zielinski |  60740 | 1990-02-10 | 1991-02-10 |
|  10007 | Tzvetan    | Zielinski |  62745 | 1991-02-10 | 1992-02-10 |
|  10007 | Tzvetan    | Zielinski |  63475 | 1992-02-10 | 1993-02-09 |
|  10007 | Tzvetan    | Zielinski |  63208 | 1993-02-09 | 1994-02-09 |
|  10007 | Tzvetan    | Zielinski |  64563 | 1994-02-09 | 1995-02-09 |
|  10007 | Tzvetan    | Zielinski |  68833 | 1995-02-09 | 1996-02-09 |
|  10007 | Tzvetan    | Zielinski |  70220 | 1996-02-09 | 1997-02-08 |
|  10007 | Tzvetan    | Zielinski |  73362 | 1997-02-08 | 1998-02-08 |
|  10007 | Tzvetan    | Zielinski |  75582 | 1998-02-08 | 1999-02-08 |
|  10007 | Tzvetan    | Zielinski |  79513 | 1999-02-08 | 2000-02-08 |
|  10007 | Tzvetan    | Zielinski |  80083 | 2000-02-08 | 2001-02-07 |
|  10007 | Tzvetan    | Zielinski |  84456 | 2001-02-07 | 2002-02-07 |
|  10007 | Tzvetan    | Zielinski |  88070 | 2002-02-07 | 9999-01-01 |
|  10008 | Saniya     | Kalloufi  |  46671 | 1998-03-11 | 1999-03-11 |
|  10008 | Saniya     | Kalloufi  |  48584 | 1999-03-11 | 2000-03-10 |
|  10008 | Saniya     | Kalloufi  |  52668 | 2000-03-10 | 2000-07-31 |
|  10009 | Sumant     | Peac      |  60929 | 1985-02-18 | 1986-02-18 |
|  10009 | Sumant     | Peac      |  64604 | 1986-02-18 | 1987-02-18 |
|  10009 | Sumant     | Peac      |  64780 | 1987-02-18 | 1988-02-18 |
|  10009 | Sumant     | Peac      |  66302 | 1988-02-18 | 1989-02-17 |
|  10009 | Sumant     | Peac      |  69042 | 1989-02-17 | 1990-02-17 |
|  10009 | Sumant     | Peac      |  70889 | 1990-02-17 | 1991-02-17 |
|  10009 | Sumant     | Peac      |  71434 | 1991-02-17 | 1992-02-17 |
|  10009 | Sumant     | Peac      |  74612 | 1992-02-17 | 1993-02-16 |
|  10009 | Sumant     | Peac      |  76518 | 1993-02-16 | 1994-02-16 |
|  10009 | Sumant     | Peac      |  78335 | 1994-02-16 | 1995-02-16 |
|  10009 | Sumant     | Peac      |  80944 | 1995-02-16 | 1996-02-16 |
|  10009 | Sumant     | Peac      |  82507 | 1996-02-16 | 1997-02-15 |
|  10009 | Sumant     | Peac      |  85875 | 1997-02-15 | 1998-02-15 |
|  10009 | Sumant     | Peac      |  89324 | 1998-02-15 | 1999-02-15 |
|  10009 | Sumant     | Peac      |  90668 | 1999-02-15 | 2000-02-15 |
|  10009 | Sumant     | Peac      |  93507 | 2000-02-15 | 2001-02-14 |
|  10009 | Sumant     | Peac      |  94443 | 2001-02-14 | 2002-02-14 |
|  10009 | Sumant     | Peac      |  94409 | 2002-02-14 | 9999-01-01 |
|  10010 | Duangkaew  | Piveteau  |  72488 | 1996-11-24 | 1997-11-24 |
|  10010 | Duangkaew  | Piveteau  |  74347 | 1997-11-24 | 1998-11-24 |
|  10010 | Duangkaew  | Piveteau  |  75405 | 1998-11-24 | 1999-11-24 |
|  10010 | Duangkaew  | Piveteau  |  78194 | 1999-11-24 | 2000-11-23 |
|  10010 | Duangkaew  | Piveteau  |  79580 | 2000-11-23 | 2001-11-23 |
|  10010 | Duangkaew  | Piveteau  |  80324 | 2001-11-23 | 9999-01-01 |
+--------+------------+-----------+--------+------------+------------+
