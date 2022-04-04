require "pry"
require "rspec"
require "./lib/board"
require "./lib/turn"

RSpec.describe Turn do
  it "exists" do
    board = Board.new
    turn = Turn.new(board)

    expect(turn).to be_an_instance_of(Turn)
  end
end
