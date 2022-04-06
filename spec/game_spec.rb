require "pry"
require "rspec"
require "./lib/board"
require "./lib/turn"
require "./lib/game"

RSpec.describe Game do
  it "exists" do
    board = Board.new
    turn = Turn.new(board)
    player = "Thelonious"
    game = Game.new(turn, player)

    expect(game).to be_an_instance_of(Game)
  end

  it "has attributes" do
    board = Board.new
    turn = Turn.new(board)
    player = "Thelonious"
    game = Game.new(turn, player)
    expect(game.player).to eq("Thelonious")
    expect(game.turn).to eq(turn)
  end
end
