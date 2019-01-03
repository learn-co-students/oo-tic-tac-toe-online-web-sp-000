class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9," ")
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

  def input_to_index(user_input)
    @user_input = user_input
    @user_input.to_i - 1
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

  def turn_count
    counter = 0
    @board.each do |position|
      if position != " "
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    the_current_player = current_player
    if valid_move?(index)
      move(index, the_current_player)
      display_board
    else
      turn
    end
  end

  def won?
    winner = nil
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|idx| @board[idx] == "X"}
        winner = combo
      elsif combo.all? {|idx| @board[idx] == "O"}
        winner = combo
      else
        false
      end
    end
    if winner != nil
      winner
    else
      false
    end
  end

  def full?
    @board.all? {|token| token == "X" || token == "O"}
  end

  def draw?
    if full?
      if won? == false
        true
      else
        false
      end
    else
      false
    end
  end

  def over?
    if won? == false && draw? == false
      false
    else
      true
    end
  end

  def winner
    win = won?

    if win == nil || win == false
      return nil
    elsif win.all? {|idx| @board[idx] == "X"}
      return "X"
    elsif win.all? {|idx| @board[idx] == "O"}
      return "O"
    end
  end

  def play

    until over? == true
      turn
    end

    if winner == "X"
      puts "Congratulations X!"

    elsif winner == "O"
      puts "Congratulations O!"

    elsif draw? == true
      puts "Cat's Game!"
    end
  end
end
