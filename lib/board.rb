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

  # def player_place_piece
  #   loop do
  #     p "Please select a columns."
  #     player_column_input = $stdin.gets.chomp.upcase.to_sym
  #     if columns.key?(player_column_input)
  #       indx = columns[player_column_input].find_index(".")
  #       if indx.nil?
  #         p "That's not a valid option. Please make a valid selection."
  #       elsif indx.between?(0, 5)
  #         columns[player_column_input][indx] = "x"
  #         break
  #       else
  #         p "That's not a valid option. Please make a valid selection."
  #       end
  #     else
  #       p "That's not a valid option. Please make a valid selection."
  #     end
  #   end
  # end

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
    win_array = [
      diagonal_win_1 = [columns[:A][0], columns[:B][1], columns[:C][2], columns[:D][3]],
      diagonal_win_2 = [columns[:B][0], columns[:C][1], columns[:D][3], columns[:E][3]],
      diagonal_win_3 = [columns[:C][0], columns[:D][1], columns[:E][2], columns[:F][3]],
      diagonal_win_4 = [columns[:D][0], columns[:E][1], columns[:F][2], columns[:G][3]],
      diagonal_win_5 = [columns[:A][1], columns[:B][2], columns[:C][3], columns[:D][4]],
      diagonal_win_6 = [columns[:B][1], columns[:C][2], columns[:D][3], columns[:E][4]],
      diagonal_win_7 = [columns[:C][1], columns[:D][2], columns[:E][3], columns[:F][4]],
      diagonal_win_8 = [columns[:D][1], columns[:E][2], columns[:F][3], columns[:G][4]],
      diagonal_win_9 = [columns[:A][2], columns[:B][3], columns[:C][4], columns[:D][5]],
      diagonal_win_10 = [columns[:B][2], columns[:C][3], columns[:D][4], columns[:E][5]],
      diagonal_win_11 = [columns[:C][2], columns[:D][3], columns[:E][4], columns[:F][5]],
      diagonal_win_12 = [columns[:D][2], columns[:E][3], columns[:F][4], columns[:G][5]],
      diagonal_win_13 = [columns[:D][0], columns[:C][1], columns[:B][2], columns[:A][3]],
      diagonal_win_14 = [columns[:E][0], columns[:D][1], columns[:C][2], columns[:B][3]],
      diagonal_win_15 = [columns[:F][0], columns[:E][1], columns[:D][2], columns[:C][3]],
      diagonal_win_16 = [columns[:G][0], columns[:F][1], columns[:E][2], columns[:D][3]],
      diagonal_win_17 = [columns[:D][1], columns[:C][2], columns[:B][3], columns[:A][4]],
      diagonal_win_18 = [columns[:E][1], columns[:D][2], columns[:C][3], columns[:B][4]],
      diagonal_win_19 = [columns[:F][1], columns[:E][2], columns[:D][3], columns[:C][4]],
      diagonal_win_20 = [columns[:G][1], columns[:F][2], columns[:E][3], columns[:D][4]],
      diagonal_win_21 = [columns[:D][2], columns[:C][3], columns[:B][4], columns[:A][5]],
      diagonal_win_22 = [columns[:E][2], columns[:D][3], columns[:C][4], columns[:B][5]],
      diagonal_win_23 = [columns[:F][2], columns[:E][3], columns[:D][4], columns[:C][5]],
      diagonal_win_24 = [columns[:G][2], columns[:F][3], columns[:E][4], columns[:D][5]],
      vertical_win_1 = [columns[:A][2], columns[:A][3], columns[:A][4], columns[:A][5]],
      vertical_win_2 = [columns[:A][1], columns[:A][2], columns[:A][3], columns[:A][4]],
      vertical_win_3 = [columns[:A][0], columns[:A][1], columns[:A][2], columns[:A][3]],
      vertical_win_4 = [columns[:B][2], columns[:B][3], columns[:B][4], columns[:B][5]],
      vertical_win_5 = [columns[:B][1], columns[:B][2], columns[:B][3], columns[:B][4]],
      vertical_win_6 = [columns[:B][0], columns[:B][1], columns[:B][2], columns[:B][3]],
      vertical_win_7 = [columns[:C][2], columns[:C][3], columns[:C][4], columns[:C][5]],
      vertical_win_8 = [columns[:C][1], columns[:C][2], columns[:C][3], columns[:C][4]],
      vertical_win_9 = [columns[:C][0], columns[:C][1], columns[:C][2], columns[:C][3]],
      vertical_win_10 = [columns[:D][2], columns[:D][3], columns[:D][4], columns[:D][5]],
      vertical_win_11 = [columns[:D][1], columns[:D][2], columns[:D][3], columns[:D][4]],
      vertical_win_12 = [columns[:D][0], columns[:D][1], columns[:D][2], columns[:D][3]],
      vertical_win_13 = [columns[:E][2], columns[:E][3], columns[:E][4], columns[:E][5]],
      vertical_win_14 = [columns[:E][1], columns[:E][2], columns[:E][3], columns[:E][4]],
      vertical_win_15 = [columns[:E][0], columns[:E][1], columns[:E][2], columns[:E][3]],
      vertical_win_16 = [columns[:F][2], columns[:F][3], columns[:F][4], columns[:F][5]],
      vertical_win_17 = [columns[:F][1], columns[:F][2], columns[:F][3], columns[:F][4]],
      vertical_win_18 = [columns[:F][0], columns[:F][1], columns[:F][2], columns[:F][3]],
      vertical_win_19 = [columns[:G][2], columns[:G][3], columns[:G][4], columns[:G][5]],
      vertical_win_20 = [columns[:G][1], columns[:G][2], columns[:G][3], columns[:G][4]],
      vertical_win_21 = [columns[:G][0], columns[:G][1], columns[:G][2], columns[:G][3]],
      horizontal_win_1 = [columns[:A][0], columns[:B][0], columns[:C][0], columns[:D][0]],
      horizontal_win_2 = [columns[:A][1], columns[:B][1], columns[:C][1], columns[:D][1]],
      horizontal_win_3 = [columns[:A][2], columns[:B][2], columns[:C][2], columns[:D][2]],
      horizontal_win_4 = [columns[:A][3], columns[:B][3], columns[:C][3], columns[:D][3]],
      horizontal_win_5 = [columns[:A][4], columns[:B][4], columns[:C][4], columns[:D][4]],
      horizontal_win_6 = [columns[:A][5], columns[:B][5], columns[:C][5], columns[:D][5]],
      horizontal_win_7 = [columns[:B][0], columns[:C][0], columns[:D][0], columns[:E][0]],
      horizontal_win_8 = [columns[:B][1], columns[:C][1], columns[:D][1], columns[:E][1]],
      horizontal_win_9 = [columns[:B][2], columns[:C][2], columns[:D][2], columns[:E][2]],
      horizontal_win_10 = [columns[:B][3], columns[:C][3], columns[:D][3], columns[:E][3]],
      horizontal_win_11 = [columns[:B][4], columns[:C][4], columns[:D][4], columns[:E][4]],
      horizontal_win_12 = [columns[:C][5], columns[:C][5], columns[:D][5], columns[:E][5]],
      horizontal_win_13 = [columns[:C][0], columns[:D][0], columns[:E][0], columns[:F][0]],
      horizontal_win_14 = [columns[:C][1], columns[:D][1], columns[:E][1], columns[:F][1]],
      horizontal_win_15 = [columns[:C][2], columns[:D][2], columns[:E][2], columns[:F][2]],
      horizontal_win_16 = [columns[:C][3], columns[:D][3], columns[:E][3], columns[:F][3]],
      horizontal_win_17 = [columns[:C][4], columns[:D][4], columns[:E][4], columns[:F][4]],
      horizontal_win_18 = [columns[:C][5], columns[:D][5], columns[:E][5], columns[:F][5]],
      horizontal_win_19 = [columns[:D][0], columns[:E][0], columns[:F][0], columns[:G][0]],
      horizontal_win_20 = [columns[:D][1], columns[:E][1], columns[:F][1], columns[:G][1]],
      horizontal_win_21 = [columns[:D][2], columns[:E][2], columns[:F][2], columns[:G][2]],
      horizontal_win_22 = [columns[:D][3], columns[:E][3], columns[:F][3], columns[:G][3]],
      horizontal_win_23 = [columns[:D][4], columns[:E][4], columns[:F][4], columns[:G][4]],
      horizontal_win_24 = [columns[:D][5], columns[:E][5], columns[:G][5], columns[:G][5]]
    ]

    win_cond_1 = ["x", "x", "x", "x"]
    win_cond_2 = ["o", "o", "o", "o"]
    win_array.include?(win_cond_1) || win_array.include?(win_cond_2)
  end

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
