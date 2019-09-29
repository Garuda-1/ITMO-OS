#!/bin/bash

echo "Greetings, $(whoami)! What would you like to do?"
echo ""
echo -e "1\tLaunch nano editor"
echo -e "2\tLaunch vi editor"
echo -e "3\tLaunch links browser"
echo -e "4\tLeave this menu"
echo ""
echo -n "> "

OPTION=""

read OPTION

case $OPTION in
	1)
	echo "Launching nano..."
	nano
	;;

	2)
	echo "Launching vi..."
	vi
	;;

	3)
	echo "Launching links..."
	links
	;;

	4)
	echo "Bye!"
	;;

	*)
	echo "Wrong parameter"
	;;
esac

