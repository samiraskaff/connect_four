require "pry"
require "./lib/board"
require "./lib/game"

class Turn
  attr_reader :board, :turn_count
  def initialize(board)
    @board = board

    @valid_keys = [:A, :B, :C, :D, :E, :F, :G]
  end

# takes user input, retries on invalid input
  def player_input
    player_column_input = gets.chomp.upcase.to_sym
    if @valid_keys.include?(player_column_input)
      @board.place_piece(player_column_input, "x")
    end # try again

  end

# gives random computer input, repeat until input is valid
  def computer_input
    computer_column_input = [:A, :B, :C, :D, :E, :F, :G].sample
    if @valid_keys.include?(computer_column_input)
      @board.place_piece(computer_column_input, "o")
    end # try again
  end

  def place_piece(column_key, x_o)
    indx = @board[column_key].find_index(".")
    if indx == nil
      p "That's not a valid option"
      #code runs here to return to user input...maybe
    elsif indx.between?(0, 5)
      @board[column_key][indx] = x_o
    else
      raise "There was an error placing a piece"
    end
  end
# prints the board after a completed turn


end
