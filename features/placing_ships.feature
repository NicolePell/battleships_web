Feature: Placing the ships
	In order to be ready to start playing
	As a player already registered
	I want to place all my ships on the board

	Scenario: Starting
		Given I am on the place_ship page
		Then I should see Ships
		When I fill in 'coordinate' with 'A3'
		And I choose 'horizontally'
		And I click 'place'
		Then I should see "Ship placed"