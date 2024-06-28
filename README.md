# テーブル設計

## users テーブル
| Column             | Type   | Options       |
| ------------------ | ------ | ------------- |
| nickname           | string   | null: false |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| last_name          | string   | null: false |
| first_name         | string   | null: false |
| last_name_kana     | string   | null: false |
| last_name_kana     | string   | null: false |
| date               | integer  | null: false |


### Association
- has_many  :items
- has_many  :orders


## items テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | -------------------------------|
| product_name        | string     | null: false,                   |
| description         | text       | null: false,                   |
| category            | integer    | null: false,                   |
| shipping_fee_burden | integer    | null: false,                   |
| shipping_from       | integer    | null: false,                   |
| shipping_day        | integer    | null: false,                   |
| price               | integer    | null: false,                   |
| user                | references | null: false, foreign_key: true |

### Association

- has_many   :orders
- belongs_to :user

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | -------------------------------|
| postal_code         | string     | null: false,                   |
| prefecture          | integer    | null: false,                   |
| city                | string     | null: false,                   |
| street_address      | string     | null: false,                   |
| building            | string     |                                |
| phone_number        | string     | null: false,                   |
| order               | references | null: false, foreign_key: true |


### Association

- belongs_to :order




