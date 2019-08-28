class TicTacToe
 
 def initialize(board = nil)
   @board = board || Array.new(9, " ")
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input) 
    converted_input = user_input.to_i 
    converted_input -= 1 
    converted_input
  end
  
  def move(index, current_player) 
    @board[index] = current_player
    @board
  end
  
  def position_taken?(index) 
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index) 
    if position_taken?(index) 
      false 
    elsif index.between?(0, 8) 
      true 
    else 
      false 
    end 
  end
  
  def turn_count
    @board.count { |token| token == "X" || token == "O" }
  end
  
  def current_player
    if turn_count % 2 == 0 
      "X" 
    else 
      "O" 
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
      if valid_move?(index)
        token = current_player
        move(index, token)
        display_board
      else
        turn
      end
  end
  
  def won? 
    WIN_COMBINATIONS.detect do | win_combination |
      win_index_1 = win_combination[0] 
      win_index_2 = win_combination[1] 
      win_index_3 = win_combination[2] 
      
      @board[win_index_1] == @board[win_index_2] &&
      @board[win_index_2] == @board[win_index_3] && 
      @board[win_index_1] != " " 
    end 
  end
  
  def full? 
    @board.none? { |position| position == " " } 
  end
  
  def draw? 
    full? && !won? 
  end
  
  def over? 
    won? || draw? 
  end 
  
  def winner
    if winner = !won?
      nil
    else
      who_won = @board[won?[0]]
    end
    
    if who_won == "X"
      "X"
    elsif who_won == "O"
      "O"
    end
  end
  
  def play
    if !over?
      turn
      play
    elsif over?
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
  end
  
end