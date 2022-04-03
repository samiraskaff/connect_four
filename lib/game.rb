require "pry"

class Game
  attr_reader :player, :turn

  # initializes new instance of Game
  def initialize(turn, player)
    @player = player
    @turn = turn
  end

  # starts a game
  def start
    p "Welcome to CONNECT FOUR #{player}"
    loop do
      p "Enter p to play. Enter q to quit."
      game_start_input = gets.chomp.downcase
      if game_start_input == "p"
        21.times do
          turn.board.display
          turn.player_input
          turn.board.display
          turn.computer_input
        end
        turn.board.display
        p "The game is a draw, gg!"
      elsif game_start_input == "q"
        exit
      else
        p "Please make a valid selection."
        sleep(1)
      end
    end
  end
    # draw

    # if turn_count.even? == true
    #   turn.player_input
    # elsif turn_count.even? == true
    #   turn.computer_input
    # end
    # @turn_count += 1
    # @board.display


  # updates turn counter and swaps between player and computer
end
