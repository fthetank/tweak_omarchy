# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc
#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"
#get fastest mirrors in your neighborhood
#our experimental - best option for the moment
alias mirror="sudo cp -f /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak && sudo reflector -c germany -l 20 -p https --save /etc/pacman.d/mirrorlist"
alias ll="ls -la"
alias ff="fastfetch"
# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#
# Use VSCode instead of neovim as your default editor
# export EDITOR="code"
#
# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"
