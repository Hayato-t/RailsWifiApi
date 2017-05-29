# README


## Ruby version
* Ruby 2.4.1 p111
* Ruby on Rails 5.0.3

## System dependencies
* mysql version 5.7.18

## Database creation
データベース作成にはmysql のデータベース作成権限のあるアカウントを作成し、  
`export RAILS_DATABASE_USERNAME=AccountName`  
`export RAILS_DATABASE_PASSWORD=AccountPwd`  
で環境変数を設定した後、  
`rake db:migrate`  
で作成できます。デフォルトではrootで入ろうとします。  

## Database creation
`rake db:seed`  
でwifiスポットのデータ(/db/jta_free_wifi.csv)をDBに格納します。  
test実行時にはそれぞれ `RAIS_ENV=test`をオプションにつけてください。  

## Usage
`rails server`  
で起動後、  
`localhost:3000/api/show?lat=LATITUDE&lng=LONGITUDE&radius=RADIUS&mxnum=MAXIMUMRESPONSE`  
で、緯度LATITUDE,経度LONGITUDEを中心に半径RAIDUS圏内のフリーwifiスポットを,上限MAXIMUMRESPONSEで近い順に探し、json形式で返します。  
radiusおよびmxnumは省略可能です。  
jsonの各データはjaaddress,janame,distanceを要素に持ち、それぞれ、住所、名前、地点からの距離[m]を表します。  

## How to run the test suite
テストコードはRSpecでつくられています。  
`rspec`  
で実行してください。  
