# Registering part 1

Given(/^I am on the homepage$/) do
  visit ("/")
end

When(/^I follow "(.*?)"$/) do |link|
  click_link(link)
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

# Registering part 2

When(/^I click on submit button$/) do
	click_button 'Register'
end


Then(/^I should be registered as "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end


When(/^I don't input my name$/) do

end