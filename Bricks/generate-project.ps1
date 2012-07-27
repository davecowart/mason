function brick-create-project([string]$name) {
	Write-Host
	Write-Host "1: MVC3"
	Write-Host "2: N2CMS (MVC3)"
	Write-Host
	$type = Read-Host "Pick a project type"

	if ($type -eq 1) {
		Write-Host "Creating MVC3 Project"
		$repo = "git@github.com:davecowart/mason-mvc3.git"
	} elseif ($type -eq 2) {
		Write-Host "Creating N2CMS (MVC3) Project"
		$repo = "git@github.com:davecowart/mason-n2cms.git"
	} else {
		Write-Host
		Write-Host "Invalid option" -foregroundcolor red
		. brick-create-project($name)
	}

	mkdir $name
	cd $name
	git clone $repo
	#rm .git
	#git init
	#git add .
	#git commit -m "init"
	#cd ..
}
