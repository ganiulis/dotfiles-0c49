function fish_prompt
    echo -s (set_color green) (whoami) " " (set_color blue) (prompt_pwd) (set_color red) (fish_git_prompt) " " (set_color normal)"→ "
end

function fish_right_prompt
    echo -s (set_color yellow) (__kube_prompt) " " (set_color normal) (date +%T)
end
