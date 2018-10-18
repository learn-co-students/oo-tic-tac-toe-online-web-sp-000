class TicTacToe
  def initialize
    @board = Array.new(9, " ")
    display_board
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

  def display_board
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if !index.between?(0,8)
      false
    elsif !position_taken?(index)
      true
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index,token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_array|
      if win_array.all?{|board_position| @board[board_position] == "X"}
        return win_array
      elsif win_array.all?{|board_position| @board[board_position] == "O"}
        return win_array
      end
    end
    if @board.all?{|space| position_taken?(space.to_i)} || @board.none?{|space| position_taken?(space.to_i)}
      false
    end
  end

  def full?
    @board.all?{|space| space == "X" || space == "O"}
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    if draw? || full? || won?
      true
    else
      false
    end
  end

  def winner
    if won?
      winning_array = won?
      token_index = winning_array[0]
      token = @board[token_index]
      token
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
