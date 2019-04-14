class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]
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
def move(position, character)

   @board[position] = character
end
def position_taken?(integer)
  if @board[integer] == " " || @board[integer] == "" || @board[integer] == nil
   false
  elsif @board[integer] == "X" || @board[integer] == "O"
   true
  end
end
def valid_move?(index)
  if (index < 0 || index > 8)
    false
  elsif position_taken?(index)
    false
  else
    true
  end
end
def turn_count
  counter = 0
  @board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  counter
end
end
