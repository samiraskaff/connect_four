require "pry"
require "rspec"
require "./lib/board"

RSpec.describe Board do
  it "exists" do
    player = "Wes"
    board = Board.new(player)

    expect(board).to be_an_instance_of Board
  end

  xit "prints a board with welcome message" do
    board = Board.new
    expect(board.start).to output(
      "welcome message here
      ABCDEFG
      .......
      .......
      .......
      .......
      .......
      ......."
    )
  end
end
