class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(index)
    index.to_i-1
  end

  def move(index, player)
    @board[index]= player
  end

  def position_taken?(index)
    return (@board[index]=="X" or @board[index]=="O")
  end

  def valid_move?(index)
    !position_taken?(index) and (index>=0 and index < 9)
  end

  def turn_count
    valid = @board.find_all {|position| position !=" "}
    valid.size
  end

  def current_player
    if turn_count%2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    position = gets.chomp
    index = input_to_index(position)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def won?
    won = false
    player = current_player == "O"? "X":"O"
    WIN_COMBINATIONS.each do |winning_array|
      won = winning_array.all? {|index| @board[index] == player}
      if won
        return winning_array
      end
    end
    return won
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    if won?
      return false
    end
    if full?
      return true
    end
    return false
  end

  def over?
    if won? or draw?
      return true
    end
    return false
  end

  def winner
    if won?
      return current_player == "O"? "X" : "O"
    end
    return nil
  end

  def play
    turn
    while over?
      turn
    end
    player = winner
    if player != nil
      puts "congratulates the winner #{player}"
    else
      "Cat\'s Game!"
    end
  end
end

# a = TicTacToe.new
# board = ["X", "O", "X", "O", "X", "O", "O", "X", "X"]
# a.board = board
# puts a.won?
