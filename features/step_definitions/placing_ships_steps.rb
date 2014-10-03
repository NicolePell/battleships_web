Given(/^I am on the place_ship page$/) do
  visit ('/new_game/place_ship')
end

Then(/^I should see Ships$/) do
 expect(page).to have_content("Ships:")
end

When(/^I fill in 'coordinate' with 'A(\d+)'$/) do |value|
  fill_in 'coordinate', with: value  
end

When(/^I choose 'horizontally'$/) do
	("choose radio_horizontally")
end


Then(/^I click 'place'$/) do
	click_button('place')
end
