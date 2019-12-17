require 'pry'
  
class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
    ]  
    
  def initialize
    @board = Array.new(9, " ")
  end
  
  def input_to_index(str_input)
    str_input.to_i - 1 
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def move(idx_position, char)
    @board[idx_position] = char
  end 
  
  def position_taken?(idx_position)
    @board[idx_position] != " " && @board[idx_position] != ""
  end 
  
  def valid_move?(idx_position)
    idx_position.between?(0,8) && !position_taken?(idx_position)
  end 
  
  def turn_count
    @board.count {|char| char == "X" || char == "O"}
  end 
  
  def current_player
    if turn_count % 2 != 0
      "O"
    else 
      "X"
    end 
  end 
  
  def turn 
    input = gets.strip 
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      turn
    end 
  end 
  
  def won?
    WIN_COMBINATIONS.find do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
    end 
  end 
  
  def full?
    @board.all? {|pos| pos == "X" || pos == "O"}
  end 
  
  def draw?
    full? && !won?
  end 
  
  def over?
    draw? || won?
  end 
  
  def winner
    if combo = won?
      @board[combo.first]
    end 
  end 
  
  def play 
    until over? 
      turn 
    end 
    if won? 
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end 
  end 
  
end


  