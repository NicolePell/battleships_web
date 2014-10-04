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
  # use  Rack::Flash, :sweep =>true

  GAME = Game.new
  BOARD1 = Board.new(Cell)
  # BOARD2 = Board.new(Cell)
  FLEET1 = [ Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat ]
  FLEET2 = [Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat ]

  get '/' do
    puts GAME.player1.inspect
    puts GAME.player1.inspect
    @player1 = GAME.player1.name unless GAME.player1.nil?
    @player2 = GAME.player2.name unless GAME.player2.nil?
    erb :index
  end

  get '/new_game' do
       puts session.inspect
  	erb :new_game
  end

  post'/new_player' do
    player = Player.new
    player.name =params[:player_name]
    session[:me] = params[:player_name]
    player.board = Board.new(Cell)

    GAME.add_player(player)
    redirect '/'
  end

  get '/new_game/place_ship' do
    if session[:me] == GAME.player1.name
      @player = GAME.player1
    else
     @player = GAME.player2
    end
    erb :place_ship
  end

  post '/new_game/place_ship_hidden' do
    @ship = params[:ship]
    @coordinate = params[:coordinate]
    @orientation = params[:orientation]
  
    if session[:me] == GAME.player1.name
      @player = GAME.player1
    else
      @player = GAME.player2
    end

    case @ship
    when "battleship"
      @player.board.place(FLEET1[1], @coordinate.to_s.capitalize.to_sym, @orientation.to_sym)
    when "aircraft_carrier"
      @player.board.place(FLEET1[0], @coordinate.to_s.capitalize.to_sym, @orientation.to_sym)
    when "destroyer"
      @player.board.place(FLEET1[2], @coordinate.to_s.capitalize.to_sym, @orientation.to_sym)
    when "submarine"
      @player.board.place(FLEET1[3], @coordinate.to_s.capitalize.to_sym, @orientation.to_sym)
    else "patrol_boat"
      @player.board.place(FLEET1[4], @coordinate.to_s.capitalize.to_sym, @orientation.to_sym)
    end
    redirect '/new_game/place_ship'
  end

  get '/grid' do
    if session[:me] == GAME.player1.name
      @opponent = GAME.player2
      @player = GAME.player1
    else
     @opponent = GAME.player1
     @player = GAME.player2
    end
    erb :grid
  end

  post '/placing_shot' do
    if session[:me] == GAME.player1.name
      @opponent = GAME.player2
      @player = GAME.player1
    else
      @opponent = GAME.player1
      @player = GAME.player2
    end
    @coordinate = params[:coordinate]
    @opponent.board.shoot_at(@coordinate.to_s.capitalize.to_sym)
    redirect '/grid'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0


 

end