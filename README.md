# app name
 sauna-app

# app概要
サウナ店舗は、コロナ禍で時間、人数制限をかけている。現在のサウナ人口増加に対応し、健康的な日本人を増やすため、sauna-appを作成した。  
また時間別のユーザーを数値化し、空いてる時間帯で割引を実施、営業時間内での利益の最大化を目指す。  
ユーザー側は、サウナ店舗にアクセスして、空き状況確認、予約することができる。  
サウナ店舗側は、店舗情報を登録し、ユーザーの予約状況を把握することができる機能とした。

# URL
https://sauna-app8.herokuapp.com/

# 利用方法
 ユーザー登録を実施し、お気に入りのサウナ店舗にアクセスし、予約する。  
 サウナ店舗側も同様に登録後、サウナ情報を登録する。ユーザーの予約状況を確認することができる。

# 目指した課題解決
 ・ユーザー側：満員の場合、待ち時間が発生、または帰宅する  
 ・サウナ店舗側：時間、人数制限をかけながらの営業なので、帰るユーザーを減らす  
 ・サウナ店舗の営業時間中の時間別の入店人数がわからない  

# 要件
 上記課題を解決するために、下記の要件をまとめた。  
 ・ユーザー登録、サウナ店舗登録、ログイン、ログアウト機能  
 ・サウナ店舗一覧表示機能、サウナ店舗情報登録、編集、削除、詳細機能  
 ・予約機能：日時を指定して予約し、トップページに本日以降の予約を表示する

# 今後の実装予定の機能
 ・予約削除機能  
 ・空き状況確認機能：サウナ店舗の本日以降の状況を携帯で確認することができる  
 ・オンライン決済機能  
 ・ユーザー側のお気に入りサウナ表示、サウナ店舗へコメント機能  
 
# 今後の展開
  営業時間中に比較的空いている時間帯の特定し、そこの時間帯だけ予約割引を設けて、最大利益が取れるツールとして使う。ロッカーの使用未使用で、予約せずに来ている人の状況もオンラインで見れるようにしたい。

# 使用技術
 ・Ruby on Rails  
 ・HTML  
 ・CSS  
 ・JavaScript

# ER図
 <https://gyazo.com/667ca150c243df61482b3b8e2ea91cc8>

# table設計

## users table
|Colum      |Type   |Options      |
|-----------|-------|-------------|
|name       |string |NOT NULL     |
|email      |string |NOT NULL     |
|password   |string |NOT NULL     |
### Association
-has_many :plans


## admins table
|Colum      |Type   |Options      |
|-----------|-------|-------------|
|name       |string |NOT NULL     |
|email      |string |NOT NULL     |
|password   |string |NOT NULL     |
### Association
-belongs_to :user


## saunas table
|Colum         |Type     |Options      |
|--------------|---------|-------------|
|name          |string   |NOT NULL     |
|sauna_deg     |integer  |NOT NULL     |
|water_deg     |integer  |NOT NULL     |
|price         |integer  |NOT NULL     |
|time_limit    |integer  |NOT NULL     |
|address       |text     |NOT NULL     |
|business_hours|integer  |NOT NULL     |
|image         |ActiveStorageで実装     |
### Association
-belongs_to :admin
-has_many :plans


## plans table
|Colum      |Type     |Options      |
|-----------|---------|-------------|
|user       |reference|             |
|prototype  |reference|             |
|date       |integer  |NOT NULL     |
|time_plan  |integer  |NOT NULL     |
### Association
-belongs_to :user  
-belongs_to :sauna
