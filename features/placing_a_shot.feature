Feature: Placing a shot
	In order to sink my opponent's ships
	As a registered player
	I want to be able to shoot at a coordinate

	Scenario: Shooting
	Given I am on the grid page
	When I choose a coordinate to shoot
	Then I should see hit or miss
