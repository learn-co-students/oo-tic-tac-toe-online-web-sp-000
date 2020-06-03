class TicTacToe 
  
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
    
  attr_accessor :location
    
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
  
  def input_to_index(user_input)
  user_input.to_i - 1
  end
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end
  
  def position_taken?(location) 
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn_count 
      @board.select { |i| i == "X" || i == "O" }.count
  end
  
  def current_player
    if turn_count.even? 
      return "X"
    else 
      return "O"
  end
end

def turn 
  puts "Please enter 1-9:"
  user_input = gets.chomp 
  index = input_to_index(user_input)
  if valid_move?(index) 
    move(index, current_player)
    display_board
  else 
    turn
end
end

def won? 
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return false
end

def full?
  @board.all? do |i| 
    i == "O" || i == "X" 
  end 
end

def draw? 
  if won? != false 
    return false  
  elsif full?
   return true
end
end

def over? 
  if won? || draw?
    return true
end
end

def winner 
  if won? 
    return @board[won?[0]]
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