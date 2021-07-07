
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
    index = input.to_i - 1
  end

  def move(index, char)
      @board[index]= char
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index,char = current_player)
    else
      turn
    end
      display_board
  end

  def turn_count
    counter = 0
    @board.each do |i|
     if i=="X" || i=="O"
       counter += 1
     end
    end
     counter
   end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
    (@board[win[0]]=="X" && @board[win[1]]=="X" && @board[win[2]]=="X") ||
    (@board[win[0]]=="O" && @board[win[1]]=="O" && @board[win[2]]=="O")
    end
  end

  def full?
   !(@board.detect {|i| i == " " || i == nil})
  end

  def draw?
   !won? && full?
  end

  def over?
    draw? || won?
  end

 def winner
   if win = won?
     @board[win[0]]
   end
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
