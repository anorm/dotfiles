if [ -f ~/.local/lib/python3.*/site-packages/powerline/bindings/$(basename $SHELL)/powerline.sh ]; then
    $HOME/.local/bin/powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source ~/.local/lib/python3.*/site-packages/powerline/bindings/$(basename $SHELL)/powerline.sh
fi
