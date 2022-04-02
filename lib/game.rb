require "pry"
require "./lib/board"
require "./lib/turn"

class Game
  attr_reader :board, :player, :turn

  # initializes new instance of Game
  def initialize(board, player)
    @board = board
    @player = player
    @turn = turn
    # @turn_count = 0
    # @draw = draw?
  end

  # starts a game
  def start
    turn = Turn.new(@board)
    p "Welcome to CONNECT FOUR #{player}"
    @board.display
    21.times do
      turn.player_input
      @board.display
      turn.computer_input
      @board.display
    end
    # draw

    # if turn_count.even? == true
    #   turn.player_input
    # elsif turn_count.even? == true
    #   turn.computer_input
    # end
    # @turn_count += 1
    # @board.display
  end

  # updates turn counter and swaps between player and computer
