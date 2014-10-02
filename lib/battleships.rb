require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'cell'
require_relative 'board'
require_relative 'water'

class BattleShips < Sinatra::Base
	set :views, settings.root + '/../views/'
  set :public_folder, settings.root + '/../public/'
  enable :sessions

  GAME = Game.new
  BOARD1 = Board.new(Cell)
  BOARD2 = Board.new(Cell)

  get '/' do
    @player1 = GAME.player1.name unless GAME.player1.nil?
    @player2 = GAME.player2.name unless GAME.player2.nil?
    @name = session[:me]
    erb :index
  end

  get '/new_game' do
  	erb :new_game
  end

  post'/new_player' do
    player = Player.new
    player.name =params[:player_name]
    session[:me] = params[:player_name]
    GAME.add_player(player)
    redirect '/'
  end

  get '/grid' do
    erb :grid
  end

  get '/new_game/place_ship' do
    erb :place_ship

  end

  post '/new_game/place_ship' do
    @ship = params[:ship]
    @coordinate = params[:coordinate]
    @orientation = params[:orientation]
    @status = params[:status]
    redirect '/new_game/place_ship'
    #then ...
    # BOARD.place(FLEET1[4], @coordinate, @orientation)
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

 # To be declared:
 # FLEET1 = [Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat]
 # Player1.board = BOARD1