require "pry"

class Turn
  attr_reader :board
  def initialize(board)
    @board = board
  end

  # takes user input
  def player_input
    $stdin.gets.chomp.upcase.to_sym
  end

  # checks if column is full
  def input_validation(location)
    if @board.columns.key?(location)
      indx = @board.columns[location].find_index(".")
      if indx.nil?
        false
      elsif indx.between?(0, 5)
        true
      else
        false
      end
    else
      false
    end
  end

  # places piece
  def place_piece(location, x_o)
    indx = @board.columns[location].find_index(".")
    @board.columns[location][indx] = x_o
  end

  # gives random computer input
  def computer_input
    @board.columns.keys.sample
  end
end
