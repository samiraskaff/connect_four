require "pry"
require "rspec"
require "./lib/board"

RSpec.describe Board do
  it "exists" do
    board = Board.new

    expect(board).to be_an_instance_of(Board)
  end

  it "creates a board hash upon initializing" do
    board = Board.new

    expect(board.columns).to eq(
      {
        A: [".", ".", ".", ".", ".", "."],
        B: [".", ".", ".", ".", ".", "."],
        C: [".", ".", ".", ".", ".", "."],
        D: [".", ".", ".", ".", ".", "."],
        E: [".", ".", ".", ".", ".", "."],
        F: [".", ".", ".", ".", ".", "."],
        G: [".", ".", ".", ".", ".", "."]
      }
    )
  end

  it "stores rows in an array for printing" do
    board = Board.new

    expect(board.row).to eq([
      ".......",
      ".......",
      ".......",
      ".......",
      ".......",
      "......."
    ])
  end

  it "prints a board" do
    board = Board.new

    # board.display should print a board to the console that looks like this:
    # ABCDEFG
    # .......
    # .......
    # .......
    # .......
    # .......
    # .......

    expect(board.display).to eq(nil)
  end

  it "detects a win" do
    board = Board.new

    expect(board.win?).to eq(false)

    board.columns[:A][0] = "x"
    board.columns[:B][1] = "x"
    board.columns[:C][2] = "x"
    board.columns[:D][3] = "x"
    expect(board.win?).to eq(true)

    board.columns[:A][0] = "o"
    board.columns[:B][1] = "o"
    board.columns[:C][2] = "o"
    board.columns[:D][3] = "o"
    expect(board.win?).to eq(true)

    # horizontal
    board.reset
    board.columns[:A][0] = "x"
    board.columns[:B][0] = "x"
    board.columns[:C][0] = "x"
    board.columns[:D][0] = "x"
    expect(board.win?).to eq(true)

    # vertical
    board.reset
    board.columns[:A][2] = "x"
    board.columns[:A][3] = "x"
    board.columns[:A][4] = "x"
    board.columns[:A][5] = "x"
    expect(board.win?).to eq(true)
  end

  it "resets the board" do
    board = Board.new
    board.columns[:A][0] = "x"
    board.columns[:B][1] = "x"
    board.columns[:C][2] = "x"
    board.columns[:D][3] = "x"
    board.reset

    expect(board.win?).to eq(false)
    expect(board.row).to eq([
      ".......",
      ".......",
      ".......",
      ".......",
      ".......",
      "......."
    ])
  end
end
