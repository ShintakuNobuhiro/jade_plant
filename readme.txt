readme
タイトル「金のなる木」

【起動方法】
フォルダ「jade_plant」内にpdeファイルを置いてからProcessing 1.5.1で起動してください。

(Windows 7以降の方)
MeiryoUIを32ptで「MeiryoUI.vlw」という名前でCreate FontしてからRunしてください。

(それ以外の方)
適当な日本語ファイルを32ptでCreate Fontしてから
PFont meiryo = loadFont("ファイル名.vlw");
に適宜書き換えてください。

【リリースノート】
・Readme
Readmeファイル(このファイルの作成)

・Firstcommit(草案Version 0)
時計の表示、合計金額の表示、合計金額に合わせて茶色い四角が下から伸びる
暫定的に"h"キーを押下すると10ずつ金額が増える。
(このソースは暫定のもののため大文字Hは非対応です。)