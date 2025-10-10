function self-upgrade --description 'Update your system'
    set -l my_system (uname)

    if [ Linux = $my_system ]
        echo "$my_system found, starting update..."
        __self-upgrade_linux
        return
    end

    if [ Darwin = $my_system ]
        echo "macOS found, starting update..."
        __self-upgrade_darwin
        return
    end

    echo "$my_system is not supported"
end
