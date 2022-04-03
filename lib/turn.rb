require "pry"

class Turn
  attr_reader :board
  def initialize(board)
    @board = board
    @valid_keys = [:A, :B, :C, :D, :E, :F, :G]
  end

  # takes user input, retries on invalid input
  def player_input
    loop do
      p "Please select a column."
      player_column_input = $stdin.gets.chomp.upcase.to_sym
      if @valid_keys.include?(player_column_input)
        @board.place_piece(player_column_input)
        break
      else
        p "That's not a valid option. Please make a valid selection."
      end
    end
  end

  # gives random computer input, repeat until input is valid
  def computer_input
    p "Computer takes a turn."
    @board.computer_place_piece
    sleep(1)
  end
end
