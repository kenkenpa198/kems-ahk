;;;;; KeM-AHKs for JIS ;;;;;

/*
JIS キーボードの右端のキーを US 風にする ahk ファイル
ノートパソコンに内蔵されているような、右端のキーが詰まったタイプの JIS キーボード用
単純に入力を入れ替えると \ 及び | が入力できなくなってしまうので、Shift や F13 の組み合わせで補完している

KeM-AHKs.ahk と同時起動すると競合して動作に不良が出るようなので、
読み込んだ上でこのファイルのみを起動する

使用する際は IME のキーボード設定を US キーボードに設定しておいてください
設定 > 時刻と言語 > 言語 > 優先する言語 > 日本語 > オプション > ハードウェア キーボード レイアウト > レイアウトを変更する
「英語キーボード (101/102キー)」に変更して OK をクリック > 再起動で反映
*/

;;; ベースの ahk ファイルを読み込み ;;;
#Include KeM-AHKs.ahk
#Include IME.ahk


;;; 右端のキーを置き換え ;;;
sc07D::BS    ; ¥ で Back Space を送信
sc073::RShift ; \ で右の Shift を送信
sc02B::
    ; Shift + ] でパイプを送信
    if GetKeyState("Shift") {
        send, |
        return
    }
    ; ] で Enter を送信
    Send, {Enter}
    return
F13 & sc02B::\   ; F13 + ] でバックスラッシュを送信


;;; IME 操作関連 ;;;
sc07B & Tab::AltTab ; 無変換キーでも AltTab
sc07B::IME_SET(0)   ; 無変換キーで IME を OFF
sc079::IME_SET(1)   ; 変換キーで IME を ON
sc070::IME_SET(1)   ; ひらがなカタカナキーで IME を ON