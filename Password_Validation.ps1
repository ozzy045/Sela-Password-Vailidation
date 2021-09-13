#ps1 Script

#Password validation using powershell script

# 2 options available:
# 1. Enter the password for validation.
# 2. Enter the text file path with the password in it.

# Function 'Pass_Check' gets the password and starts the validation process.

# Flag variable helps to understand whether there is an error in the password or not.

# Each 'if' argument checks if the input is valid. 



param([switch]$f = $false) #indicate whether the f option has been entered - switches to "true".


function Pass_Check {
 $Flag = '0';
	#check if the password is greater than or equal to 10
 if (-NOT($args[0].length -ge 10)){
    write-host "password length should be greater than or equal to 10 "`n -Foregroundcolor red
    $Flag = 1;
 }
 	# check if the password includs numbers
 if ($args[0] -notmatch "[0-9]" ){
    write-host "password must include numbers"`n -Foregroundcolor red
    $Flag = 1;
 }
 	#check if the password include capital leeter
 if (-not($args[0] -cmatch "[A-Z]")){
    write-host "password must include capital char"`n -Foregroundcolor red
    $Flag = 1;

 }
 	#check if the password include lower case letter
 if (-not($args[0] -cmatch "[a-z]" )){
    write-host "password must include lower case char"`n -Foregroundcolor red
    $Flag = 1;
 }
 	#check if there is an error 
 if ($Flag -eq 0){
    	write-host  $args[0] " - is a Valid Password" -Foregroundcolor Green}
	    else {
		  write-host "You entered" $args[0] `n -Foregroundcolor red
		  write-host "This password is invalid, please try again" -Foregroundcolor Yellow
 }
}
	#check the variable ater the -f option (if entered)
if ($f){
	if(!(test-path $args[0])){
		write-host "You should enter an existing file, try again" -Foregroundcolor Yellow
		exit 1;
	}
	else{
		$pass = Get-Content $args[0] -Raw 
		Pass_Check $pass;
	}
}
	#if no -f option in input, check the string from the command line.
elseif (!($f)){
		$pass=$args[0];
		Pass_Check $pass;
}
