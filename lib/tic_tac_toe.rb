class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    converted_input = user_input.to_i - 1
  end
  
  def move(input, char)
    @board[input] = char
  end 
  
  def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else
    true
  end
end
  
  def valid_move?(index)
  if !index.between?(0, 8)
    false
  elsif position_taken?(index) == false
    true
else
    false
  end
end
  
  def turn_count
  @board.select.count do |count|
    count == "X" || count == "O"
  end
end

  def current_player
  if turn_count.even? == true
    return "X"
  else
    "O"
  end
end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
      if !valid_move?(index)
    turn
  end
    move(index, current_player)
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.each do |wincombo|
      if (@board[wincombo[0]]) == "X" && (@board[wincombo[1]]) == "X" && (@board[wincombo[2]]) == "X"
    return wincombo
      elsif (@board[wincombo[0]]) == "O" && (@board[wincombo[1]]) == "O" && (@board[wincombo[2]]) == "O"
    return wincombo
      end
    end
  false
end
  
  def full?
  @board.all? do |position|
    position == "X" || position == "O"
  end
end

  def draw?
  !won? && full?
end

  def over?
  if won? != false || draw? == true || full? == true
    return true
  else
    false
  end
end

def winner
  if won?
    return @board[won?[0]]
  end
end

def message
  if winner != nil
    puts "Congratulations #{winner}!"
  else
    if winner == nil
      puts "Cat's Game!"
  end
end
end

 def play
  if over?
    message
  else
    turn
    play
  end
end
  
end

