::::: KeM-AHKs の切り替え用 bat ::::: 
:: KeM-AHKs 通常版とJIS版をトグル的に切り替える bat

:: PowerShell で通知を出すため、事前に BurntToast のインストールを行っておく
:: 参考: https://neos21.net/blog/2022/01/27-01.html

:: 1. 管理者権限で PowerShell を起動
:: 2. インストール
::    > Install-Module -Name BurntToast
:: 3. 2回分インストールの許可を聞かれるのでどちらも Y
:: 4. インストールが完了したら実行テスト
::    > New-BurntToastNotification -Text '通知テスト！'


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
    taskkill /F /IM KeM-AHKs.exe
    start .\Assets\KeM-AHKs-forJIS.exe
    powershell -Command "New-BurntToastNotification -Text 'Switch-AHKs', 'KeM-AHKs JIS キーボード版 をアクティブにしました。'"
) else (
    tasklist | find "KeM-AHKs-forJIS.exe" > NUL
    if not %ERRORLEVEL% == 0 (
        taskkill /F /IM KeM-AHKs-forJIS.exe
    )
    start .\Assets\KeM-AHKs.exe
    powershell -Command "New-BurntToastNotification -Text 'Switch-AHKs', 'KeM-AHKs 通常版 をアクティブにしました。'"
)
