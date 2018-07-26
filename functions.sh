trim_string() { # https://github.com/dylanaraps/pure-bash-bible#trim-leading-and-trailing-white-space-from-string
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    echo "$_"
}

install() {
    code --install-extension $1
}

uninstall() {
    code --uninstall-extension $1
}

just_do_it() {
    while read -r line ; do
        s=$(trim_string "$line")
        if [[ -n "$s" && ! "$s" = \#* ]] ; then
            $1 $s
        fi
    done < "extensions.dat"
}
