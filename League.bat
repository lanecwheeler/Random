@echo off
title League Ping Test
setlocal enabledelayedexpansion
set count=0
set total=0
for /F "tokens=3,7 delims==: " %%G in ('ping 104.160.131.3 ^| findstr /C:"Reply from"') do (
	set /a count+=1
	SET ms=%%H
	set ms=!ms:ms=!
	set /a total=!total! + !ms!
)
set /a average=%total% / %count%
echo Your connection to League is %average%ms
if %average% GEQ 500 (
	echo It's a no-go babe.
	GOTO:EOF
)
if %average% GEQ 200 (
	echo Eh, probably don't play.
	GOTO:EOF
)
if %average% GEQ 100 (
	echo You're probably good. 
	GOTO:EOF
)
if %average% LSS 100 (
	echo Rek sum noobs.
)
