Feature: Placing a shot
	In order to sink my opponent's ships
	As a registered player
	I want to be able to shoot at a coordinate

	Scenario: Shooting at empty cell
		Given I am on the grid page
		When I choose an empty coordinate to shoot
		Then I should see miss
 
	Scenario: Shooting at ship
		Given I am on the grid page
		When I shoot at a coordinate with a ship on it
		Then I should see hit
