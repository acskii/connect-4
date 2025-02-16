require_relative 'grid'
require_relative 'mechanics'
require 'io/console'

class Board
  attr_reader :plr1_score, :plr2_score, :current_player
  include Mechanics

  def initialize(plr1_color= Grid::default_plr1, plr2_color= Grid::default_plr2)
    @grid = Grid.new(plr1_color, plr2_color)
    @round = 1
    @current_player = 1
    @plr1_score = 0
    @plr2_score = 0
  end

  def start_game
    # Main game loop
    loop do
      while !game_over?   
        display_scores    
        display_current   
        pretty_print
        switch_player if add_coin get_col_choice
        $stdout.clear_screen
      end

      winner = who_won
      update_score(winner)
      display_winner(winner)
      ask_another_round ? reset_board : break
      $stdout.clear_screen
    end
  end

  def pretty_print
    @grid.print_grid
  end

  def reset_board
    @grid.reset
    @current_player = 1
  end

  def who_won
    (Mechanics.row_check(@grid.grid) || 
     Mechanics.col_check(@grid.grid) || 
     Mechanics.diagonal_check(@grid.grid))
  end

  def game_over?
    !who_won.nil?
  end

  private
  def display_winner(winner)
    puts "WINNER: #{@grid.player_coin(winner)}"
  end

  def update_score(winner)
    case winner
      when 1 then @plr1_score += 1
      when 2 then @plr2_score += 1
    end
  end

  def display_current
    puts "CURRENT PLAYER: #{@grid.player_coin(@current_player)}"
  end

  def display_scores
    puts "PLAYER 1 |[ #{plr1_score} ]| <> PLAYER 2 |[ #{plr2_score} ]|"
  end

  def ask_another_round
    print 'Another round? '
    loop do
      input = gets.chomp.downcase

      case input
        in 'y' then return true
        in 'n' then return false
        else next
      end
    end
  end

  def get_col_choice
    loop do
      print 'Col: '
      input = gets.chomp.to_i

      return input if input.between?(0, 6)
      puts 'INVALID COLUMN NUMBER' unless input.between?(0, 6)
    end
  end

  def add_coin(col)
    @grid.add_coin(current_player, col)
  end

  def switch_player
    @current_player = current_player == 1 ? 2 : 1 
  end
end