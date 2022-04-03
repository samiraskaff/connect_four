require "pry"
require "rspec"
require "./lib/board"
require "./lib/turn"
require "./lib/game"

board = Board.new
turn = Turn.new(board)
player = "Thelonious"
game = Game.new(turn, player)

# starts the game
game.start
