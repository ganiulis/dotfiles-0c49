function __self-upgrade_darwin
    if not type -q brew
        echo 'Missing brew. Visit https://brew.sh.'
        return
    end

    brew update
    brew upgrade
end
