#!/bin/sh

#stty -istrip crt erase 
stty -ixon

mesg y

echo
quotes
echo

# Enable ssh-agent
if [ -z $SSH_AUTH_SOCK ]; then
    eval `ssh-agent`
fi
### Predictable SSH authentication socket location
### XXX NOT $HOME because of `sudo -s`
SOCK="/home/$USER/.ssh/ssh-agent.sock"
if [ ! -z $SSH_AUTH_SOCK ] && [ $SSH_AUTH_SOCK != $SOCK ]; then
    rm -f $SOCK
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi
