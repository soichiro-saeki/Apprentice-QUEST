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
channels テーブル: チャンネルに関する情報を保存します。<br>
id: チャンネルのID (主キー)  <br>
name: チャンネル名  <br>
<br>
programs テーブル: 番組に関する情報を保存します。<br>
id: 番組のID (主キー)<br>
title: 番組名<br>
description: 番組詳細<br>
genre: ジャンル<br>
<br>
seasons テーブル, シーズンに関する情報を保存します。<br>
id: シーズンのID (主キー)<br>
number: シーズン番号<br>
program_id: 番組のID (外部キー)<br>
<br>
episodes テーブル: エピソードに関する情報を保存します。<br>
id: エピソードのID (主キー)<br>
number: エピソード番号<br>
title: エピソードタイトル<br>
description: エピソード詳細<br>
duration: 動画時間<br>
air_date: 公開日<br>
views: 視聴数<br>
season_id: シーズンのID (外部キー)<br>
programs_id:プログラムのID(外部キー）<br>
<br>
schedules テーブル: スケジュールに関する情報を保存します。<br>
id: スケジュールのID (主キー)<br>
start_time: 放送開始時刻<br>
end_time: 放送終了時刻<br>
channel_id: チャンネルのID (外部キー)<br>
episode_id: エピソードのID (外部キー)<br>

</details>

### 2.データベースとテーブル設計
ではエンティティの定義に基づきデータベースの設計を行います。
<details>
<summary>チャンネルテーブル</summary>
  channelsテーブル

| Field | Type         | Null | Key | Default | Extra          |
|-------|--------------|------|-----|---------|----------------|
| id    | int          | NO   | PRI | NULL    | auto_increment |
| name  | varchar(255) | NO   |     | NULL    |                |
</details>

<details>
<summary> 番組テーブル </summary>
  programsテーブル

| Field       | Type         | Null | Key | Default | Extra          |
|-------------|--------------|------|-----|---------|----------------|
| id          | int          | NO   | PRI | NULL    | auto_increment |
| title       | varchar(255) | NO   | UNI | NULL    |                |
| description | text         | YES  |     | NULL    |                |
| genre       | varchar(255) | YES  |     | NULL    |                |
</details>

<details>
<summary>シーズンテーブル</summary>
  seasonsテーブル

| Field      | Type | Null | Key | Default | Extra          |
|------------|------|------|-----|---------|----------------|
| id         | int  | NO   | PRI | NULL    | auto_increment |
| number     | int  | NO   |     | NULL    |                |
| program_id | int  | NO   | MUL | NULL    |                |
</details>

<details>
<summary>エピソードテーブル</summary>
  episodesテーブル

| Field       | Type         | Null | Key | Default | Extra          |
|-------------|--------------|------|-----|---------|----------------|
| id          | int          | NO   | PRI | NULL    | auto_increment |
| number      | int          | NO   |     | NULL    |                |
| title       | varchar(255) | NO   |     | NULL    |                |
| description | text         | YES  |     | NULL    |                |
| duration    | time         | NO   |     | NULL    |                |
| air_date    | date         | NO   |     | NULL    |                |
| views       | int          | NO   |     | 0       |                |
| season_id   | int          | YES  | MUL | NULL    |                |
| programs_id | int          | YES  | MUL | NULL    |                |
</details>

<details>
<summary>スケジュールテーブル</summary>
  schedulesテーブル

| Field      | Type     | Null | Key | Default | Extra          |
|------------|----------|------|-----|---------|----------------|
| id         | int      | NO   | PRI | NULL    | auto_increment |
| start_time | datetime | NO   |     | NULL    |                |
| end_time   | datetime | NO   |     | NULL    |                |
| channel_id | int      | NO   | MUL | NULL    |                |
| episode_id | int      | NO   | MUL | NULL    |                |
</details>

<details>
<summary>視聴日時</summary>
  viewingsテーブル

| Field      | Type     | Null | Key | Default | Extra          |
|------------|----------|------|-----|---------|----------------|
| id         | int      | NO   | PRI | NULL    | auto_increment |
| episode_id | int      | NO   | MUL | NULL    |                |
| viewed_at  | datetime | NO   |     | NULL    |                |

</details>

### 3.MySQLでデータベースとテーブルを作成
create_nettv_table.sqlを保存したディレクトリから実行してください。
```
source C:\Users\..\create_nettv_table.sql
```

### 4.データベースにデータを格納
chatGPTなどのAIchatにデータを作成してもらっても構いませんが、こちらで用意しているdumpファイルを実行していただいても結構です。

```
net_tv_data.dump
```

### 5.データベースのスキーマの確認
それぞれのテーブルをDESCRIBE [table名];で設計通りにできているか確認してください。

| Tables_in_nettv_show |
|----------------------|
| channels             |
| episodes             |
| programs             |
| schedules            |
| seasons              |
| viewings             |
