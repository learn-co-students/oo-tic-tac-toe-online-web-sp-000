class TicTacToe
    attr_accessor :board
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
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
  
  def input_to_index(input)
     return input.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
  end
  end
  
  def valid_move?(index)
    if index.between?(0, 8)
      !position_taken?(index)
    else 
      return false
  end
  end
  
  def turn_count
  counter = 0
  @board.each do |moves| 
  if moves == "X" || moves == "O"
    counter += 1
  end
  end
  counter
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
    index = input_to_index(user_input)

     if valid_move?(index)
      move(index, current_player)
      display_board    
    else
      puts "Invalid move!"
      turn
    end
  end
  
  def won?
     WIN_COMBINATIONS.each do |win_combinations|
    if win_combinations.all? { |i| board[i] == "X" }
      return win_combinations
    elsif win_combinations.all? { |i| board[i] == "O"}
      return win_combinations
   end
  end
 FALSE
 end
 
def full?
  if @board.all? {|i| i == "X" || i == "O"}
    return true
  end
end

def draw?
    full? && !won?
  end

def over?
   if draw? || full?
      true
    elsif won? != false && won? != []
      true
    else
      false
  end 
  end 
  
  def winner
    if winnerr = won?
      @board[winnerr.first]
    end
  end
  
  def play
    until over? == true
      turn
    end

     if won?
      winner_name = winner
      puts "Congratulations #{winner_name}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end