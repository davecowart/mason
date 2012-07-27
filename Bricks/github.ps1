function brick-create-repo([string]$name) {
	Read-Host "API currently not cooperating, so go create the repo $name (press enter when done)"
	#$email = Read-Host "Enter your email address"
 	#curl -i -v -X POST -H "Content-Type: application/json" -H "Accept: application/json" -u "$email" -d "{"name":"$name"}" https://api.github.com/user/repos
}

function brick-push-repo([string]$name) {
	cd $name
	git remote add origin git@github.com:davecowart/$name.git
	git push -u origin master
	cd ..
}