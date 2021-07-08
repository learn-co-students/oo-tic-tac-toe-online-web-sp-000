class TicTacToe
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

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      current_player = current_player()
      move(index, current_player)
      display_board()
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position != " "
        count += 1
      end
    end
    count
  end

  def current_player
    turn_number = turn_count()
    if turn_number % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_combo = []
      win_combination.each do |index_value|
        if position_taken?(index_value) == true
          win_combo << index_value
        end
      end
      if win_combo.length == 3
        if @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]]
          return win_combo
        end
      end
    end
    return false
  end

  def full?
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    if count == 9
      true
    else
      false
    end
  end

  def draw?
    if full?()
      if won?()
        false
      else
        true
      end
    else
      if won?()
        false
      end
    end
  end

  def over?
    if full?() === true || won?() != false || draw?() === true
      true
    else
      false
    end
  end

  def winner
    if won?() != false
      win_combo = won?()
      @board[win_combo[0]]
    else
      nil
    end
  end

  def play
    until over?() == true
      turn()
      won?()
    end
    if draw?()
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner()}!"
    end
  end

  def welcome
    puts "Welcome to Tic Tac Toe!"
  end

end
