# README
## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false, unique: true      |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Columu                      | Type       | Options                          |
| --------------------------- | ---------- | ---------------------------------|
| image                       | ASで実装    |                                  |
| product_name                | string     | null: false                      |
| product_name_explanation    | text       | null: false                      |
| category_id                 | integer    | null: false                      |
| condition_id                | integer    | null: false                      |
| shipping_charges_id         | integer    | null: false                      |
| prefectures_id              | integer    | null: false                      |
| says_to_ship_id             | integer    | null: false                      |
| price                       | integer    | null: false                      |
| user                        | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Columu                   | Type       | Options                          |
| ------------------------ | ---------- | ---------------------------------|
| user                     | references | null: false, foreign_key: true   |
| item                     | references | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :item
- has_one :street_address

## street_addresss テーブル

| Columu                   | Type       | Options                          |
| ------------------------ | ---------- | ---------------------------------|
| postal_code              | string     | null: false                      |
| prefectures_id           | integer    | null: false                      |
| municipalities           | string     | null: false                      |
| address                  | string     | null: false                      |
| building_name            | string     |                                  |
| phone_number             | string    | null: false                       |
| order                    | references | null: false, foreign_key: true   |

### Association

- belongs_to :order