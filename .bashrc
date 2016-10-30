# Set directory as terminal title.
# Set prompt to: {directory} ({git branch}) ★ 
export PS1='\[\e]0;\W\a\]${debian_chroot:+($debian_chroot)}\[\033[38;5;245m\]\W\[\033[0m\]$(__git_ps1 " (%s)") \[\033[38;5;42m\]★\[\033[0m\] '

# Always open emacs inline
alias emacs='emacs -nw'
