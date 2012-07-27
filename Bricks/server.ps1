function brick-create-folder([string]$server, [string]$name, [string]$env) {
	mkdir "\\$server\webs\demo\$name-$env"
}