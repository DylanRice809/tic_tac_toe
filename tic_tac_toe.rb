# frozen_string_literal: true

module CheckFunctions
  def check_array (array)
    array.any? { |element| element.all?("X") || element.all?("O") }
  end

  def win_condition_x (board)
    check_array(board)
  end

  def win_condition_y (board, column_1=[], column_2=[], column_3=[], columns=[])
    board.each do |row|
      column_1 << row[0]
      column_2 << row[1]
      column_3 << row[2]
    end
    columns << column_1
    columns << column_2
    columns << column_3
    check_array(columns)
  end

  def win_condition_diagonal (board, diagonal_1=[], diagonal_2=[], diagonals=[])
    iterator_array = [0,1,2]
    for i in iterator_array
      diagonal_1 << board[i][i]
    end
    for i in iterator_array.reverse
      diagonal_2 << board[i][i]
    end
    diagonals << diagonal_1
    diagonals << diagonal_2
    check_array(diagonals)
  end

  def check_all_conditions (board)
    win_condition_x(board) || win_condition_y(board) || win_condition_diagonal(board) ? true : false
  end
end

# defines the board and methods for making moves
class Game
  include CheckFunctions

  def initialize
    @board_array = Array.new(3) { Array.new(3, '_') }
    @player_1_turn = true
  end
  
  def display_board ()
    @board_array.each do |row| 
      p row
      puts "\n"
    end
  end

  # get user input for their turn and change the board instance accordingly
  def take_turn (player_choice=0)
    loop do
      puts "Type row and column"
      player_choice = gets.chomp.split("").map! { |int| int.to_i }
      break unless player_choice[0] > 2 || player_choice[0] < 0 || player_choice[1] > 2 || player_choice[1] < 0 
    end
    if @player_1_turn
      @board_array[player_choice[0]][player_choice[1]] = "X"
      player_1_turn = false
    else
      @board_array[player_choice[0]][player_choice[1]] = "O"
      player_1_turn = true
    end
  end

  def play_game ()
    p check_all_conditions(@board_array)
  end

end

game_instance = Game.new
game_instance.display_board()
game_instance.take_turn()
game_instance.take_turn()
game_instance.take_turn()
game_instance.display_board()
game_instance.play_game