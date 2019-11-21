require "capybara"

class CreateAndEditEmployee < SitePrism::Page

  set_url "http://cafetownsend-angular-rails.herokuapp.com/employees/new"

	element :firstName_field, '[ng-model="selectedEmployee.firstName"]'
	element :lastName_field, '[ng-model="selectedEmployee.lastName"]'
  element :startDate_field, '[ng-model="selectedEmployee.startDate"]'
  element :email_field, '[type="email"]'
  element :button_add, '[type="submit"]', match: :first



		
  def fill_form_to_employee_data(firstname, lastname)
		firstName_field.set firstname
		lastName_field.set lastname
    startDate_field.set Faker::Date.birthday(max_age: 80)
    email_field.set (Faker::Name.first_name+"@cafetownsend.com")
  end
  
  def click_add_button
    button_add.click
  end

  def clear_employee_form
    firstName_field.native.clear 
		lastName_field.native.clear 
    startDate_field.native.clear
    email_field.native.clear 
  end

end