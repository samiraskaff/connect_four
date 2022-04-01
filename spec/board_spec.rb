require "pry"
require "rspec"
require "./lib/board"

RSpec.describe Board do
  it "exists" do
    board = Board.new

    expect(board).to be_an_instance_of Board
  end

  it "prints a board" do
    board = Board.new

task :task_name => [:dependent, :tasks] do

end
    expect(board.display).to eq(6)
  end
end
