function dtf --wraps='git --git-dir=$HOME/.dotfiles --work-tree=$HOME' --description dotfiles
    git --git-dir=$HOME/.dotfiles --work-tree=$HOME $argv
end
