require "pry"
require "rspec"
require "./lib/game"
require "./lib/board"

board = Board.new
player = "Thelonious"
game = Game.new(board) # suggestion of how we can use this

# starts the game
game.start
