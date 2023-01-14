CD C:\\Users
CD Dan
CD Pictures
CD "Saved Pictures"
CD "Bing Wallpaper Archive"
CD Fetcher

$count=1
$url=1
$files = get-content -path .\fullsize.txt
$files | foreach-object {
	$url=$_
	echo $url
	invoke-webrequest $url -outfile image$count.jpg
	$count+=1
}