# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
データベース作成にはmysql のデータベース作成権限のあるアカウントを作成し、
`export RAILS_DATABASE_USERNAME=AccountName`
`export RAILS_DATABASE_PASSWORD=AccountPwd`
で環境変数を設定した後、
`rake db:migrate`
で作成できます。デフォルトではrootで入ろうとします。
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
