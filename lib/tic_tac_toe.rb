class TicTacToe

  attr_accessor :board

  # Intialize board
  def initialize(board = nil)
    @board = board || @board = Array.new(9," ")
    puts "Welcome to Tic Tac Toe!"
    display_board
  end

  # Array of possible win combinations
  WIN_COMBINATIONS = [
    [0, 1, 2], #Top row
    [3, 4, 5], #Middle row
    [6, 7, 8], #Bottom row
    [0, 3, 6], #First Column
    [1, 4, 7], #Second Column
    [2, 5, 8], #Third Column
    [0, 4, 8], #Diagonal left to right
    [2, 4, 6], #Diagonal right to left
  ]

  # Display the current board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Input to board index method to translate player input to valid board
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  # Move method to place move into board
  def move(index, current_player)
    @board[index] = current_player
  end

  # Determine if position has an "X" or "O" already in it
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # Determine if a move is valid
  def valid_move?(index)
    if index.between?(0, 8)
      !position_taken?(index)
    else
      false
    end
  end

#Complete turn method
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)

    if valid_move?(index)
      move(index, current_player)
      display_board    
    else
      puts "Invalid move!"
      turn
    end
  end

  # Determine who the current player is
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  # Count the number of turns that have occured
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

# Deterimin if the board has a winner.  If there is a winner, return the winning combination
  def won? 
    winning_array = []

    WIN_COMBINATIONS.each do |combo|
      board_values = []
      combo.each do |position_value|
        board_values.push(@board[position_value]) 
        #puts "the current board value is #{board_values}"     
      end
      if board_values.all?{|values| values == "X" }|| board_values.all?{|values| values == "O"}
        winning_array = combo
      end
    end
    
    if winning_array == [] && full? == true
      winning_array = false
    end

    if board.all?{|values| values == " " }|| board.all?{|values| values == ""}
      winning_array = false
    end

    winning_array  
  end

  # Check if the board is full
  def full?
    # @board.none? {|value| value == " "} ? true : false  
    @board.none? {|value| value == " "} || false
  end

  # Check if there is a draw
  def draw?
    full? && !won?
  end

  def over?
    if draw? || full?
      true
    elsif won? != false && won? != []
      true
    else
      false
    end
  end

  # Return the winner, either "X" or "O"
  def winner
    winner = nil
    if won?.length == 3
      winning_array = won?
      winner = @board[winning_array[0]]
    end
    winner
  end

  # Play method will run until the game is over
  def play
    until over? == true
      turn
    end

    if won?
      winner_name = winner
      puts "Congratulations #{winner_name}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end