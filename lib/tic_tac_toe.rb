require "pry"
class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "-----------"
  end
  
  def input_to_index(input)
    index = input.to_i-1
  end 
  
  def move(index,token = "X")
    @board[index] = token
  end 
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true 
    end
    false 
  end
  
  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      return true
    end
    false 
  end 
  
  def turn_count
    @board.count("X") + @board.count("O")
  end 

  def current_player
    if turn_count.odd?
      return "O"
    else
      "X"
    end 
  end   
  
  def turn
    puts "Please enter 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      @board[index] = current_player 
    else
      turn 
    end 
    display_board 
  end 
  
  def won?
    result = false
    WIN_COMBINATIONS.each do |combination|
      combo_index_1 = combination[0]
      combo_index_2 = combination[1]
      combo_index_3 = combination[2]
      position_1 = @board[combo_index_1]
      position_2 = @board[combo_index_2]
      position_3 = @board[combo_index_3]
      
      if position_taken?(combination[0]) && position_1 == position_2 && position_2 == position_3
        result = combination
      end
    end
    result
  end 
  
  def full?
    result = false
    if @board.all? {|index| index == "X" || index == "O"}
      result = true 
    end 
    result
  end 
  
  def draw?
    if full? && !won?
      return true 
    end 
    false
  end 
  
  def over?
    if won? || draw?
      return true
    end 
    false 
  end 
  
  def winner
    if won?
      return @board[won?[0]]
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