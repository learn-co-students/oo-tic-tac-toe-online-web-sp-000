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
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end 
  
  def move(index, token = "X")
    @board[index] = token
  end 
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end 
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true 
    end
  end 
  
  def turn_count
    number_of_turns = 0 
    @board.each do |space|
      if space == "X" || space == "O"
        number_of_turns += 1
      end 
    end 
    number_of_turns
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
        return win_combo
      end 
    end 
    false
  end
  
  def full?
    if @board.any? {|index| index == "" || index == " " || index == nil}
      false 
    else
      true 
    end
  end 
  
  def draw?
    if !won? && full?
      true 
    end
  end 
  
  def over?
    if won? || draw? || full?
      true 
    end
  end 
  
  def winner
    if won?
      @board[won?[1]]
    end
  end 
  
  def play 
    until over? == true
      turn
      won?
      draw?
    end
    if won?
      winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end 
  end 
  
end 