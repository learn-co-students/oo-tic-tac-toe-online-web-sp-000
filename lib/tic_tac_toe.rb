class TicTacToe 
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
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
  
  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end 
  
  def move(position, token="X")
    @board[position] = token 
  end 
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true 
    else 
      false 
    end 
  end 
  
  def valid_move?(position)
    if position.between?(0, 8) && !position_taken?(position)
      true 
    else 
      false 
    end 
  end 
  
  def turn
    puts "Enter your postion (number 1-9)"
    user_input = gets.strip 
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      puts "Invalid move "
      turn 
    end 
  end 
  
  def turn_count
    @board.count {|turn| turn == "X" || turn == "O"}
  end 
  
  def current_player 
    if turn_count.even?
      "X"
    else 
      "O"
    end 
  end 
  
  def won? 
    WIN_COMBINATIONS.detect do |win_combo| 
      if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X") || 
         (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
        win_combo
      else 
        false 
      end 
    end 
  end 
  
  def full?
    @board.all? {|position| position.include?("X") || position.include?("O")}
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
    end 
  end 
  
  def winner 
    if won?
      @board[won?[0]]
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













