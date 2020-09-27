class TicTacToe
  attr_accessor :board, :index
  
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [
    [0,1,2], #top row win
    [3,4,5], #middle row win
    [6,7,8], #bottom row win
    [0,4,8], #left diagonal win
    [2,4,6], #right diagonal win
    [0,3,6], #left column win
    [1,4,7], #middle column win
    [2,5,8] #right column win
    ]

  def display_board
    row_one = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    dashes =  "-----------"
    row_two = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    row_three = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    
    #printing the updated board
    puts row_one
    puts dashes
    puts row_two
    puts dashes
    puts row_three
  end

  
  def input_to_index(input)
    @index = input.to_i - 1
  end
  
  def move(index, character)
    @board[index] = character
  end

  # determing if the position has been taken
  def position_taken?(index)
    if @board[index] == " " || @board[index] == ""
      p false
      elsif @board[index] == nil
        p false
      elsif @board[index] == "X" || @board[index] == "O"
        p true
    end
  end

  # making sure the user plays on the board
  def valid_move?(index)
    #this first if statement is checking if the index is on the board and if the position has been taken
    if index.between?(0,8) && position_taken?(index) == false
      p true
    elsif index > 9 || index < 0
      p false
    elsif position_taken?(index) == true
      p false
    end
  end

  #returns the number of turns that have been played
  def turn_count
    #using the count method to count how many X's and O's are in the board array
    x = @board.count("X")
    o = @board.count("O")
    #adding the X's and O's together
    turn = x + o
    #we want the return value to be a number, so we use return
    p turn
  end

  #tells you whose turn it is
  def current_player
    if turn_count % 2 == 0
      p "X"
    else
      p "O"
    end
  end

  def turn
    #asking the user for their input
    puts "Please enter 1-9:"
    #the gets method actually *gets* the user input
    input = gets
  
    character = current_player
  
    #now calling the input_to_index method to convert the input to an integer and to the proper ruby index equivalent
    @index = input_to_index(input)
  
    #if the move is valid, we make the move and display the board
    if valid_move?(index) == true
    move(index, character)
    display_board
  #otherwise, we ask for a new position
    else
      "Please enter 1-9:"
      input = gets
    end
  end

  def won?
    if @board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
       false
    end

  #counting so we don't return false until we have looked at all of the combinations.
  count = 0

    WIN_COMBINATIONS.each do |combo|
      count = count + 1
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" &&   @board[combo[2]] == "X"
        return combo
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      elsif count == 8
        return false
      end
    end
  end

  def full?
    if @board.any?(" ")
      return false
    else
      return true
    end
  end

  def draw?
    if won? != false || full? == false
      return false
    else
      return true
    end
  end
  
  def over?
     #board that has been won and the board is NOT full --> true
    if won? != false && full? == false
      return true
    #board that has been won and the board is full --> true
    elsif won? != false && full? == true
      return true
    #board that is still in-progress --> false
    elsif won? == false && full? == false
      return false
    #board that's a draw --> true
    elsif draw? == true
      return true
    end
  end
  
  #method to determine the winner and returns the winning token
  def winner
    #setting the index of the win into a variable, win
    win = won?
    #now returning nil if there is no winner
    if won? == false
      return nil
    #all indexes should have the same token for a win, so we're only checking the first
    elsif @board[win[0]] == "X" && won? != false
      return "X"
    elsif @board[win[0]] == "O" && won? != false
      return "O"
    end
  end
  
  
  #this play method works in irb
  def play
    #turn(board)
    i = 0
    until over? == true
      turn
      if draw? == true
        break
      elsif won? != false
        break
      elsif i == 9
        break
      end
    end
  
    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end

end