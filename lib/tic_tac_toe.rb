require 'pry'

class TicTacToe 
  
  # attr_accessor :board 
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]
 
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end 
  
  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end   
  
  def input_to_index(index)
    index.to_i - 1 
  end   
  
  def move(index,token = "X") 
    @board[index] = token 
  end   
  
  def position_taken?(index)
    if @board[index] != " "
      true
    else
      false 
    end
  end   
  
  def valid_move?(position)
    if position >= 0 && position < 9
      #binding.pry
      !position_taken?(position)
    else   
    false
    end 
  end   

  #   if position < 0 || position > 8 
  #     false 
  #   else 
  #   !position_taken?(position)
  #   end 
  # end   
  
  def turn_count
   9 - @board.count(" ") 
  end   
    
  def current_player
    if turn_count % 2 == 0 
      current_player = "X"
    else 
     current_player = "O"
    end 
  end   

  def turn
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index,current_player) 
      display_board
    else  
      turn
    end  
  end  
  
  def won?
    win_combo = false
    WIN_COMBINATIONS.each do |combination|
      check = combination.map {|int| int = @board[int]}
      # binding.pry
      if check.select {|int| int == "X"}.length == 3
        win_combo = combination
      elsif check.select {|int| int == "O"}.length == 3
        win_combo = combination
      end 
    end
    win_combo
  end 
  
  def full?
    if @board.include?(" ")
     false 
    else 
     true 
    end  
  end   
  
  def draw? 
    if full? == true && won? == false 
      true 
    else 
      false 
    end   
  end   
  
  def over?
    if won? || draw? == true 
      true 
    else 
      false 
    end   
  end   
  
  def winner
    if won? == false 
      nil 
    else 
      @board[won?[0]]
    end   
  end   
  
  def play
    until over?
      turn 
    end 
    if won? 
     puts "Congratulations #{winner}!"
    else draw? 
      puts "Cat\'s Game!"
    end   
  end   
end   

