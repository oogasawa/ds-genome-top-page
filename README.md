# DS Genome Top Page

先進ゲノムのゲノムブラウザはJBrowse、アノテーションの全文検索、BLAST, BLATが合わさってひとまとまりのサイトなる。
本Webアプリはそのポータルサイトである。

N50などいくつかの統計量をポータルサイトに表示するためにSpring Bootを使う。
（コンテナ不要でデプロイが簡単だからという理由もある。）

画面はApache Tiles + Bootstrap4を使って配置する。外観はおおよそ以下の通り。これを生物種ごとに作っていけば良い。
（完全パラメータ化してもいいのだろうけれども、現時点では後日検討扱いとする。）



## 更新履歴

- version 0.2.0
  - Spring Boot ver.5 + Apache Tiles ver.3 + Bootstrap4で基本的な機能を作成した。リンク先URLは要調整。
  
### 未実装の機能

- エラー画面表示
  
## インストール方法

### 前提

- Java version 10
- Apache maven version 3.5.3
- git (version 2.15.2)

### コンパイル方法

	git clone http://gitlab.ddbj.nig.ac.jp/oogasawa/ds-genome-top-page
	cd ds-genome-top-page
	git checkout v0.2.0
	mvn -Dmaven.test.skip=true clean package
	
これによりtargetディレクトリの下にjarファイルが生成される。

## 起動方法

以下のコマンドでds-text-searchが動作するwebサーバーが8000番ポートで起動する。（デフォルトは8080)

    java -jar target/ds-genome-top-page-0.2.0.jar \
	    --server.port=8000 \
	    --baseurl='http://rgm01.nig.ac.jp' 




## 使い方

ブラウザで http://localhost:8000/ にアクセスすると以下のような画面が表示される。

<img src="docs/images/top_page.png" width="450" />








