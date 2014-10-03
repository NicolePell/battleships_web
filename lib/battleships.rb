require 'sinatra/base'
require_relative 'game'
require_relative 'player'
require_relative 'cell'
require_relative 'board'
require_relative 'water'
require_relative 'ship'

class BattleShips < Sinatra::Base
	set :views, settings.root + '/../views/'
  set :public_folder, settings.root + '/../public/'
  enable :sessions

  GAME = Game.new
  BOARD1 = Board.new(Cell)
  BOARD2 = Board.new(Cell)
  FLEET1 = [ Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat ]

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

  post '/new_game/place_ship_hidden' do

    @ship = params[:ship]
    @coordinate = params[:coordinate]
    @orientation = params[:orientation]
    # @status = params[:status]

    case @ship
    when "battleship"
      BOARD1.place(FLEET1[1], @coordinate.to_s.capitalize.to_sym, @orientation.to_sym)
    when "aircraft_carrier"
      BOARD1.place(FLEET1[0], @coordinate.to_s.capitalize.to_sym, @orientation.to_sym)
    when "destroyer"
      BOARD1.place(FLEET1[2], @coordinate.to_s.capitalize.to_sym, @orientation.to_sym)
    when "submarine"
      BOARD1.place(FLEET1[3], @coordinate.to_s.capitalize.to_sym, @orientation.to_sym)
    else "patrol_boat"
      BOARD1.place(FLEET1[4], @coordinate.to_s.capitalize.to_sym, @orientation.to_sym)
    end
    puts BOARD1.inspect
    redirect '/new_game/place_ship'
    #then ...
    # BOARD.place(FLEET1[4], @coordinate, @orientation)
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end