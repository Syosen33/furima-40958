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
- has_many :items
- has_one  :orders


## items テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | -------------------------------|
| product_name        | string     | null: false,                   |
| description         | text       | null: false,                   |
| category            | string     | null: false,                   |
| shipping_fee_burden | integer    | not null, foreign key (references: genres) 
| shipping_from       | integer    | not null, foreign key (references: genres) 
| shipping_days       | integer    | not null, foreign key (references: genres) 
| price               | integer    | null: false,                   |
| user                | references | null: false, foreign_key: true |

### Association

- has_one    :order
- bilongs_to :user

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | string     | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | -------------------------------|
| postal_code         | string     | null: false,                   |
| prefecture          | integer    | not null, foreign key (references: prefectures) |
| city                | string     | null: false,                   |
| street_address      | string     | null: false,                   |
| building            | string     |                                |
| phone_number        | string     | null: false,                   |
| order               | references | null: false, foreign_key: true |


### Association

- belongs_to :order




