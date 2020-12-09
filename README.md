# README
## usersテーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| nickname  | string     | null: false, unique: true      |
| email     | string     | null: false, unique: true      |
| password  | string     | null: false                    |
| name      | string     | null: false                    |
| name_kana | string     | null: false                    |
| birthday  | date       | null: false                    |

### Association
- has_many :items
- has_many :purchase_records

## items テーブル

| Columu                   | Type       | Options                          |
| ------------------------ | ---------- | ---------------------------------|
| image                    | ASで実装    |                                  |
| product_name             | string     | null: false                      |
| product_name_explanation | string     | null: false                      |
| category                 | integer    | null: false                      |
| condition                | integer    | null: false                      |
| shipping_charges         | integer    | null: false                      |
| shipping_area            | integer    | null: false                      |
| says_to_ship             | integer    | null: false                      |
| price                    | integer    | null: false                      |
| user                     | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Columu                   | Type       | Options                          |
| ------------------------ | ---------- | ---------------------------------|
| user                     | references | null: false, foreign_key: true   |
| items                    | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item
- has_one :street_address

## street_addresss テーブル

| Columu                   | Type       | Options                          |
| ------------------------ | ---------- | ---------------------------------|
| postal_code              | string     | null: false                      |
| prefectures              | string     | null: false                      |
| municipalities           | string     | null: false                      |
| address                  | string     | null: false                      |
| building_name            | string     |                                  |
| phone_number             | integer    | null: false                      |
| purchase_record          | references | null: false, foreign_key: true   |

### Association

- belongs_to :purchase_record