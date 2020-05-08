class TicTacToe

WIN_COMBINATIONS = [

  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8],

  ]

def initialize
@board = [" ", " ", " ", " ", " ", " ", " ", " ", " ", ]
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

def move(index, character)
  @board[index] = character
end

def position_taken?(index) # code your #position_taken? method here!
  if @board[index] == " " || @board[index] =="" || @board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    return true
  end
end

def turn
  puts "Please enter 1-9:"
  string_entered = gets.strip
  desired_position = input_to_index(string_entered)
    if valid_move?(desired_position)
    move(desired_position, current_player)
    display_board
    else
    turn
    end
end

def turn_count
  move_count = 0
  @board.each do |ex_or_o|
  if ex_or_o == "O" || ex_or_o == "X"
      move_count += 1
    end
  end
  move_count
end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|

    @board[combo[0]] == @board[combo[1]] && @board[combo[1]] ==  @board[combo[2]] && position_taken?(combo[0])

      end
    end

  def full?
  @board.all? do |marker|
    marker == "X" || marker == "O"
end
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  if win_array = won?
    @board[win_array.first]
  end
end

def play
while !over?
  turn
end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end




























end
