# Given(/^I am asked for shot coordinate$/) do
#   expect(page).to have_content('Where would you like to place your shot?')
# end

# When(/^I input a valid coordinate$/) do
#   fill_in 'coordinate', with: "(^[A-Za-z]\d{1}$|^[A-Za-z]10$)"
# end

# Then(/^I see if I hit or miss$/) do
#   expect(page).to have_content('hit' | 'miss')
# end

# Feature: Placing a shot
# 	In order to place a shot
# 	As a registered player
# 	I want to choose a coordinate

# 	Scenario: Choosing a coordinate
# 	Given I am asked for shot coordinate
# 	When I input a valid coordinate
# 	Then I see if I hit or miss