require "pry"
require "rspec"
require "./lib/board"

RSpec.describe Board do
  it "exists" do
    board = Board.new

    expect(board).to be_an_instance_of Board
  end

  xit "prints a board" do
    board = Board.new

    expect(board.display).to start_with("ABCDEFG")
  end
end
