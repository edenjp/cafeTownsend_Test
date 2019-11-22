Feature: Café Townsend Test  
	Delete Employee Tests 

@delete
Scenario: Deleting an employee with success
    
  Given the employee page and I select the first employee from the list 
  When I click on delete button
  Then an alert asking to confirm appears and I click to confirm
	Then the first employee from list will be Deleted


@delete
Scenario: Canceling delete of an employee
    
  Given the employee page and I select the first employee from the list 
  When I click on delete button
  Then an alert asking to confirm appears and I click to cancel
	Then the first employee from list will remain the same