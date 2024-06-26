# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :messages

## items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | -------------------------------|
| Product | string     |                                |
| category| references | null: false,                   |
| price   | references | null: false,                   |
| Seller  | references | null: false,                   |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many   :orders

## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     |                                |
| address     | references | null:                          |
| phone_number| references | null: false,                   |

### Association

- belongs_to :users
- belongs_to :orders