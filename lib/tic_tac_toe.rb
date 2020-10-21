class TicTacToe

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]]

  @board = []

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
  puts " #{@board[0]} "+"|"+" #{@board[1]} "+"|"" #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} "+"|"+" #{@board[4]} "+"|"" #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} "+"|"+" #{@board[7]} "+"|"" #{@board[8]} "
end

def input_to_index(input)
  index = input.to_i
  index - 1
end

def move(index, value="X")
  @board[index] = value
end

def input_to_index(input)
  index = input.to_i
  index - 1
end

def move(index, value)
  @board[index] = value
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  while !valid_move?(index)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  end
  cur_pl = current_player
  move(index, cur_pl)
  display_board
end

def turn_count
  count = 0
  @board.each do  |item|
    if !(item == " " || item == "" )
      count += 1
    end
  end
  count
end

def current_player
  turns = turn_count
  return turns % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") ||
    (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
 end
end

def full?
  @board.select{ |item| item != " " && !item.nil? && item != ""}.size == 9
end

def draw?
  !(won? || !full?)
end

def over?
  won? || full? || draw?
end

def winner
  if won?
    if( WIN_COMBINATIONS.detect {|win_combination|
      (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") })
      return  "X"
    else
      return "O"
    end
  end
   nil
end

def play
    while !over?
      turn
    end
    if won?
      currentwinner = winner
      puts "Congratulations #{currentwinner}!"
    else
      puts "Cat's Game!"
    end
  end
end
