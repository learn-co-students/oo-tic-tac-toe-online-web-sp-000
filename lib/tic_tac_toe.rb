class TicTacToe

  # Define the WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    [6, 4, 2], # / diagonal
    [0, 4, 8] # \ diagonal
  ]

  # Initialize method; every time this is called,
  # the instance variable board is set to the game's
  # initial state.
  def initialize
    @board = [" ", " ", " ",
      " ", " ", " ",
      " ", " ", " "]
  end

  # Prints out the current status of the
  # game's board out to the console
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Convert a user's input (1-9) to valid
  # board index (0-8)
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  # Update the board with a player's move
  def move(index, token = "X")
    @board[index] = token
  end

  # Clearly defines if a position is occupied on the board
  def position_taken?(index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end

  # Checks to see if a move is valid
  def valid_move?(index)
    (index < 0 || index > 8) ? false : !self.position_taken?(index)
  end

  # Count how many turns have been played, given the current board
  def turn_count
    counter = 0
    @board.each_with_index {|space, index| counter += 1 if self.position_taken?(index)}
    counter
  end

  # Determine whose turn it is based on the number of turns that have been played
  # ASSUMPTION: player "X" goes first
  def current_player
    self.turn_count % 2 == 0 ? "X" : "O"
  end

  # Get user's input and put in their move to the board instance variable, if
  # the user's move is valid
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = self.input_to_index(input)
    if self.valid_move?(index)
      self.move(index, self.current_player)
      self.display_board
    else
      puts "Not a valid move."
      self.turn
    end
  end

  # Determine if the game has a winner
  def won?
    WIN_COMBINATIONS.each do | winning_combination |
      if @board[winning_combination[0]] == @board[winning_combination[1]] && @board[winning_combination[1]] == @board[winning_combination[2]] && self.position_taken?(winning_combination[0])
        return winning_combination
      else
        false
      end
    end
    false
  end

  # Determine if the board is full
  def full?
    @board.all? {|space| (space == "X" || space == "O")}
  end

  # Determine if the game is a draw
  def draw?
    self.full? && !self.won?
  end

  # Determine if the game is over
  def over?
    self.draw? || self.won?
  end

  # Determine the winner
  def winner
    self.won? ? @board[self.won?[0]] : nil
  end

  def play
    until self.over?
      self.turn
    end

    if self.draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{self.winner}!"
    end
  end

end
