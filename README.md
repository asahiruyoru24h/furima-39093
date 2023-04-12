# テーブル設計

## users テーブル

| Column                                  | Type   | Options     |
| ----------------------------------------| ------ | ----------- |
| nickname                                | string | null: false |
| kanji_first_name                        | string | null: false |
| kanji_last_name                         | string | null: false |
| kana_first_name                         | string | null: false |
| kana_last_name                          | string | null: false |
| email                                   | string | unique: true |
| encrypted_password                      | string | null: false |
| birthday                                | date   | null: fals |


### Association

- has_many :items,costumer,address,
- has_many :items, through: :costumer

## costumer テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| item   | string | null: false |

### Association

- has_many :address
- has_many :users, through: :room_users
- has_many :messages

## items テーブル

| Column                 | Type       | Options                        |
| -----------------------| ---------- | ------------------------------ |
| title                  | references | null: false, foreign_key: true |
| text                   | references | null: false, foreign_key: true |
| category               | references | null: false, foreign_key: true |
| condition              | references | null: false, foreign_key: true |
| shipment fee           | references | null: false, foreign_key: true |
| days                   | references | null: false, foreign_key: true |
| price                  | references | null: false, foreign_key: true |
| place                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postcode        | string     | null: false, foreign_key: true |
| state           | references | null: false, foreign_key: true |
| city            | references | null: false, foreign_key: true |
|address line     | references | null: false, foreign_key: true |
|mobile number    | references | null: false, foreign_key: true |
|
|

### Association

- belongs_to :costumer
- belongs_to :user