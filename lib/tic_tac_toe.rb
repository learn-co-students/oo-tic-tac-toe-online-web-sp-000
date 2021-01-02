class TicTacToe
  


WIN_COMBINATIONS = 
[
  
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]  
  
  def initialize
    @board= [" "," "," "," "," "," "," "," "," "]
  end

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
  
  
  def position_taken?(index)
    if @board[index] == "" || @board[index] == " "
      false
    else
      true
    end
  end
  
  def move(index, current_player)
   @board[index] = current_player
  end
  
def valid_move?(index)
  if !position_taken?(index) && index.between?(0,8)
    return true
  else false
    
  end
end



  def turn_count
    turn_num = 0
    @board.each do |space|
      if space == "X" || space == "O"
       turn_num +=1
      end
    end
    
  return turn_num
end


  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  
  
  def turn
  puts "Please enter 1-9:"
  input=gets.chomp
  index = input_to_index(input)
  if valid_move?(index)
    token = current_player
    move(index, token)
    display_board
    elsif won? == true || over? == true || draw? == true || full? == true
      play
  else
    turn
  end
end

  def won?
    board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else 
      WIN_COMBINATIONS.each do |combo| 
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
      end
      return false
  end
end

  def full?
     @board.all? { |i| i =="X" || i == "O"}
  end
  
  def draw?
    if full? == true && won? == false
      true
    else
      false
    end
  end
  
  def over?
    if draw? == true || won? == true || full? == true
      true
    else
      false
    end
  end

  def winner
  index = []
  index = won?
  if index == false
    nil
  else
    if @board[index[0]] == "X"
      "X"
    else
      "O"
    end
  end
end

  
  
  def play
    until over? == true
    turn
    over?
    won?
    draw?
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
end
    



end