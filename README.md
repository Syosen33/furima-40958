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
| birth_year         | integer  | null: false |
| birth_month        | integer  | null: false |
| birth_day          | integer  | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :messages
- has_many :favorite through: : item_users


## items テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | -------------------------------|
| Product_name        | string     | null: false,                   |
| description         | text       | null: false,                   |
| category            | string     | null: false,                   |
| shipping_fee_burden | string     | null: false,                   |
| shipping_from       | string     | null: false,                   |
| shipping_days       | integer    | null: false,                   |
| price               | integer    | null: false,                   |
| selling_fee         | integer    | null: false,                   |
| profit              | integer    | null: false,                   |
| user_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many   :orders
- has_many   :comments

## orders テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | -------------------------------|
| Postal_name         | string     | null: false,                   |
| prefecture          | string     | null: false,                   |
| city                | string     | null: false,                   |
| street_address      | string     | null: false,                   |
| building            | string     | null: false,                   |
| phone_number        | string     | null: false,                   |
| item_id             | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :items

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |

- belongs_to :users
- belongs_to :items

## favorite テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

- belongs_to :users
- belongs_to :items