require "pry"

class Game
  attr_reader :player, :turn

  # initializes new instance of Game
  def initialize(turn, player)
    @player = player
    @turn = turn
    @round = 0
  end

  # starts a game
  def start
    p "Welcome to CONNECT FOUR #{player}"
    loop do
      p "Enter p to play. Enter q to quit."
      game_start_input = gets.chomp.downcase
      if game_start_input == "p"
        turn.board.reset
        @round = 0
        loop do
          if @round == 21
            turn.board.display
            p "The game is a draw, gg!"
            break
          else
            loop do
              turn.board.display
              location = turn.player_input
              if turn.input_validation(location) == true
                turn.place_piece(location, "x")
                break
              end
            end
            if turn.board.win? == true
              turn.board.display
              p "Congrats #{player}! You have won!"
              break
            end
            turn.board.display
            p "Computer takes a turn."
            loop do
              location = turn.computer_input
              if turn.input_validation(location) == true
                turn.place_piece(location, "o")
                break
              end
            end
            if turn.board.win? == true
              turn.board.display
              p "Computer has won, gg!"
              break
            end
            @round += 1
          end
        end
      elsif game_start_input == "q"
        exit
      else
        p "Please make a valid selection."
        sleep(1)
      end
    end
  end
end
