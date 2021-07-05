class TicTacToe
   attr_accessor  :display_board

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
  def initialize(board = nil)
      @board = board || Array.new(9, " ")



  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
#####################################################
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
######################################################
  def input_to_index(user_input)
    user = user_input.to_i
    user -= 1
  end
#######################################################
  def move(index,player)
      @board[index] = player
  end
######################################################
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
####################################################
  def valid_move?(index)
    if position_taken?(index) == true
          false
    elsif index < 0 || index > 9
         false
    else
           true
     end
  end
#####################################################
  def turn
      puts "Please enter 1-9:"
     index = gets.strip
     interger = input_to_index(index)
     valid = valid_move?(interger )
     if valid == false
     puts "Please enter 1-9:"
        gets.strip
    else
      playing =  current_player
      move(interger,playing)
    end
    puts display_board
  end
#########################################################
  def won?
       if @board[0] == "X" && @board[1] == "X" && @board[2] == "X" ||   @board[0] == "O" && @board[1] == "O" && @board[2] == "O"
              WIN_COMBINATIONS[0]
        elsif @board[3] == "X" && @board[4] == "X" && @board[5] == "X" || @board[3] == "O" && @board[4] == "O" && @board[5] == "O"
              WIN_COMBINATIONS[1]
        elsif @board[6] == "X" && @board[7] == "X" && @board[8] == "X" || @board[6] == "O" && @board[7] == "O" && @board[8] == "O"
              WIN_COMBINATIONS[2]
        elsif @board[0] == "X" && @board[3] == "X" && @board[6] == "X" || @board[0] == "O" && @board[3] == "O" && @board[6] == "O"
              WIN_COMBINATIONS[3]
        elsif @board[1] == "X" && @board[4] == "X" && @board[7] == "X" || @board[1] == "O" && @board[4] == "O" && @board[7] == "O"
             WIN_COMBINATIONS[4]
       elsif @board[2] == "X" && @board[5] == "X" && @board[8] == "X"  || @board[2] == "O" && @board[5] == "O" && @board[8] == "O"
             WIN_COMBINATIONS[5]
       elsif @board[0] == "X" && @board[4] == "X" && @board[8] == "X"  || @board[0] == "O" && @board[4] == "O" && @board[8] == "O"
             WIN_COMBINATIONS[6]
       elsif @board[6] == "X" && @board[4] == "X" && @board[2] == "X"  || @board[6] == "O" && @board[4] == "O"  && @board[2] == "O"
            WIN_COMBINATIONS[7]
       else
            nil
       end
end
##############################################################
def  full?
  board_valid = true
  @board.all? do |not_emty|
      if not_emty != " "
         board_valid = true
      else
          board_valid = false
      end
  end
  board_valid
end
############################################################
def draw?
  if won?.class == Array
       return false
    elsif full? == true
        return true
    else
            false
    end
  end
#########################################################
 def over?
   if full? == true
       true
   elsif full? == true && won?.class == Array
       true
   elsif full? == false && won?.class == Array
         true
   else
         false
   end
 end
#########################################################
def winner
  won = won?
  if won == nil
   return nil
   else
    return @board[won[0]]
     puts @board[won[0]]
   end
  end
#########################################
def play

counter = 0
loop do
  counter += 1
  if won?.class == Array


     if winner == "O"
        puts "Congratulations O!"
     elsif  winner == "X"
        puts "Congratulations X!"
      end
 else
     if draw? == true
        puts "Cat's Game!"
      else
          over?
          turn
          draw?
    end
 end
if counter >= 10
  break
end
end
 end
 end
