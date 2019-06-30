require "pry"
class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def initialize
    #your initialize method should set a @board variable equal to a new, empty array that represents the game board.
    @board = Array.new(9, " ")
    @display_board = display_board
  #  @play = play
    @board
    @display_board
  #  @play
  end

  def display_board
    #=> Define a method that prints the current board representation based on the @board instance variable.
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(user_input)
     #=> can pass user input and have it return to us the corresponding index of the @board array.
     index = user_input.to_i - 1
    # @instance_index = index
   end

   def move(position, token = "X")
     @board[position] = token
   end

   def position_taken?(index)
     !(@board[index] == "" || @board[index] == " " || @board[index] == nil)
   end

   def valid_move?(index)
     (index.between?(0,8) && !(position_taken?(index)))
   end

   def turn
     puts "Please enter 1-9:"
     #captures the user input.
     input = gets.strip
     index = input_to_index(input)
     token = current_player
     if valid_move?(index) == true
       move(index, token)
       display_board
     else
       puts "Invalid Entry"
       turn
     end
   end

   def turn_count
     counter = 0
     @board.each do |token|
       if token == "X" || token == "O"
         counter += 1
       end
     end
     counter
   end

   def current_player
     if turn_count.even?
      "X"
     else
      "O"
     end
   end

   def won?
    WIN_COMBINATIONS.detect do |location|
     slot1 = location[0]
     slot2 = location[1]
     slot3 = location[2]
     @board[slot1] == @board[slot2] && @board[slot2] == @board[slot3] && @board[slot1] != " "
    end
   end

   def full?
     @board.all? { |slot| slot != " " }
   end

   def draw?
     full? && !won?
   end

   def over?
     full? || draw? || won?
   end

   def winner
     if win_combination = won?
       winning_location = win_combination[0]
       @board[winning_location]
     end
   end

   def play
     winner_is = current_player
     count = 1
     turn until over?
     if winner
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cat's Game!"
     else
       until over? == true || won? != false do
         puts count
         count +=1
         turn
       end
     end
end






end
