## Thank you for reading!!
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/25423296/163456776-7f95b81a-f1ed-45f7-b7ab-8fa810d529fa.png">
  <source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png">
  <img alt="Shows an illustrated sun in light mode and a moon with stars in dark mode." src="https://user-images.githubusercontent.com/25423296/163456779-a8556205-d0a5-45e2-ac17-42d089e3c3f8.png"width="100" height="100">
</picture>

## 好きな時間に好きな場所で話題の動画を無料で楽しめる「インターネットTVサービス」を作ってみましょう。

こちらのドキュメントはデータベース設計の流れを一緒に理解し、実際にデータベースの構築を行う手順を記載してます。

手順としては下記手順で進めます。データベースの構築のみ行いたい方は3番から進めてください。  
- エンティティの定義  
- エンティティの定義に基づきテーブル設計を行う。※第3正規形になるようにする。  
- 実際にMySQLにてデータベースの作成とテーブルの作成を行う。  
- chatGPTなどAIchatからデータを作成し、データベースにデータを格納する。※dumpファイルからインポートする。  
- データベースが設計通りにできているか確認する。

### 1.エンティティの定義
まずはエンティティの定義をします。
<details>
    <summary> 
      エンティティの定義の方法について確認したい方
    </summary>
  
  チャンネルテーブル: チャンネルID、チャンネル名<br>
  番組枠テーブル: 番組枠ID、チャンネルID、時間帯<br>
  番組テーブル: 番組ID、番組名、番組詳細、ジャンル <br> 
  シーズンテーブル: シーズンID、番組ID、シーズン数  <br>
  エピソードテーブル: エピソードID、シーズンID、エピソード数、タイトル、エピソード詳細、動画時間、公開日 <br> 
  視聴数テーブル: 視聴数ID、エピソードID、番組枠ID、視聴数  <br>
  
  これらのテーブルは外部キー制約を使用して関連付けられます。  <br>
  例えば、番組枠テーブルのチャンネルIDはチャンネルテーブルのチャンネルIDを参照します。<br>
  また、シーズンテーブルの番組IDは番組テーブルの番組IDを参照します。
</details>

### 2.データベースとテーブル設計
ではエンティティの定義に基づきデータベースの設計を行います。
<details>
<summary>チャンネルテーブル</summary>  
  
| Field        | Type         | Null | Key | Default |               Extra|     
|--------------|--------------|------|-----|---------|--------------------|
| channel_id   | int          | NO   | PRI | NULL    |      auto_increment|
| channel_name | varchar(255) | NO   |     | NULL    |                    |

</details>  
<details>
  <summary>エピソードテーブル</summary>
  
| Field           | Type         | Null | Key | Default | Extra          |
|-----------------|--------------|------|-----|---------|----------------|
| episode_id      | int          | NO   | PRI | NULL    | auto_increment |
| season_id       | int          | NO   | MUL | NULL    |                |
| episode_number  | int          | NO   |     | NULL    |                |
| title           | varchar(255) | NO   |     | NULL    |                |
| episode_details | text         | YES  |     | NULL    |                |
| video_length    | time         | NO   |     | NULL    |                |
| release_date    | date         | NO   |     | NULL    |                |

</details>  

<details>
  <summary>番組枠テーブル</summary>  

| Field           | Type | Null | Key | Default | Extra          |
|-----------------|------|------|-----|---------|----------------|
| program_slot_id | int  | NO   | PRI | NULL    | auto_increment |
| channel_id      | int  | NO   | MUL | NULL    |                |
| time_slot       | time | NO   |     | NULL    |                |

</details>
 
<details>
  <summary> 番組テーブル </summary>  

| Field           | Type         | Null | Key | Default | Extra          |
|-----------------|--------------|------|-----|---------|----------------|
| program_id      | int          | NO   | PRI | NULL    | auto_increment |
| program_name    | varchar(255) | NO   |     | NULL    |                |
| program_details | text         | YES  |     | NULL    |                |
| genre           | varchar(255) | NO   |     | NULL    |                |

</details>

<details>
  <summary>シーズンテーブル</summary>
  
| Field         | Type | Null | Key | Default | Extra          |
|---------------|------|------|-----|---------|----------------|
| season_id     | int  | NO   | PRI | NULL    | auto_increment |
| program_id    | int  | NO   | MUL | NULL    |                |
| season_number | int  | NO   |     | NULL    |                |

</details>  

### 3.MySQLでデータベースとテーブルを作成
creaternet_tv_service_table.sqlを保存したディレクトリから実行してください。
```
source C:\Users\..\creaternet_tv_service_table.sql
```

### 4.データベースにデータを格納
chatGPTなどのAIchatにデータを作成してもらっても構いませんが、こちらで用意しているdumpファイルを実行していただいても結構です。

### 5.データベースのスキーマの確認

