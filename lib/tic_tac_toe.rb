class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def board=(board)
    @board = board
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
  [0, 1, 2], #top row win
  [3, 4, 5], #middle row win
  [6, 7, 8], #bottom row win
  [0, 4, 8], #diagonal win
  [2, 4, 6], #diagonal win
  [0, 3, 6], #left column win
  [1, 4, 7], #middle column win
  [2, 5, 8]  #right column win
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(position, token)
    @board[position] = token
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O"
  end

  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end

  def turn_count
    count = 0
    board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count.odd?
      "O"
    else
      "X"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    token = current_player
    if valid_move?(index)
      puts 'valid move'
      move(index, token)
    else
      puts 'try again'
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
    end
  end

  def full?
    @board.all? {|char| char == "X" || char == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if win_combination = won?
      @board[win_combination[0]]
    end
  end

  def play
    until over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end

end
