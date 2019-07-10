class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    [0, 4, 8], # \ diagonal
    [2, 4, 6] # / diagonal
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
  
  def input_to_index (input)
    return input.to_i - 1
  end
  
  def move (index, token = "X")
    @board[index] = token
  end
  
  def position_taken? (index)
    return false if @board[index] == " " || @board[index] == "" || @board[index] == nil
    true
  end
  
  def valid_move? (index)
    return true if index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn_count
    count = 0
    @board.each do |position|
      count += 1 if position == "X" || position == "O"
    end
    count
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
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
  
  #Endgame methods
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board.values_at(win_combination[0], win_combination[1], win_combination[2]) == ["X", "X", "X"]  || @board.values_at(win_combination[0], win_combination[1], win_combination[2]) == ["O", "O", "O"]
    end
  end
  
  def full?
    !@board.find {|position| position == " "}
  end
  
  def draw?
    return true if !won? && full?
    false
  end
  
  def over?
    return true if won? || draw? || full?
    false
  end
  
  def winner
    return @board[won?[1]] if won?
  end
  
  def play
    turn until won? || over?
    if won?
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end
  end
  
end
