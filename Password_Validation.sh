#!/bin/bash

#This script check input from the user for the following rules
#1. Length – minimum of 10 characters.
#2. Contain both alphabet and number.
#3. Include both the small and capital case letters
#if one or more rule fails, the output will be printed in red with the rules that failed
#if the input pass all rules, the output will be printed in green

#Save user's input into "password" and calculate  length
password=$1
passLength=${#password}
flag=0 #if a  rule fail flag will be set to 1!

#echo "password:$password"
#echo "password length: $passLength"

#check if lengh is less then 10 charcters

if (($passLength < 10));
  then
  echo "password's length must be 10 or higher"
 flag=1
fi
 #check if input contain a letter and a digit
if ! [[ $password =~ [[:alpha:]] && $password =~ [[:digit:]] ]]; 
  then
  echo "Password must contain a letter and a digit"
 flag=1
fi
  #check if the input contain bothe uppercase and lowercase
  
if   [[ ! "$password" =~ [[:upper:]] || ! "$password" =~ [[:lower:]]  ]];
  then
  echo "Password must contain a uppercase and lowercase letters"
   flag=1
fi
  #check if the password is valid and print it in the right color
if   ((flag==0))
then 
  echo "$(tput setaf 2) $password"
  exit 0;
  else
  echo "$(tput setaf 1) $password"
  exit 1;
fi
