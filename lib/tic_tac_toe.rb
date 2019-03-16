class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom Row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Left to Right diagonal
    [2,4,6] # Right to Left diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    turns = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        turns +=1
      end
    end
    return turns
  end

  def current_player
    turns = turn_count
    turns % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    cur_player = current_player
    if valid_move?(index)
      move(index, cur_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
         return win_combo
      end
    end
    false
  end

  def full?
    @board.all? do |moves|
      moves == "X" || moves == "O"
    end
  end

  def draw?
    if won?
      false
    else
      if full?
        true
      else
        false
      end
    end
  end

  def over?
    if won?
      true
    elsif draw?
      true
    else
      false
    end
  end

  def winner
    if won?
     return @board[won?[0]]
    else
      return nil
    end
  end

  def play
     until over?
        turn
     end
     if won?
        winner == "X" || winner == "O"
        puts "Congratulations #{winner}!"
     elsif draw?
        puts "Cat's Game!"
     end
  end
end
