function gpsh --description 'git push super-shortcut'
    git add . && git commit -m "$argv" && git push
end
