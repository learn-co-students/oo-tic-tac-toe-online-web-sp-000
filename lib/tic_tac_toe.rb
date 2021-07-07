class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(index)
    @index = index.to_i - 1
  end  
  
  def move(index, char = "X")
    @board[index] = char
  end
  
  def position_taken?(index)
    if (@board[index] == " " || @board[index] == "")
      return FALSE
    elsif @board[index] == NIL
      return FALSE
    else 
      return TRUE
    end
  end
  
  def valid_move?(index)
    if index.between?(0, 8) && position_taken?(index) == FALSE
      return TRUE
    end
  end  
  
  def turn 
    puts "Please enter 1-9: "
    input = gets
    input = input_to_index(input)
    if valid_move?(input) == TRUE
      move(input, current_player)
      display_board
    else
      turn
    end  
  end 
  
  def turn_count
    counter = 0 
    @board.each do |char|
      if (char == "X" || char == "O")
        counter += 1 
      end
    end
    return counter
  end
  
  def current_player
    turn = turn_count
    if turn % 2 == 0 
      return "X"
    else
      return "O"
    end
  end
  
  def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_1 = win_combination[0]
    win_2 = win_combination[1]
    win_3 = win_combination[2]
      
    pos_1 = @board[win_1]
    pos_2 = @board[win_2]
    pos_3 = @board[win_3]

  if(pos_1 == "X" && pos_2 == "X" && pos_3 == "X")
    return win_combination
  elsif(pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
    return win_combination
  end 
end
return false
end 

def full?
  @board.each do |pos|
    if(pos == " ")
      return false
    end  
  end  
end

def draw?
  full? && !won? 
end

def over?
  won? || draw? || full?
end
  
def winner
  if won? == false
    return nil
  else
    win = won?
    return @board[win[0]]
  end  
end

def play
  until over?
    current_player
    turn
    turn_count
  end
  if won?
    char = winner
    puts "Congratulations #{char}!"
  elsif
    draw?
    puts "Cat's Game!"
  end  
end  
end  