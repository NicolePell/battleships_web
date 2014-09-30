Feature: Placing a shot
	In order to place a shot
	As a registered player
	I want to choose a coordinate

	Scenario: Choosing a coordinate
	Given I am asked for shot coordinate
	When I input a valid coordinate
	Then I see if I hit or miss
