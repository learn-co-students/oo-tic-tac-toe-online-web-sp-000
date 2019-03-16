require 'pry'
class TicTacToe
  def initialize(board= nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [0, 3, 6],
    [3, 4, 5],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
    [6, 7, 8],
    [1, 4, 7]
    
    
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
  
   def move(index, player = "X")
     @board[index] = player  
    end
  
    def position_taken?(index)
       @board[index] != " "
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
       count = 0 
     @board.each do |index|
      if index == "X" || index == "O"
        count = count + 1 
      end
    end
      count 
    end 
    
    def current_player
      if turn_count.even?
      return "X" 
      else 
      return "O" 
      end
    end 
    
    def won?
       WIN_COMBINATIONS.detect do |combo|
         if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
           combo 
         end 
        end 

    end 
    
    def full?
      @board.all? {|index| index == "X" || index=="O"}
        
    end 
  
  
  
    def draw?
       full? && !won?
    end  
    
    def over?
      draw? || won?
    end 
    
    def winner 
      if !won?
        nil 
      else
        @board[won?[0]]
        binding.pry 
      end 
    end   
    
  #  def play
   #   until won? == true 
    #  turn 
     # end 
    #end
    
    
end