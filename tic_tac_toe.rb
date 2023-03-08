# frozen_string_literal: true

# defines the board and methods for making moves
class Game
  attr_accessor :board_array

  def initialize
    @board_array = Array.new(3) { Array.new(3, '_') }
  end

  def display_board (array)
    array.each do |row| 
      p row
      puts "\n"
    end
  end
end

game_instance = Game.new
game_instance.display_board(game_instance.board_array)