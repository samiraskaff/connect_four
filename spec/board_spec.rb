require "pry"
require "rspec"
require "./lib/board"

RSpec.describe Board do
  it "exists" do
    board = Board.new

    expect(board).to be_an_instance_of Board
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
    board.reassign_board({
      A: ["x", ".", ".", ".", ".", "."],
      B: [".", "x", ".", ".", ".", "."],
      C: [".", ".", "x", ".", ".", "."],
      D: [".", ".", ".", "x", ".", "."],
      E: [".", ".", ".", ".", ".", "."],
      F: [".", ".", ".", ".", ".", "."],
      G: [".", ".", ".", ".", ".", "."]
    })
    expect(board.win?).to eq(true)

    board.reassign_board({
        A: ["o", ".", ".", ".", ".", "."],
        B: [".", "o", ".", ".", ".", "."],
        C: [".", ".", "o", ".", ".", "."],
        D: [".", ".", ".", "o", ".", "."],
        E: [".", ".", ".", ".", ".", "."],
        F: [".", ".", ".", ".", ".", "."],
        G: [".", ".", ".", ".", ".", "."]
      })
      expect(board.win?).to eq(true)
  end

  it "resets the board" do
    board = Board.new
    board.reassign_board({
        A: ["o", ".", ".", ".", ".", "."],
        B: [".", "o", ".", ".", ".", "."],
        C: [".", ".", "o", ".", ".", "."],
        D: [".", ".", ".", "o", ".", "."],
        E: [".", ".", ".", ".", ".", "."],
        F: [".", ".", ".", ".", ".", "."],
        G: [".", ".", ".", ".", ".", "."]
      })
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
