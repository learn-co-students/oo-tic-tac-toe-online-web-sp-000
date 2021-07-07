class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

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
  input.chomp.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  if @board[index] == "X" || @board[index] == "O"
    true
  else
    false
end
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  @board.count {|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Player, please enter a number 1-9:"
  input = gets.strip
  index = input_to_index(input)
  cp = current_player
  if valid_move?(index)
    move(index, cp)
    display_board
  else
    turn
  end
end

def won?
  a = WIN_COMBINATIONS.find {
    |win_combo| @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
  }
  b = WIN_COMBINATIONS.find {
    |win_combo| @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
  }
  a || b
end

def full?
  !@board.any? { |x| x == "" || x == " "}
end

def draw?
  !won? && full?
end

def over?
  draw? || won?
end

def winner
   if won?
     @board[won?[0]] == "X" ? "X" : "O"
   else
     nil
   end
 end

 def play
   turn until
     over?
     if won?
      puts("Congratulations #{winner}!")
     else
      draw?
      puts "Cat's Game!"
     end
   end
 end
