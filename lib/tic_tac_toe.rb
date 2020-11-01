class TicTacToe
  attr_accessor :board
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
  def initialize
    @board = Array.new(9, " ")
  end

  def input_to_index(move)
    move.to_i - 1
  end

  def move(move, char)
  @board[move] = char
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else
    true
  end
end

def valid_move?(index)
 if index.between?(0, 8) && !position_taken?(index)
   true
 else
   false
 end
end

  def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def turn
 loop do
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
     break
    end
  end
 display_board
end

def won?
count = 0
  until count > 7 do
  #use count as a selecter for index of WIN_COMBINATIONS
   win_array = WIN_COMBINATIONS[count]
   board_array = []
  #retrieve indexes from board that correspond to WIN_COMBINATIONS[i]
    win_array.each do |index|
      board_array << @board[index]
    end
  #if all x or o then game over (break)
  if board_array == ["X", "X", "X"] || board_array == ["O", "O", "O"]
    return win_array
  else
    #else reset board_array and increase count and try again
      board_array = []
      count += 1
  end
  end
end
def full?
  emptys = @board.detect do |index|
           index == "" || index == " "
         end
  if emptys != nil
    return false
  else
    return true
  end
end

def draw?
  if !won? && full?
    return true
  else
    false
  end
end

def over?
  if won? || draw? || full?
    return true
  end
end

def winner
  return nil if won? == nil
  @board[won?[0]]
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
