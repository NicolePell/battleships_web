Feature: Allowing another player to join the game
	In order to play battleships with a friend
	As a player myself
	I want to allow another player to play with me

	Scenario: Registering player 2	
		Given Player 1 is registered
		And I click on "Register Player 2"
		And I register as Player 2
		Then I should be registered as "Player 2"
		And I should see "ready to fire"
		And I should see the board
