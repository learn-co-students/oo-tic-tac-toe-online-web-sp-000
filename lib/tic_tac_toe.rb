class TicTacToe
  
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
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def turn
    u_i = gets.chomp
    index = input_to_index(u_i)
    valid_move?(index) ? move(index, current_player) : turn
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end
  
  def full?
    (@board.count("X") + @board.count("O") == 9)? true : false
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    won? ? @board[won?[0]] : nil
  end
  
  def input_to_index(user_input)
    u_i = user_input.to_i - 1
    u_i
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == " "? false : true
  end
  
  def valid_move?(index)
    if !position_taken?(index) && (0..8).include?(index)
      true
    else
      false
    end
  end
  
  def play
    until over?
      turn
    end
    
    if over? && won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
end