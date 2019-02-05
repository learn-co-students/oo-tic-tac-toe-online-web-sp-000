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
  
  def input_to_index(index)
    @index = index.to_i - 1
  end
  
  def move(index, player = "X")
    @board[index] = player
  end 
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && @board[index] != "X" && @board[index] != "O"
    if index.between?(0,8) && @board[index] != "X" && @board[index] != "O"
      return TRUE
    end
  end
  
  def turn_count
    counter = 0 
    @board.each do |spot_taken|
      if spot_taken == "X" || spot_taken == "O"
        counter += 1
      end
    end
  return counter
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
    input = gets.chomp
    index = input_to_index(input)
    
    if valid_move?(index)
      player = current_player
      move(index, player)
      #move(index, player = "X")
      display_board
    else 
      turn
    end
  end 
  
  def won?
    WIN_COMBINATIONS.each  do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif 
        position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combo
      elsif
        false
      end
    end
  
    if @board.all?{|i| i == " "}
      return false
    else
      @board.any?{|i| i == " "}
        return false 
    end
  end
  
  def full?
    if @board.all?{|i| i == "X" || i == "O"}
      return true
    else
      @board.any?{|i| i == " "}
        return false
    end
  end
  
  def draw?
    won? == false && full?
  end
  
  def over?
    if won? || draw? || full?
      return true 
    end
  end
  
  def winner
    if won?
      winning_array = won?
      i = winning_array[0]
      return @board[i]
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
       puts "Congratulations #{winner}!"
    else draw?
       puts "Cat's Game!"
    end
  end
end