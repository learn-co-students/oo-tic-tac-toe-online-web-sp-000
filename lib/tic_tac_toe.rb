class TicTacToe 
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def play
  turn until over?
  won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
  end

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],  
[6,7,8],  
[0,3,6],  
[1,4,7],  
[2,5,8],  
[0,4,8], 
[6,4,2] 
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
  
  
  def move(index, player="X")
    @board[index] = player
  end
  
  def position_taken?(index)
    (@board[index].nil? || @board[index] == " ")? false : true
  end
  
  def valid_move?(index)
    !position_taken?(index) && (index).between?(0,8)
  end
  
  def turn_count
    @board.count {|space| space == "X" || space == "O" }
  end
  
  def current_player
    turn_count% 2 == 0? 'X' : 'O'
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
  
  def won?
    x = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
    o = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
    return x || o
  end
  
  def full?
    @board.none?(' ')
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw? || full?
  end
  
  def winner
    (won?)? @board[won?[0]] : nil
  end
  
  
end
