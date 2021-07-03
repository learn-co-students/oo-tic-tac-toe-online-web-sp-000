require "pry"

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

   def move(index, token= "X")
     @board[index] = token
  end
  
    def position_taken?(index)
         @board[index] != "  " && @board[index] != " " && @board[index] != "" && @board[index] != nil
    end   
    
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end
     
    def turn_count
      count = 0 
        @board.each do |token|
          if token == "X" || token == "O"
          count += 1 
        end
      end
        return count
    end
     
    def current_player
      turn_count.even? ? "X" : "O"
    end
     
      def turn
        puts "Please enter 1-9:"
        user_input = gets.chomp
        index = input_to_index(user_input)
        if valid_move?(index)
          move(index, current_player)
          display_board
        else
          turn
        end
      end
     
    def won?
     WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
     
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
  
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination 
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O" 
        return win_combination
      else
       false
      end
    end
    end
     
    def full?
     @board.none? {|position| position == " " } 
    end
     
    def draw?
      full? && !won?
    end
     
    def over?
      full? || won? || draw?
    end
     
    def winner
       if location = won?
         index = location[0]
         return @board[index]
      end
    end 

  def play
    turn until over?
     
    if winner
      
    puts "Congratulations #{winner}!"
    else
    puts "Cat's Game!"
    end
   #binding.pry
   
  
   end
end