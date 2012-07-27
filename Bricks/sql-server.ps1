function brick-create-database([string]$name, [string]$path, [string]$env) {
	$script = Get-Content("$path\create-db.sql")
	$script = $script -replace "{{NAME}}", $name
	$script = $script -replace "{{ENV}}", $env
	Set-Content "$path\temp-create-db.sql" $script
	sqlcmd -S blofeld2 -i "$path\temp-create-db.sql"
	rm "$path\temp-create-db.sql"
}