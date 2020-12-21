
## users table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| name        | storing    | null: false       |
| password    | storing    | null: false       |
| email       | storing    | null: false       |


### Association

- has_many :items
- belongs_to :purchase_record


## items table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| item_name   | storing    | null: false       |
| category    | storing    | null: false       |
| price       | storing    | null: false       |
| seller      | storing    | null: false       |
| user        | references | foreign_key: true |


### Association
- belongs_to :user
- belongs_to :purchase_record



## purchase_record table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |
| buyer       | storing    | null: false       |


### Association
- has_one :user
- has_one :item
- belongs_to :address


## address table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| buyer       | references | foreign_key: true |
| address     | storing    | null: false       |

### Association
- has_one :purchase_record