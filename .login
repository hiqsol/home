#! /bin/sh
### $Header: /usr/cvs/sol/.login,v 1.8 2005/04/11 18:59:51 sol Exp $

#stty -istrip crt erase 
stty -ixon

mesg y

if [ -d ~/.calendar ]; then
	echo
	test -x /usr/bin/calendar && /usr/bin/calendar -A 3
fi
if [ -d ~/src/some ]; then
	echo
	gmake -s -C ~/src/some some
fi
