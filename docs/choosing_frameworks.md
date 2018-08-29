# フレームワークの選定

## 要約

- デプロイも含めた開発効率向上のためSpring Bootでmicroservice化する。
- Viewのフレームワークとしてthymeleafがよく言及されるが、thymeleafの目的は「JSPの代替技術。より自然なhtmlでViewを表現できる」
  - 正直このご利益はどうでもいいことと思う。
  - JavaならJSPを使うのが自然であり、複数のページの見てくれを統一するやり方はApache Tilesで完成している。



## Apache Tiles

Spring5 + tilesのtutorialとしては以下の記事があった。

- [Bealdung, Apache Tiles Integration with Spring MVC (2018)](https://www.baeldung.com/spring-mvc-apache-tiles)


そのまま使えるテンプレートを検索し以下を使うこととした。

[Github, spring-boot-web-mvc-tiles3 (2014)](https://github.com/mmeany/spring-boot-web-mvc-tiles3)

ポイントは以下の通り。

- ドキュメントが十分書いてある。
- そのままだとwarファイルができるが、これをtomcat配下に入れるのではなくmicroservice的にwarの中にtomcatが入る形になっている。
- Java9からJavaEEの構成が変わってしまったため、そのままではJava9以降のJDKでは動かない。
  - https://stackoverflow.com/questions/43574426/how-to-resolve-java-lang-noclassdeffounderror-javax-xml-bind-jaxbexception-in-j
  - このエラーが起こらないようにするには、spring-boot-starter-parentのバージョンを2.x系統にあげればよい。



pom.xmlを修正

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.0.4.RELEASE</version>
        <relativePath /> <!-- lookup parent from repository -->
    </parent>
	
    <groupId>com.mvmlabs.spring-boot-play</groupId>
    <artifactId>spring-boot-web-mvc-tiles3</artifactId>
    <version>1.0</version>
    <packaging>jar</packaging>


コンパイル

    mvn -Dmaven.test.skip=true clean package

実行

    java -jar target\spring-boot-web-mvc-tiles3-1.0.war --debug

pom.xmlのなかで拡張子をwarと指定してある。これをjarに直せば、いわゆるmicroserviceのお作法通りとなる。


これで動作した.

Confirm static content can be accessed:

    http://localhost:8080/static/index.html
    http://localhost:8080/index.html

Note: The first URL above demostrates Spring Boot mapping of static resources The second URL above demonstrates default index.html mapping provided by Spring Boot

Confirm that Spring MVC has been configured as expected

    http://localhost:8080/home
    http://localhost:8080/greet?name=Mark
    http://localhost:8080/greet/Mark

All done here.



## githubからとってきたプロジェクトを自分のプロジェクトに変更する。

ファイルを一つ一つ自分のプロジェクトのディレクトリに移さなきゃダメか？
プロジェクトのファイル名を変えて、gitlabにプロジェクトを吸い上げさせることはできるか？



以下のサイトをみると、可能であることが書いてある。
http://www.aise.ics.saitama-u.ac.jp/~gotoh/CreateNewProjectOnGitLab.html#toc4

しかし同じようにやって見ると、認証のところでエラーになる。
gitlabの何らかの設定の問題かもしれない。(<= gitlabのdockerコンテナ版だとsshポート22番を開けているが、さくらのクラウドに立てたのはどうしたのかな？）


	oogasawa@Carassius.local:~/works2/spring-boot-web-mvc-tiles3 (2018-08-09 11:13:45)
	$ ls -a
	.		.git		LICENSE		pom.xml
	..		.gitignore	README.md	src
	oogasawa@Carassius.local:~/works2/spring-boot-web-mvc-tiles3 (2018-08-09 11:13:58)
	$ rm -R -f .git
	oogasawa@Carassius.local:~/works2/spring-boot-web-mvc-tiles3 (2018-08-09 11:14:03)
	$ git init
	Initialized empty Git repository in /Users/oogasawa/works2/spring-boot-web-mvc-tiles3/.git/
	oogasawa@Carassius.local:~/works2/spring-boot-web-mvc-tiles3 (2018-08-09 11:14:13)
	$ git add *
	oogasawa@Carassius.local:~/works2/spring-boot-web-mvc-tiles3 (2018-08-09 11:14:17)
	$ git status
	On branch master

	No commits yet

	Changes to be committed:
	  (use "git rm --cached <file>..." to unstage)

		new file:   LICENSE
		new file:   README.md
		new file:   pom.xml
		new file:   src/main/java/com/mvmlabs/springboot/Application.java
		new file:   src/main/java/com/mvmlabs/springboot/ConfigurationForTiles.java
		new file:   src/main/java/com/mvmlabs/springboot/web/GreetingController.java
		new file:   src/main/resources/application.properties
		new file:   src/main/webapp/WEB-INF/tiles/layout/basic.jsp
		new file:   src/main/webapp/WEB-INF/tiles/tiles.xml
		new file:   src/main/webapp/WEB-INF/tiles/view/footer.jsp
		new file:   src/main/webapp/WEB-INF/tiles/view/header.jsp
		new file:   src/main/webapp/WEB-INF/tiles/view/home/greeting.jsp
		new file:   src/main/webapp/WEB-INF/tiles/view/home/home.jsp
		new file:   src/main/webapp/static/index.html
		new file:   src/test/java/com/mvmlabs/springboot/ApplicationTests.java
		new file:   src/test/java/com/mvmlabs/springboot/TestConfigurtaion.java

	Untracked files:
	  (use "git add <file>..." to include in what will be committed)

		.gitignore

	oogasawa@Carassius.local:~/works2/spring-boot-web-mvc-tiles3 (2018-08-09 11:14:20)
	$ git commit -m 'first commit'
	[master (root-commit) 911eb81] first commit
	 16 files changed, 780 insertions(+)
	 create mode 100644 LICENSE
	 create mode 100644 README.md
	 create mode 100644 pom.xml
	 create mode 100644 src/main/java/com/mvmlabs/springboot/Application.java
	 create mode 100644 src/main/java/com/mvmlabs/springboot/ConfigurationForTiles.java
	 create mode 100644 src/main/java/com/mvmlabs/springboot/web/GreetingController.java
	 create mode 100644 src/main/resources/application.properties
	 create mode 100644 src/main/webapp/WEB-INF/tiles/layout/basic.jsp
	 create mode 100644 src/main/webapp/WEB-INF/tiles/tiles.xml
	 create mode 100644 src/main/webapp/WEB-INF/tiles/view/footer.jsp
	 create mode 100644 src/main/webapp/WEB-INF/tiles/view/header.jsp
	 create mode 100644 src/main/webapp/WEB-INF/tiles/view/home/greeting.jsp
	 create mode 100644 src/main/webapp/WEB-INF/tiles/view/home/home.jsp
	 create mode 100644 src/main/webapp/static/index.html
	 create mode 100644 src/test/java/com/mvmlabs/springboot/ApplicationTests.java
	 create mode 100644 src/test/java/com/mvmlabs/springboot/TestConfigurtaion.java
	oogasawa@Carassius.local:~/works2/spring-boot-web-mvc-tiles3 (2018-08-09 11:14:38)
	$ git remote add origin oogasawa@gitlab.ddbj.nig.ac.jp:oogasawa/spring-boot-tiles3
	oogasawa@Carassius.local:~/works2/spring-boot-web-mvc-tiles3 (2018-08-09 11:15:18)
	$ git push origin master
	oogasawa@gitlab.ddbj.nig.ac.jp's password: 
	Permission denied, please try again.
	oogasawa@gitlab.ddbj.nig.ac.jp's password: 
	Permission denied, please try again.
	oogasawa@gitlab.ddbj.nig.ac.jp's password: 
	oogasawa@gitlab.ddbj.nig.ac.jp: Permission denied (publickey,password).
	fatal: Could not read from remote repository.

	Please make sure you have the correct access rights
	and the repository exists.
	oogasawa@Carassius.local:~/works2/spring-boot-web-mvc-tiles3 (2018-08-09 11:16:17)
	$ git push -u origin master
	ssh: connect to host gitlab.ddbj.nig.ac.jp port 22: Connection refused
	fatal: Could not read from remote repository.

	Please make sure you have the correct access rights
	and the repository exists.
	oogasawa@Carassius.local:~/works2/spring-boot-web-mvc-tiles3 (2018-08-09 11:17:21)
	$ git push  origin master
	ssh: connect to host gitlab.ddbj.nig.ac.jp port 22: Connection refused
	fatal: Could not read from remote repository.

	Please make sure you have the correct access rights
	and the repository exists.
	oogasawa@Carassius.local:~/works2/spring-boot-web-mvc-tiles3 (2018-08-09 11:17:46)
	$ 



## さくらのクラウドに立てたgitlabの問題を回避する。

以下のサイトに書いてある手順は以下の通りであった。
http://www.aise.ics.saitama-u.ac.jp/~gotoh/CreateNewProjectOnGitLab.html#toc4


1. 普通にディレクトリ構造を作る。
2. git initコマンドにてローカルリポジトリ化
3. git add * コマンドにてディレクトリ構造内の全ファイルをローカルリポジトリにaddする。
4. git commit してディレクトリ構造内の全ファイルをローカルリポジトリにcommitする。
5. git remote add origin oogasawa@gitlab.ddbj.nig.ac.jp:oogasawa/spring-boot-tiles3 でリモートのgitlabサイトに紐づける
6. git push origin master にてリモートリポジトリにファイルをpushする。


git remoteコマンドを使わなければいいはず。

1. gitlab上で空のリモートリポジトリを作る。REAME.mdだけ作っておく。
2. git cloneして空のローカルリポジトリを作る。
3. 空のローカルリポジトリに普通にディレクトリ構造を作る。
4. git add * コマンドにてディレクトリ構造内の全ファイルをローカルリポジトリにaddする。
5. git commit してディレクトリ構造内の全ファイルをローカルリポジトリにcommitする。
6. git push origin master にてリモートリポジトリにファイルをpushする。


具体的には以下のようにする。

1. gitlab上で空のリモートリポジトリを作る。 (プロジェクト名 ds-text-search)
2. git cloneして空のローカルリポジトリを作る。
3. 空のローカルリポジトリに普通にディレクトリ構造を作る。
    - このときにパッケージ名などを必要に応じて調整する。
4. git add * コマンドにてディレクトリ構造内の全ファイルをローカルリポジトリにaddする。
5. git commit してディレクトリ構造内の全ファイルをローカルリポジトリにcommitする。
6. git push origin master にてリモートリポジトリにファイルをpushする。

空のリモートリポジトリをクローンしてそこにディレクトリ構造を作るところまでの作業は以下の通り。

	 oogasawa@Carassius.local:~/works2 (2018-08-09 11:39:42)
	 $ ls
	 HelloSpringMVC			ds-text-search			spring-boot-technique
	 RGM				ds-text-search.md		spring-boot-web-mvc-tiles3
	 blast				ds-text-search.md~		spring-boot-web-mvc-tiles3-000
	 ds-jbrowse-textsearch		misc-base
	 oogasawa@Carassius.local:~/works2 (2018-08-09 11:39:43)
	 $ tree ds-text-search
	 ds-text-search
	 ├── README.md
	 └── docs
		 └── scripts

	 2 directories, 1 file
	 oogasawa@Carassius.local:~/works2 (2018-08-09 11:39:47)
	 $ cp -r spring-boot-web-mvc-tiles3/* ds-text-search
	 oogasawa@Carassius.local:~/works2 (2018-08-09 11:40:15)
	 $ tree ds-text-search
	 ds-text-search
	 ├── LICENSE
	 ├── README.md
	 ├── docs
	 │   └── scripts
	 ├── pom.xml
	 └── src
		 ├── main
		 │   ├── java
		 │   │   └── com
		 │   │       └── mvmlabs
		 │   │           └── springboot
		 │   │               ├── Application.java
		 │   │               ├── ConfigurationForTiles.java
		 │   │               └── web
		 │   │                   └── GreetingController.java
		 │   ├── resources
		 │   │   └── application.properties
		 │   └── webapp
		 │       ├── WEB-INF
		 │       │   └── tiles
		 │       │       ├── layout
		 │       │       │   └── basic.jsp
		 │       │       ├── tiles.xml
		 │       │       └── view
		 │       │           ├── footer.jsp
		 │       │           ├── header.jsp
		 │       │           └── home
		 │       │               ├── greeting.jsp
		 │       │               └── home.jsp
		 │       └── static
		 │           └── index.html
		 └── test
			 └── java
				 └── com
					 └── mvmlabs
						 └── springboot
							 ├── ApplicationTests.java
							 └── TestConfigurtaion.java

	 22 directories, 16 files
	 oogasawa@Carassius.local:~/works2 (2018-08-09 11:40:20)
	 $
	 oogasawa@Carassius.local:~/works2/ds-text-search (2018-08-09 11:49:12)
	 $ git add *
	 oogasawa@Carassius.local:~/works2/ds-text-search (2018-08-09 11:49:24)
	 $ git status
	 On branch master
	 Your branch is up to date with 'origin/master'.

	 Changes to be committed:
	   (use "git reset HEAD <file>..." to unstage)

		 new file:   LICENSE
		 modified:   README.md
		 new file:   pom.xml
		 new file:   src/main/java/com/mvmlabs/springboot/Application.java
		 new file:   src/main/java/com/mvmlabs/springboot/ConfigurationForTiles.java
		 new file:   src/main/java/com/mvmlabs/springboot/web/GreetingController.java
		 new file:   src/main/resources/application.properties
		 new file:   src/main/webapp/WEB-INF/tiles/layout/basic.jsp
		 new file:   src/main/webapp/WEB-INF/tiles/tiles.xml
		 new file:   src/main/webapp/WEB-INF/tiles/view/footer.jsp
		 new file:   src/main/webapp/WEB-INF/tiles/view/header.jsp
		 new file:   src/main/webapp/WEB-INF/tiles/view/home/greeting.jsp
		 new file:   src/main/webapp/WEB-INF/tiles/view/home/home.jsp
		 new file:   src/main/webapp/static/index.html
		 new file:   src/test/java/com/mvmlabs/springboot/ApplicationTests.java
		 new file:   src/test/java/com/mvmlabs/springboot/TestConfigurtaion.java

	 oogasawa@Carassius.local:~/works2/ds-text-search (2018-08-09 11:49:27)
	 $ 

あとはこれを編集してgitlabにpushすればいい。

