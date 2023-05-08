
### 設計時にUNIQUEキーを設定し忘れていたので、UNIQEキーをテーブルに追加した。
```
-- programs テーブルを作成
CREATE TABLE programs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    genre VARCHAR(255)
);

### 重複しているカラム検索
SELECT title, COUNT(*) FROM programs
GROUP BY title
HAVING COUNT(*) > 1;

UNIQUEキーをテーブルに追加
ALTER TABLE programs
ADD UNIQUE (title);


```
※重複していたタイトル名

| title                    | COUNT(*) |
--------------------------|----------|
| 進撃の巨人                |        3 |
| NARUTO -ナルト-     　    |        3 |
| アベンジャーズ            |        3 |
| ブレイキング・バッド       |        3 |
| スター・ウォーズ           |        3 |
| ダークナイト               |        3 |
| ゲーム・オブ・スローンズ    |        3 |
| ワンパンマン               |        3 |
| FIFAワールドカップ        |        3 |
| マトリックス              |        3 |

### すべての重複しているタイトルを洗い出し、titleの値が1になるまで削除する。
```
DELETE p1 FROM programs p1  
INNER JOIN programs p2  
WHERE p1.id > p2.id AND p1.title = p2.title;  
```

## UNIQUEキーをあらかじめ追加しておくように修正。
```
-- programs テーブルを作成
CREATE TABLE programs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL　UNIQUE,
    description TEXT,
    genre VARCHAR(255)
);
```



