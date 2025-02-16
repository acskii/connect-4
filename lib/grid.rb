require 'colorize'
require_relative 'colors'

class Grid
  attr_reader :plr1, :plr2, :grid
  @@default_plr1 = Colors.colors[:red]
  @@default_plr2 = Colors.colors[:blue]

  def self.default_plr1
    @@default_plr1
  end

  def self.default_plr2
    @@default_plr2
  end

  def initialize(plr1_color= @@default_plr1, plr2_color= @@default_plr2)
    @plr1 = valid_color?(plr1_color) ? plr1_color : @@default_plr1
    @plr2 = valid_color?(plr2_color) ? plr2_color : @@default_plr2
    @grid = Array.new(6) {Array.new(7, 0)}   # Grid layout of 6*7 slots
  end

  def reset
    @grid.clear
    @grid = Array.new(6) {Array.new(7, 0)}     # Grid layout of 6*7 slots
  end

  def print_grid
    @grid.length.times do |t|
      @grid[-1 - t].each do |col|
        print "| #{player_coin(col)} "
      end 
      print '|'
      puts ''
    end
    puts ('-' * 4 * 7) + '-' # 4 per col * 7 cols
  end

  def player_coin(plr)
    case plr
      when 1 then Colors.color_represent.colorize(plr1)
      when 2 then Colors.color_represent.colorize(plr2)
      else '⛌'
    end
  end

  def add_coin(plr, col)
    return false unless plr.kind_of?(Integer) && plr.between?(1,2) && col.between?(0,6)

    @grid.each do |row|
      if row[col].zero?
        row[col] = plr
        break
      end
    end
    true
  end

  private
  def valid_color?(color)
    !Colors.colors.dig(color).nil?
  end
end 