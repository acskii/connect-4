module Mechanics
  # Methods that check which color has won on a given Grid.
  # General methods that returns a winner if found from a list of 7 scores
  # Row check 
  def self.row_check(grid)
    grid.each do |row|
      winner = win_by_score(row)

      return winner unless winner.nil?
    end
    nil
  end
  # Column check
  def self.col_check(grid)
    7.times do |col|
      column = grid.map { |row| row.at(col) }
      winner = win_by_score(column)

      return winner unless winner.nil?
    end
    nil
  end
  # Diagonal check
  def self.diagonal_check(grid)
    # Scan through left and right diagonals
    left = left_diag_check(grid)
    right = right_diag_check(grid)

    # If winner from either, return it else nil
    return left unless left.nil?
    return right unless right.nil? 
    nil
  end

  private
  def self.left_diag_check(grid)
    # Nagivate the grid diagonally from left 0 -> left 3
    4.times do |col|
      diag = []
      grid.each do |row|
        element = row[col]
        break if element.nil?   # Since not all diagonals have fixed length

        diag << element
        col += 1
      end
      winner = win_by_score(diag)
      return winner unless winner.nil?
    end
    nil
  end

  def self.right_diag_check(grid)
    # Nagivate the grid diagonally from right -1 -> right -4
    for col in Array(1..4).map { |n| -n }
      diag = []
      grid.each do |row|
        element = row.at(col)
        break if element.nil?   # Since not all diagonals have fixed length

        diag << element
        col -= 1
      end
      winner = win_by_score(diag)
      return winner unless winner.nil?
    end
    nil
  end

  def self.win_by_score(row)
    # Receive a list of [0,1,2] / nagivate as a fixed window
    # look at 4 each if all are the same, then that number is the winner
    # set([1,1,1,1]) = [1] <--
    ((row.length % 4) + 1).times do |t|
      set = row.slice(t, 4).uniq
      return set.first if set.length == 1 && !set.first.zero?
    end
    nil
  end
end