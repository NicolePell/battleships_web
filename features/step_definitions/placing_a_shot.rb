Given(/^I am on the grid page$/) do
  visit ('/grid')
end

When(/^I choose a coordinate to shoot$/) do
	fill_in('coordinate', with: "A1")  
end

Then(/^I should see hit or miss$/) do
  expect(page).to have content("hit" || "miss")
end

