require 'pry'

class TicTacToe
  attr_accessor :board,:TicTacToe 
  
WIN_COMBINATIONS = [ 
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8], 
[0, 4, 8],
[6, 4, 2]
] 
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    count = 0 
    board.each do |entry|
     if entry == "X" || entry == "O" 	     
       count +=1 
      end 
    end 	   
    count
end 	

 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def play
    turn 
    draw?
    over? 
    won?(array_index)
      puts "Congratulations !" 
      over?
end 


def input_to_index(user_input)
 user_input.to_i - 1
end


 
def move(array_index, player)
  board[array_index] = player
end 


 
def position_taken?(array_index)
    board[array_index] != " " 
end 


def valid_move?(array_index)
  if array_index.between?(0,8) && !position_taken?(array_index)
    true 
  end
end 
 
 
def turn
  user_input = gets.chomp
  array_index = input_to_index(user_input)
   #over?
  if !valid_move?(array_index)
    #goes back to the beginning of the turn method to get another user_input
    turn 
  end 
  player = current_player 
  move(array_index, player) 
  display_board 
end 
 


def won?
    WIN_COMBINATIONS.each do |array|
   if board[array[0]] == board[array[1]] && board[array[1]] == board[array[2]] && board[array] != " "
    puts winning_combination = array
end 
end 
end 


  # it 'returns false for a draw' do
  # it 'returns the winning combo for a win' do
  #       game = TicTacToe.new
  #       board = ["X", "O", "X", "O", "X", "O", "O",  "X", "X"]
  #       game.instance_variable_set(:@board, board)

  #       expect(game.won?).to contain_exactly(0,4,8) 
 


def full?
  board.each do |element|
    if element.include? " " 
    end
  end
end 


def draw? 
  # if turn_count >= 6 && !won? 
  # end  
  end


def winner
  puts "Winner is #{player}."
end



def over?
  won? || full?
end 
end 
