class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [
    [0,1,2],  #Top row
    [3,4,5],  #Middle row
    [6,7,8],  #Bottom row
    [0,3,6],  #Left column
    [1,4,7],  #Middle column
    [2,5,8],  #Right column
    [0,4,8],  #Diagonal TL-BR
    [6,4,2]   #Diagonal BL-TR
  ]


  def initialize
    @board = Array.new(9, " ")
  end

#HELPERS
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def input_to_index(input)
  input.to_i - 1
end


def move(index, character)
    @board[index] = character
end


def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end


def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end


def turn_count
  turn = 0
  @board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn
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
    character = current_player
    move(index, character)
    display_board
  else
    turn
  end
end


def won?
  WIN_COMBINATIONS.each {|win_combo|
      index_0 = win_combo[0]
      index_1 = win_combo[1]
      index_2 = win_combo[2]

      position_1 = board[index_0]
      position_2 = board[index_1]
      position_3 = board[index_2]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
           return win_combo
     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combo
        end
      }
  return false
end


def full?
  !@board.include?(" ")
end


def draw?
  if won? == false && full? == true
    return true
  else
    return false
  end
end


def over?
  if won? || full? || draw?
    return true
  else
    return false
  end
end


def winner
  index = []
  index = won?
  if index == false
    return nil
  else
    if @board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end


def play
  until over? == true
    turn
  end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cat's Game!"
  end
end

end
