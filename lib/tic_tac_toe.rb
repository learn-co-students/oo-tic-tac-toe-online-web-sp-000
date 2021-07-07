class TicTacToe 
  
  def initialize  
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @board = board
  end
  
  WIN_COMBINATIONS = 
  [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [2,5,8],
  [1,4,7]
  ]
  
  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, player = "X")
    @board[index] = player
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index) 
  end
  
  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
        counter += 1
      end
    end
    counter
  end
  
  def current_player
    if turn_count % 2 == 0 
      return "X"
    else turn_count % 2 == 1 
      return "O"
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && 
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end
  
  def full?
    @board.all?{|pipes| pipes == "X" || pipes == "O"}
  end

  def draw?
    if won? == nil && full? == true 
      return true
    elsif won? == true 
      return false
    end
  end
  
  def over?
    won? || full? 
  end
  
  def winner
    if winning_combo = won?
      @board[winning_combo[0]] 
    end
  end
  
  def play
    until over? || draw?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end