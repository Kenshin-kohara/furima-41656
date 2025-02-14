## usersテーブル

|Column|Type|Options|
|nickname       |text|null: false, unique: true|
|mail address   |text|null: false, unique: true|
|password       |text|null: false|
|last name      |text|null: false|
|first name     |text|null: false|
|last name read |text|null: false|
|first name read|text|null: false|
|date of birth  |text|null: false|

### Association
has_many :items
has_many :purchase records

## itemsテーブル

|Column|Type|Options|
|item         |text|null: false|
|image        |text|null: false|
|explanation  |string|null: false|
|price        |text|null: false|
|seller       |references|null: false|
|category     |text|null: false|
|keep         |text|null: false|
|bearer       |text|null: false|
|shipping area|text|null: false|
|shipping days|text|null: false|

### Association
has_one :purchase records
belongs_to :items

## purchase recordsテーブル

|Column|Type|Options|
|purchaser|references|null: false, foreign_key: true|
|item     |references|null: false, foreign_key: true|
|image    |references|null: false, foreign_key: true|
|price    |references|null: false, foreign_key: true|

### Association
belongs_to :users
belongs_to :items
has_one :shipping destination


## shipping destinationテーブル

|Column|Type|Options|
|post code   |text|null: false|
|prefecture  |text|null: false|
|city        |text|null: false|
|street      |text|null: false|
|building    |text||
|phone number|text|null: false, unique: true|

### Association
belongs_to :purchase records
