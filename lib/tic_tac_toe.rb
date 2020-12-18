class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
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
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end
    
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil 
      return false 
    elsif @board[index] == "X" || @board[index] == "O"
      return true 
    end
  end
  
  def valid_move?(index)
    if !position_taken?(index) && (index).between?(0,8)
      true
    else
      false
    end
  end
  
  def turn_count
    count = 0 
    @board.each do |token|
      if token == "X" || token == "O"
        count += 1
      end
    end
    count
  end
  
  def current_player
    turn_count % 2 == 0? "X" : "O" 
  end
  
  def turn
    puts "Please enter 1-9:"
    user_input = gets.chomp()
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |single_combo|
      win_index_1 = single_combo[0]
      win_index_2 = single_combo[1]
      win_index_3 = single_combo[2]
      
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      
      if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
        return single_combo
      end
    end
    
    return false
  end
  
  def full?
    if @board.any?{|index| index == " " || index == nil}
      return false 
    else 
      true
    end
  end
      
  def draw?
    if full? && !won?
      return true 
    elsif !full? && !won?
      false
    elsif won?
      false
    end
  end
    
  def over?
    if full? || won? || draw?
      true 
    else 
      false 
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
      display_board
    end
    
    if won?
      winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  
end