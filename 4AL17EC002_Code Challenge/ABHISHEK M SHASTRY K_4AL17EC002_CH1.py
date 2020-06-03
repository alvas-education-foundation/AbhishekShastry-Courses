"""Write python code to verify user_name = "Micheal" and password ="e3$WT89x". 
The total number of attempts are 03. For every wrong user_name and password 
Print - Invalid username or Password, upon three attempts fails print- Account locked
If inputs are correct Print - You have successfully login"""

attempts = 3 #Set number of attempts to enter user name and password.

while attempts !=0: #Check until attempts become equal to zero.
    user_name = input("Enter the user name:")
    user_password = input("Enter the user password:")

    if user_name == 'Micheal' and user_password == 'e3$WT89x': #Compare user name and password with the entered input. 
        print("You have successfully logged in!")
        flag = 1
        break
    else:
        attempts-=1 #Decrease number of attempts by 1.
        if attempts !=0:
            print("Invalid user name or password. Try again...")
        else:
            print("You have exceeded the number of attempts.")
            print("Account Locked!") 
            


