Feature: Placing the ships
	In order to be ready to start playing
	As a player already registered
	I want to place all my ships on the board

	Scenario: Starting
		Given I have 5 ships 
		When I click 'place ships'
		Then I can place the patrolboat  