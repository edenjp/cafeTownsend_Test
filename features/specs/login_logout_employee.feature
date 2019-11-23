Feature: Café Townsend Test 
	Login and logout Employee Tests

@login
Scenario: Login a employee with success

  Given the page to log in the system    
  When I fill the username and password and click on login button
  Then I am redirected to employees list 

@logout
Scenario: Logout a employee with success

  Given the page main page with the list of employees
  When I click on logout button
  Then I am redirected to login page

