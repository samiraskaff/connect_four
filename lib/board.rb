require "pry"
class Board
  attr_reader :columns, :board
  def initialize
    @columns = {
      A: [".", ".", ".", ".", ".", "."],
      B: [".", ".", ".", ".", ".", "."],
      C: [".", ".", ".", ".", ".", "."],
      D: [".", ".", ".", ".", ".", "."],
      E: [".", ".", ".", ".", ".", "."],
      F: [".", ".", ".", ".", ".", "."],
      G: [".", ".", ".", ".", ".", "."]
    }
  end

  def display
    puts columns.keys.join
    6.times do
      starting_index = 0
      puts columns[:A][starting_index] + columns[:B][starting_index] + columns[:C][starting_index] +
        columns[:D][starting_index] + columns[:E][starting_index] + columns[:F][starting_index] +
        columns[:G][starting_index]
      starting_index + 1
    end

    # def start # I think this should be in the game file
    #   p "Welcome"
    #   p display
    # end
  end
end
