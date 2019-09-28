class TicTacToe

  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #0 'top row win'
    [3,4,5], #1 'middle row win'
    [6,7,8], #2 'bottom row win'
    [0,3,6], #3 'first column win'
    [1,4,7], #4 'second column win'
    [2,5,8], #5 'third column win'
    [0,4,8], #6 'left diagonal win'
    [2,4,6]  #7 'right diagonal win'
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(number)
    number.to_i - 1
  end

  def move(input, value)
    @board[input] = value
  end

  def position_taken?(input)
    if @board[input] == "" || @board[input] == " " || @board[input] == nil
      return false
    elsif @board[input] == "X" || @board[input] == "O"
      return true
    end
  end

  def valid_move?(input)
    if position_taken?(input) == false && input.to_i.between?(0,8)
      return true
    end
  end

  def turn_count
    counter = 0

    @board.each do |turn|
      if turn == "X" || turn == "O"
        counter +=1
      end
    end
    counter

  end

  def current_player
    if turn_count.even? == true
      return "X"
    else
      return "O"
    end
  end

  def turn
  	puts "Please enter 1-9:"

    user_input = gets.to_i
  	index = input_to_index(user_input)

  	if valid_move?(index) == true && current_player == "X"
  			move(index, value = "X")
  			puts display_board
  	elsif valid_move?(index) == true && current_player == "O"
  			move(index, value = "O")
  			puts display_board
  	elsif valid_move?(index) == false
  		puts "Please enter 1-9:"
  		input = gets.to_i
  	else
  		puts "Please enter 1-9:"
  		input = gets.to_i
  	end
  end

  def won?

    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      @board[win_index_1] == @board[win_index_2] && @board[win_index_2] == @board[win_index_3] && @board[win_index_1] != " "
    end

  end


  def full?

    @board.all? do |value| #The '#all?' goes through each value of the array to see if it meets the conditions required below.
      value == "X" || value == "O"
    end #If every value is equal to either "X" or "O", then we know the board is full and it is a draw. It will return true.

  end


  def draw?

    if full? && !won?
      return true
    end

  end


  def over?

    if won? || full?
      return true
    end

  end


  def winner

    winner = won? #First, we set the variable 'winner' equal to the array resulting from our 'won?' method (if a winning combo is found).
    #We then jump into a conditional statement. If we have a winner, we want to check what character won the game: 'X' or 'O'.
    if winner #First, let's say we had a diagonal winner ([0,5,8]). We can call any value from this array and set it equal to a variable.
      winning_character = winner[1] #winning_character is set equal to the value of the called array position. In this case, we call the middle value of '5'.
      return @board[winning_character] #then, we return the board position of the winning_character value, which could be read as 'board[5]'
    else #if there are not winning combinations found, we return a value of 'nil'
      nil
    end

  end


  def play

    until over? || draw? #This loops checks if the game is over by win or draw. It plays through a full game.
      turn #If the game is not over, it allows the user to take another turn.
    end #The result of the loop will be a 'true' value for either 'over?' or 'draw?'

    # We then create a condition to output the results of the game to the user.
    if won? # If a user, either 'X' or 'O' won the game...
      winner == "X" || winner == "O" #First, we check to see who the winning character was.
      puts "Congratulations #{winner}!" #Once we determine if it was 'X' or 'O', we return an interpolated string with that character.
    elsif draw? #If the game ended in a draw, we simply return the string below.
      puts "Cat's Game!"
    end

  end

end
