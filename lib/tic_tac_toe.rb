

class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    (0..8).include?(index) && !position_taken?(index)
  end

  def turn_count
    count= 0
    @board.each do |element|
      if element != " "
        count+= 1
      end
    end
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    input= gets.strip
    index= input_to_index(input)
    character= current_player
    if valid_move?(index)
      move(index, character)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |i|
      @board[i[0]] == @board[i[1]] && @board[i[1]] == @board[i[2]] && position_taken?(i[0])
    end
  end

  def full?
    @board.all? {|i| i != " "} && !won?
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
