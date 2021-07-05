class TicTacToe
  def initialize
    @board = Array.new(9) {|i| i=" "}
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    return input.to_i-1
  end

  def move(index, char)
    if(valid_move?(index))
      @board[index]= char
    end
  end

  def valid_move?(index)
    index.between?(0,8)&&!position_taken?(index)
  end

  def position_taken?(index)
    @board[index]=="X"||@board[index]=="O"
  end

  def turn_count
    count = Array.new
    @board.each do |char|
      if(char=="X"||char=="O")
        count<<char
      end
    end
    count.size
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      @board[index] = current_player
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |wins|
      if((wins.all? do |space| @board[space]=="X" end)||(wins.all? do |space| @board[space]=="O" end))
        return wins
      end
    end
  end

  def full?
    @board.all? do |space| space=="X"||space=="O" end
  end

  def draw?
    full?&&!won?
  end

  def over?
    draw?||won?
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    display_board
    while (!over?)
      turn
      if won?||draw?
        break
      end
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
