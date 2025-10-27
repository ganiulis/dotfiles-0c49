function l --wraps='ls -l' --wraps='ls -F' --description 'alias l=ls -F'
    ls -F $argv
end
