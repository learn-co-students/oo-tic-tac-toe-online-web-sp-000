class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  # a constant with all possible win combinations
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # First column
    [1, 4, 7], # Second column
    [2, 5, 8], # Third column
    [0, 4, 8], # Diagonal
    [2, 4, 6] # Diagonal
  ]

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

  def move(move_index, player="X")
    @board[move_index] = player
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      player = current_player()
      move(index, player)
      display_board()
    else
      turn()
    end
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    if turn_count() % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    game_won = false
    WIN_COMBINATIONS.each do |combination|
      index1 = combination[0]
      index2 = combination[1]
      index3 = combination[2]
      if (@board[index1] == "X" && @board[index2] == "X" && @board[index3] == "X") ||
         (@board[index1] == "O" && @board[index2] == "O" && @board[index3] == "O")
        return combination
      end
    end
    game_won
  end

  def full?
    @board.all? {|content| content == "X" || content == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner()
    win_combination = won?
    if win_combination
      @board[win_combination[0]]
    end
  end

  def play()
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end


end
