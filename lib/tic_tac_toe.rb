class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
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
  
  #display_board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  #input_to_index
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  # move
  def move(index, current_player = "X")
    @board[index] = current_player
  end
  
  #position_taken?
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  # valid_move?
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  # turn
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
  
  # turn_count
  def turn_count
    count = 0 
    @board.each do |el|
      if el == "X" || el == "O"
        count += 1
      end
    end
    count
  end
  
  # current_player
  def current_player
    player = "X"
    if turn_count % 2 != 0
      player = "O"
    end
    player
  end
  
  # won?
  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] != " " && @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]
        return combo
      end
    end
    nil 
  end
  
  # full?
  def full?
    is_full = @board.all? do |el|
      el == "X" || el == "O"
    end
    is_full
  end
  
  # draw?
  def draw?
    is_draw = false 
    
    if full? && !won?
      is_draw = true 
    end
    
    is_draw
  end
  
  # over?
  def over?
    is_over = false 
    if won? || draw? || full?
      is_over = true 
    end
    is_over
  end
  
  # winner
  def winner
    if won?
      return @board[won?[0]]
    else
      return nil 
    end
  end
  
  # play
  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
end