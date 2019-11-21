Given("the page to create employee") do
  @firstname =  "0" + (Faker::Name.first_name).to_s
  @lastname =  "Test" + (Faker::Name.last_name).to_s
  @employees_number = page.evaluate_script("$('.ng-scope li').length")
  @last_employee = page.evaluate_script("$('.ng-scope li').last().text()")

  @home.goToCreatePage
end

When("I fill the form and the click on add button") do
  @createAndEdit.fill_form_to_employee_data($firstname, $lastname)
  @createAndEdit.click_add_button
end

Then("the I am redirected to users list and the new employee will be listed") do
  @employees_final_number = page.evaluate_script("$('.ng-scope li').length")
  @new_last_employee = page.evaluate_script("$('.ng-scope li').last().text()")

  expect(page).to have_selector('#bEdit', visible: true)
  expect(@employees_number).to be < @employees_final_number
  expect(@last_employee.to_s).not_to eql @new_last_employee.to_s
end
