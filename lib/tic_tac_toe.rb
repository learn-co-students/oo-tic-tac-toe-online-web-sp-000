class TicTacToe
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
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
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, player)
    @board[index] = player
  end
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    (0..8).include?(index) && !position_taken?(index)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
    
  def turn
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      input = gets.strip
    end
  end
  
  def won?
    WIN_COMBINATIONS.find do |combo|
      a = @board[combo[0]]
      b = @board[combo[1]]
      c = @board[combo[2]]
      x_win = a == "X" && b == "X" && c == "X"
      o_win = a == "O" && b == "O" && c == "O"
      x_win || o_win
    end
  end
  
  def full?
    turn_count == @board.count
  end
  
  def draw?
    full? && !won?
  end
   
  def over?
    draw? || won?
  end
  
  def winner
    @board[won?[0]] if won?
  end
  
  def play
    while !over?
      turn
    end
    won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
  end
end