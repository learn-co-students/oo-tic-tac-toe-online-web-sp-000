class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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

 def input_to_index(input)
  index = input.to_i - 1
end
 
 def move(index, current_player = "X")
  @board[index] = current_player
end

def position_taken?(index)
  ((@board[index] == "X") || (@board[index] == "O"))
end


def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

 
 def turn
    puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn # messed up here?
  end
end


def full?
  @board.all? {|i| i == "X" || i == "O"}
end

def winner
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return "X"
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return "O"
    else
      nil
    end
  end
end

def won?
WIN_COMBINATIONS.each { |win_combination|
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = @board[win_index_1] # load the value of the board at win_index_1
  position_2 = @board[win_index_2] # load the value of the board at win_index_2
  position_3 = @board[win_index_3] # load the value of the board at win_index_3
    if position_1 == ("X") && position_2 == ("X") && position_3 == ("X")
    return win_combination # return the win_combination indexes that won.
  elsif position_1 == ("O") && position_2 == ("O") && position_3 == ("O")
  return win_combination
 end
}
return false
end


def draw?
  if full? == true && won? == false
    true
  else
    false
  end
end

def over?
  if won? || full? || draw?
    return true
  end
end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end



end