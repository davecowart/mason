function mason([string]$name) {
	if (![bool]$name) {
		Write-Host "You must specify a project name"
		return
	}
	. load-bricks($path)
	$name = rename($name)
	Write-Host "Laying the foundation for $name..."
	. brick-create-project($name)
	. brick-create-repo($name)
	. brick-push-repo($name)
	. brick-create-folder "stgcomweb" $name "QA"
	. brick-create-folder "stgcomweb" $name "UAT"
}

function rename([string]$name) {
	return (Get-Culture).TextInfo.ToTitleCase($name).Replace(" ", "") -replace "[^A-Za-z0-9._]", ""
}

function Get-ScriptDirectory {
	$Invocation = (Get-Variable MyInvocation -Scope 1).Value
	Split-Path $Invocation.MyCommand.Path
}

function load-bricks([string]$path) {
	# $path = "$path\Bricks\*.ps1"
	Get-ChildItem ("$path\Bricks\*.ps1") | ForEach-Object { . $_ }
}

$path = Get-ScriptDirectory

function test([string]$param1, [string]$param2) {
	Write-Host $param1 $param2
}