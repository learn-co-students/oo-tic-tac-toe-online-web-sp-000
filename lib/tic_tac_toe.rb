class TicTacToe
  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [1,4,7],
      [2,5,8]
  ]
  def initialize (board=[" "," "," "," "," "," "," "," "," "])
    @board = board
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index (user_input)
    user_input.to_i - 1
  end
  def move(index, player)
    @board[index] = player
  end
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end
  def turn_count
    xs = 0
    os = 0
    counter = 0
    9.times do
      if @board[counter] == "X"
        xs +=1
      elsif @board[counter] == "O"
        os +=1
      end
      counter +=1
    end
    xs+os
  end
  def current_player
    if turn_count%2 == 0
      "X"
    else
      "O"
    end
  end
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]]== "X") || (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
        return win_combo
      end
    end
    false
  end
  def full?
    counter = 0
    full =  0
    9.times do
      if @board[counter] == "X" || @board[counter] == "O"
        full += 1
      end
      counter += 1
    end
    if full == 9
      true
    end
  end
  def draw?
    if full? && !won?
      true
    end
  end
  def over?
    if draw? || won?
      true
    end
  end
  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end
  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won? && winner == "O"
      puts "Congratulations O!"
    elsif won? && winner== "X"
      puts "Congratulations X!"
    end
  end
end