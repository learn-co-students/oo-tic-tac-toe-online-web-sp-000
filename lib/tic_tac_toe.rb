class TicTacToe
  
  WIN_COMBINATIONS = [[0, 1, 2], [1, 4, 7], [2, 5, 8], [0, 3, 6], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]]
  
  attr_accessor :board
  
  def initialize()
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = "#{input}".to_i - 1
    if index.between?(0, 8)
      return index
    else 
      return -1
    end
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == "" or @board[index] == " "
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end
  
  def turn
    puts "Please enter a number between 1-9"
    input = gets.strip.to_i
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    turn_count = 0
    @board.each do |i|
      if i == "X" || i == "O"
        turn_count += 1
      end
    end
    return turn_count
  end
  
  def current_player
    x_turn = turn_count % 2
    if x_turn == 0
      return "X"
    else 
      return "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |i|
      @board[i[0]] == @board[i[1]] && @board[i[2]] == @board[i[1]] && position_taken?(i[0])
    end
  end
  
  def full?
    turn_count == 9 
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw? || full?
  end
  
  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end
  
  def play

    turn while !over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end