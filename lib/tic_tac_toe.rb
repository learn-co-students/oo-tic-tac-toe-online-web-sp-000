class TicTacToe
  WIN_COMBINATIONS = [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],
	[0, 4, 8],
	[2, 4, 6],
    ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board=(board)
    @board
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
  
  def move(space, symbol = "X")
    @board[space] = symbol
  end
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    end
  end
  
  def turn_count
    turn_number = 0 
    @board.each do |token|
      if token == "X" || token == "O"
        turn_number += 1
      end
    end
    turn_number
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |w_index|
      @board[w_index[0]] == @board[w_index[1]] &&
      @board[w_index[1]] == @board[w_index[2]] &&
      position_taken?(w_index[0])
    end
  end
  
  def full?
    @board.all? do |blank|
      blank == "X" || blank == "O"
    end
  end
  
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if win = won?
      @board[win.first]
    end
  end
  
  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
    
end
