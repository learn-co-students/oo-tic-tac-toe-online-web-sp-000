class TicTacToe

  def initialize(board = nil)
   @board = board || Array.new(9, " ")
   end
   WIN_COMBINATIONS = [
     [0,1,2], # Top row
     [3,4,5], # Middle row
     [6,7,8], # Bottom row
     [0,3,6], # Left side
     [1,4,7], # Center vertical
     [2,5,8], # Right Side
     [2,4,6], # Diagnol 1
     [0,4,8] # Diagnol 2
   ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(num)
  index = num.to_i - 1

  index
  end

  def move(index,character)
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def turn_count
  count = 0
  @board.each do |occ| #{|occ| occ == "X" || occ == "O"? count+=1}
    if occ == "X"
      count += 1
    elsif occ == "O"
      count += 1
    end
  end
  count
end

  def on_board?(num)
    if num.between?(0, 8)
      return true
    else
      return false
    end
  end

  def valid_move?(index)
  # board = @board
  if !(position_taken?(index)) && on_board?(index)
    return true
  else
    return false
  end
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
  num = gets.strip
  input = input_to_index(num)
  character = current_player

  if valid_move?(input)
    move(input, character)
  else
    turn
  end
  display_board
end

def won?
  WIN_COMBINATIONS.each do |wins|

    win_index_1 = wins[0]
    win_index_2 = wins[1]
    win_index_3 = wins[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return wins
    elsif
      (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return wins
    end
  end
  return false
end

def full?
  @board.all? { |full| full == "X" || full == "O"}
end


def draw?
  if !won? && full?
    true
  else
    false
  end
end

def over?
  if won? || full? || draw?
    true
  else
    false
  end
end

def winner
  idx = won?
  if won? == false
    nil
  elsif  @board[idx[0]] == "X"
    "X"
  else
    "O"
  end
end

def play

  until over?
    turn
  end

    if won? && winner == "X"
      puts "Congratulations X!"
    elsif won? && winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cat's Game!"
    end
end


end
