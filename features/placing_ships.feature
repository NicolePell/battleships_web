Feature: Placing the ships
	In order to be ready to start playing
	As a player already registered
	I want to place all my ships on the board

	Scenario: Starting
		Given I am on the place_ship page
		Then I should see Ships
		When I enter the following into the placement form:
				| coordinate | A3 |
				| orientation | horizontally |
		Then I click 'place'