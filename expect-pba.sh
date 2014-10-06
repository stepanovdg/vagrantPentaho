#!/usr/bin/expect -f

# 1 ARGUMENT = NAME OF BIN
# 2 ARGUMENT = install location
spawn ./$1
#13 press enter
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "Do you accept the license? [y/n]:" { send "y\r" }
expect -re "Please choose an option [1] :" { send "1\r" }
expect -re "Location:.*Pentaho]:" { send $2"\r" }
expect -re "Password: :" { send "admin\r" }
expect -re "Confirm Password: :" { send "admin\r" }
expect -re "Press [Enter] to continue :" { send "\r" }
expect -re "View Installation Summary [Y/n]:" { send "n\r" }
expect -re "Launch the Pentaho User Console now. [Y/n]:" { send "n\r" }
