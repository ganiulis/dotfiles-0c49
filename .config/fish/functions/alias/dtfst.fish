function dtfst --wraps='git --git-dir=$HOME/.dotfiles --work-tree=$HOME status' --description dotfiles
    git --git-dir=$HOME/.dotfiles --work-tree=$HOME status $argv
end
