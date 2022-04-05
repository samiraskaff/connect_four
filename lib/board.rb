require "pry"

class Board
  attr_reader :columns

  # creates a columns
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

  # organizes board into an array of strings (rows)
  def row
    rows = []
    starting_index = 5
    6.times do
      rows << columns[:A][starting_index] + columns[:B][starting_index] + columns[:C][starting_index] +
        columns[:D][starting_index] + columns[:E][starting_index] + columns[:F][starting_index] +
        columns[:G][starting_index]
      starting_index -= 1
    end
    rows
  end

  # displays the board
  def display
    puts columns.keys.join
    puts row
  end

  # checks for a win
  def win?
    diagonal_wins = [
      [columns[:A][2], columns[:B][3], columns[:C][4], columns[:D][5]],
      [columns[:A][1], columns[:B][2], columns[:C][3], columns[:D][4], columns[:E][5]],
      [columns[:A][0], columns[:B][1], columns[:C][2], columns[:D][3], columns[:E][4], columns[:F][5]],
      [columns[:B][0], columns[:C][1], columns[:D][2], columns[:E][3], columns[:F][4], columns[:G][5]],
      [columns[:C][0], columns[:D][1], columns[:E][2], columns[:F][3], columns[:G][4]],
      [columns[:D][0], columns[:E][1], columns[:F][2], columns[:G][3]],
      [columns[:A][3], columns[:B][2], columns[:C][1], columns[:D][0]],
      [columns[:A][4], columns[:B][3], columns[:C][2], columns[:D][1], columns[:E][0]],
      [columns[:A][5], columns[:B][4], columns[:C][3], columns[:D][2], columns[:E][1], columns[:F][0]],
      [columns[:B][5], columns[:C][4], columns[:D][3], columns[:E][2], columns[:F][1], columns[:G][0]],
      [columns[:C][5], columns[:D][4], columns[:E][3], columns[:F][2], columns[:G][1]],
      [columns[:D][5], columns[:E][4], columns[:F][3], columns[:G][2]]
    ]

    if row.find { |e| e.include?("xxxx") || e.include?("oooo") }
      true # for horizontal win
    elsif columns.values.find { |arr| arr.join.include?("xxxx") || arr.join.include?("oooo") }
      true # for vertical win
    elsif diagonal_wins.find { |arr| arr.join.include?("xxxx") || arr.join.include?("oooo") }
      true # for diagonal win
    else
      false
    end
  end

  # resets columns to original array
  def reset
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
end
