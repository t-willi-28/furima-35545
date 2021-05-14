# テーブル設計

## usersテーブル

| Column           | Type   | Option      |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| last_name        | string | null: false |
| first_name_kana  | string | null: false |
| last_name_kana   | string | null: false |
| barth_date       | date   | null: false |

### Association

- has_many :products
- has_many :buyer
- has_many :ship_address

## productsテーブル

| Column      | Type       | Option      |
| ----------- | ---------- | ----------- |
| name        | string     | null: false |
| category    | string     | null: false |
| status      | string     | null: false |
| ship_from   | string     | null: false |
| ship_day    | string     | null: false |
| description | text       | null: false |
| ship_cost   | integer    | null: false |
| price       | integer    | null: false |
| user_id     | references |             |

### Association

- belongs_to :user
- has_one :ship_address
- has_one :buyer

## ship_addressテーブル

| Column        | Type       | Option      |
| ------------- | ---------- | ----------- |
| post_code     | integer    | null: false |
| prefecture    | string     | null: false |
| municipality  | string     | null: false |
| building_name | string     |             |
| address       | text       | null: false |
| phone_number  | string     | null: false |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :buyer

## buyerテーブル

| Column     | Type       | Option      |
| ---------- | ---------- | ----------- |
| user_id    | references |             |
| product_id | references |             |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :buyer