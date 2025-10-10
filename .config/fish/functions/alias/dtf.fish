function dtf --wraps='git --git-dir=$HOME/.dotfiles --work-tree=$HOME' --description 'dotfiles'
    git --git-dir=/home/gintaras/.dotfiles --work-tree=/home/gintaras $argv
end
