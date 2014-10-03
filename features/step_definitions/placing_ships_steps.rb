Given(/^I am on the place_ship page$/) do
  visit ('/new_game/place_ship')
end

Then(/^I should see Ships$/) do
 expect(page).to have_content("Ships:")
end

When(/^I enter the following into the placement form:$/) do |table|
 fill_in('coordinate', with: "D5")
 fill_in('orientation', with: "horizontally")
end

# Then(/^I should see Ships$/) do
#  expect(page).to have_xpath("//img[@src= 'http://www.setexasrecord.com/content/img/f235738/ship-wheel.png']") 
# end
# Then(/^I click 'check'$/) do
#  click_button('check')
# end
