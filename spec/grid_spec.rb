require './lib/grid'
require 'colorize'

describe Grid do
  it "Grid is of correct size (6 rows / 7 cols)" do
    grid = Grid.new.grid
    rows, cols = grid.length, grid[0].length
    correct_size = rows == 6 && cols == 7

    expect(correct_size).to be true
  end

  it "Grid accepts different player colors" do
    grid = Grid.new(:green, :cyan)
    correct_colors = grid.plr1 == :green && grid.plr2 == :cyan

    expect(correct_colors).to be true
  end

  it "Grid rejects invalid player color" do
    grid = Grid.new(:green, :orange)
    correct_colors = grid.plr1 == :green && grid.plr2 == :blue

    expect(correct_colors).to be true
  end

  it "Player 1 coin correct" do
    grid = Grid.new
    actual = grid.player_coin(1)
    expected = '⚫'.colorize(grid.plr1)

    expect(actual).to eql(expected)
  end

  it "Player 2 coin correct" do
    grid = Grid.new
    actual = grid.player_coin(2)
    expected = '⚫'.colorize(grid.plr2)

    expect(actual).to eql(expected)
  end

  it "invalid player no coin" do
    grid = Grid.new
    actual = grid.player_coin(3)
    expected = '⛌'

    expect(actual).to eql(expected)
  end
end