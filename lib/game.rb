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
        # turn.board.reset
        loop do
          if @round == 21
            turn.board.display
            p "The game is a draw, gg!"
            break
          else
            turn.board.display
            turn.player_input
            if turn.board.win? == true
              turn.board.display
              p "Congrats #{player}! You have won!"
              break
            end
            turn.board.display
            turn.computer_input
            if turn.board.win? == true
              turn.board.display
              p "You lost to the computer! ggez..."
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
