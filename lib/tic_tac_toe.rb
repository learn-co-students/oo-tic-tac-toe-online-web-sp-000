class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," ",]
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]

  #won
  def won?
  WIN_COMBINATIONS.detect do |winning_combo|
    position_1 = @board[winning_combo[0]]
    position_2 = @board[winning_combo[1]]
    position_3 = @board[winning_combo[2]]
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return winning_combo
  elsif
    position_1 == "O" && position_2 == "O" && position_3 == "O"
      return winning_combo
    else
    false
  end
  end
  end
  #full?

  def full?
    if @board.any? {|i| i == nil || i == " "}

      return false
    else
      return true

    end
  end

  #draw?

  def draw?
    if full? == true && !won?
      return true
    else
      return false
    end
  end

  #over?

  def over?
    if draw? || full? || won?
      return true
    else
      return false
    end
  end
  #winner


  def winner
    if won?
      return @board[won?[0]]
    else
      nil
  end
  end



  def display_board
    row1 = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    row2 = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    row3 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    divider = "-----------"
  puts row1
  puts divider
  puts row2
  puts divider
  puts row3
  end



  def move(index, current_player)
      @board[index] = current_player
  end



  def position_taken?(index)
    if @board[index] == ("") || @board[index] == (" ") || @board[index] == nil
      return false
    else @board[index] == ("X") || @board[index] == ("O")
      return true
    end
  end




  def input_to_index(input)
   input.to_i - 1
  end




  def valid_move?(index)
     if !position_taken?(index) && index.between?(0,8)
        true
  else
    false
  end
  end




  def turn
    puts "Please enter 1-9:"

    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board

    else
      turn
    end
  end

  def turn_count
    counter = 0
  @board.each do |positions|
  if positions == "X" || positions == "O"
    counter += 1
  end
  end
  return counter
  end


  def current_player
  if turn_count % 2 == 0
     current_player = "X"
  else
    current_player = "O"
  end
  end

  def play

  while !won? && !draw? && !over?
    turn
  end
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  elsif draw?
    puts "Cat's Game!"
  end
  end





end
