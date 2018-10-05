 require 'pry'
 class TicTacToe

       attr_accessor :board, :index,



   def initialize(board = nil)
     @board = @board || Array.new(9, " ")
   end




   def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end


  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,4,8], [2,4,6],
    [0,3,6], [1,4,7], [2,5,8]
  ]


  def input_to_index(user_input)
    @index = user_input.to_i
    @index = @index - 1
    return @index
 end

  end

  def position_taken?
    if @board[@index] == " " || @board[@index]==""|| @board[@index]== nil
      taken = false
    end
  return taken
  end

  def self.move
   @board[@index]="X"
  end



  def valid_move?
    valid = false
      if !position_taken? && @index.Range(0,8)
        valid = true
      end
    return valid
  end

  def turn_count
  counter = 0
  @board.each do |x|
    if x == "X" || x == "O"
      counter += 1
    end
  end
  return counter
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  input_to_index
    if valid_move?
      move(board, index, current_player(board) )
      move
      display_board
    elsif !valid_move?
      puts "Please enter 1-9:"
      user_input = gets.strip
      input_to_index
    end
end


def won?
  won = false
    WIN_COMBINATIONS.each do |win_combination|
      if (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
        return win_combination
      elsif
        @board == [" "," "," "," "," "," "," "," "," "]
    end
 end
 return won
end


def full?
  full = false
  @board.all? do |index|
    if index == "X" || index == "O"
      full = true
    end
  full
end





 def draw?
   drew = false
     if !won?(@board) && full?(@board)
       drew = true
       print "Cat's Game!"
     end
   return drew
end


def over?
  over = false
    if won? || full? || draw?
      over = true
    end
  return over
end


def winner
  win = nil
  WIN_COMBINATIONS.each do |win_combination|
    if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
      win = "X"
    elsif  @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
      win = "O"
    end
  end
  return win
end

def play
  until won?
    turn
  end
    if won? && !draw?
      winner
    end
end

end
