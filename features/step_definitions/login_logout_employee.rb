Given("the page to log in the system") do
  @login = LoginPage.new
  @login.load
end

When("I fill the username and password and click on login button") do
  @login.login_site("Luke", "Skywalker")
end

Then("I am redirected to employees list") do
  expect(page).to have_selector('#bEdit', visible: true)
  expect(page.evaluate_script("$('#greetings').text()")).to eql ("Hello Luke")
end

Given("the page main page with the list of employees") do
  expect(page.evaluate_script("$('#greetings').text()")).to eql ("Hello Luke")
end

When("I click on logout button") do
  page.execute_script("$('p.main-button').click()")
end

Then("I am redirected to login page") do
  expect(page).to have_selector('[type="password"]') 
  expect(page.evaluate_script("$('.info').text()")).to eql ("Username: \"Luke\" Password: \"Skywalker\"")
end

