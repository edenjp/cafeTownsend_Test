# NOTES:

In this automation 07 test scenarios were coveraded, using 25 steps to do it. The scenarios are:  
Login page  
 - [x] Login with valid user and password 

Create Page  
 - [x] Create new user with all fields  

Edit page  
 - [x] Edit user with all fields  
 - [x] Give up of editing and click back, should not edit the user  

Delete page  
 - [x] Delete from list with success  
 - [x] Cancel Delete from list and from edit page  

Logout  
 - [x] logout should direct to login page  

*Only the Happy path was coverade on this project.*  


The following tests were performed manually:  
 - [x] Login empty user and password  
 - [x] Login with wrong user and password  
 - [x] Create user without fill form  
 - [x] Edit user without fill form  
 - [x] Delete from edit page with success  
 - [x] Give up of create and click back, should not create a new user  

## Sugestions to improvement  
 - One of the things that I missed while I was creating this automation was the tags at the HTML, this made some validations very difficult to do.  
 - The list does not have an ordination.  
 - The final user feedbacks could be improved, the feedback and confirmation to delete are inside a alert and this usually is associated to undesired pop ups, this can make a user experience a bad thing.  
 - There is no feedback for the main actions.  
