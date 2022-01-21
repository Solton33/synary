# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| birth_day          | date   | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

- has_many :scenarios
- has_many :comments

## scenarios テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| scenario   | text       | null: false                    |
| title      | string     | null: false                    |
| image      | text       |                                |
| user       | references | null: false, foreign_key: true |

- belongs_to :user
- has_many :comments
- has_many :scenario_tas
- has_many :tags, through: :scenario_tags

## comment テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | string     |                                |
| user     | references | null: false, foreign_key: true |
| scenario | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :scenario

## tags テーブル

| Column   | Type       | Options      |
| -------- | ---------- | ------------ |
| tag      | string     | null: false  |

- has_many :scenario_tags
- has_many :scenario, through: :scenario_tags

## scenario_tags テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| tag      | references | null: false, foreign_key: true |
| scenario | references | null: false, foreign_key: true |

- belongs_to :scenario
- belongs_to :tag


