::::: KeM-AHKs の切り替え用 bat ::::: 
:: KeM-AHKs 通常版とJIS版をトグル的に入れ替え 
:: どちらも起動していない場合は通常版を起動する 

:: 標準出力へコマンドを表示しない
@echo off
:: カレントディレクトリを再設定
cd /d %~dp0
:: 環境変数をローカル化
setlocal
:: 文字コードを設定
chcp 65001

tasklist | find "KeM-AHKs.exe" > NUL
if %ERRORLEVEL% == 0 (
    echo --- Switch to forJIS ---
    echo;
    taskkill /F /IM KeM-AHKs.exe
    start KeM-AHKs-forJIS.exe
) else (
    echo --- Switch to Normal ---
    echo;
    tasklist | find "KeM-AHKs-forJIS.exe" > NUL
    if not %ERRORLEVEL% == 0 (
        taskkill /F /IM KeM-AHKs-forJIS.exe
    )
    start KeM-AHKs.exe
)

timeout /t 2