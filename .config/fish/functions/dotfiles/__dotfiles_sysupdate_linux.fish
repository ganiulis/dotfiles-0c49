function __dotfiles_sysupdate_linux
    if not type -q sudo
        echo 'Need elevated privileges—`sudo` is missing'
        return
    end

    # See https://wiki.archlinux.org/title/Pacman.
    if type -q pacman
        sudo pacman -Syu
	return
    end

    echo "Could not discover supported package manager"
end
