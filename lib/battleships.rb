require 'sinatra/base'
require_relative 'game'
require_relative 'player'

class BattleShips < Sinatra::Base
	set :views, settings.root + '/../views/'
  set :public_folder, settings.root + '/../public/'
  enable :sessions

  GAME = Game.new


  get '/' do
    @player1 = GAME.player1.name unless GAME.player1.nil?
    @player2 = GAME.player2.name unless GAME.player2.nil?
    @name = session[:me]
    erb :index
  end

  get '/new_game' do
  	@name = session[:something]
  	erb :new_game
  end

  post'/new_player' do
    player = Player.new
    player.name =params[:player_name]
    session[:me] = params[:player_name]
    GAME.add_player(player)
    puts player.inspect
    puts GAME.inspect
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

 # To be declared:
 # BOARD1 = Board.new(Cell)
 # FLEET1 = [Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat]
 # Player1.board = BOARD1