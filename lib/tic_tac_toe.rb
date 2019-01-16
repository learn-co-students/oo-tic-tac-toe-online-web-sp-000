class TicTacToe
def initialize(board=Array.new(9, " "))
  @board = board
end

attr_accessor :board

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  return input.to_i - 1
end

def move(index, current_player="X")
  @board[index] = current_player
end

def position_taken?(index)
     @board[index] != " "
  end

def valid_move?(index)
   !position_taken?(index) && index.between?(0, 8)
  end

  def turn_count
       @board.count do |v|
         v != " "
       end
  end

def current_player
if turn_count % 2 == 0
     return "X"
  else
     return "O"
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  if valid_move?(index)
       move(index, current_player)
       display_board
  else
    puts "Wrong entry."
    turn
  end
end

def won?

  WIN_COMBINATIONS.each do |f|
  index0 = f[0]
  index1 = f[1]
  index2 = f[2]


  position0 = @board[index0]
  position1 = @board[index1]
  position2 = @board[index2]

  if position0 == "X"  && position1 == "X" && position2 == "X"  ||
     position0 == "O"  && position1 == "O" && position2 == "O"

  return f
  end
end
  return false
end

def full?
 @board.all? do |y|
   y == "X" || y == "O"
 end
end

def draw?
 full? == true && won? == false
end

def over?
won? || draw?
end

def winner
  if  over? || draw?
      @board[won?[0]]
    else
      print
    end
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
