require "capybara"

class LoginPage < SitePrism::Page

	set_url 'http://cafetownsend-angular-rails.herokuapp.com/'

	element :username_field, '[type="text"]'
	element :password_field, '[type="password"]'
	element :login_button, '[type="submit"]'

	def login_site (username, password)
		username_field.set username
		password_field.set password
		login_button.click
	end
	
end
