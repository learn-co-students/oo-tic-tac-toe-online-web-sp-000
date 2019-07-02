class TicTacToe
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

attr_accessor :board

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
def input_to_index(input)
  @index = input.to_i - 1
end
def move(index, player)
  @board[index] = player
end
def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
end
def valid_move?(index)
  !position_taken?(index) && index.between?(0, 8)
end
def turn_count
  @count = 0
  @board.each do |space|
    if space == "X" || space == "O"
      @count += 1
    end
  end
  @count
end
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
  else turn
  end
  display_board
end

def play
   until over?
    turn
   end
     if draw?
       puts "Cat's Game!"
     elsif winner
       puts "Congratulations #{winner}!"
     end
end

def won?
      WIN_COMBINATIONS.detect do |combo|
        position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]]  == @board[combo[2]]
      end
  end
def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
end
#
def full?
  @board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?
  full? && !won?
end

def over?
  won? || full? || draw?
end

def winner
    if won?
       @board[won?[1]]
    end
end



end
