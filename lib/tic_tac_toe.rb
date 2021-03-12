class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],]
  
  def initialize(board = nil)
    @board = Array.new(9, " ")
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
  
  def move(index,token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
   (@board[index] == " ") ? false : true
  end
  
  def valid_move?(index)
    if index > 8 || index < 0
      return false    
    end
    
    if position_taken?(index)
      return false
    else
      return true
    end
  end
  
  def turn_count
    turns = @board.count { |x| x != " " } 
  end
  
  def current_player
    (turn_count % 2 == 0) ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    
    if valid_move?(index)
      move(index,current_player)
    else
      turn
    end
    display_board
  end
  
  def won?
    if turn_count <= 0
      return nil
    else
      WIN_COMBINATIONS.each do |win_combo| 
        if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X") || (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
          return win_combo
        end
      end
      return false
    end
  end
  
  def full?
    (turn_count == 9) ? true : false
  end
  
  def draw?
    (full? && !won?) ? true : false
  end
  
  def over?
    (draw? || won?) ? true : false
  end
  
  def winner
    w_index = won?
    if w_index
      return @board[w_index[0]]
    else
      return nil
    end
  end
  
  def play
  
    while !over? do
      turn
    end
  
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end