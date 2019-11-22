Feature: Café Townsend Test 
	Create new Employee Tests

@create
Scenario: Creating a new employee with success

  Given the page to create employee    
  When I fill the form and the click on add button
  Then the I am redirected to users list and the new employee will be listed
