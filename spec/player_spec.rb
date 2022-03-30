require "pry"
require "rspec"
require "./lib/player"

RSpec.describe Player do
  it "exists" do
    player = Player.new("Sage")

    expect(player).to be_an_instance_of Player
  end
end
