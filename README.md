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

| Column        | Type    | Options     |
| --------      | ------  | ----------- |
| nick_name     | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| first_name    | string  | null: false |
| last_name     | string  | null: false |
|  id           | integer | null: false |


### Association
- has_many :items
- has_many :buyer
- has_one :card


## items テーブル

| Column      | Type       | Options     |
| ------      | ------     | ----------- |
| image       | text       | null: false |
| item_name   | string     | null: false |
| text        | string     | null: false |
| user_id     | references | null: false |
| items_id    | integer    | null: false |

### Association
- belongs_to :user
- belongs_to :buyer 



## buyer テーブル
| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :items
- has_one :card

## card テーブル

| Column           | Type     | Options                 |
| -------          | -------  | ----------------------- |
| number           |  integer |                         |
| month            |  integer |                         |
| security_number  |  integer |                         |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
### Association

- belongs_to :buyer
- belongs_to :user

