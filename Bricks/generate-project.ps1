function brick-create-project([string]$name) {
	Write-Host
	Write-Host "1: MVC3"
	Write-Host "2: N2CMS (MVC3)"
	Write-Host
	$type = Read-Host "Pick a project type (Enter for 1)"

	if ($type -eq 2) {
		Write-Host "Creating N2CMS (MVC3) Project"
		$repo = "git@github.com:davecowart/mason-n2cms.git"
	} else {
		Write-Host "Creating MVC3 Project"
		$repo = "git@github.com:davecowart/mason-mvc3.git"
	}

	mkdir $name
	cd $name
	git clone $repo .
	rm -r -force .git
	git init
	git add .
	git commit -m "init"
	cd ..
}
