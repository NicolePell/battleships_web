Given(/^Player 1 is registered$/) do
	visit '/'
	click_link("Start a new game")
	click_button 'Register'
end

Given(/^I register as Player 2$/) do
 
  click_button "Register"
end

When(/^I click on "(.*?)"$/) do |link|
  click_link(link)
end

Then(/^I should see the board$/) do
  expect(page).to have_content("board")
end