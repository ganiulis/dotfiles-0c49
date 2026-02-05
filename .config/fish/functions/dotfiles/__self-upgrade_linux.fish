function __self-upgrade_linux
    # See https://github.com/nix-community/home-manager
    if type -q home-manager
        home-manager switch
        return
    end

    if not type -q sudo
        echo 'Need elevated privileges—`sudo` is missing'
        return
    end

    # See https://nixos.org
    if type -q nixos-rebuild
        sudo nixos-rebuild switch
        return
    end

    # See https://wiki.archlinux.org/title/Pacman
    if type -q pacman
        sudo pacman -Syu
        return
    end

    # See https://wiki.debian.org/Apt
    if type -q apt
        sudo apt update -y
        sudo apt full-upgrade -y --autoremove
        return
    end

    echo "Could not discover supported package manager"
end
