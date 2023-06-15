## ローカル環境での開発

実際の負荷試験・スコアの採点は VM 環境で行われますが、ローカル環境での開発も可能です。

ローカル環境にリポジトリをクローンし、ルートディレクトリにある init.sh を実行してください。

```
$ bash init.sh [VMのドメイン] [秘密鍵のパス]
```

無事に環境が立ち上がれば、あとは VM 環境での開発と同じスクリプトが実行できます。

それぞれのスクリプトについては、[評価スクリプト](./99_manual.md#%e8%a9%95%e4%be%a1%e3%82%b9%e3%82%af%e3%83%aa%e3%83%97%e3%83%88)をご参照ください。