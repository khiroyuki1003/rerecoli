# RecoLi
### ログイン前
[![Image from Gyazo](https://i.gyazo.com/b8498b658aeb478f4502065a3ad6012b.jpg)](https://gyazo.com/b8498b658aeb478f4502065a3ad6012b)

### ログイン後（例）
[![Image from Gyazo](https://i.gyazo.com/4344e56aa8cf88714b13a3ccdca5188f.png)](https://gyazo.com/4344e56aa8cf88714b13a3ccdca5188f)

<br>

## 📝 概要
「死ぬまでにやりたい事」に焦点を当てた、【todoアプリ】です。

ユーザーは、「やりたい事」とその達成期限などを自由に設定できます。

このアプリはいくつかの機能で、「やりたい事」を達成する為の行動を促します。

<br>

## 🌐 URL

下記からRecoLiを体験できます。

 [RecoLiを体験](https://rerecoli.herokuapp.com/)
 
 <br>
 
**アプリの利用には、ログインが必須です。**
 
 - サンプルユーザー  
   - email : heroku2@heroku.com
   - password : 123heroku2 

<br>

**サンプルユーザーでのログイン時、データの編集・削除はご遠慮ください。**


<br>

## 利用方法
下記いずれかの方法でご利用が可能です。

###### ⅰ. 上記サンプルユーザーでログイン
###### ⅱ. ユーザーを新規登録　　

<br>

### ⅰ. 上記サンプルユーザーでログイン

1. トップページの**ログイン**をクリックしてください。
2. email : heroku2@heroku.com, password : 123heroku2 をそれぞれ入力後、**ログイン**をクリックしてください。

[![Image from Gyazo](https://i.gyazo.com/db6e0b144f8ad16aa95bef4b07e3a69f.jpg)](https://gyazo.com/db6e0b144f8ad16aa95bef4b07e3a69f)

<br>

### ⅱ. ユーザーを新規登録

1. トップページの**新規登録**をクリックしてください。
2. 「メールアドレス」　「パスワード」　「パスワード（確認）」　を入力後、**新規登録**をクリックしてください。

<br>

[![Image from Gyazo](https://i.gyazo.com/d7a303f190be39fad4468b2e4f9f5117.jpg)](https://gyazo.com/d7a303f190be39fad4468b2e4f9f5117)

<br>

3. 「ニックネーム」　「あなたが大切にしている言葉」（任意）　「生年月日」を入力後、**プロフィール登録**をクリックしてください。

<br>

[![Image from Gyazo](https://i.gyazo.com/c933a3f3f44819c579cbcdb4bd9b5e8a.jpg)](https://gyazo.com/c933a3f3f44819c579cbcdb4bd9b5e8a)  

<br>

## 目指した課題解決

### ペルソナ
「いつかやりたい事」「死ぬまでにやりたい事」があるが、それを達成するための行動ができていない方へ向けたアプリです。

目標設定、リマインド機能、達成までのプロセス作成などを活用して「やりたい事」の達成に向けた行動を促す事が目的です。

### 開発経緯

「人生で最も後悔していることはなんですか？」

80歳以上の老人を対象としたある研究でこの質問をしたところ、7割の方が「チャレンジしなかった事」だと答えたそうです。

「チャレンジしなかった後悔」を少しでも小さくするために、このアプリを開発しました。

<br>

開発に至ったきっかけは、開発者自身が感じている課題を解決するアプリが欲しいと考えた事です。

過去に受講した自分の価値観を深掘りして人生について考えるワークにて、「死ぬまでにやりたい事」リストを作りましたが、作ったまま活用できていませんでした。

作ったままにはしたくないと考えた結果、アプリを開発する事で解決できるかもしれないと思い、企画を始めました。

<br>

## 要件定義
| 機能　　　　  　　　  | 目的　　　　　　　　　　　　　　　　 | 詳細　　　　　　　　　　　　　　　　　 |
|:-----------|:------------|:------------|
| ユーザー新規登録機能       | ユーザー毎に「やりたい事」を管理する為。        | メールアドレス・　パスワードを入力すると登録できる。         |
| ユーザーログイン機能   | 登録済のユーザーがアプリを利用する為。      | 登録したメールアドレス・パスワードを入力するとログインできる。       |
| ユーザーログアウト機能       | ユーザーがログアウト可能にする為        | サイドバーの「ログアウト」をクリックするとログアウトできる。         |
| プロフィール登録機能       | 行動促進に必要なデータを登録する為。        | ニックネーム・生年月日を入力すると入力・選択すると登録できる。任意で大切にしている言葉の設定も可能。         |
| プロフィール編集機能         | 登録したプロフィールを変更可能にする為。          | 登録済のデータを編集・更新できる。           |
| プロフィール詳細表示機能       | 登録したプロフィールを確認する為。       | 登録済のプロフィールの各データを表示する。また、生年月日から現在の年齢を計算し、表示する。       |
| カテゴリ新規作成機能    | 「やりたい事」のカテゴリをユーザーが作成する事で、自由度を上げる為。     | カテゴリ名を入力すると作成できる。|
| カテゴリ名変更機能    | 作成したカテゴリの名前を変更可能にする為。     | 登録済のデータを編集・更新できる。      |
| カテゴリ一覧表示機能    | ユーザー自身が作成したカテゴリを一覧で確認できるようにする為。     | ユーザー自身が作成したカテゴリが一覧で表示される      |
| カテゴリ削除機能    | 作成したカテゴリを削除可能にする為。     | カテゴリ内で「やりたい事」リストなどを作成している場合、まとめて削除される。      |
| リスト新規作成機能    | 「やりたい事」を1つずつリストにして記録する為。     | タイトル・達成目標日・リマインド時刻を入力する事で作成できる。任意で、詳細・優先度を登録可能。      |
| リスト編集機能    | 作成したリストを編集可能にする為。     |   登録済のデータを編集・更新できる。    |
| リストの達成目標日変更機能    | 作成したリストの達成目標日を変更可能にする為。     | 登録済のデータを編集・更新できる。     |
| リスト一覧表示機能    | カテゴリ内で作成したリストを一覧で確認可能にする為。     | カテゴリに紐づくリストを一覧で表示する。 目標日を基準に、時系列で表示。     |
| リスト詳細表示機能    | 作成したリストの情報を詳細に確認可能にする為。     | リスト毎の情報を詳細に表示する。      |
| リストの削除機能    | 作成したリストを削除可能にする為。     | リスト内でプロセスなどを作成している場合、まとめて削除される。      |
| プロセス新規作成機能    | リスト達成に向けたプロセスを設定する為。     | タイトル・達成目標日・リマインド時刻を入力する事で作成できる。任意で詳細情報を登録可能。      |
| プロセス編集機能    | 作成したプロセスを編集可能にする為。     |   登録済のデータを編集・更新できる。    |
| プロセス一覧表示機能    | リスト内で作成したプロセスを一覧で表示する為。    |  リストに紐づくプロセスを一覧で表示する。 目標日を基準に、時系列で表示。       |
| プロセス詳細表示機能    | 作成したプロセスの情報を詳細に確認可能にする為。     | プロセス毎の情報を詳細に表示する。      |
| プロセスの削除機能    | 作成したプロセスを削除可能にする為     | リスト内でリマインドが作成されている場合、まとめて削除する。      |
| リスト・プロセスのカレンダー表示機能    | ユーザー自身が作成したリスト・プロセスを、時系列で確認しやすくする為。     | ユーザー自身が作成したリスト・プロセスを全てカレンダーに表示する。      |
| リスト・プロセスのステータス切替機能    | リスト・プロセスを達成したか否かが確認できるようにする為。     | 一覧・詳細表示に置かれたボタンをクリックする事でステータスを切り替える。ステータスに応じて、リスト・プロセスの詳細表示や一覧表示内の個別表示などを、一部変更して表示する。      |
| 未達成のリスト・プロセスの一覧表示機能    | 取り組むべきリスト・プロセスを確認しやすくする為。     | ステータスが未達成のリスト・プロセスを一覧表示する。目標日を基準に、時系列で表示。      |
| 達成済のリスト・プロセスの一覧表示機能    | 達成したリスト・プロセスを確認しやすくする為。     | ステータスが達成済のリスト・プロセスを一覧表示する。目標日を基準に、時系列で表示。      |
| リスト・プロセスのリマインド機能    | 目標日を過ぎたリスト・プロセスを確認しやすくする為。　|目標日・リマインド時刻を基準に、同日時あるいは日時を過ぎたリスト・プロセスのリマインドを作成して一覧表示する。また、未確認のリマインドがある場合は、通知マークを表示する。       |
| リマインド非表示機能    | 確認したリマインドを非表示にする為。     | 個別の「確認した」ボタンか、「全て確認済にする」ボタンをクリックして、非表示にする。      |

<br>

## 実装した機能についての画像やGIF動画
### ユーザー新規登録機能

![regist (1)](https://user-images.githubusercontent.com/87423529/134757589-d196b858-de77-437a-9a44-9a9f418c8d85.gif)

<br>

### プロフィール登録機能

![profile-regist](https://user-images.githubusercontent.com/87423529/134757829-c9a809cb-7fa8-4484-b302-56a69962d608.gif)


<br>

### ユーザーログイン機能

![rogin](https://user-images.githubusercontent.com/87423529/134758203-7b92696f-542d-4d45-8f58-3950436b6bd2.gif)


<br>

### ユーザーログアウト機能

![rogout](https://user-images.githubusercontent.com/87423529/134758030-1a3481cd-319b-4a8a-bd52-822272f95f56.gif)


<br>

### プロフィール詳細表示機能

![profile-show](https://user-images.githubusercontent.com/87423529/134758372-2a67d257-e1e6-455d-a410-e885059b42cc.gif)


<br>

### プロフィール編集機能

![progile-edit](https://user-images.githubusercontent.com/87423529/134758457-c31f751b-686b-4663-9cc8-d60b979219aa.gif)


<br>


### カテゴリ新規作成機能

<br>


### カテゴリ名変更機能

<br>


### カテゴリ一覧表示機能

<br>


### カテゴリ削除機能

<br>


### リスト新規作成機能

<br>


### リスト編集機能

<br>


### リストの達成目標日変更機能

<br>

### リスト一覧表示機能

<br>

### リスト詳細表示機能

<br>

### リストの削除機能

<br>

### プロセス新規作成機能

<br>

### プロセス編集機能

<br>

### プロセス一覧表示機能

<br>

### プロセス詳細表示機能

<br>

### プロセスの削除機能

<br>

### リスト・プロセスのカレンダー表示機能

<br>

### リスト・プロセスのステータス切替機能

<br>

### 未達成のリスト・プロセスの一覧表示機能

<br>

### 達成済のリスト・プロセスの一覧表示機能

<br>

### リスト・プロセスのリマインド機能

<br>

### リマインド非表示機能

<br>


## 実装予定の機能

<br>

## データベース設計

<br>

## ローカルでの動作方法

<br>

## 開発環境

<br>

## 最後までお目通しいただき有り難うございました。






