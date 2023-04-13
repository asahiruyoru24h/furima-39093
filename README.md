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

- has_many :items,costumer

## costumer テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false,foreign_key: true |
| item   | string | null: false,foreign_key: true |

### Association


belongs_to :user
has_one :address

## items テーブル

| Column                 | Type       | Options                        |
| -----------------------| ---------- | ------------------------------ |
| title                  | string | null: false|
| text                   | string | null: false|
| category_id               | integer| null: false|
| condition_id              | integer| null: false|
| shipment fee_id           | integer| null: false|
| days_id                   | integer| null: false|
| price_id                  | integer| null: false|
| place_id                  | integer| null: false|
### Association

  
- belongs_to :user,costumer

## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postcode        | integer    | null: false|
| state           | string     | null: false|
| city            | string     | null: false|
|building         | string     |            |
|address line     | string     | null: false|
|mobile number    | string     | null: false|
|
|

### Association

- belongs_to :costumer