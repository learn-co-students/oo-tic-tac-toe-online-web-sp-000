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
  
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end
  
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
    if @board[index] == " " || @board[index] == "" || @board[index] == nil 
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true 
    else
      return false
    end
  end
  
  def turn_count
    count = 0
    @board.each do |spaces|
      if spaces == "X" || spaces == "O"
      count += 1 
      end
    end
    count
  end
  
  def current_player 
    if turn_count % 2 == 0 
      return "X"
    else
      return "O"
    end
  end
  
  def turn
    puts "Make your move by entering a number 1-9. 1 is in the upper left corner. 9 is in the lower right corner."
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end
  
  def full?
    @board.all? do |space|
      space == "X" || space == "O"
    end
  end
  
  def draw?
    if full? and !won?
      return true
    end
  end
  
  def over?
    if won? || draw?
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
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end