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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else @board[index] == "X" || @board[index] ==  "O"
      true
    end
  end

  def valid_move?(move)
    if position_taken?(move) == true
      false
    else position_taken?(move) == false
      return true if move.between?(0,8)
    end
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    board_index = input_to_index(gets.strip)
    if valid_move?(board_index) == true
      @board[board_index] = current_player
    else
      until valid_move?(board_index) == true
        puts "Please enter 1-9:"
        board_index = input_to_index(gets.strip)
      end
    end
    display_board
  end

  def won?
    array = WIN_COMBINATIONS.select do |combo|
                win_index_1 = combo[0]
                win_index_2 = combo[1]
                win_index_3 = combo[2]

                position_1 = @board[win_index_1]
                position_2 = @board[win_index_2]
                position_3 = @board[win_index_3]

                if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
                  return [win_index_1, win_index_2, win_index_3]
                end
            end
    if array == []
      false
    end
  end

  def full?
    @board.none? {|i| (i == nil?) || (i == " ")}
  end

  def draw?
    return true if won? == false && full? == true
  end

  def over?
    if won?
      true
    elsif draw? == true || full? == true
      true
    else draw? == false
      false
    end
  end

  def winner
    if won?
      winning_array = won?
      winning_array.all? do |i|
        return @board[i]
      end
    else won? == false
      return nil
    end
  end

  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
