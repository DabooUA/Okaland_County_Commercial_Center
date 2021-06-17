Oakland County Vehicle Center website build flow:

1.
    a. Creating migration for vehicle database
    b. Creating migration for user database
    c. Creating migration for message board
    d. Creating migration for storing the pictures
2.
    a. Creating UserController. Responsible for:
        1. Creating New User (Sign up)
        2. Validating the User (Log in)
        3. Logging the User off (Log off)
    b. Creating VehicleController. Responsible for:
        1. Creating new Vehicle Post/Listing
        2. Editing Vehicle Post/Listing
        3. Delting Vehicle Post/Listing
    c. Creating MessageController. Responsible for:
        1. Creating a message that will be posted on thread of the listed vehicle for sale or trade.
        2. Editing the message.
        3. Deleting the message.