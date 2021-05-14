# テーブル設計

## usersテーブル

| Column            | Type   | Option                   |
| ----------------- | ------ | ------------------------ |
| nickname          | string | null: false              |
| email             | string | null: false, unique: true|
| encrypted_password| string | null: false              |
| first_name        | string | null: false              |
| last_name         | string | null: false              |
| first_name_kana   | string | null: false              |
| last_name_kana    | string | null: false              |
| barth_date        | date   | null: false              |

### Association

- has_many :products
- has_many :buyers

## productsテーブル

| Column      | Type       | Option           |
| ----------- | ---------- | ---------------- |
| name        | string     | null: false      |
| description | text       | null: false      |
| category_id | integer    | null: false      |
| stat_id     | integer    | null: false      |
| from_id     | integer    | null: false      |
| day_id      | integer    | null: false      |
| cost_id     | integer    | null: false      |
| price       | integer    | null: false      |
| user        | references | foreign_key: true|

### Association

- belongs_to :user
- has_one :buyer

## ship_addressテーブル

| Column        | Type       | Option           |
| ------------- | ---------- | ---------------- |
| post_code     | string     | null: false      |
| from_id       | integer    | null: false      |
| municipality  | string     | null: false      |
| building_name | string     |                  |
| address       | string     | null: false      |
| phone_number  | string     | null: false      |
| buyer         | references | foreign_key: true|

### Association

- belongs_to :buyer

## buyerテーブル

| Column     | Type       | Option            |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| product    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :ship_address