# NOTES:

XX test scenarios was coveraded, using xx steps to do it. The scenarios are:
Login page
 - Login with valid user and password (main page should show "Hello username", list of users, buttons to create, edit and Delete)
 - Login with valid user and password without initial capital letter
 - Login empty user and password
 - Login with wrong user and password

Create Page(Fields: First name, Last name, Start date, Email)
 - Create new user with all fields(should appear in the list grid)
 - Create user without fill form
 - Create user without fill fields(randon, at least 4 tests)
 - Give up of create and click back, should not create a new user

Edit page
 - Edit user with all fields(should appear in the list grid)
 - Edit user without fill form
 - Edit user without fill fields(randon, at least 4 tests)
 - Give up of editing and click back, should not edit the user

Delete page
 - Delete from list with success(should remove user from list)
 - Delete from edit page with success(should remove user from list)
 - Delete from edit page after change data(should remove user from list)
 - Cancel Delete from list and from edit page

Logout
- logout should direct to login page

Only the Happy path was coverade on this project.

## Sugestions



