class TicTacToe 
  
  def initialize
    @board = Array.new(9, " ")
  end 

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
 
 def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
 
 def input_to_index(user_input)
     @index = user_input.to_i - 1
 end 
 
 def move(index, token = "X")
     @board[index] = token
 end 
 
 def position_taken?(index)
   @board[index] != " " && @board[index] != "" 
 end 
 
 def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
 end 
 
 def turn
    display_board
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if !valid_move?(index)
      turn
    end
    move(index, current_player)
 end 
 
 def turn_count
    @board.count{|token| token == "X" || token == "O"}
end


 def current_player
    turn_count % 2 == 0 ? "X" : "O"
end

def won?
    winner_X_count = 0 
   winner_O_count = 0 
  
 WIN_COMBINATIONS.each do |combo| 
  win_index_1 = combo[0]
  win_index_2 = combo[1]
  win_index_3 = combo[2]

  pos_1 = @board[win_index_1]
  pos_2 = @board[win_index_2]
  pos_3 = @board[win_index_3]
  
    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") 
      winner_X_count += 1
      return combo
    elsif (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      winner_O_count += 1
      return combo
    else
      false 
    end #end if
  end #end do
  
  #return false if empty board 
 @board.none? do |value|
   value == " "
 end 
 

 
 #return false if draw
 !(winner_O_count==winner_X_count)

 
   
  
end

def full?
    @board.all? { |token| token == 'X' || token == 'O' }
end 

def draw?
    !won? && full?
end 

def over?
   won? || draw?
 end 

def winner
  if result = won?
    @board[result.first]
  end 
end 

def play
  turn until over?
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end 
 
