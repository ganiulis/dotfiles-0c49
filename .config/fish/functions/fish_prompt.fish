function fish_prompt
    echo -s (set_color green) (whoami) " " (set_color blue) (prompt_pwd) (set_color red) (fish_git_prompt) " " (set_color normal)"→ "
end
