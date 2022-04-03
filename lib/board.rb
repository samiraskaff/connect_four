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

  # organizes board into rows
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

  def place_piece(column_input)
    indx = columns[column_input].find_index(".")
    if indx.nil?
      p "That's not a valid option. Please make a valid selection."
    elsif indx.between?(0, 5)
      columns[column_input][indx] = "x"
    else
      p "That's not a valid option. Please make a valid selection."
    end
  end

  def computer_place_piece
    loop do
      computer_column_input = columns.keys.sample
      indx = columns[computer_column_input].find_index(".")
      if !indx.nil?
        columns[computer_column_input][indx] = "o"
        break
      end
    end
  end

  def win?
    diagonal_win_1 = [column[:A][0], column[:B][1], column[:C][2], column[:D][3]]
    diagonal_win_2 = [column[:B][0], column[:C][1], column[:D][3], column[:E][3]]
    diagonal_win_3 = [column[:C][0], column[:D][1], column[:E][2], column[:F][3]]
    diagonal_win_4 = [column[:D][0], column[:E][1], column[:F][2], column[:G][3]]
    diagonal_win_5 = [column[:A][1], column[:B][2], column[:C][3], column[:D][4]]
    diagonal_win_6 = [column[:B][1], column[:C][2], column[:D][3], column[:E][4]]
    diagonal_win_7 = [column[:C][1], column[:D][2], column[:E][3], column[:F][4]]
    diagonal_win_8 = [column[:D][1], column[:E][2], column[:F][3], column[:G][4]]
    diagonal_win_9 = [column[:A][2], column[:B][3], column[:C][4], column[:D][5]]
    diagonal_win_10 = [column[:B][2], column[:C][3], column[:D][4], column[:E][5]]
    diagonal_win_11 = [column[:C][2], column[:D][3], column[:E][4], column[:F][5]]
    diagonal_win_12 = [column[:D][2], column[:E][3], column[:F][4], column[:G][5]]
    diagonal_win_13 = [column[:D][0], column[:C][1], column[:B][2], column[:A][3]]
    diagonal_win_14 = [column[:E][0], column[:D][1], column[:C][2], column[:B][3]]
    diagonal_win_15 = [column[:F][0], column[:E][1], column[:D][2], column[:C][3]]
    diagonal_win_16 = [column[:G][0], column[:F][1], column[:E][2], column[:D][3]]
    diagonal_win_17 = [column[:D][1], column[:C][2], column[:B][3], column[:A][4]]
    diagonal_win_18 = [column[:E][1], column[:D][2], column[:C][3], column[:B][4]]
    diagonal_win_19 = [column[:F][1], column[:E][2], column[:D][3], column[:C][4]]
    diagonal_win_20 = [column[:G][1], column[:F][2], column[:E][3], column[:D][4]]
    diagonal_win_21 = [column[:D][2], column[:C][3], column[:B][4], column[:A][5]]
    diagonal_win_22 = [column[:E][2], column[:D][3], column[:C][4], column[:B][5]]
    diagonal_win_23 = [column[:F][2], column[:E][3], column[:D][4], column[:C][5]]
    diagonal_win_24 = [column[:G][2], column[:F][3], column[:E][4], column[:D][5]]
    vertical_win_1 = [column[:A][2], column[:A][3], column[:A][4], column[:A][5]]
    vertical_win_2 = [column[:A][1], column[:A][2], column[:A][3], column[:A][4]]
    vertical_win_3 = [column[:A][0], column[:A][1], column[:A][2], column[:A][3]]
    vertical_win_4 = [column[:B][2], column[:B][3], column[:B][4], column[:B][5]]
    vertical_win_5 = [column[:B][1], column[:B][2], column[:B][3], column[:B][4]]
    vertical_win_6 = [column[:B][0], column[:B][1], column[:B][2], column[:B][3]]
    vertical_win_7 = [column[:C][2], column[:C][3], column[:C][4], column[:C][5]]
    vertical_win_8 = [column[:C][1], column[:C][2], column[:C][3], column[:C][4]]
    vertical_win_9 = [column[:C][0], column[:C][1], column[:C][2], column[:C][3]]
    vertical_win_10 = [column[:D][2], column[:D][3], column[:D][4], column[:D][5]]
    vertical_win_11 = [column[:D][1], column[:D][2], column[:D][3], column[:D][4]]
    vertical_win_12 = [column[:D][0], column[:D][1], column[:D][2], column[:D][3]]
    vertical_win_13 = [column[:E][2], column[:E][3], column[:E][4], column[:E][5]]
    vertical_win_14 = [column[:E][1], column[:E][2], column[:E][3], column[:E][4]]
    vertical_win_15 = [column[:E][0], column[:E][1], column[:E][2], column[:E][3]]
    vertical_win_16 = [column[:F][2], column[:F][3], column[:F][4], column[:F][5]]
    vertical_win_17 = [column[:F][1], column[:F][2], column[:F][3], column[:F][4]]
    vertical_win_18 = [column[:F][0], column[:F][1], column[:F][2], column[:F][3]]
    vertical_win_19 = [column[:G][2], column[:G][3], column[:G][4], column[:G][5]]
    vertical_win_20 = [column[:G][1], column[:G][2], column[:G][3], column[:G][4]]
    vertical_win_21 = [column[:G][0], column[:G][1], column[:G][2], column[:G][3]]
    horizontal_win_1 = [column[:A][0], column[:B][0], column[:C][0], column[:D][0]]
    horizontal_win_2 = [column[:A][1], column[:B][1], column[:C][1], column[:D][1]]
    horizontal_win_3 = [column[:A][2], column[:B][2], column[:C][2], column[:D][2]]
    horizontal_win_4 = [column[:A][3], column[:B][3], column[:C][3], column[:D][3]]
    horizontal_win_5 = [column[:A][4], column[:B][4], column[:C][4], column[:D][4]]
    horizontal_win_6 = [column[:A][5], column[:B][5], column[:C][5], column[:D][5]]
    horizontal_win_7 = [column[:B][0], column[:C][0], column[:D][0], column[:E][0]]
    horizontal_win_8 = [column[:B][1], column[:C][1], column[:D][1], column[:E][1]]
    horizontal_win_9 = [column[:B][2], column[:C][2], column[:D][2], column[:E][2]]
    horizontal_win_10 = [column[:B][3], column[:C][3], column[:D][3], column[:E][3]]
    horizontal_win_11 = [column[:B][4], column[:C][4], column[:D][4], column[:E][4]]
    horizontal_win_12 = [column[:C][5], column[:C][5], column[:D][5], column[:E][5]]
    horizontal_win_13 = [column[:C][0], column[:D][0], column[:E][0], column[:F][0]]
    horizontal_win_14 = [column[:C][1], column[:D][1], column[:E][1], column[:F][1]]
    horizontal_win_15 = [column[:C][2], column[:D][2], column[:E][2], column[:F][2]]
    horizontal_win_16 = [column[:C][3], column[:D][3], column[:E][3], column[:F][3]]
    horizontal_win_17 = [column[:C][4], column[:D][4], column[:E][4], column[:F][4]]
    horizontal_win_18 = [column[:C][5], column[:D][5], column[:E][5], column[:F][5]]
    horizontal_win_19 = [column[:D][0], column[:E][0], column[:F][0], column[:G][0]]
    horizontal_win_20 = [column[:D][1], column[:E][1], column[:F][1], column[:G][1]]
    horizontal_win_21 = [column[:D][2], column[:E][2], column[:F][2], column[:G][2]]
    horizontal_win_22 = [column[:D][3], column[:E][3], column[:F][3], column[:G][3]]
    horizontal_win_23 = [column[:D][4], column[:E][4], column[:F][4], column[:G][4]]
    horizontal_win_24 = [column[:D][5], column[:E][5], column[:G][5], column[:G][5]]
  end
end
