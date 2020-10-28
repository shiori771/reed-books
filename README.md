# テーブル設計

## usersテーブル

| Column   | Type   | Option      |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| profile  | text   |             |

### Association

- has_many :books_users
- has_many :books, through: :books_users
- has_many :memos


## books テーブル

| Column    | Type   | Option      |
| --------- | ------ | ----------- |
| image_url | text   | null: false |
| title     | string | null: false |
| author    | string | null: false |
| url       | text   | null: false |

### Association

- has_many :books_users
- has_many :users, through: :books_users
- has_one :memo


## readings_users テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| reading | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :book


## memos テーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| review_id | integer    |                                |
| text      | text       |                                |
| user      | references | null: false, foreign_key: true |
| reading   | references | null: false, foreign_key: true |

### Association

- belongs_to :reading
- belongs_to :user
