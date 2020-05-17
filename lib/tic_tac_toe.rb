class TicTacToe
  def initialize
    @board=[" ", " "," "," "," ", " "," "," "," "]
  end
  WIN_COMBINATIONS=[[0,1,2],[0,4,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]]
  def display_board
    ii=0 
    while(true)
    puts " #{@board[ii]} | #{@board[ii+1]} | #{@board[ii+2]} "
    if (ii==6)
      break
    end
    puts "-----------"
    ii+=3
    end
  end
  def input_to_index(input)
    input_as_num=input.to_i() - 1
    return input_as_num
  end
  
def move(index, player="X")
  @board[index]=player
end
def position_taken?(index)
  if @board[index] == " "
    return false 
  else 
    return true 
  end 
end

def valid_move?(index)
  if (position_taken?(index) == false && index <9 && index>=0)
    return true 
  else 
    return false 
  end
end

def turn 
  while(true)
  puts "please input a move"
  input=gets.chomp  
  index = input_to_index(input)
  if (valid_move?(index))
    player = current_player()
    move(index,player)
    display_board
    break
  else 
    puts 'invalid move'
    next 
   end
  end
end


def turn_count()
  turn = 9 
  ii = 0 
  while (ii<9)
    if (@board[ii]==" ")
      turn -= 1 
    end 
    ii+=1
  end
  return turn 
end
def current_player()
  current_round=turn_count()
  
  if (current_round%2 == 0)
    return "X"
  else 
    return "O"
  end
end

def won?()
  ii=0
  while (ii<8)
    win_attempt=WIN_COMBINATIONS[ii]
    if (@board[win_attempt[0]]== @board[win_attempt[1]] && @board[win_attempt[1]]==@board[win_attempt[2]] && @board[win_attempt[0]] != " ")
      return win_attempt
    end
    ii +=1
  end
  return false 
end 

def full?
  ii=0 
  while(ii<8)
    if @board[ii]== " "
      return false
    else 
      ii+=1
    end
  end
  return true
end

def draw?
  if (full?() == true && won?() == false)
    return true
  else 
    return false
  end
end

def over? 
  if( won?() != false || draw?() == true )
    return true 
  else 
    return false
  end
end

def winner()
  board_won_on=won?()
  
  if (board_won_on == false)
    return nil
    
  else 
    winner_is_you=board_won_on[1]
    winner_name = @board[winner_is_you]
    return winner_name
  end
end 
  def play 
    while(over? == false)
      turn()
      
    end
    if (won?)
       person = winner()
       puts "Congratulations #{person}!"
    elsif (draw?())
      puts "Cat's Game!"
    end
  end 
    
    
 end