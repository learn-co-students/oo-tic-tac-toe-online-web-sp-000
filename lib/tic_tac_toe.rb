class TicTacToe

#board**************************************************
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    
  end
  
  WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6 ,7 ,8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0,4, 8],[2, 4, 6]]
#board display***********************************************
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

#change input*********************************************
def input_to_index(user_input)
  return user_input.to_i - 1
end

#move*************************************************8
def move(index, current_player)
  @board[index] = current_player

end


#taken or not*****************************************
def position_taken?(index)
  occupied = nil
  if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
      occupied = false
    else
      occupied = true

    end
    occupied
  end


#validate************valid move*****************************  
def valid_move?(index)
  index.between?(0, 8) && !position_taken?(index)
end

#turn*******************************************
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
end

#count turns************************
def turn_count
  count_moves = 0
  @board.each do |check|
    if (check == "X" || check == "O")
        count_moves += 1
    end
  end
   return count_moves
end

#current player**********************************
def current_player
  turn_count
  if turn_count.even?
    return "X"
  else
    return "O"

  end
end

#won or not**************************************
def won?
WIN_COMBINATIONS.each do |win_combination|
  win_index0 = win_combination[0]
  win_index1 = win_combination[1]
  win_index2 = win_combination[2]

  position_1 = @board[win_index0]
  position_2 = @board[win_index1]
  position_3 = @board[win_index2]

if (position_1 == "X" && position_2 == "X" && position_3 == "X")
  return win_combination
  elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
  return win_combination
end
end
return false
end

#board full or not**************************************
def full?
    @board.all? do |marker|
      marker == "X" || marker == "O"
    end
  end
  
  def draw?

  full? && !won?
  end
  
  
#over or not**********************************  
  def over?
    if draw?
      return true

    elsif won? && full?
    return true

    elsif won? && !full?
      return true

    elsif !(won? && full?)
      return false
    end
end

#winner winner chicken dinner**************************
def winner
  if win_combo = won?
  @board[win_combo.first]
#else
 # return nil
end
 end

#play the game**********************************
def play
  until over?
    turn
  end
  you_won = winner
  if won?
   puts "Congratulations #{you_won}!"
    elsif draw?
      puts "Cat's Game!"
    end


#   moves = 0
#   until moves == 9
#   turn(board)
#   moves += 1
# end
end

  
  
  
  
end 
