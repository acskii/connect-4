require './lib/mechanics.rb'

describe Mechanics do
  describe "#row_check" do
    it "Valid grid, Player 1 should win" do
      grid = [
        [1,1,1,1,2,2,0],
        [2,0,2,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0]
      ]

      result = Mechanics.row_check(grid)
      expect(result).to eql(1)
    end

    it "Valid grid, Player 2 should win" do
      grid = [
        [1,1,2,1,2,2,0],
        [1,2,2,1,2,1,0],
        [2,2,2,2,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0]
      ]

      result = Mechanics.row_check(grid)
      expect(result).to eql(2)
    end

    it "Valid grid, 2 win conditions includes row, Player 1 should win" do
      grid = [
        [1,1,1,1,2,2,0],
        [1,2,1,2,2,1,0],
        [2,1,2,2,0,0,0],
        [0,2,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0]
      ]

      result = Mechanics.row_check(grid)
      expect(result).to eql(1)
    end

    it "Empty grid, return nil" do
      grid = [
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0]
      ]

      result = Mechanics.row_check(grid)
      expect(result).to be_nil
    end
  end

  describe "#col_check" do
    it "Valid grid, Player 1 should win" do
      grid = [
        [1,2,0,0,2,2,0],
        [1,2,0,0,0,0,0],
        [1,2,0,0,0,0,0],
        [1,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0]
      ]

      result = Mechanics.col_check(grid)
      expect(result).to eql(1)
    end

    it "Valid grid, Player 2 should win" do
      grid = [
        [1,1,2,1,2,2,0],
        [1,2,2,0,2,0,0],
        [2,1,0,0,0,0,0],
        [2,1,0,0,0,0,0],
        [2,0,0,0,0,0,0],
        [2,0,0,0,0,0,0]
      ]

      result = Mechanics.col_check(grid)
      expect(result).to eql(2)
    end

    it "Valid grid, 2 win conditions includes col, Player 1 should win" do
      grid = [
        [1,1,1,1,2,2,0],
        [1,2,1,2,2,1,0],
        [1,1,2,2,0,0,0],
        [1,2,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0]
      ]

      result = Mechanics.col_check(grid)
      expect(result).to eql(1)
    end

    it "Empty grid, return nil" do
      grid = [
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0]
      ]

      result = Mechanics.col_check(grid)
      expect(result).to be_nil
    end
  end

  describe "#diagonal_check" do
    it "Valid grid, Player 1 should win" do
      grid = [
        [1,2,2,2,0,0,0],
        [1,1,2,1,0,0,0],
        [1,2,1,2,0,0,0],
        [0,0,0,1,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0]
      ]

      result = Mechanics.diagonal_check(grid)
      expect(result).to eql(1)
    end

    it "Valid grid, Player 2 should win" do
      grid = [
        [1,1,2,1,2,2,0],
        [1,1,2,2,2,0,0],
        [0,1,1,2,0,0,0],
        [0,0,2,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0]
      ]

      result = Mechanics.diagonal_check(grid)
      expect(result).to eql(2)
    end

    it "Valid grid, 2 win conditions includes col, Player 1 should win" do
      grid = [
        [1,1,1,1,2,2,0],
        [1,1,1,2,2,1,0],
        [1,1,1,2,0,0,0],
        [0,0,0,1,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0]
      ]

      result = Mechanics.diagonal_check(grid)
      expect(result).to eql(1)
    end

    it "Empty grid, return nil" do
      grid = [
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0]
      ]

      result = Mechanics.diagonal_check(grid)
      expect(result).to be_nil
    end
  end
end
