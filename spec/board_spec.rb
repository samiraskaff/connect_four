require "pry"
require "rspec"
require "./lib/board"

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
end
