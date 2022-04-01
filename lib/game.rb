require "pry"
require "./lib/board"

class Game
  attr_reader :board, :player

  # initializes new instance of Game
  def initialize(board, player)
    @board = board
    @player = player
  end

  # starts a game
  def start
    p "Welcome to CONNECT FOUR #{player}"
    @board.display
  end
end
