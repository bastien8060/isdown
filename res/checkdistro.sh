if [ -f "/etc/arch-release" ]; then
	echo arch
elif [ -f /etc/lsb-release ]; then
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
