# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type       | Options                   |
| ------------------ | ------     | -----------               |
| nickname           | string     | null: false, unique: true | ユニーク制約
| email              | string     | null: false               | ユニーク制約
| encrypted_password | string     | null: false               |
| lastname           | string     | null: false               |
| firstname          | string     | null: false               |
| lastname_kana      | string     | null: false               |
| firstname_kana     | string     | null: false               |
| birth_day          | date       | null: false               |

### Association
has_many :goods
has_many :destination
has_one :card


### goodsテーブル

| Column             | Type     | Options                        |
| ------------------ | ------   | -----------                    |
| name               | string   | null: false                    | 
| description        | string   | null: false                    | 
| status             | string   | null: false                    |
| price              | string   | null: false                    |
| category           | string   | null: false                    |
| user_id            |references| null: false, foreign_key: true | 外部キー


### Association

- belongs_to :user
- has_one :destination
- has_many :imege


####　destination テーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| postalcode  | string     | null: false                    |
| prefecture  | references | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     | null: false                    |
| phone_number| string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |

 
### Association

- belongs_to :goods
- belongs_to :user

####　imeges テーブル

|Column         |Type        |Options                         |
|---------------|------------|--------------------------------|
| image         | strind     | null: false                    |
| goods_id      | integer    | null: false                    |


### Association

- belongs_to :goods





####　card テーブル

|Column         |Type        |Options                         |
|---------------|------------|--------------------------------|
| user_id       | references | null: false, foreign_key: true |
| card_id       | string     | null: false                    |
| security_code | string     | null: false                    |

### Association

- belongs_to :user