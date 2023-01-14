CD C:\\Users
CD Dan
CD Pictures
CD "Saved Pictures"
CD "Bing Wallpaper Archive"
CD Fetcher
$string = get-content .\binglinks.txt
$array =$string.split(",")
$array | out-file .\bingarray.txt