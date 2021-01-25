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
    won?
      puts "Congratulations !" 
end 

def over? 
    
      puts "Congratulations #{player}!" 
end 
 


def input_to_index(user_input)
  index = user_input.to_i
  array_index = index-1
end



def move(array_index, player)
  board[array_index] = player
end 
 
def position_taken?(array_index)
    board[array_index] != " " 
end 


def valid_move?(array_index)
  if array_index.between?(0,8) && !position_taken?(array_index) 
  end
end 

 
def turn
  over?
  user_input = gets.chomp 
  array_index = input_to_index(user_input)
  valid_move?(array_index)
  player = current_player 
  move(array_index, player)
  display_board 
end 

def won?
  # if draw?
  #   false 
   
  #   arrays = []
  #   arrays << WIN-COMBINATIONS
  #   arrays.each do |array|
  
  # index_1 = array[0]
  # index_2 = array[1]
  # index_3 = array[2]
   
#     position_1 = board[index_1]
#     position_2 = board[index_2]
#     position_3 = board[index_3] 
 
#     position_1 == position_2 && position_2 == position_3 && position_1 = "X" || position_1 == "O" 
#     return board
# end
#end 
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
  if turn_count >= 6 && !won?  ? false: true 
   end  
  end


def winner
  puts "Winner is #{player}."
end



def over?
  won? || full?
end 
end 
