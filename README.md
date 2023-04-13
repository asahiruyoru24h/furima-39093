# テーブル設計

## users テーブル

| Column                                  | Type   | Options     |
| ----------------------------------------| ------ | ----------- |
| nickname                                | string | null: false |
| kanji_first_name                        | string | null: false |
| kanji_last_name                         | string | null: false |
| kana_first_name                         | string | null: false |
| kana_last_name                          | string | null: false |
| email                                   | string | null: false,unique: true	|
| encrypted_password                      | string | null: false |
| birthday                                | date   | null: false |


### Association

- has_many :items
  has_many :costumer

## costumers テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | reference | null: false,foreign_key: true |
| item   | reference | null: false,foreign_key: true |

### Association


belongs_to :user
belongs_to :items
has_one :address

## items テーブル

| Column                 | Type       | Options                        |
| -----------------------| ---------- | ------------------------------ |
| title                  | string | null: false|
| about                  | text   | null: false|
| category_id            | integer| null: false|
| condition_id           | integer| null: false|
| shipment_fee_id        | integer| null: false|
| prepare_id             | integer| null: false|
| price                  | integer| null: false|
| place                  | integer| null: false|
| seller                 | reference  |null: false,foreign_key: true |


  
- belongs_to :user
  has_one :costumer


## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postcode        | string     | null: false|
| state_id        | integer    | null: false|
| city            | string     | null: false|
| building         | string     |            |
| address_line     | string     | null: false|
| mobile_number    | string     | null: false|
| user_id          | reference  |null: false,foreign_key: true |
|

### Association

- belongs_to :costumer