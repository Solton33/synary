# README

## アプリケーション名
* [Synary (シナリー）]( https://synary.herokuapp.com/
)
* テスト用アカウント/Pass：otamesi@gmail.com/123asd
* Basic ID/Pass : solton/0528
---

## アプリケーション概要
* ユーザー登録機能
* ログイン、サインイン機能
* 文章および画像の投稿機能
* 投稿した文章および画像の編集、削除機能
* マイページ機能、投稿一覧表示機能
* コメント投稿機能

---

## 利用方法
ユーザー登録後、自由形式で文章を打ち込むことができる。
打ち込んだ文章には表紙として画像を添付することができる。
投稿された文章は同じく登録された別ユーザーから閲覧することができ、各文章にはコメントを残す機能がある為別ユーザーからの評価などをもらうことができる。

---

## 課題解決
TRPGというゲーム媒体を好む人の中でシナリオを創作する人がその作品を自分の中でだけではなく第三者にも見てもらうことで創作者同士のコミュニケーションを円滑にすることができる場を作る。
また、この場によって同じ趣味の人たちとの交流を作る場ともなるようにする為。

---

## 実装予定の機能
* いいね機能
* タグづけ機能
* タグ検索機能
* コメント削除機能(シナリオ投稿者権限)
* 探索者作成機能

---

# 現在のDB設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| birth_day          | date   | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

- has_many :scenarios
- has_many :comments
- has_many :likes

## scenarios テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| scenario   | text       | null: false                    |
| title      | string     | null: false                    |
| image      | text       |                                |
| user       | references | null: false, foreign_key: true |

- belongs_to :user
- has_many :comments
- has_many :likes

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| comment     | string     |                                |
| user_id     | integer    | null: false, foreign_key: true |
| scenario_id | integer    | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :scenario

## likes テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | integer    | null: false, foreign_key: true |
| scenario_id | integer    | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :scenario
