require "capybara"

class HomePage < SitePrism::Page

	set_url "http://cafetownsend-angular-rails.herokuapp.com/employees"

	element :button_create, '#bAdd'
	element :button_edit, '#bEdit'
	element :button_delete, '#bDelete'
	element :employee_line, ".ng-scope li"

	def goToCreatePage
		button_create.click
	end

	def goToEditPage
		button_edit.click
	end
	
	def goToDeletePage
		button_delete.click
	end
end
