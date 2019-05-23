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
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  #remember that input is the USERS STRING while index is the INDEX WITHIN @BOARD
  def input_to_index(input)
    input.to_i - 1
  end 
  def move(index, token = "X")
    @board[index] = token
  end 
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false 
  end 
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end 
  def turn_count
    @board.count {|b| b != " "}
  end 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end 
  def turn 
    puts "Please enter 1-9:"
    input = gets.chomp
    input = input_to_index(input)
    if valid_move?(input) 
      token = current_player
      move(input, token)
      display_board
    else 
      "Please enter 1-9: "
      turn
    end 
  end 
  def won?
    won_or_not = false
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end 
    end 
  end
  def full? 
    @board.all? {|b| b == "X" || b == "O"}
  end 
  def draw? 
    full? && !won?
  end 
  def over? 
    won? || full? || draw?
  end 
 def winner
    if combo = won?
      @board[combo[0]]
    end 
  end
  def play
    until over? do 
      turn 
    end 
    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"   
    end
  end 
end 