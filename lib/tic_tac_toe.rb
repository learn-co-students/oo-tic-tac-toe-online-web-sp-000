class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

def initialize
  @board = Array.new(9, " ")
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

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  @board.count {|space| space != " "}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Please choose a number 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.each { |combo|
    space1 = combo[0]
    space2 = combo[1]
    space3 = combo[2]
    
    tokens = @board.values_at(space1,space2,space3)
    
    if tokens.all?("X")
      return combo
    elsif tokens.all?("O")
      return combo
    end
  }
  false
end
 
 def full?
   @board.any?(" ") ? false : true
 end
 
 def draw?
   full? && !(won?) ? true : false
 end
 
 def over?
   won? || draw? ? true : false
 end
 
 def winner
   #check board index directley, current_player variable will not be true 
   won? ? @board[won?[0]] : nil
 end
 
 def play 
 while !(over?) do
   turn
 end
 draw?  ? (puts "Cat's Game!") : (puts "Congratulations #{winner}!")
 end
end