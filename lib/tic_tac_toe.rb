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
    [6,4,2]
  ]
  
    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} |"
    end

  def input_to_index(input)
    index = input.to_i-1
  end
  
  def move(index, player_token = "X")
    @board[index] = player_token 
  end
  
  
  def position_taken?(index)
    if (@board[index] == "X") || (@board[index] == "O")
      true 
    else
      false 
    end
  end 
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
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
  
  
  def turn_count
    turn_counter = 0
    @board.each do |player_input|
      if player_input == "X" || player_input == "O"
        turn_counter += 1
      end
    end
    turn_counter
  end 
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end 
  end
  
  
  def won?
    WIN_COMBINATIONS.find do |winner|
      if (@board[winner[0]]) == "X" && (@board[winner[1]]) == "X" && (@board[winner[2]]) == "X"
        return winner
      elsif
      (@board[winner[0]]) == "O" && (@board[winner[1]]) == "O" && (@board[winner[2]]) == "O"
      return winner
    end 
  end
end

def full?
  if @board.include?(" ")
    false
  else
    true
  end
end

  def draw?
    full? && !won?
  end

def over?
  draw? || won? || full?
end

def winner
  if won?
    @board[won?[0]]
  end 
end

def play
  
  while over? == false
  turn
end

if won?
  puts "Congratulations #{winner}!"
else draw?
  puts "Cat's Game!"
end
end



  
end 
    
  
    
  
  
    