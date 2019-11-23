Before('@create,@edit, @delete, @logout') do
  @login = LoginPage.new
  @home = HomePage.new
  @createAndEdit = Employee.new
  page.current_window.resize_to(1800,1000)
  @login.load
  @login.login_site("Luke", "Skywalker")
  sleep(2)
end

AfterStep { sleep(3) }

After do |scenario|
  scenarioName = scenario.name.tr(" ", "_").downcase!
  scenarioName = scenarioName.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
  
  screenshot = "report/screenshots/#{scenarioName}.png"
  page.save_screenshot(screenshot)
  embed(screenshot, 'image/png', 'Clique aqui para ver a evidencia!')
  
end
