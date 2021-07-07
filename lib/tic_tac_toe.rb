class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
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
  
  def move(index, player_token = "X")
    @board[index] = player_token
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)  
    @board[index] == " " && index.between?(0, 8) == true
  end
  
  def turn_count
    @board.count{|x| x == "X" || x == "O"}
  end
  
  def current_player
    if turn_count % 2 == 0
      player = "X"
    else
      player = "O"
    end
    return player
  end
  
  def turn
    puts "Please choose a number 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, player_token = current_player)
    else
      turn
    end
    display_board
  end
  
  
  def won?
    WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
  end
  
  def full?
    @board.each do |x|
      if x == "X" || x == "O"
        true
      elsif x == " "
        return false
      else 
        true
      end
    end
  end 
  
  def draw?
    !won? && full? ? true : false
  end
  
  def over?
    won? || draw? || full? ? true : false
  end
  
  def winner
    index = [@board]
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
    until over?
      turn
    end

     if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end