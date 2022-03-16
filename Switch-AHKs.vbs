' bat をバックグラウンドで実行するための VBS ファイル

' このファイルのショートカットをスタートメニューのディレクトリに配置してパッと実行できるようにしておく
' C:\Users\%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu

' 参考: https://amaotolog.com/pc-benri/33

Set ws = CreateObject("Wscript.Shell")
ws.run "cmd /c Switch-AHKs.bat", vbhide