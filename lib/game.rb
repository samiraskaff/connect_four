require "./lib/board"

class Game
  attr_reader :board

  # initializes new instance of Game
  def initialize(board)
    @board = board
  end

  # starts a game
  def start
    p "Welcome to CONNECT FOUR"
    @board.display
  end
end
