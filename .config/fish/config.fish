# Allows for nested function/completion directories
if status is-interactive
    set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
    set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path

    if test -d $HOME/bin
        set PATH "$HOME/bin:$PATH"
    end

    if test -d $HOME/.local/bin
        set PATH "$HOME/.local/bin:$PATH"
    end

    if test -d $HOME/$HOME/.local/scripts
        set PATH "$HOME/.local/scripts:$PATH"
    end

    if test -x $HOME/.local/bin/mise
        mise activate fish | source
    end

    if test -x $HOME/.local/bin/starship
        starship init fish | source
    end
end
