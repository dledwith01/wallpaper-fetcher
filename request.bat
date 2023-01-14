@echo off

rem dependencies: parse.bat, clean.ps1, webrequest.ps1

rem navigate to working file directory

CD C:\\Users
CD Dan
CD Pictures
CD "Saved Pictures"
CD "Bing Wallpaper Archive"
CD Fetcher

rem call powershell to pull json output of bing wallpaper feed. writes output to binglinks.txt

pwsh.exe -executionpolicy unrestricted -command "Invoke-WebRequest https://peapix.com/bing/feed?country=us -OutFile binglinks.txt"

rem call powershell to run powershell script that cleans up the feed into a list. writes list to bingarray.txt

pwsh.exe -file "C:\Users\Dan\Pictures\Saved"" ""Pictures\Bing"" ""Wallpaper"" ""Archive\Fetcher\clean.ps1"

rem call parser batch file to clean up the list some more. writes list for full size image urls to fullsize.txt 

call parse.bat

rem call powershell to run powershell script that downloads each jpg from the list of urls in fullsize.txt. these files are saved in working file directory.

pwsh.exe -executionpolicy unrestricted -file "C:\Users\Dan\Pictures\Saved"" ""Pictures\Bing"" ""Wallpaper"" ""Archive\Fetcher\webrequest.ps1"

rem create unique filenames based on exact date and time for each image file, rename from image1.jpg to datetime.jpg

rem image1
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate1 set MyDate1=%%x
set today1=%MyDate1:~0,4%%MyDate1:~4,2%%MyDate1:~6,2%
set mytime1=%MyDate1:~8,2%%Mydate1:~10,2%%MyDate1:~12,2%%MyDate1:~15,3%
set mydatetime1=%today1%%mytime1%

rem image2
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate2 set MyDate2=%%x
set today2=%MyDate2:~0,4%%MyDate2:~4,2%%MyDate2:~6,2%
set mytime2=%MyDate2:~8,2%%Mydate2:~10,2%%MyDate2:~12,2%%MyDate2:~15,3%
set mydatetime2=%today2%%mytime2%

rem image3
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate3 set MyDate3=%%x
set today3=%MyDate3:~0,4%%MyDate3:~4,2%%MyDate3:~6,2%
set mytime3=%MyDate3:~8,2%%Mydate3:~10,2%%MyDate3:~12,2%%MyDate3:~15,3%
set mydatetime3=%today3%%mytime3%

rem image4
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate4 set MyDate4=%%x
set today4=%MyDate4:~0,4%%MyDate4:~4,2%%MyDate4:~6,2%
set mytime4=%MyDate4:~8,2%%Mydate4:~10,2%%MyDate4:~12,2%%MyDate4:~15,3%
set mydatetime4=%today4%%mytime4%

rem image5
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate5 set MyDate5=%%x
set today5=%MyDate5:~0,4%%MyDate5:~4,2%%MyDate5:~6,2%
set mytime5=%MyDate5:~8,2%%Mydate5:~10,2%%MyDate5:~12,2%%MyDate5:~15,3%
set mydatetime5=%today5%%mytime5%

rem image6
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate6 set MyDate6=%%x
set today6=%MyDate6:~0,4%%MyDate6:~4,2%%MyDate6:~6,2%
set mytime6=%MyDate6:~8,2%%Mydate6:~10,2%%MyDate6:~12,2%%MyDate6:~15,3%
set mydatetime6=%today6%%mytime6%

rem image7
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate7 set MyDate7=%%x
set today7=%MyDate7:~0,4%%MyDate7:~4,2%%MyDate7:~6,2%
set mytime7=%MyDate7:~8,2%%Mydate7:~10,2%%MyDate7:~12,2%%MyDate7:~15,3%
set mydatetime7=%today7%%mytime7%

rem rename the jpg files

rename image1.jpg %mydatetime1%.jpg
rename image2.jpg %mydatetime2%.jpg
rename image3.jpg %mydatetime3%.jpg
rename image4.jpg %mydatetime4%.jpg
rename image5.jpg %mydatetime5%.jpg
rename image6.jpg %mydatetime6%.jpg
rename image7.jpg %mydatetime7%.jpg

rem move the jpg files to the bing wallpaper archive directory

move %mydatetime1%.jpg ..\
move %mydatetime2%.jpg ..\
move %mydatetime3%.jpg ..\
move %mydatetime4%.jpg ..\
move %mydatetime5%.jpg ..\
move %mydatetime6%.jpg ..\
move %mydatetime7%.jpg ..\

rem cleans up temporary files created during processing

del fullsize.txt
del bingarray.txt
del binglinks.txt

rem now... how do i change my wallpaper to %mydatetime1%.jpg??
rem REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /f /t REG_SZ /d "C:\Users\Dan\Pictures\Saved Pictures\Bing Wallpaper Archive\%mydatetime1%.jpg"

CD ..\
del /s /f /q "C:\Users\Dan\Pictures\Saved Pictures\Bing Wallpaper Archive\CurrentWallpaper\"
copy %mydatetime1%.jpg "C:\Users\Dan\Pictures\Saved Pictures\Bing Wallpaper Archive\CurrentWallpaper\%mydatetime1%.jpg"

mkdir %today1%

move %mydatetime1%.jpg .\%today1%\
move %mydatetime2%.jpg .\%today1%\
move %mydatetime3%.jpg .\%today1%\
move %mydatetime4%.jpg .\%today1%\
move %mydatetime5%.jpg .\%today1%\
move %mydatetime6%.jpg .\%today1%\
move %mydatetime7%.jpg .\%today1%\


