Given("the employee page and I select the first employee from the list") do
	@employees_number = page.evaluate_script("$('#employee-list li').length")
  @first_employee_from_list = page.evaluate_script("$('#employee-list li').first().text()")
	
	@Select_first_employee = page.evaluate_script("$('#employee-list li').first().click()")
end

When("I click on delete button") do
  @home.goToDeletePage
end

Then("an alert asking to confirm appears and I click to confirm") do
  page.driver.browser.switch_to.alert.accept
end

Then("the first employee from list will be Deleted") do
  @employees_final_number = page.evaluate_script("$('#employee-list li').length")-@employees_number
	@employee_list = page.evaluate_script("$('.ng-scope').text()")
	@new_first_employee_from_list = page.evaluate_script("$('#employee-list li').first().text()")

  expect(@employees_number).to be > @employees_final_number.to_i
	expect(@first_employee_from_list.to_s).not_to eql @new_first_employee_from_list.to_s
end

Then("an alert asking to confirm appears and I click to cancel") do
  page.driver.browser.switch_to.alert.dismiss
end

Then("the first employee from list will remain the same") do
  @employees_final_number = page.evaluate_script("$('#employee-list li').length")
	@employee_list = page.evaluate_script("$('.ng-scope').text()")
	@new_first_employee_from_list = page.evaluate_script("$('#employee-list li').first().text()")

  expect(@employees_number).to be == @employees_final_number.to_i
	expect(@first_employee_from_list.to_s).to eql @new_first_employee_from_list.to_s
end
