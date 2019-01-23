class TicTacToe
 def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
   @board = board
 end
 
 def board=(board)
   @board = board
 end
 def board
   @board
 end
 
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

def display_board(board=[])
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
user_input.to_i - 1
end

def move(position,value)
@board[position] = value
end

def position_taken?(index)
if @board[index] == "X" || @board[index] == "O"
true
elsif @board[index] == " "
false
elsif @board[index] == ""
false
else
false
end
end

def valid_move?(index)
index.between?(0,8) && !position_taken?(index)
end

def turn
puts "Please enter 1-9:"
answer = gets.strip
response_index = input_to_index(answer)
if valid_move?(response_index)
move(response_index,current_player)
else
puts "This is not valid"
turn
end
display_board
end

def turn_count
counter = 0
@board.each do |moves|
if moves == "X" || moves == "O"
counter +=1
end
end
counter
end

def current_player
if turn_count % 2 == 0
return "X"
else
return "O"
end
end

def won?
WIN_COMBINATIONS.each do|combo|
#part below – grabs each index of winning combo
win_index_1 = combo[0]
win_index_2 = combo[1]
win_index_3 = combo[2]

#part below – loads value of board at index
position_1 = @board[win_index_1]
position_2 = @board[win_index_2]
position_3 = @board[win_index_3]

if position_1 == "X" &&
position_2 == "X" &&
position_3 == "X"
return combo
elsif position_1 == "O" &&
position_2 == "O" &&
position_3 == "O"
return combo
else
end
end
false
end

def full?
if @board.all? {|word| word == "X" || word =="O"}
true
else
false
end
end

def draw?
if full? && !won?
true
else
end
end

def over?
if won? || draw? || full? == true
return true
else
end
end

def winner
WIN_COMBINATIONS.each do|combo|
win_index_1 = combo[0]
win_index_2 = combo[1]
win_index_3 = combo[2]

position_1 = @board[win_index_1]
position_2 = @board[win_index_2]
position_3 = @board[win_index_3]
if position_1 == "X" && position_2 == "X" && position_3 == "X"
return "X"
elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
return "O"
end
end
nil
end

def play
until over?
turn
end
if won?
puts "Congratulations #{winner}!"
else
puts "Cat's Game!"
end
end


end

