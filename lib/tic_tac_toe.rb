class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  
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
  
  def move(index,mark = "X")
    @board[index] = mark
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count {|mark| mark == "X" || mark == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
    combination.all? {|win_index| @board[win_index] == "X"} ||   combination.all? {|win_index| @board[win_index] == "O"}
    end
  end

  def full?
    @board.all? {|space| space == "X" || space == "O"}
  end
  
  def draw?
    full? && !won? 
  end
  
  def over?
    won? || draw?
  end

  def winner
    if won?.class == Array
      @board[won?[0]]
    end
  end

  def play
    until over? do
      turn
    end
    if won?
      puts  "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end







