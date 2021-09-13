#!/bin/bash

#This script check input from the user for the following rules
#1. Length – minimum of 10 characters.
#2. Contain both alphabet and number.
#3. Include both the small and capital case letters
#if one or more rule fails, the output will be printed in red with the rules that failed
#if the input pass all rules, the output will be printed in green

#check if lengh is less then 10 charcters

pass_check(){   #the validation happens in this function by getting the password as a variable.

passLen=${#1} #Save password's lenght into a variable.
flag=0 #if a  rule fail flag will be set to 1!

if (($passLen < 10));
  then
  echo "password's length must be 10 or higher"
 flag=1
fi
 #check if input contain a letter and a digit
if ! [[ $1 =~ [[:alpha:]] && $1 =~ [[:digit:]] ]]; 
  then
  echo "Password must contain a letter and a digit"
 flag=1
fi
  #check if the input contain bothe uppercase and lowercase
  
if   [[ ! "$1" =~ [[:upper:]] || ! "$1" =~ [[:lower:]]  ]];
  then
  echo "Password must contain a uppercase and lowercase letters"
   flag=1
fi
  #check if the password is valid and print it in the right color
if   ((flag==0))
then 
  echo "$(tput setaf 2)$1"
  exit 0;
  else
  echo "$(tput setaf 1)$1"
  exit 1;
fi
}

# check if the option -f insterted
if getopts ":f" opt; 
then
    if [[ -f "$2" ]] #checks if the file that should include the password exists
    then #send a text  file password to the function
        password="$(cat "$2")"
        pass_check "$password"
        else
        echo "$(tput setaf 3) There is no such file"
    fi
    else #send a command line password to the function
    pass_check "$1"
    echo "$1"
fi