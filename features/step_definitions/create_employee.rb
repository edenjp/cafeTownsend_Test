Given("the page to create employee") do
  @employees_number = page.evaluate_script("$('.ng-scope li').length")
  @home.goToCreatePage
end

When("I fill the form and the click on add button") do
  @createAndEdit.fill_form_to_employee_data($firstname, $lastname)
  @createAndEdit.click_add_button
end

Then("the I am redirected to users list and the new employee will be listed") do
  @employee_list = page.evaluate_script("$('#employee-list li').text()")
  @employees_final_number = page.evaluate_script("$('.ng-scope li').length")
  @employee = $firstname + " " + $lastname

  expect(page).to have_selector('#bEdit', visible: true)
  expect(@employees_number).to be < @employees_final_number
  expect(@employee_list.to_s).to include @employee
end
