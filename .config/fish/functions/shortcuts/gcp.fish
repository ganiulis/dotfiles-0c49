function gcp --description 'git push super-shortcut'
    git pull && git add . && git commit -m "$argv" && git push
end
