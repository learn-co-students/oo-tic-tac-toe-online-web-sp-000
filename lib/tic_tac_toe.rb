class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS= [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [1,4,7],
      [2,5,8]
    ]

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

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  @board[index] != " " && @board[index] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  counter=0
  @board.each do |spaces|
    if spaces == "X" || spaces == "O"
    counter +=1
  end
  end
  counter
end

def current_player
  turn_count % 2 == 0? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |wincombo|
   if (@board[wincombo[0]]) == "X" && (@board[wincombo[1]]) == "X" && (@board[wincombo[2]]) == "X"
     return wincombo
   elsif (@board[wincombo[0]]) == "O" && (@board[wincombo[1]]) == "O" && (@board[wincombo[2]]) == "O"
      return wincombo
    end
  end
  false
end

def full?
  @board.all? {|i| i == "X" || i == "O"}
  end

def draw?
  if !won? && full?
    return true
  end
  false
end

def over?
  if won? || full? || draw?
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
      winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
   elsif draw?
      puts "Cat's Game!"
   end
end

end
