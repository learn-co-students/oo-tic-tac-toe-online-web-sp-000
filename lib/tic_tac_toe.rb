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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true
    else
      false
    end
  end

  def turn_count
    turn = 0
    @board.each do |index|
      if index == "X" || index == "O"
      turn += 1
      end
    end
    turn
  end

  def turn
    puts "Please choose a number 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, token)
    else
      turn
    end
    display_board
  end

  def current_player
    num_turn = turn_count
    if turn_count % 2 == 0
      player = "X"
    else
      player = "O"
    end
    player
  end

  def turn
    puts "Please choose a number 1-9:"
    user_input = gets.chomp
     index = input_to_index(user_input)
     if valid_move?(index)
       token = current_player
       move(index, token)
       display_board
     else
       turn
     end
  end

  def won?
    WIN_COMBINATIONS. each {|win_combo|
      index_0 = win_combo[0]
      index_1 = win_combo[1]
      index_2 = win_combo[2]

      position_1 = @board[index_0]
      position_2 = @board[index_1]
      position_3 = @board[index_2]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
         return win_combo
      end
    }
    return false
  end

  def full?
     @board.all? {|index| index == "X" || index == "O"}
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if won?|| draw?
      return true
    else
      return false
    end
  end

  def winner
    index = []
    index = won?
    if index == false
      return nil
    else
      if @board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
