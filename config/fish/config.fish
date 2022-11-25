# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- vt1
    end
end

# Aliases on startup
alias config='/usr/bin/git --git-dir=/home/merrinx/.dotfiles/ --work-tree=/home/merrinx/'

# Running random script at term start
colorscript random
