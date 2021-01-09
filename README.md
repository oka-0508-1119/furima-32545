
## users table

| Column                | Type       | Options           |
|-----------------------|------------|-------------------|
| first_name            | string     | null: false       |
| last_name             | string     | null: false       |
| first_name_kana       | string     | null: false       |
| last_name_kana        | string     | null: false       |
| nickname              | string     | null: false       |
| encrypted_password    | string     | null: false       |
| email                 | string     | null: false       |
| birth_date            | date       | null: false       |

### Association

- has_many :items
- has_many :purchase_records


## items table

| Column                     | Type        | Options           |
|----------------------------|-------------|-------------------|
| name                       | string      | null: false       |
| category_id                | integer     | null: false       |
| price                      | integer     | null: false       |
| user                       | references  | foreign_key: true |
| product_condition_id       | integer     | null: false       |
| delivery_fee_id            | integer     | null: false       |
| shipping_area_id           | integer     | null: false       |
| days_to_ship_id            | integer     | null: false       |
| product_description        | text        | null: false       |



### Association
- belongs_to :user
- has_one :purchase_record



## purchase_record table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses table

| Column                | Type       | Options           |
|-----------------------|------------|-------------------|
| purchase_record       | references | foreign_key: true |
| prefecture_id         | integer    | null: false       |
| city                  | string     | null: false       |
| house_number          | string     | null: false       |
| phone_number          | string     | null: false       |
| postal_code           | string     | null: false       |
| building_name         | string     |                   |

### Association
- belongs_to :purchase_record