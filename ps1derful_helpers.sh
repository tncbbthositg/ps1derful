__ps1derful_get_short_path() {
	if type -t ps1derful_get_short_path > /dev/null 2>&1; then
		echo `ps1derful_get_short_path`
	else
		echo "\w"
	fi
}