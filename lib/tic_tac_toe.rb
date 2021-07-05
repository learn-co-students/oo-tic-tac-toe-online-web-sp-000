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
  
  def move(index, current_player = "X")
   @board[index] = current_player
  end
  
  def position_taken?(location)
   @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
   counter = 0
    @board.each do |turn|
     if turn == "X" || turn == "O"
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
    input = gets.strip
    index = input_to_index(input)
     if valid_move?(index)
       move(index, current_player)
       display_board
     else turn
    end
   end 
  
  def won?
    WIN_COMBINATIONS.detect do |combination|
     win1=combination[0]
     win2=combination[1]
     win3=combination[2]
    # looping and saving first 3 numbers in each array to variables using [indexes]
      @board[win1] == @board[win2] && @board[win2] == @board[win3] && @board[win1] != " "
    # using variables with board array numbers (winning numb) to check if they match
    end  
  end
  
  def full?
  @board.none? {|i| i==" " }
  end
  
  def draw?
   !won? && full? 
   if !won? && full?
      return true
      elsif !won? && !full?
      return false
      elsif won?
      return false
    end  
  end

  def over?
   if won?
      return true
      elsif draw?
        return true
        elsif full?
          return true
    end
  end

  def winner
   win_combination = won?
   if win_combination
      winning_location = win_combination[0]
      @board[winning_location]
    else
      nil
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
       puts "congratulations!"
      elsif draw?
       puts "draw!"
        end
      end
end