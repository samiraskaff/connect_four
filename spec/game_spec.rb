require "pry"
require "rspec"
require "./lib/board"
require "./lib/game"

RSpec.describe do Game
  it "exists" do
    board = Board.new
    player = "Thelonious"
    game = Game.new(board, player)

    expect(game).to be_an_instance_of(Game)
  end

  it "Game can start" do
    board = Board.new
    player = "Thelonious"
    game = Game.new(board, player)

    expect(game.start).to eq(nil)
  end
end
