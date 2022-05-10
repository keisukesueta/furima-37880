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
has_many :destinations
has_many :historys




### goodsテーブル

| Column             | Type     | Options                        |
| ------------------ | ------   | -----------                    |
| name               | string   | null: false                    | 
| description        | text     | null: false                    | 
| status_id          | string   | null: false                    |
| price              | string   | null: false                    |
| category_id        | string   | null: false                    |
| sippingcost_id     | string   | null: false                    |
| sippingdays_id     | string   | null: false                    |
| sippingaddress_id  | string   | null: false                    |
| user               |references| null: false, foreign_key: true | 外部キー


### Association

- belongs_to :user
- has_one :history



####　destinations テーブル

| Column         | Type       | Options                        |
|-------------   |------------|--------------------------------|
| postalcode     | string     | null: false                    |
| prefecture_id  | string     | null: false                    |
| city_id        | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

 
### Association

- belongs_to :history


####　 historysテーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| goods_id    | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

- has_one :good
- belongs_to :user
- has_one : destination


