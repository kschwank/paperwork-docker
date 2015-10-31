#!/bin/bash

if [ "$1" = 'paperwork' ]; then
    mkdir -p $HOME/papers
    mkdir -p $HOME/.local/share/paperwork
    chown -R paperworker $HOME
    chown -R paperworker /tmp/.X11-unix

    exec gosu paperworker "$@"
fi

exec "$@"
