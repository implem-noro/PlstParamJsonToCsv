# PlstParamJsonToCsv

プリザンターのパラメータJSONファイルをCSV化するPowerShellスクリプトです。  
変更管理を目的としたExcelでのパラメータ設定値一覧を作成する作業などを省力化できます。  
プリザンターのバージョンに合致するディレクトリ配下のスクリプトを利用してください。  

## PlstParamJsonToCsv.ps1

以下を目的としたPowerShellスクリプトです。  

1. プリザンターのパラメータJSONファイルをCSV化する  

### 実行方法

Windows PowerShellを起動し、以下のコマンドを実行します。  

```bat
cd C:\web\pleasanter\Implem.Pleasanter\App_Data\Parameters
C:\work\PlstParamJsonToCsv\ver1.3.xx.x\PlstParamJsonToCsv.ps1
```

上記コマンドを実行すると、C:\work\Output.csv が作成されます。  

## PlstParamForCheck.ps1

以下を目的としたPowerShellスクリプトです。  

1. 対象のバージョンに合わせた「PlstParamJsonToCsv.ps1」を作成する  
1. 「PlstParamJsonToCsv.ps1」の過不足をチェックする  

### 事前準備

#### パラメータファイルの過不足チェック
「PlstParamForCheck.ps1」を開き、C:\web\pleasanter\Implem.Pleasanter\App_Data\Parameters 配下のJSONファイルと過不足がないことを確認します。  
過不足がある場合は、「PlstParamForCheck.ps1」を編集して上書き保存します。  

#### Go言語のインストール
以下の公式サイトよりGo言語をインストールしてください。  
https://go.dev/dl/  

#### BOM対応
パラメータファイルが「UTF-8 BOM付」の場合、スクリプト実行時に以下のエラーが発生します。  

```
failed to form statements: invalid character 'ï' looking for beginning of value
```

パラメータファイルを別の場所（C:\work\Parameters_1.3.xx.x 等）にコピーした上で、以下のような文字コード変換ツールを利用して「UTF-8 BOM無」に変換してください。  

KanjiTranslator  
https://www.kashim.com/kanjitranslator/  

#### 文字化け対応

パラメータファイルの値として日本語が設定されている箇所があると正しく変換されないため、一時的に削除します。  
コマンド実行によりファイル作成後、出力されたファイルに手動で戻します。  

| パラメータファイル名    | パラメータ名                                | パラメータ値                              |
|---------------|---------------------------------------|-------------------------------------|
| General.json  | CharToAddWhenCopying                  | " - コピー"                            |
| Security.json | PasswordPolicies[0].Languages[1].Body | "パスワードは6文字以上を入力してください。"             |
| Security.json | PasswordPolicies[1].Languages[1].Body | "パスワードにはアルファベット小文字を1文字以上を入力してください。" |
| Security.json | PasswordPolicies[2].Languages[1].Body | "パスワードにはアルファベット大文字を1文字以上を入力してください。" |
| Security.json | PasswordPolicies[3].Languages[1].Body | "パスワードには数字を1文字以上を入力してください。"         |
| Security.json | PasswordPolicies[4].Languages[1].Body | "パスワードには記号を1文字以上を入力してください。"         |

### 実行方法

Windows PowerShellを起動し、以下のコマンドを実行します。  

```bat
cd C:\work\Parameters_1.3.xx.x
C:\work\PlstParamJsonToCsv\ver1.3.xx.x\PlstParamForCheck.ps1
```

上記コマンドを実行すると、C:\work\PlstParamForCheck.csv が作成されます。  

### 確認方法
1. C:\work\Output.csv をサクラエディタなどのテキストエディタで昇順にソートします。  
1. C:\work\PlstParamForCheck.csv をサクラエディタなどのテキストエディタで昇順にソートします。  
1. ソートした2ファイルをWinMergeなどの差分比較ツールで比較します。  
1. 差分がある場合は、「PlstParamJsonToCsv.ps1」を編集して上書き保存します。  