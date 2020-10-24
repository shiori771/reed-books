# テーブル設計

## usersテーブル

| Column   | Type   | Option      |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| profile  | text   | null: false |

### Association

- has_many :user_readings
- has_many :readings, through: user_readings
- has_many :memos


## readings テーブル

| Column    | Type   | Option      |
| --------- | ------ | ----------- |
| image_url | text   | null: false |
| title     | string | null: false |
| author    | string | null: false |
| url       | text   | null: false |

### Association

- has_many :user_readings
- has_many :user, through: user_readings
- has_one :memo


## user_readings テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| reading | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :reading


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
