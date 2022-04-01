require "pry"
require "rspec"
require "./lib/board"
require "./lib/game"

RSpec.describe do Game
  it "exists" do
    board = Board.new
    game = Game.new(board)

    expect(game).to be_an_instance_of(Game)
  end

  it "Game can start" do
    board = Board.new
    game = Game.new(board)

    expect(game.start).to start_with("Welcome to CONNECT FOUR")
  end
end
