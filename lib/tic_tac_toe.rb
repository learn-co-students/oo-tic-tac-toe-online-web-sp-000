class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end

WIN_COMBINATIONS =[
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
    user_input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0 
    @board.each do |space| 
     if space == "X" || space == "O"
      counter += 1 
     end
    end
    counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter a number (1-9):"
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
    WIN_COMBINATIONS.detect do |win_combination|
     win_index_0 = win_combination[0]
     win_index_1 = win_combination[1]
     win_index_2 = win_combination[2]
    
     position_0 = @board[win_index_0]
     position_1 = @board[win_index_1]
     position_2 = @board[win_index_2]
    
     position_0 == position_1 && 
     position_1 == position_2 && 
     position_taken?(win_index_0)
    end
  end
   
  def full?
    @board.all?{|index| index != " "} 
  end
  
  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end
  
  def winner
    if win_combo = won?
    @board[win_combo[0]]
    end
  end
  
  def play
    until over?
     turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
    
end 