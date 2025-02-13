require 'colorize'
require_relative 'colors'

class Grid
  attr_reader :plr1, :plr2, :grid
  @@default_plr1 = Colors.colors[:red]
  @@default_plr2 = Colors.colors[:blue]

  def initialize(plr1_color= @@default_plr1, plr2_color= @@default_plr2)
    @plr1 = valid_color?(plr1_color) ? plr1_color : @@default_plr1
    @plr2 = valid_color?(plr2_color) ? plr2_color : @@default_plr2
    @grid = [ [0] * 7 ] * 6     # Grid layout of 6*7 slots
  end

  def print_grid
    @grid.each do |row|
      row.each do |col|
        print "| #{player_coin(col)} "
      end 
      print '|'
      puts ''
    end
    puts('-' * 4 * 7) # 4 per col * 7 cols
  end

  def player_coin(plr)
    coin = '⚫'
    case plr
      when 1 then coin.colorize(plr1)
      when 2 then coin.colorize(plr2)
      else '⛌'
    end
  end

  private
  def valid_color?(color)
    !Colors.colors.dig(color).nil?
  end
end 