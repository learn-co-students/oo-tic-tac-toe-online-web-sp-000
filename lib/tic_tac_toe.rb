class TicTacToe 
  
  def initialize(board = nil)
    @board = board || board = Array.new(9, " ")
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
    
  def display_board
    separator = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts separator
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts separator
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
   user_input.to_i-1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(index)
    if (@board[index] ==  " " || @board[index] == nil)
      taken = false
    else
      taken = true
    end
  end 
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    counter = 0 
    @board.each do |value|
      if value == "X" || value == "O"
        counter += 1 
      end
    end
    return counter
  end
  
  def current_player
    num = turn_count
    if num % 2 == 0 
      return 'X'
    else 
      return 'O'
    end
  end 
  
  def turn
    puts "Please enter 1-9:"
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
    winning_combo = nil
    WIN_COMBINATIONS.each do |combo|
      position_1 = combo[0]
      position_2 = combo[1]
      position_3 = combo[2]
    if @board[position_1] == "X" && @board[position_2] == "X" && @board[position_3] == "X"
      winning_combo = combo
    elsif @board[position_1] == "O" && @board[position_2] == "O" && @board[position_3] == "O"
      winning_combo = combo
    end
  end
  winning_combo
  end
  
  def full?
    (@board).all? {|index| index == "X" || index == "O"}
  end
  
  def draw?
    if !won? && full?
      return true
    else won? && full?
      return false
    end
  end
  
  def over?
    if draw? || won? || full?
      return true
    else 
      return false 
    end
  end
  
  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end
  
  def play
    until over? == true
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end 
  end
end