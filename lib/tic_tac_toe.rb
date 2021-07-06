class TicTacToe
  attr_accessor :board

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
)
    @board = board
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]


def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end


def won?
  outcome = nil
  WIN_COMBINATIONS.each do |combo|
    position_1 = combo[0]
    position_2 = combo[1]
    position_3 = combo[2]


    if @board[position_1] == "X" && @board[position_2] == "X" && @board[position_3] == "X"
    outcome = combo
  elsif @board[position_1] == "O" && @board[position_2] == "O" && @board[position_3] == "O"
    outcome = combo
    end
  end

   return outcome
end


def input_to_index(user_input)
  return user_input.to_i - 1
end


def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    player = current_player
    move(index, player)
    display_board
  else
    turn
  end
end

def move(index, token = "X")
  return @board[index] = token
end
#move(board, 0, "X")

def turn_count
  counter = 0
  @board.each do |moves|
    if moves == "X" || moves == "O"
      counter += 1
    end
  end
  return counter
end


def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end


def full?
  def check(counter)
    if counter == 9
       true
    else
      false
    end
  end

  counter = 0
  @board.each do |spot|
    if spot == "X" || spot == "O"
      counter += 1
    end
  end
  return check(counter)
end


def draw?
  full? && !won?
end


def over?
  full? || won? || draw?
end

def winner
  if outcome = won?
    @board[outcome.first]
  end
end

def play
  until over?
    turn
  end

  if won?
    victor = winner
   puts "Congratulations #{victor}!"
  elsif draw?
   puts "Cat's Game!"
  end
end

end


#play(board)
