Given(/^I am on the grid page$/) do
  visit ('/grid')
end

When(/^I choose an empty coordinate to shoot$/) do
	fill_in('coordinate', with: "A1") 
	click_button "SHOOT"
end

Then(/^I should see miss$/) do
	save_and_open_page
  expect(page).to have_content("MISS")
end

When(/^I shoot at a coordinate with a ship on it$/) do
  visit ('/new_game/place_ship')
  fill_in 'coordinate', :with => "B1"
  click_button('place')
  visit ('/grid')
  fill_in('coordinate', with: "B1") 
	click_button "SHOOT"
end

Then(/^I should see hit$/) do
  expect(page).to have_content("HIT")
end