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
      player_column_input = $stdin.gets.chomp.upcase.to_sym
      if @valid_keys.include?(player_column_input)
        indx = @board.columns[player_column_input].find_index(".")
        if indx.nil?
          p "That's not a valid option. Please make a valid selection."
        elsif indx.between?(0, 5)
          @board.columns[player_column_input][indx] = "x"
          break
        else
          p "That's not a valid option. Please make a valid selection."
        end
      else
        p "That's not a valid option. Please make a valid selection."
      end
    end
  end

  # gives random computer input, repeat until input is valid
  def computer_input
    computer_column_input = [:A, :B, :C, :D, :E, :F, :G].sample
    if @valid_keys.include?(computer_column_input)
      @board.place_piece(computer_column_input, "o")
    end # try again
  end
end
