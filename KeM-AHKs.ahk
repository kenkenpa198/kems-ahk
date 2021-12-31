;;;;; KeM-AHKs ;;;;;

/*
Emacs コマンドなど自分用に作成した ahk ファイル

先に ChgKey を使って Caps Lock に F13 キーを登録しておく
F13 キーのスキャンコード: 0x0064
*/

;;; IME 関数 ;;;
; https://w.atwiki.jp/eamat/pages/20.html より
;-----------------------------------------------------------
; IMEの状態をセット
;   SetSts          1:ON / 0:OFF
;   WinTitle="A"    対象Window
;   戻り値          0:成功 / 0以外:失敗
;-----------------------------------------------------------
IME_SET(SetSts, WinTitle="A")    {
	ControlGet,hwnd,HWND,,,%WinTitle%
	if	(WinActive(WinTitle))	{
		ptrSize := !A_PtrSize ? 4 : A_PtrSize
	    VarSetCapacity(stGTI, cbSize:=4+4+(PtrSize*6)+16, 0)
	    NumPut(cbSize, stGTI,  0, "UInt")   ;	DWORD   cbSize;
		hwnd := DllCall("GetGUIThreadInfo", Uint,0, Uint,&stGTI)
	             ? NumGet(stGTI,8+PtrSize,"UInt") : hwnd
	}

    return DllCall("SendMessage"
          , UInt, DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hwnd)
          , UInt, 0x0283  ;Message : WM_IME_CONTROL
          ,  Int, 0x006   ;wParam  : IMC_SETOPENSTATUS
          ,  Int, SetSts) ;lParam  : 0 or 1
}


;;; Emacs コマンド ;;;
F13 & f::Right     ; forward char
F13 & b::Left      ; backward char
F13 & p::Up        ; previous line
F13 & n::Down      ; next line
F13 & a::HOME      ; move beginning of line
F13 & e::END       ; move end of line
F13 & d::Del       ; delete char
F13 & h::BS        ; delete backward char
F13 & m::Enter     ; newline
F13 & k::          ; 切り取り
    send, +{END}
    send, ^x
    return
F13 & y::^v        ; 貼り付け


;;; 変換関連 ;;;
F13 & u::F6        ; ひらがな変換
F13 & i::F7        ; カタカナ変換
F13 & o::F10       ; 半角英数字変換


;;; Excel ;;;
; Ctrl + Tab でシート移動
#IfWinActive ahk_exe EXCEL.EXE
    ^Tab::send, ^{PgDn}
    +^Tab::send, ^{PgUp}
    return
#ifWinActive


;;; その他 ;;;
F13 & Space::      ; Windows 検索
    send, #s
    IME_SET(0)
    return
!q::!F4            ; アプリの終了