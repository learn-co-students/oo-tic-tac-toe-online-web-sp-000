class TicTacToe
def initialize(board = nil)
  @board = board || Array.new(9, " ")
end
 
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
  
def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def move(index, value) 
  @board[index] = value
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0, 8) && !position_taken?(index)
  end
    
def current_player
  if turn_count % 2 == 0
  "X"
  else
  "O"
 end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input) 
  if valid_move?(index)
    move(index, current_player) 
  else 
    turn
  end
    display_board
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?
  WIN_COMBINATIONS.each do |combo|
    if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
      return combo
    elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
      return combo
    end 
  end
    false
end

def full?
  @board.each do |space|
    if space == " "
     return false  
    end 
  end
end

def draw?
    if full? && !won?
      return true
    else 
      return false
  end  
 end

def over?
   if draw? || won? || full?
     return true
      else 
        return false
      end
   end
 
def winner
  combo = won?
    if !won?
      return nil
     elsif @board[combo[0]] == "X"
        return "X"
     elsif @board[combo[0]] == "O"
        return "O"
    end
  end
  
def play
  until over?
    turn
  end
    if won?
      puts "Congratulations #{winner}!"
        elsif draw?
          puts"Cat's Game!"
     end
  end
end