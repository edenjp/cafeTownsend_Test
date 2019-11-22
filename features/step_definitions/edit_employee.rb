Given("the page to edit the first employee from the list") do
	@employees_number = page.evaluate_script("$('#employee-list li').length")
	@first_employee_from_list = page.evaluate_script("$('#employee-list li').first().text()")
	
	@Select_first_employee = page.evaluate_script("$('#employee-list li').first().click()")
	@home.goToEditPage
	expect(page).to have_selector('#bEdit', visible: false)
end

When("I update the form and click on add button") do
	@createAndEdit.clear_employee_form
  @createAndEdit.fill_form_to_employee_data($firstname, $lastname)
	@createAndEdit.click_add_button
	@home.goToEditPage
	@createAndEdit.click_add_button
end

Then("the I am redirected to users list") do
	expect(page).to have_selector('#bEdit', visible: true)
end

Then("the first employee from list will be updated") do
	@employees_final_number = page.evaluate_script("$('#employee-list li').length")
	@employee_list = page.evaluate_script("$('#employee-list li').text()")
	@new_first_employee_from_list = page.evaluate_script("$('#employee-list li').first().text()")
	@updated_first_employee = $firstname + " " + $lastname
	
  expect(@employees_number).to be == @employees_final_number
	expect(@first_employee_from_list.to_s).not_to eql @new_first_employee_from_list.to_s
	expect(@employee_list.to_s).to include  @updated_first_employee
end

When("I update the form and click on Back button") do
	@createAndEdit.clear_employee_form
  @createAndEdit.fill_form_to_employee_data("Altered", "Altered")
	@createAndEdit.click_back_button
end
