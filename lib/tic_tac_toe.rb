

class TicTacToe

  WIN_COMBINATIONS = [
[0,1,2], # top_row
[3,4,5], # middle_row
[6,7,8], # bottom_row
[0,3,6], # left_column
[1,4,7], # center_column
[2,5,8], # right_column
[0,4,8], # left_diagonal
[6,4,2] # right_diagonal
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

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def input_to_index(position)
    input=position.to_i
    input-1
  end

  def move (index, token = 'X')
    @board[index] = token
  end

  def position_taken?(position)
    if @board[position] == 'X' || @board[position] == 'O'
      true
    else
      false
    end
  end

  def valid_move?(position)
    if position >=0 && position <=8
      if @board[position] == ' '
        true
      end
    else
      false
    end
  end

  def turn
    puts "Hello! Please make your move (1-9)" #ask for input
    move = gets.chomp #get input
    index = input_to_index(move) #translate input into index
    if valid_move?(index) #if index is valid
      token = current_player
      move(index, token) #  make the move for index
      display_board #  show the board
    else
      puts "Hello! Please make your move (1-9)"
      move = gets.chomp#ask for input
    end
  end

  def won?
    WIN_COMBINATIONS.find do |indices| #values_at returns the values for the corresponding indices (* transforms the indices array to a list of arguments, so values_at(*[0,1,2]) becomes values_at(0,1,2)).
      values = @board.values_at(*indices)
      values.all?('X') || values.all?('O')#The block's 2nd line then checks whether these values are all 'X', or all 'O'. Once this evaluates to true, the loop breaks and find returns the matching element. (or nil if there was no match)
    end
  end

  def full?
    @board.all? do |full|
      full=="X" || full=="O"
    end
  end

  def draw?
    if full? && !won?
      true
    elsif won? == true
      false
    else
      false
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    won = won?
    if won != nil
      return @board[won[0]]
    end
  end

  def play
    until over? == true
      turn
    end
    if won?
      puts "Congratulations #{winner}!" #congratulate the winner
    elsif draw?
      puts "Cat's Game!"
    else
      false
    end
  end
end
