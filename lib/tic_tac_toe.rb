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
     [6,4,2]
    ]
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(num)
  num.to_i - 1
  end
  
  def move(index, value)
  @board[index] = value
  end
  
  
  def valid_move?(index)
  
     if position_taken?(index)
       return false
     elsif index.between?(0,8)
       return true
     end
     
end
  

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end
  
  
def turn_count
  count = 0 
  
  @board.each do |turn|
    if turn == "X" || turn == "O"
    count += 1 
    else
    end
  
end
return count
end

def current_player
  
if turn_count.even?
  return "X"
else 
  return "O"
end
end

  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  check = valid_move?(index)
  
  if current_player == "X"
    value = "X"
  elsif current_player == "O"
    value = "O"
  end
    
      if check == true
        move(index,value)
        turn_count
        display_board
      else
      turn
      end
    
end
  
  
  def won?
  
  winner_ = []
  
  WIN_COMBINATIONS.each do |array|
    if @board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X"
      winner_ = array
    elsif @board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O"
    winner_ = array
    else
    end
  end
    
    if winner_ != []
    return winner_
  else 
    return false
  end
    
end


def full?
  
  if @board.count(" ") > 0 
    return false
  else 
    return true
  end
    
end

def draw?
  
  if won? == false && full? == true 
    return true
  else
    return false
  end
  
end

def over?
  if won? != false || full? == true || draw?
    return true
  else
    return false
  end
end

def winner
  winning_combo = won?
  
  if winning_combo != false
  
    if @board[winning_combo[0]] == "O"
      return "O"
     elsif @board[winning_combo[0]] == "X"
       return "X"
     
     else
       
  end
end
end



def play

until over?
  turn
end

if draw?
  puts "Cat's Game!"
elsif winner
  puts "Congratulations #{winner}!"
elsif full?
 puts "Full!"
end


end



  
end
