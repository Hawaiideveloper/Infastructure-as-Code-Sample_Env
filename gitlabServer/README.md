```
Note!!!
```
This server took about 20 minutes to boot fully after it booted as there are dependecies 





Make sure to adjust the BASE_DIR to point to the correct location where you want to create the Vagrantfile and initiate the Vagrant VM. Also, remember to make the file executable, and you can then run the script:

If you have a Vagrant instance running, you can log in to it using `vagrant ssh`. Here are the steps to login to the Vagrant instance:

### Step 1: Navigate to Vagrant Directory
Open a terminal, and navigate to the directory containing your Vagrantfile.

```
cd /path/to/your/vagrant/directory
```
In your case, this would be:
```
cd /Users/president/Documents/gitlab/server
```


### Spin up and if you get an error do this:
Spin up a gitlab server
- [ ] vagrant up
- [ ] vagrant status

#### Kill the running instances if you get issues:
- [ ] vagrant halt
- [ ] kill -9 $(pgrep -f vagrant)
- [ ] sudo kill -9 $(lsof -t -i:8080)






##### If you dont feel comfortable with command above run the following
- [ ] ps aux | grep 'vagrant'
- [ ] kill -9 [ProcessID]
- [ ] lsof -i :8080





### Step 2: SSH into the Vagrant Box
Run the following command to SSH into the running Vagrant box.
```
vagrant ssh
```

Now you are inside your Vagrant instance, 

### Step 3: Reset the GitLab Password
Once you are inside your Vagrant instance via SSH, perform the GitLab password reset steps 

### Note
- Ensure that the Vagrant instance is running. You can check the status of Vagrant instances with the command `vagrant status`.
- If the Vagrant instance is not running, you can start it with the command `vagrant up`.



2. **Open the Rails Console**

   Run the following command to open the GitLab Rails Console:

   ```gitlab-rails console -e production
   ```

3. **Find the User**

   You can find the user by their username or email. Replace `username` with the actual username of the account.

   ```
   user = User.find_by(username: 'username')
   ```

   Or, if you want to find the user by email, replace `email@example.com` with the actual email of the account.

   ```
   user = User.find_by(email: 'email@example.com')
   ```

4. **Reset Password**

   Once you have the user object, you can reset the password. Replace `newpassword` with the desired password.

   ```
   user.password = 'newpassword'
   user.password_confirmation = 'newpassword'
   user.save!
   ```

5. **Exit the Console**

   Type `exit` and press Enter to leave the Rails Console.

   ```sh
   exit
   ```

6. **Login with the New Password**

   Now, you should be able to log in to the GitLab instance using the new password.

### Important Notes:
- Be cautious while making changes via Rails Console as it can directly affect the GitLab database.
- It’s a good practice to backup GitLab before making any changes to avoid data loss.
- After resetting the password, the user should log in and change the password immediately.
- Use strong passwords and follow the password policy if any.

If you’re using GitLab.com, you have to use the “Forgot your password?” link on the login page, as the above method only applies to self-hosted GitLab instances. If you do not have access to the recovery email or cannot recover the account using the provided methods, you will need to contact GitLab support for assistance.