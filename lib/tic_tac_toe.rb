require 'pry'
class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
    
  def input_to_index(input)
    input.to_i - 1 
  end 
  
   def move(index, token)
     @board[index] = token
   end
   
   def position_taken?(index)
     if @board[index] == "O" || @board[index] == "X"
       true 
     else 
       false
      end 
    end 
    
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end 
  
  def turn_count
    count = 0 
    @board.each do |token|
      count += 1 if token == "X" || token == "O"
    end
    count
  end
  
  def current_player
    if turn_count.odd?
      "O"
    else 
      "X"
    end     
  end 
  
  def turn 
    puts "Please enter a number between 1-9"
    input = gets
    position = input_to_index(input)
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn 
    end 
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && 
      @board[combo[1]] == @board[combo[2]] && 
      position_taken?(combo[0])
    end
  end
  
  def full?
    @board.all?{|index| index == "X" || index == "O"}
  end
  
  def draw?
    full? && !won?
  end 
  
  def over?
    full? || won?
  end
  
  def winner
    if champion = won?
    @board[champion.first]
   end
  end 
  
  def play 
    while !over? && !draw?
    turn 
    end 
    if over? && won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end 
end  









