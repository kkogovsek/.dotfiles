plugins=(nvm)
alias config='/usr/bin/git --git-dir=/home/klemen/.cfg/ --work-tree=/home/klemen'
alias smart='sh /home/klemen/.config/randomness/run-dev.sh /home/klemen/smartis/smartstack'
alias mm='sh /home/klemen/.config/randomness/run-dev.sh /home/klemen/projekti/mizarstvo-marolt'
alias sm='sh /home/klemen/.config/randomness/run-dev.sh /home/klemen/smartis/klienti/service-manager'
alias yr='yarn run '
alias yto='while read; do yr test; for proc in `pgrep node`; do kill $proc; done; done'
alias yi='yaourt --pager --color'
