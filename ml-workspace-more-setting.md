# Enable ssh password login
In ml-workspace docker environment, ssh password login is 
disabled by default. To use it, we need to allow the login
using password and set root password.
## Allow root login
Add ```PermitRootLogin yes``` and ```PasswordAuthentication yes``` in
```/etc/ssh/sshd_config```.
## Set root password
run ```passwd root``` and input the password.