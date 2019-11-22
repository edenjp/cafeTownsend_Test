Feature: Café Townsend Test  
	Edit Employee Tests 

@edit
Scenario: Editing an employee with success
    
  Given the page to edit the first employee from the list 
  When I update the form and click on add button
  Then the I am redirected to users list 
	And the first employee from list will be updated

@edit
Scenario: Canceling Edit for an employee
    
  Given the page to edit the first employee from the list 
  When I update the form and click on Back button
  Then the I am redirected to users list 
	And the first employee from list will remain the same