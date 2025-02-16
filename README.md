## usersテーブル

|Column|Type|Options|
|nickname_______|string|null: false|
|email__________|string|null: false, unique: true|
|password_______|string|null: false|
|last_name______|string|null: false|
|first_name_____|string|null: false|
|last_name_read_|string|null: false|
|first_name_read|string|null: false|
|date___________|integer|null: false|

### Association
has_many :items
has_many :purchase_records

## itemsテーブル

|Column|Type|Options|
|item_________|string|null: false|
|explanation__|text|null: false|
|price________|integer|null: false|
|user_________|references|null: false, foreign_key: true|
|category_____|string|null: false|
|keep_________|string|null: false|
|bearer_______|string|null: false|
|prefecture___|string|null: false|
|shipping_days|string|null: false|

### Association
has_one :purchase_record
belongs_to :item

## purchase_recordsテーブル

|Column|Type|Options|
|purchaser|references|null: false, foreign_key: true|
|item_____|references|null: false, foreign_key: true|
|image____|references|null: false, foreign_key: true|
|price____|references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :shipping destination


## shipping_destinationテーブル

|Column|Type|Options|
|post_code___|string|null: false|
Active|prefecture__|string|null: false|
|city________|string|null: false|
|street______|string|null: false|
|building____|string|
|phone_number|string|null: false|
|user|references|null: false, foreign_key: true|

### Association
belongs_to :purchase record
