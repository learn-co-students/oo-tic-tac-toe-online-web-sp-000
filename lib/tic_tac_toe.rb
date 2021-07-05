class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]
  
  def initialize
    @board = Array.new(9, " ")
    
  end
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  
end

def input_to_index(input) 
  input.to_i - 1 
end

def move(index, player_token = "X")
  @board[index] = player_token
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    return false
  else 
    return true
  end
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    return true
  else
    false
  end
end


def turn
  puts "Please enter 1-9"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(index)
     turn
    else
    move(index, current_player)
  end
  display_board
end

def turn_count
  count = 0 
  @board.each do |board|
   if board != " "  
    count += 1
  end
  end
  count
end

def current_player
  if turn_count % 2 == 0 
    return "X"
  else
    return "O"
  end
end

def won?
    WIN_COMBINATIONS.each do |win_combination|
      
    if win_combination.all?{|symbol| @board[symbol] == "X"}
      return win_combination
    elsif win_combination.all?{|symbol| @board[symbol] == "O"}
      return win_combination
    end
    end
    return false
  end
  
  def full?
    @board.all? do |taken|
      taken == "X" || taken == "O"
 end
end    

def draw?
 !won? && full?
 end
 
 def over?
   draw? || won? 
 end 
 
 def winner
   if draw? || !full? && !won?
     return nil
   elsif @board[won?[0]] == "X"
   return "X"
   elsif @board[won?[0]] == "O"
   return "O"
   end
 end
  
def play
  while !over? && !won? && !draw?
  turn
  end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
end

end
