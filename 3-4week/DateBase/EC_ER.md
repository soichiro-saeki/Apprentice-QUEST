あなたはこれからAmazonのようなECサイトを新規に作成しようとしています。ユーザーが会員登録し、その後商品を購入できるサイトです。  　

各ユーザーは、マイページで登録情報と購入履歴を確認することができます。ECサイトのマイページには、以下の情報が表示されていました。  

山浦清透のマイページ  

○購入履歴  
・購入商品1（4/14購入）  　　
【商品】iPhone 13  
【カテゴリー】スマートフォン   
【値段】100,000円  

・購入商品2（4/17購入）  
【商品】キリン一番搾り生ビール10本  
【カテゴリー】ビール  
【値段】2,000円  
ここで表示されている情報がサイトで必要となる全ての種類データであるとします（ユーザーや商品は他にも存在しています）。  


Userテーブル  
| カラム名	| データ型 |	NULL	| キー	| 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | ---| --- | 
| id | bigint(20) |  |	PRIMARY |  |	YES |
|name |	varchar(100) | | | |				
| email	| varchar(100) | | INDEX | | |		
					
syohinテーブル					
| カラム名	| データ型 |	NULL	| キー	| 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | ---| --- | 
| id | bigint(20) | | PRIMARY | | YES |
| syohin_name	| varchar(100) | | | | |				
| syohine_category | varchar(100) | | | | |				
| price |	bigint(20) | | | | |				
					
					
					
purchase_histories					
| カラム名	| データ型 |	NULL	| キー	| 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | ---| --- | 
| id | bigint(20)| | PRIMARY	|	| YES |
| user_id |	bigint(20) | YES | INDEX | | |		
| syohin_id | bigint(20) | YES | INDEX | | |		
| purchase_date |	date | | | | |				
