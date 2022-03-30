require "pry"
class Board
  attr_reader :column, :starting_index, :player, :board
  def initialize(player)
    @column = {
      A: [".", ".", ".", ".", ".", "."],
      B: [".", ".", ".", ".", ".", "."],
      C: [".", ".", ".", ".", ".", "."],
      D: [".", ".", ".", ".", ".", "."],
      E: [".", ".", ".", ".", ".", "."],
      F: [".", ".", ".", ".", ".", "."],
      G: [".", ".", ".", ".", ".", "."]
    }
    @player = player
  end

  def @board
    @starting_index = 0
    puts column.keys.join
    6.times do
      puts column[:A][starting_index] + column[:B][starting_index] + column[:C][starting_index] +
        column[:D][starting_index] + column[:E][starting_index] + column[:F][starting_index] +
        column[:G][starting_index]
      starting_index += 1
    end

  def start
    p "Welcome"
    p board
  end
end
