function brick-create-hudson([string]$name, [string]$path) {
	$config = Get-Content("$path\config.xml")
	$config = $config -replace "{{NAME}}", $name
	$config = $config -replace "{{USERNAME}}", "Intermark"
	$url = "http://jaws:8080/createItem?name=$name"
	
	$webrequest = [System.Net.WebRequest]::Create($url)
	$PostStr = [System.Text.Encoding]::UTF8.GetBytes($config)
	$webrequest.ContentLength = $PostStr.Length
	$webrequest.ContentType = "application/xml"
	$webrequest.Method = "POST"

	$requestStream = $webRequest.GetRequestStream()
	$requestStream.Write($PostStr, 0, $PostStr.length)
	$requestStream.Close()

	[System.Net.WebResponse] $resp = $webrequest.GetResponse();
}