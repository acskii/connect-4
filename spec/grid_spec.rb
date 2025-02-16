require './lib/grid'
require 'colorize'

describe Grid do  
  before(:each) do
    @grid = Grid.new
  end

  it "Grid is of correct size (6 rows / 7 cols)" do
    grid = @grid.grid
    rows, cols = grid.length, grid[0].length
    correct_size = rows == 6 && cols == 7

    expect(correct_size).to be true
  end

  describe "Colors" do
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
  end
  
  describe "Players" do
    it "Player 1 coin correct" do
      actual = @grid.player_coin(1)
      expected = Colors.color_represent.colorize(@grid.plr1)
  
      expect(actual).to eql(expected)
    end
  
    it "Player 2 coin correct" do
      actual = @grid.player_coin(2)
      expected = Colors.color_represent.colorize(@grid.plr2)
  
      expect(actual).to eql(expected)
    end
  
    it "invalid player no coin" do
      actual = @grid.player_coin(3)
      expected = '⛌'
  
      expect(actual).to eql(expected)
    end
  end
end