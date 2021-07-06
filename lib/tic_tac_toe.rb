class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], # top row 
  [3,4,5], # middle row 
  [6,7,8], # bottom row 
  [0,3,6], # 1st column
  [1,4,7], # 2nd column 
  [2,5,8], # 3rd column
  [0,4,8], # Left-right diagonal
  [2,4,6], # right-left diagonal
  
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
  
  def move(position, current_player)
    @board[position] = current_player
  end
  
  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end
  
  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end
  
  def turn_count
    turn_count = 0 
    @board.each do |element|
    turn_count += element.count("X" + "O")
    end
    return turn_count
  end 
  
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    position = input_to_index(user_input)
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
     turn
    end
  end
  
  
  def won?
    winning_array = WIN_COMBINATIONS.detect do |win|
      if win.all? {|index|       #when block is used within if must use curly braces
        @board[index] == "X"}

        winning_array.inspect
    
      elsif win.all? {|index|
        @board[index] == "O"}
    
        winning_array.inspect
      end
    end
  end
  
  def full?
    @board.all? {|index|
      index == "X" || index == "O"}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
  draw? || won?
  end
  
  def winner
    WIN_COMBINATIONS.detect do |win|
      if win.all? {|index|
        @board[index] == "X"}
      return "X"
    
      elsif win.all? {|index|
        @board[index] == "O"}
      return "O"
      end
    end
  end
  
  def play
    until over?
      turn
    end
  
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end 