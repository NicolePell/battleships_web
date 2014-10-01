Feature: Starting the game
	In order to play battleships
	As a nostalgic player
	I want to start a new game

	Scenario: Registering part 1
		Given I am on the homepage
		When I follow "Start a new game"
		Then I should see "What's your name?"

	Scenario: Registering part 2	
		Given I am on the homepage
		When I follow "Start a new game"
		And I click on submit button
		Then I should be registered as "Player 1"

	Scenario: Registering no name	
		Given I am on the homepage
		When I follow "Start a new game"
		And I don't input my name
		And I click on submit button
		Then I should be registered as "Player 1"