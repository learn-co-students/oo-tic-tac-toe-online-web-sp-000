class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  attr_accessor :board
  
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
  
  def move(index, value)
    @board[index] = value
  end
  
  def position_taken?(index)
    if @board[index] == " " ||@board[index] == ""
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true
    else
      false
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    counter
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
    
  def turn
    puts "Please enter 1-9:"
    
    input = gets
    index = input_to_index(input)
    
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo_array|
      if @board[win_combo_array[0]] == @board[win_combo_array[1]] && @board[win_combo_array[1]] == @board[win_combo_array[2]] && position_taken?(win_combo_array[0])
        win_combo_array
      end
    end
    false
  end
  
  def full?
    @board.all? |value|
      value != " "
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || full? || draw?
  end
  
  def winner?
    if won? && over?
      @board[won?[0]]
    else
      nil
    end
  end
  
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end