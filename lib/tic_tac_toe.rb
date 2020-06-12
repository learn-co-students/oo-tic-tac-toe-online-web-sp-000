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

  def input_to_index(input)
    index = input.to_i
    index -= 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end

  def valid_move?(index)
    if index >= 0 && index <= 8 && position_taken?(index) == false
      true
    else
      false
    end
  end

  def turn_count
    count_array = @board.select {|i| i != " "}
    count_array.length
  end

  def current_player
    count = turn_count
    if count.odd?
      "O"
    else
      "X"
    end
  end

  def turn
    puts "Please select a position 1 - 9:"
    input = gets.chomp
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      puts "Invalid move."
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
  end

  def full?
  !(@board.include? " ")
  end

  def draw?
    if !(won?)
      full?
    else
      false
    end
  end

  def over?
    if draw?
      true
    elsif won?
      true
    else
      false
    end
  end

  def winner
    if !(over?)
      return nil
    elsif draw?
      return nil
    elsif won?
      winning_move = won?
      win_ident = winning_move[1]
      if @board[win_ident] == "X"
        return "X"
      elsif @board[win_ident] == "O"
        return "O"
      end
    end
  end

  def play
    until over?
      turn
    end
    if winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
