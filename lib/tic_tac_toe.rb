class TicTacToe
  
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
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
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
  
  def move(index, current_player = "X")
    @board[index] = current_player
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
    turns = turn_count
      if turns % 2 == 0
       player = "X"
      else
       player = "O"
    end
     return player
  end 
  
  def turn 
    puts "Please choose a number 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
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
    @board.all? {|index| index == "X" || index == "O"}
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end
  
  def play
    while over? == false
    	turn
    end

    if draw?
    	puts "Cat's Game!"
    elsif winner == "X" 
    	puts "Congratulations X!"
    elsif winner == "O"
    	puts "Congratulations O!"
    end
  end
  
end