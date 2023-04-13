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
  has_many :costumers

## costumers テーブル

| Column | Type       | Options                       |
| user   | references |null: false,foreign_key: true  |
| item   | references | null: false,foreign_key: true |

### Association


belongs_to :user
belongs_to :item
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
| place_id               | integer| null: false|
| user                   | references |null: false,foreign_key: true |


  
- belongs_to :user
  has_one :costumer


## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postcode        | string     | null: false|
| place_id        | integer    | null: false|
| city            | string     | null: false|
| building         | string     |            |
| address_line     | string     | null: false|
| mobile_number    | string     | null: false|
| costumer         | references |null: false,foreign_key: true |
|

### Association

- belongs_to :costumer