# テーブル設計

## usersテーブル

| Column   | Type   | Option      |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| profile  | text   |             |

### Association

- has_many :books
- has_many :memos


## books テーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| isbn      | text       | null: false                    |
| image_url | text       | null: false                    |
| title     | string     | null: false                    |
| author    | string     |                                |
| url       | text       | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_one :memo



## memos テーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| review_id | integer    |                                |
| text      | text       |                                |
| user      | references | null: false, foreign_key: true |
| book      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :book
