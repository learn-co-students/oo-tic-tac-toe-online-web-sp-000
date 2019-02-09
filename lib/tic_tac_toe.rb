class TicTacToe
  def initialize(board=nil)
    @board=board||[" "," "," "," "," "," "," "," "," "]
  end
  
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

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

def move(index, current_player="X")
  @board[index] = current_player
end
  
  def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count()
  count=0
  @board.each do |space|
    if(space=="X"||space=="O")
      count+=1
end
end
return count
end

def current_player
  number=turn_count

    if(number%2==0)
      return "X"
    else
      return "O"
    
  end
end

def turn()
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn()
  end
end

def won?()
  WIN_COMBINATIONS.each { |win_comb|
    if(@board[win_comb[0]]=="X" && @board[win_comb[1]]=="X" && @board[win_comb[2]]=="X")
      return win_comb
      elsif(@board[win_comb[0]]=="O" && @board[win_comb[1]]=="O" && @board[win_comb[2]]=="O")
      return win_comb
    end
  } 
      return false
  
end

def full?()
  @board.all? {|position|
  position=="X" || position=="O"
  }
end

def draw?()
  if(full?()&&!won?())
    return true
  else
    return false
  end
end

def over?()
  if(won?()||draw?()||full?())
    return true
  else
    return false
  end
  
end

def winner()
  if(won?()==false)
    return nil
  elsif(@board[won?[0]]=="X")
    return "X"
    else(@board[won?[0]]=="O")
    return "O"
 
  end
end

def play()
  until over?() == true
    turn()
  end

  if won?()
    puts "Congratulations #{winner}!"
  elsif draw?()
    puts "Cat's Game!"
  end
end

end