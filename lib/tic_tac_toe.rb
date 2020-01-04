class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  # class constant for winning combinations
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  # board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # method to translate user input into board array index
  def input_to_index(input)
    # convert input to integer and subtracts 1
    input.to_i - 1
  end

  # method to take index of board array and the player's character. Default character to "X".
  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    elsif @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    else position_taken?(index) == true
      return false
    end
  end

  def turn_count
    # use each to iterate over the elements of the board
    # to check if that element is an X or O and increment counter by 1
    # return value of each is the original array
    counter = 0
    @board.each do |space_count|
      if space_count == "X" || space_count == "O"
          counter += 1
          puts "#{space_count}"
          # return counter
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
        return "X"
    else
        return "O"
    end
  end

  # turn method
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    valid = valid_move?(index)
    # check that index is valid
      if valid == false
        turn
      else
        move(index, current_player)
        display_board
      end
  end

  def won?
    winner = []
    empty_board = @board.all? { |empty| empty == " " || empty == nil}
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all? { |value| @board[value] == "X"} || win_combo.all? { |value| @board[value] == "O"}
        winner = win_combo
        return winner
      end
    end
    return false
  end

  # check to see if the board is full
  def full?
    @board.all? { |full| full == "X" || full == "O"}
  end

  def draw?
    full? && !won?
  end

  # returns true if the board has been won, is a draw, or is full.
  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  # return the token, "X" or "O" that has won the game given a winning board
  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    # until the game is #over?, take turns
    until over?
        turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    end
  end

end
