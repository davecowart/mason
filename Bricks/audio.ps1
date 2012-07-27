function brick-play-complete-sound([string]$path) {
	$sound = new-Object System.Media.SoundPlayer
	$sound.SoundLocation="$path\work-complete.wav"
	$sound.Play()
}