<!-- omit in toc -->
# KeM-AHKs

自分用の Auto Hot Key ファイルたちです。  
`Switch-AHKs.vbs` を実行することで、2種類の AHK の実行ファイルをトグル的に切り替えられるようにしています。

## 1. 環境構築

1. `git clone https://github.com/kenkenpa198/KeM-AHKs.git`
2. [最新のリリース](https://github.com/kenkenpa198/KeM-AHKs/releases) から `Assets.zip` をダウンロード。
3. 解凍した `Assets` フォルダを下記のように配置。

    ```shell
    .
    ├── Assets ★
    │   ├── KeM-AHKs-forJIS.exe ★
    │   └── KeM-AHKs.exe ★
    ├── KeM-AHKs-forJIS.ahk
    ├── KeM-AHKs.ahk
    ├── README.md
    ├── Switch-AHKs.bat
    └── Switch-AHKs.vbs
    ```

4. 通知用の BurntToast をインストールする。
   1. 管理者権限で PowerShell を起動。
   2. `Install-Module -Name BurntToast` を実行。
   3. 2回分インストールの許可を聞かれるのでどちらも `Y` 。
   4. インストールが完了したら実行テストをする。  
   `New-BurntToastNotification -Text '通知テスト！'`
5. `KeM-AHKs.exe` `Switch-AHKs.vbs` のショートカットをそれぞれ以下のディレクトリに配置。
   1. `KeM-AHKs.exe` : `%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
   2. `Switch-AHKs.vbs` : `%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu`
6. スタートアップ時の起動とスタートメニューからの実行をそれぞれ確認。

## 2. メモ

- ahk を利用したいだけのミニマム（ミニマル？）な運用なら、`Assets.zip` をダウンロードして中の exe ファイルを実行しておくだけで OK 。
- WSL2 環境にクローンした場合、親ディレクトリをシンボリックリンクで繋げておく。  
その後 Win 環境側からそのディレクトリを開き、Win 環境上のパスでショートカットを作成する。  
参考: [kenkenpa198/dotfiles](https://github.com/kenkenpa198/dotfiles) > [mklink.bat](https://github.com/kenkenpa198/dotfiles/blob/main/.setup/bat/mklink.bat)

## 3. クレジット

### 3.1. 利用ソフトウェア

- [AutoHotkey](https://www.autohotkey.com/)
- [IME制御 - eamat @Cabinet](https://w.atwiki.jp/eamat/pages/17.html)
  - `IME.ahk` の `IME_SET( )` 関数を利用させていただいています。
- [BurntToast](https://neos21.net/blog/2022/01/27-01.html)

### 3.2. 参考サイト

- [AutoHotkey Wiki](http://ahkwiki.net/Top)
- [Windows GitBash から GUI に通知を出す方法3選 - Neo's World](https://neos21.net/blog/2022/01/27-01.html)
- [[Windows] バッチファイル（.bat）を非表示・最小化した状態で起動する](https://uguisu.skr.jp/Windows/bat_nowindow.html)
- [WindowsのAlt空打ちで日本語入力(IME)を切り替えるツールを作った - karakaram-blog](https://www.karakaram.com/alt-ime-on-off/)
