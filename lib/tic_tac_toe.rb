class TicTacToe

  def initialize
    @board = Array.new(9) {" "}
  end
  def play
    until over? || won?
      turn
    end
    puts "Cat's Game!" if draw?
    puts "Congratulations X!" if winner == "X"
    puts "Congratulations O!" if winner == "O"
  end

  def winner
    hold_array = []

    WIN_COMBINATIONS.each do |combo|
      combo.each do |index|
        hold_array << board[index] if position_taken?(index)
        end

      if hold_array.length == 3 && hold_array.uniq.length == 1
        winner = hold_array.uniq.first
        return winner
        else
        hold_array.clear
      end
    end
    nil
  end

  def over?
    return true if won?
    return true if draw?
  end

    def won?
    hold_array = []

    WIN_COMBINATIONS.each do |combo|
      combo.each do |index|
        hold_array << board[index] if position_taken?(index)
        end
      if hold_array.length == 3 && hold_array.uniq.length == 1
        return combo
      else
        hold_array.clear
      end
    end
    false
  end

   def full?
    board.all? { |pos| pos == "X" || pos == "O" }
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def current_player(board)
    count = turn_count(board)
    return "X" if count.even?
    return "O" if count.odd?
  end

  def player_move(index, token)
    board[index] = token
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    unless valid_move?(index)
      turn
    else
      move(index, token)
      display_board
    end
  end


  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [6,4,2],
    [0,3,6],
    [7,4,1],
    [2,5,8]
  ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    int = input.to_i
    int - 1
  end

  def move(index, char = "X")
    board[index] = char
  end

  def position_taken?(index)
    !(board[index].nil? || board[index] == " ")
  end

  def turn_count
  count = 0
  board.each do |pos|
    count += 1 unless pos == " "
  end
  count
end

  def current_player
    count = turn_count
    return "X" if count.even?
    return "O" if count.odd?
  end

  def valid_move?(index)
    if index.to_i.between?(0, 8)
      return true if board[index] == " "
    end
      return false
    end
  end
