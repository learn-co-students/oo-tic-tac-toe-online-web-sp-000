class TicTacToe 
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board 
  end
  
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
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    @input_to_index = user_input.to_i - 1
  end
  
  def move(index, value)
    @board[index] = value
  end
  
  def position_taken?(index)
    @board[index] == " " || @board[index] == "" || @board[index] == nil ? false : true
  end
  
  def valid_move?(index)
    index.between?(0, 8) == true && position_taken?(index) == false ? true : false
  end
  
  def turn 
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    valid_move?(index) && !position_taken?(index) ? 
    move(index, value = current_player) && display_board : turn
  end
  
  def turn_count 
    counter = 0 
    @board.each {|turn| turn == "X" || turn == "O" ? counter += 1 : counter += 0}
    return counter
  end
  
  def current_player
    turn_count.even? == true ? "X" : "O"
  end
  
  def won?
    winner = nil
    WIN_COMBINATIONS.each do |combination|
      if combination.all? {|token| @board[token] == "X"}
        winner = combination
      elsif combination.all? {|token| @board[token] == "O"}
        winner = combination
      else
        false
      end
    end
    winner != nil ? winner : false
  end
  
  def full?
    @board.none?{|token| token == " "} 
  end
  
  def draw?
    won? == false && full? == true ? true : false
  end
  
  def over?
    won? || draw? || full? ? true : false
  end
  
  def winner
    winner = nil
    WIN_COMBINATIONS.each do |combination|
      if combination.all? {|token| @board[token] == "X"}
      winner = "X"
      elsif combination.all? {|token| @board[token] == "O"}
      winner = "O"
      end 
    end
    winner
  end
  
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end