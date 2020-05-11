if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    echo $NAME
    echo $VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    echo $(lsb_release -si)
    echo $(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    echo "ubuntu"
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    echo "debian"
elif [ -f /etc/SuSe-release ]; then
    echo "suse"
    ...
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    echo "centos"
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    echo $(uname -s)
    echo $(uname -r)
fi
