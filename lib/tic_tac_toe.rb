class TicTacToe
  def initialize(board=nil)
    @board=board ||Array.new(9," ")
  end

  WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  if input.to_i.to_s==input
     return input.to_i-1
   else return -1
  end
end

def move(index,value="X")
  @board[index]=value
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  if (!(@board[index]=="X"))&&(!(@board[index]=="O"))&& index.between?(0,8)
    return true
end
end

def turn
  puts 'Please enter 1-9:'
  input=gets.strip
  index=input_to_index(input)
  if valid_move?(index)
    move(index,current_player)
      display_board
  else turn
  end
end

def  turn_count
  count=0
  @board.each do |value|
    if !(value==" ")
      count+=1
  end
  end
  return count
  end

def current_player
  turns=turn_count
  turns.even?? "X": "O"
  # if turns%2==0
   #    "X"
   #else "O"
   # end
end

def won?
WIN_COMBINATIONS.each do |combo|
#for each combo in WIN_COMBINATIONS do
  position_1=@board[combo[0]]
  position_2=@board[combo[1]]
  position_3=@board[combo[2]]
if (position_1=="X" && position_2=="X"&& position_3=="X") ||( position_1=="O" && position_2=="O" && position_3=="O")
  return combo
end
end
false
end

def full?
  @board.none?{|space| space==" "}
end

def draw?
  if full? && !won?
    true
  else false
  end
end

def over?
  if won?|| draw?
    true
  else false
  end
end

def winner
  if won?
    winner=won?[0]
    return @board[winner]
  end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else puts "Cat's Game!"
  end
end






























end
