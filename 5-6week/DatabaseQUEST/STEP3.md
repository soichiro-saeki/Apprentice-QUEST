## STEP3のクエリ

1.よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください  
  ```
  SELECT title, views 
  FROM episodes
  LIMIT 3;
  ```
2.よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。  
  エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
  ```
  SELECT p.title AS 'Program Title', s.number AS 'Season Number', e.number AS 'Episode Number', e.title AS 'Episode Title', e.views AS 'Views'
  FROM programs p
  JOIN seasons s ON p.id = s.program_id
  JOIN episodes e ON s.id = e.season_id
  ORDER BY e.views DESC
  LIMIT 3;
  ```

3.本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。  
  本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。  
  なお、番組の開始時刻が本日のものを本日放送される番組とみなすものとします。  
```
  SELECT c.name AS channel_name, s.start_time, s.end_time, se.number AS season_number, e.number AS episode_number, e.title AS episode_title, e.description AS episode_description
  FROM schedules sJOIN channels c ON s.channel_id = c.id
  JOIN episodes e ON s.episode_id = e.id
  JOIN seasons se ON e.season_id = se.id
  WHERE DATE(s.start_time) = CURDATE()
  ORDER BY s.start_time;
```                                           

4.ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。  
  ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください  
``` 
  SELECT s.start_time, s.end_time, se.number AS season_number, e.number AS episode_number, e.title AS episode_title, e.description AS episode_description
  FROM schedules s
  JOIN channels c ON s.channel_id = c.id
  JOIN episodes e ON s.episode_id = e.id
  JOIN seasons se ON e.season_id = se.id
  WHERE c.name = 'ドラマ' AND DATE(s.start_time) BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
  ORDER BY s.start_time;
``` 
5.(advanced) 直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください  
```
SELECT p.title AS programs_title, SUM(e.views) AS total_views 
FROM schedules s 
JOIN episodes e ON s.episode_id = e.id 
JOIN programs p ON e.programs_id = p.id WHERE DATE(s.start_time) 
BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE() 
GROUP BY p.id ORDER BY total_views DESC LIMIT 2;
```
6.(advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。  
  ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。
 ```  
SELECT p.genre AS genre_name, p.title AS program_title, AVG(e.views) AS average_views
FROM programs p
JOIN episodes e ON p.id = e.programs_id
GROUP BY p.id
ORDER BY genre_name, average_views DESC;
 ```
  
  
  
