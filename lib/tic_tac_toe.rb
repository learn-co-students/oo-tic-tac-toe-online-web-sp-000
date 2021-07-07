require 'pry'
class TicTacToe
  
  def initialize
    
    
   @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   
   
  end 
  
  WIN_COMBINATIONS = [[0, 1, 2],
                      [3, 4, 5], 
                      [6, 7, 8],
                      [0, 4, 8],
                      [2, 4, 6],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8]]
                      
  def display_board
    
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 

  
  
  def input_to_index(user_input)
  user_input.to_i - 1
  end 
  
  def move(index, token)
    
    @board[index] = token
    
  end 
  
  
  def position_taken?(index)
    if @board[index] == "X" 
      true
    elsif @board[index] == "O"
      true 
    else
      false 
    end 
  end 
  
  
def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end
  
  
    
  def turn_count
    counter = 0
    @board.each do |spot|
      if spot == "X" || spot == "O"
        counter += 1
      end
    end 
    counter
  end
  
  
  
  def current_player
    if turn_count.odd?
      "O"
    else 
      "X"
    end 
  end 
  
    
  def turn
    
    puts "Please enter 1-9:"
    input = gets.strip
    
    index = input_to_index(input)  
    
    
    
      if valid_move?(index)
        player = current_player
        move(index, player) 
        display_board
      else 
        turn 
      end 
      
  end


  
  
def won?
  
WIN_COMBINATIONS.detect do |win_combination|
  index1 = win_combination[0]
  index2 = win_combination[1] 
  index3 = win_combination[2] 

  position_1 = @board[index1]
  position_2 = @board[index2]
  position_3 = @board[index3]
  
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  else
    false
  end
   if position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  else
    false
  end
 end
end
  
  
  def full?
   if @board.include?(" ")
    false
  else
    true
  end
    
  end 
  
  def draw?
    !won? && full?
  end 
  
  
  def over?
    draw? || won? 
  end 
  
def winner
    if draw?
      nil
      elsif !won?
      nil 
    
    elsif over? && current_player == "X"
      "O"
    elsif over? && current_player == "O" 
      "X"
    else 
      nil 
  end 
end 

 
  def play 
    until over?
    turn
    end
   
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O" 
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end 
  
  end 
  
  
  
  
  
  
  
  
end  
