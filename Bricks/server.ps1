function brick-create-folder([string]$server, [string]$name) {
	mkdir \\$server\webs\demo\$name
}