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

  it "has attributes" do
    board = Board.new
    turn = Turn.new(board)
    expect(turn.board).to eq(board)
  end

  it "checks if column is full" do
    board = Board.new
    turn = Turn.new(board)

    expect(turn.input_validation(:A)).to eq(true)
    expect(turn.input_validation(:X)).to eq(false)
    board.columns[:A][0] = "x"
    board.columns[:A][1] = "x"
    board.columns[:A][2] = "x"
    board.columns[:A][3] = "x"
    board.columns[:A][4] = "x"
    board.columns[:A][5] = "x"
    expect(turn.input_validation(:A)).to eq(false)
  end

  it "places piece" do
    board = Board.new
    turn = Turn.new(board)

    turn.place_piece(:A, "x")
    expect(board.columns[:A][0]).to eq("x")
    board.reset
    turn.place_piece(:A, "o")
    expect(board.columns[:A][0]).to eq("o")
  end
end
