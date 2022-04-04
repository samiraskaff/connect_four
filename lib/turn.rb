require "pry"

class Turn
  attr_reader :board
  def initialize(board)
    @board = board
  end

  # takes user input, retries on invalid input
  def player_input
    @board.player_place_piece
    sleep(1)
  end

  # gives random computer input, repeat until input is valid
  def computer_input
    p "Computer takes a turn."
    @board.computer_place_piece
    sleep(1)
  end
end
