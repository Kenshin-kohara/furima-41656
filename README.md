## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_read|string|null: false|
|first_name_read|string|null: false|
|date_of_birth|date|null: false|

### Association
has_many :items
has_many :purchase_records

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|
|category|integer|null: false|
|keep|integer|null: false|
|bearer|integer|null: false|
|prefecture|integer|null: false|
|shipping_days|integer|null: false|

### Association
has_one :purchase_record
belongs_to :item

## purchase_recordsテーブル

|Column|Type|Options|
|------|----|-------|
|purchaser|references|null: false, foreign_key: true|
|name|references|null: false, foreign_key: true|
|price|references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :shipping _destination


## shipping_destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|street|string|null: false|
|building|string|
|phone_number|string|null: false|
|purchaser|references|null: false, foreign_key: true|

### Association
belongs_to :purchase_record
