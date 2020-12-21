
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
| birth_date            | string     | null: false       |

### Association

- has_many :items
- has_many :purchase_record


## items table

| Column                     | Type        | Options           |
|----------------------------|-------------|-------------------|
| name                       | string      | null: false       |
| category                   | string      | null: false       |
| price                      | integer     | null: false       |
| seller                     | string      | null: false       |
| user                       | references  | foreign_key: true |
| image                      | Activestrage| null: false       |
| product_condition          | string      | null: false       |
| delivery_fee               | string      | null: false       |
| shipping_area              | string      | null: false       |
| days_to_ship               | string      | null: false       |
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
| prefectures           | string     | null: false       |
| municipality          | string     | null: false       |
| address               | string     | null: false       |
| phone_number          | string     | null: false       |
| postal_code           | string     | null: false       |







### Association
- has_one :purchase_record