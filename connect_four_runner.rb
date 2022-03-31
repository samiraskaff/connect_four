require "pry"
require "rspec"
require "./lib/player"
require "./lib/board"

player = Player.new("Sage")

board = Board.new

board.display # test to run ruby file

# game = Game.new(player, board) # suggestion of how we can use this

# game.start # initializes and starts the game
