class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end # of initialise

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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
      index = input.to_i - 1
      return index
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end



def move(index, player = "X")
    @board[index] = player
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  if @board[index] == " " && index <= 8 && index >= 0
     return true
   else
     puts "wasnt a valid move"
     return false
  end
end

def turn
  puts "Please enter a number 1-9"
  input = gets.chomp
  index = input_to_index(input)
  fix_index = index
  if valid_move?(fix_index)
    move(fix_index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  count = 0
  @board.each do |element|
    if element == "X" || element == "O"
      count += 1
    end
  end
  count
end


def won?
  WIN_COMBINATIONS.each do | win_combination |
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?
  @board.include?(" ") ? false : true
end

def draw?
  full? && !won? ? true : false
end

def over?
  won? || draw? || full? ? true : false
end

def winner
  won? ? @board[won?[0]] : nil
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

end # of class
#
