class TicTacToe
  #initialize
  #assigns an instance variable @board to array with 9 blank spaces " "    
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  #define WIN_COMBINATIONS constant within ttt class = to nested array filled
  #with winning combinations
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

  
  def display_board
    #define method that prints current board based on @board inst variable
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  #input_to_index method 
  def input_to_index(user_input)
    user_input.to_i - 1 
  end
  
  #move method  
  def move(index, token = "X")
    @board[index] = token 
  end

  #position_taken?
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false 
    end 
  end

  #valid_move? method that accepts a position to check and returns true
  #if move is valid, false or nil if not
  def valid_move?(index)
    if position_taken?(index)
      false
    elsif index < 0 || index > 8
      false
    else
      true 
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end 
  end 
  
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end 
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      return win_combination
    else
      # do nothing
    end
  end
    return nil
  end
  
  def full?
    @board.all?{|occupied| occupied != " "}
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end 
  end
  
  def over?
    if draw? || won?
      true
    else
    end
  end

  def winner
    if won?
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      else 
        #do nothing 
      end
    end
    else
    return nil 
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
    else
    end 
  end
end 