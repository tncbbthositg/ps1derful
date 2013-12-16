# normal
black="\[\e[0;30m\]"
red="\[\e[0;31m\]"
green="\[\e[0;32m\]"
yellow="\[\e[0;33m\]"
blue="\[\e[0;34m\]"
purple="\[\e[0;35m\]"
cyan="\[\e[0;36m\]"
white="\[\e[0;37m\]"
light_gray="\[\e[2;37m\]"

# bold
b_black="\[\e[1;30m\]"
b_red="\[\e[1;31m\]"
b_green="\[\e[1;32m\]"
b_yellow="\[\e[1;33m\]"
b_blue="\[\e[1;34m\]"
b_purple="\[\e[1;35m\]"
b_cyan="\[\e[1;36m\]"
b_white="\[\e[1;37m\]"

# underline
u_black="\[\e[4;30m\]"
u_red="\[\e[4;31m\]"
u_green="\[\e[4;32m\]"
u_yellow="\[\e[4;33m\]"
u_blue="\[\e[4;34m\]"
u_purple="\[\e[4;35m\]"
u_cyan="\[\e[4;36m\]"
u_white="\[\e[4;37m\]"

# background
bg_black="\[\e[40m\]"
bg_red="\[\e[41m\]"
bg_green="\[\e[42m\]"
bg_yellow="\[\e[43m\]"
bg_blue="\[\e[44m\]"
bg_purple="\[\e[45m\]"
bg_cyan="\[\e[46m\]"
bg_white="\[\e[47m\]"

# intense
i_black="\[\e[0;90m\]"
i_red="\[\e[0;91m\]"
i_green="\[\e[0;92m\]"
i_yellow="\[\e[0;93m\]"
i_blue="\[\e[0;94m\]"
i_purple="\[\e[0;95m\]"
i_cyan="\[\e[0;96m\]"
i_white="\[\e[0;97m\]"

# bold intense
b_i_black="\[\e[1;90m\]"
b_i_red="\[\e[1;91m\]"
b_i_green="\[\e[1;92m\]"
b_i_yellow="\[\e[1;93m\]"
b_i_blue="\[\e[1;94m\]"
b_i_purple="\[\e[1;95m\]"
b_i_cyan="\[\e[1;96m\]"
b_i_white="\[\e[1;97m\]"

# background intense
bg_i_black="\[\e[0;100m\]"
bg_i_red="\[\e[0;101m\]"
bg_i_green="\[\e[0;102m\]"
bg_i_yellow="\[\e[0;103m\]"
bg_i_blue="\[\e[0;104m\]"
bg_i_purple="\[\e[10;95m\]"
bg_i_cyan="\[\e[0;106m\]"
bg_i_white="\[\e[0;107m\]"

__bash_colors_print_samples() {
	grep "^[a-z_]\+=" $BASH_SOURCE | sed -E 's/((.*)="\\\[(.*)\\\]")/[ \3\2\\e[0m ]/' | while read -r line; do
		echo -e "$line"
	done
}