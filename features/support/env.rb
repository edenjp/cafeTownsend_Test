require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'faker'
require 'capybara/poltergeist'

World(Capybara::DSL)

#settings to capybara's driver
Capybara.configure do |config|
	config.default_driver = :selenium_chrome
	config.default_max_wait_time = 30
end

Capybara.javascript_driver = :poltergeist

$profile = ENV['PROFILE']

$firstname =  "0" + (Faker::Name.first_name).to_s
$lastname =  "Test" + (Faker::Name.last_name).to_s

