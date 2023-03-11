# frozen_string_literal: true

# defines the board and methods for making moves
class Game
  def initialize
    @board_array = Array.new(3) { Array.new(3, '_') }
  end
  
  def display_board ()
    @board_array.each do |row| 
      p row
      puts "\n"
    end
  end

  def take_turn (player_1_turn, player_choice=0)
    loop do
      puts "Type row and column"
      player_choice = gets.chomp.split("").map! { |int| int.to_i }
      break unless player_choice[0] > 2 || player_choice[0] < 0 || player_choice[1] > 2 || player_choice[1] < 0 
    end
    if player_1_turn
      @board_array[player_choice[0]][player_choice[1]] = "X"
    else
      @board_array[player_choice[0]][player_choice[1]] = "O"
    end
  end
end

game_instance = Game.new
game_instance.display_board()
game_instance.take_turn(false)
game_instance.display_board()