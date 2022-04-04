require "pry"

class Turn
  attr_reader :board
  def initialize(board)
    @board = board
  end

  # takes user input
  def player_input
    p "Please select a column."
    $stdin.gets.chomp.upcase.to_sym
  end

  # tests user input
  def player_input_validation(player_choice)
    if @board.columns.key?(player_choice)
      indx = @board.columns[player_choice].find_index(".")
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

  # places player piece
  def player_place_piece(player_choice)
    indx = @board.columns[player_choice].find_index(".")
    @board.columns[player_choice][indx] = "x"
  end

  # gives random computer input, repeat until input is valid
  def computer_input
    p "Computer takes a turn."
    @board.computer_place_piece
    sleep(1)
  end
end
