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
    turn.board.display
    21.times do
      turn.player_input
      turn.board.display
      turn.computer_input
      turn.board.display
    end

    # draw

    # if turn_count.even? == true
    #   turn.player_input
    # elsif turn_count.even? == true
    #   turn.computer_input
    # end
    # @turn_count += 1
    # @board.display
  end

  # updates turn counter and swaps between player and computer
end
