Given(/^I am on the place_ship page$/) do
  visit ('/new_game/place_ship')
end

Then(/^I should see Ships$/) do
 expect(page).to have_content("Ships:")
end

When(/^I enter the following into the placement form:$/) do |table|
 fill_in 'coordinate', :with => "A3"
end

Then(/^I click 'place'$/) do
  click_button('place')
end

# When(/^I enter the following into the placement form:$/) do |table|
#  fill_in('coordinate', with: 'A3')
#  fill_in('orientation', with: "horizontally")
# end

# Then(/^I click 'place'$/) do
#  click_button('place')
# end
