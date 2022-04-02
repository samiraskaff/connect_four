require "pry"
require "rspec"
require "./lib/board"
require "./lib/game"

RSpec.describe Board do
  it "exists" do
    board = Board.new

    expect(board).to be_an_instance_of Board
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

  it "places a piece" do
    board = Board.new
    player = "Thelonious"
    game = Game.new(board, player)
    game.start
    board.place_piece(:A, "x")

    # after board.place_piece(:A, "x")
    # board.display should print a board to the console that looks like this:
    # ABCDEFG
    # .......
    # .......
    # .......
    # .......
    # .......
    # x......

    expect(board.display).to eq(nil)
  end
end
