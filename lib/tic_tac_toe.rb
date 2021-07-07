class TicTacToe

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize
    @board = ([" "," "," "," "," "," "," "," "," "])
  end

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

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |index|
      if index != "" && index != " " && index != nil
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count.odd? == true
      return "O" # e.g 1 - x goes first
    elsif turn_count.even? == true
      return "X" #eg 2 - O goes second
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|

      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if @board.any?{|index| index == "X" || index == "O"}
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        end
      else
       return false
      end
    end
    return false
  end

  def full?
    if @board.all?{|index| index == "X" || index == "O"}
      return true
    elsif @board.any?{|index| index == "X" || index == "O"}
      return false
    else return false
    end
  end

  def draw?
    if won? == false && full? == true
      return true
    else
     return false
    end
  end

  def over?
    if won? != false or draw? == true or full? == true
      return true
    else
      return false
    end
  end

  def winner
    if won? != false

      xcount = 0
      ocount = 0

      xcount += @board.select{|index| index == "X"}.length()
      ocount += @board.select{|index| index == "O"}.length()

      if xcount > ocount
        return "X"
      elsif ocount >= xcount
        return "O"
      end
    end
  end

  def play
    while over? != true
      turn
    end
    if won? != false
      puts "Congratulations " + winner + "!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end

end
