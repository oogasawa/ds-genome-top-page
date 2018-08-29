

# 作業記録

## 要約

[フレームワークの選定](choosing_frameworks.md)

- Spring Boot (ver.5) + Apache Tiles (ver 3)の系を使うことにした。
- microserviceの形となっていて、ドキュメントも必要な分記載されている以下のプロジェクトからスタートすることにした。
   - [Github, spring-boot-web-mvc-tiles3 (2014)](https://github.com/mmeany/spring-boot-web-mvc-tiles3)
- ただし、Java9からJavaEEのAPIがガラッと変わったためそのままでは動かなかった。
  - pom.xmlファイル中のspring-boot-starter-parentのバージョンを1系から2系にあげることで解決した。

開発内容

1. プロジェクト名、パッケージ名などの調整とコンパイル確認。
2. 検索フォームを表示する。
3. 全文検索（正規表現）の実装
4. JBrowseへのリンクの作成
5. その他細かいこと
  - 検索フォームをヘッダへ。フッタはいらないかな。 ... ok!
  - 正規表現の"case-insensitive"への対応 ... ok!
  - <title>を直す。...ok!
  - ゲノムブラウザの表示範囲確認 ... ok! 
  - 設定を設定ファイルから読み込むようにする。 ... ok!
  - resetボタンを効かせる。 ... ok!
  - CSSの適用
    - マウスオーバー時の背景色を変えてユーザーの行ずれミスを防ぐ ... ok!
	- JBrowseへのリンクをアイコンで表現する。 ... ok!
	  - http://olivero.info/bari/h/hyperlink-button-icon/
	  - ロイヤリティーの問題の調査と解消が必要
6. 全体の調整 => リリース
  - DS text searchのドキュメントを作る ... ok!
7. さらに続きの細かいこと
  - rgm12のコンテナの中にDS text searchをインストール ... ok!
  - トップページつくる
  - コンテナをリリース (rgm01にWebサーバー立ててrgm22をマウントしとけばいいんでしょ)
8. CSSの整理
  - 全体配置
  - リンクアイコンのロイヤリティー問題の調査・解消が必要
9. JBrowseのプラグイン (Dojoの勉強)







