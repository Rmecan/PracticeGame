@echo off
@chcp 65001 >nul
@setlocal enabledelayedexpansion

set hands[1]=グー
set hands[2]=チョキ
set hands[3]=パー

:menu
set /a choice=0
cls
echo じゃんけんゲーム
echo 1. グー
echo 2. チョキ
echo 3. パー
set /p choice=選択してください (1-3): 
if "%choice%" neq "1" if "%choice%" neq "2" if "%choice%" neq "3" (
    echo 無効な選択です。もう一度選んでください。
    pause
    goto menu
)

set /a computer=%random% %% 3 + 1
set /a result=(3 + %choice% - %computer%) %% 3

echo あなた: !hands[%choice%]!
echo コンピュータ: !hands[%computer%]!

if %result%==0 (
    echo 引き分けです！
) else if %result%==1 (
    echo あなたの負けです！
) else (
    echo あなたの勝ちです！
)

pause
goto menu