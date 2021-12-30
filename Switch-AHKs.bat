::::: KeM-AHKs の切り替え用 bat ::::: 
:: KeM-AHKs 通常版とJIS版をトグル的に入れ替え 

:: TODO 
:: どちらも起動していない・どちらも起動してしまっている場合の処理を入れる 

@echo off
chcp 65001

tasklist | find "KeM-AHKs.exe" > NUL
if %ERRORLEVEL% == 0 (
  taskkill /F /IM KeM-AHKs.exe
  start KeM-AHKs-forJIS.exe
) else (
  taskkill /F /IM KeM-AHKs-forJIS.exe
  start KeM-AHKs.exe
)

timeout /t 2