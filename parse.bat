@echo off
setlocal enabledelayedexpansion
CD C:\\Users
CD Dan
CD Pictures
CD "Saved Pictures"
CD "Bing Wallpaper Archive"
CD Fetcher
break>fullsize.txt
for /f "tokens=1 delims=" %%a in (bingarray.txt) do (
rem echo.%%a
set str=%%a
set trim=%%a
set trim=!trim:~1,8!
rem echo !trim!
rem echo !str!
if !trim! == imageUrl echo !str!>>fullsize.txt
)

for /f "tokens=1* delims=:" %%a in (fullsize.txt) do echo %%b>>fullsize1.txt

xcopy /y fullsize1.txt fullsize.txt
del fullsize1.txt
for /f "tokens=1 delims=" %%a in (fullsize.txt) do (
set str=%%a
set str=!str:~1,-1!
echo !str!>>fullsize1.txt
)
xcopy /y fullsize1.txt fullsize.txt
del fullsize1.txt