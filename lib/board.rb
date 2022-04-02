require "pry"
class Board
  attr_reader :columns, :board

  # creates a board
  def initialize
    @columns =
    {
      A: [".", ".", ".", ".", ".", "."],
      B: [".", ".", ".", ".", ".", "."],
      C: [".", ".", ".", ".", ".", "."],
      D: [".", ".", ".", ".", ".", "."],
      E: [".", ".", ".", ".", ".", "."],
      F: [".", ".", ".", ".", ".", "."],
      G: [".", ".", ".", ".", ".", "."]
    }
  end

  # displays a board

  def display

    puts columns.keys.join
    starting_index = 5
    6.times do
      puts columns[:A][starting_index] + columns[:B][starting_index] + columns[:C][starting_index] +
        columns[:D][starting_index] + columns[:E][starting_index] + columns[:F][starting_index] +
        columns[:G][starting_index]
      starting_index -= 1
    end
    return
  end

  def place_piece(column_key, x_o)
    indx = columns[column_key].find_index(".")
    if indx == nil
      p "That's not a valid option"
      #code runs here to return to user input...maybe
    elsif indx.between?(0, 5)
      columns[column_key][indx] = x_o
    else
      raise "There was an error placing a piece"
    end
  end
end
