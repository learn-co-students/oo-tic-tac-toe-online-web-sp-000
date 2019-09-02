class TicTacToe
  def initialize(board = nil)
    @board = board || @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #first column
  [1, 4, 7], #second column
  [2, 5, 8], #third column
  [0, 4, 8], #first diagonal
  [2, 4, 6] #second diagonal
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
    index
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end
  
  def valid_move?(index)
    if (index >= 0 || index <9) && (position_taken?(index) == false) 
      true
    else
      false
    end
  
  def turn
    puts "Please make a move by entering a position between 1-9."
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, token = "X")
    else
      while valid_move?(index) == false
        puts "The move is invalid. Please choose another
        position."
        input = gets.strip
        display_board
      end
      move(index, token = "X")
      display_board
    end
  end
  
  def turn_count
    def @board.count {|board_space| board_space == "X" || board_space == "Y"}
  end
  
  def current_player
    if turn_count % 2 == 0 
      token = "X"
    else
      token = "Y"
    end
  end
  
  def won?
    WIN_COMBINATIONS.find{|win_combo| 
      position_1 = win_combo[0]
      position_2 = win_combo[1]
      position_3 = win_combo[2]
       @board[position_1] == "X" && @board[position_2] == "X" && @board[position_3] == "X" ||
        @board[position_1] == "O" && @board[position_2] == "O" && @board[position_3] == "O"
      }
  end
  
  def full?
    if @board.include?(" ")
      false
    else
      true
  end
  
  def draw?
    if full? == true && won? == false
      true
  end
  
  def over?
    if full? == true 
      true
  end
  
  def winner
    if won? == true 
      winner = won?[0]
    winner
  end
  
  def play 
    until over? == true
      turn
    end
    if won? == true
      puts "Congratulations: #{winner}. You won the game!"
    else
      puts "This game of Tic-Tac-Toe has ended in a draw."
    end
  end
end
