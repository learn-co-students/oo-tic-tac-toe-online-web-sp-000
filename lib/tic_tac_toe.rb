class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = 
    [
      [0, 1, 2], #Top row
      [3, 4, 5], #Middle row
      [6, 7, 8], #Bottom row
      [0, 3, 6], #First column vertical
      [1, 4, 7], #Second column vertical
      [2, 5, 8], #Third column vertical
      [0, 4, 8], #First Diagonal
      [2, 4, 6]  #Second Diagonal
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
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end
  
  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    else
      false
    end
  end
  
  def turn
    puts "Please enter 1-9"
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
    count = @board.select {|i| i == "X" || i == "O"}
    count.length
  end
  
  def current_player
    turn_count % 2 == 0? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_arrays|
      pos1 = win_arrays[0]
      pos2 = win_arrays[1]
      pos3 = win_arrays[2]
      if @board[pos1] == "X" && @board[pos2] == "X" && @board[pos3] == "X" || @board[pos1] == "O" && @board[pos2] == "O" && @board[pos3] == "O"
      return win_arrays
      end
    end
  false
  end
  
  def full?
    if @board.include?(" ")
      false
    else
      true
    end
  end
  
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end
  
  def over?
    if won? || full? || draw?
      true
    else
      false
    end
  end
  
  def winner
    if won?
      winner = won?
      win_index = winner[0]
      @board[win_index]
    end
  end
  
  def play
    until over? 
      turn
    end
    if won?
      winning_player = winner
      puts "Congratulations #{winning_player}!"
      elsif draw?
      puts "Cat's Game!"
    end
  end
end