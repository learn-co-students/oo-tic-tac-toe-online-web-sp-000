class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS =
  [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

  def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n
        #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n
        #{@board[6]} | #{@board[7]} | #{@board[8]} "
return " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n
        #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n
        #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
      return index = input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    count = 0
    @board.each do |play|
      if play == "X" || play == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input= gets.strip
    index = input_to_index(user_input)
  if  valid_move?(index)
    move(index, char= current_player)
    display_board
  else
    turn
  end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      position_taken?(combo[0]) &&
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[0]] == @board[combo[2]]
    end
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
    won? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
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
