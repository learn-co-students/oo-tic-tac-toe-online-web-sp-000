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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    position = user_input.to_i - 1
  end

  def move(position, character = "X")
    @board[position] = character
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    # ask the user for input (position 1-9)
    puts "Please enter 1-9:"
    # get input
    user_input = gets.strip
    # calls input to index method 
    index = input_to_index(user_input)
    # if index is valid
    if valid_move?(index)
      # make the move for index
      move(index, character = current_player)
      # show the board
      display_board
    # else
    else
      # ask for input again until you get a valid input
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |player|
      # returns number of turns that have been played
      if player == "X" || player == "O"
        counter += 1
      end  
    end  
    counter
  end

  def current_player
    #if turn count is an even number, should return "X"
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    # Returns false/nil if no win combination present and return the winning combination indexes as an array if there is a win
    # iterate over WIN_COMBINATIONS (a nested array) and check if board has the same player token in each index of a winning combination
    WIN_COMBINATIONS.find do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
    end
  end

  def full?
    # Return true if every element in the board contains either "X" or "O"
    # Returns false for an in-progress game
    @board.none?{|index| index == " " || index == nil}
  end

  def draw?
    # Returns TRUE if the board is NOT WON, but it is FULL (a draw)
    # Returns FALSE if the board is NOT WON and the board is NOT FULL
    # Returns FALSE if the board is WON
    !won? && full? 
  end

  def over?
    # Returns TRUE if the board has been won, is a draw, or is full
    # Compose using the methods I created
    won? || draw? || full?
  end
    
  def winner
    # Return the token "X" or "O" that has won the game given a winning board
    if won?
      winning_token = won?
      @board[winning_token[0]]
    else
    end  
  end

  def play
    round = 0
    until round == 9 || over?
      round += 1
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
end