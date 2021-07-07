class TicTacToe
  
  WIN_COMBINATIONS = 
  [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]
  
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
    user_input.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
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
    counter = 0 
    @board.each do |i|
      if i == "X" || i == "O"
        counter += 1
      end
    end
   counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
        return win_combination
      end 
    end
    return false
  end
  
  def full?
    @board.none? { |position| position == " "}
  end
  
  def draw?
    if full? && !won?
      return true
    end
    return false
  end
  
  def over?
    if won? || draw?
      return true
    end
    return false
  end
  
  def winner
    winning_array = won?
    if winning_array
      winning_location = winning_array[0]
      @board[winning_location]
    end
  end
    
  def play
    until over?
    current_player
    turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
end