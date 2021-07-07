class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row 
  [3,4,5], # Middle row 
  [6,7,8], # Bottom row 
  [0,3,6], # left column 
  [1,4,7], # middle column 
  [2,5,8], # right column 
  [0,4,8], # diag topleft 
  [2,4,6]  # diag botleft
 ]
 
 def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end
  
  def move(index, players_token = "X")
    @board[index] = players_token
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end  

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input) 
    if valid_move?(index) == false 
      puts "Invalid move."
      turn
    else
      move(index, players_token = current_player)
      display_board
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X") || (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
      return win_combo 
      end
    end
    false
  end
  
  def full?
    !@board.any?{|x| x == " "}
  end  
  
  def draw?
    if full? == true && won? == false
      true
    else
      false
    end
  end
  
  def over?
    if won? || draw?
      true
    else
      false
    end
  end 
  
  def winner
    winning_combo = won?
    if winning_combo
      @board[winning_combo[0]]
    else 
      nil
    end
  end
  
  def play
    until over? 
      turn
    end
    if won?
      winner == "X" || winner == "O" 
      puts "Congratulations #{winner}!" 
    elsif draw?
      puts "Cat's Game!" 
    end 
  end
  
end