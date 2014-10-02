Given(/^I am on the place_ship page$/) do
  visit ('/new_game/place_ship')
end

Then ('I should see Place your patrol boat') do
  page.should have_content "Place your patrol boat"
end

When(/^I enter the following into the placement form:$/) do |table|
 fill_in('coordinate', with: "D5")
 fill_in('orientation', with: "horizontally")
end

Then(/^I click 'check'$/) do
 click_button('check')
end

Then(/^I will be shown an alert saying 'valid!'$/) do
  pending # express the regexp above with the code you wish you had
end