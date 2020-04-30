
class TicTacToe 
  
  def initialize
    @board = Array.new(9, " ")
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
    user_input.to_i - 1
  end
  
  def move(index, token="X")
    @board[index] = token 
  end
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    counter = 0 
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1 
      else
        counter += 0 
      end
    end
    return counter 
  end
  
  def current_player
    if turn_count.even? 
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
      value = current_player
      move(index, value)
      display_board
    else 
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combination|
      position_taken?(combination[0]) && (@board[combination[0]] == @board[combination[1]]) && (@board[combination[1]] == @board[combination[2]])
    end
  end
  
  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end
  
  def draw?
    full? && !won?
  end


  def over?
    full? || draw? || won?
  end

  def winner
    if won?
      winning_array = won?
      @board[winning_array[0]]
    else 
      return nil 
    end
  end

  def play
    until over?
      turn
    end
    if won?
      player = winner
      puts "Congratulations #{player}!"
    else 
      puts "Cat's Game!"
    end
  end


  
end