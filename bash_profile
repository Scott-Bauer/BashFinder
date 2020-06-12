#!/bin/bash
#Scotty Bauer 260789116

#Calls variable hostname (found this variable from reading 'man hostname')
echo -e "\e[1mWelcome to $HOSTNAME!\e[0m"

#grep my username to the who command, and piped that with a wc -l which counts the number of lines in the output
NUM=$(who | grep sbauer3 | wc -l)
echo "You have $NUM login session(s) to this host."

#I added extra echo's to put the  quote between blank lines
echo 

fortune

echo 


alias comp206='cd ~/Projects/COMP206'

#export PS1 here to that specified in question 1 part 4
export PS1='\e[0;34m\u@\h\e[m\e[0;31m[\T]\e[m:\e[0;32m\w$\e[m '



#For the "plus one other thing of your liking" part, I added colors to my shell's prompt. Also, I made my welcome message in bold
