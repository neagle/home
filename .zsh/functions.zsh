# Tell brew bundle to use the standard brewfile from anywhere
function brew() {
	if [[ $1 == "bundle" ]]; then
		command brew bundle --file=~/.config/brewfile/Brewfile "${@:2}"
	else
		command brew "$@"
	fi
}
