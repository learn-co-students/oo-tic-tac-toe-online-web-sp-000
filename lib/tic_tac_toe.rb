
class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [  [0,1,2], #Top ROW
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [3,4,5],
  [6,7,8]]

  def WIN_COMBINATIONS
    @@WIN_COMBINATIONS
  end

  def initialize(board = nil)

    @board = board ||
    Array.new(9, " ")
  end

  def display_board
  @board
  # a variable game = a new TicTacToe instance and inserts "board"
    game = TicTacToe.new("board")
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
game
end

  def input_to_index(string)
    string = string.to_i
    string - 1
  end


  def move(index, token = "X")
    @board
    board[index] = token
  end

  def position_taken?(index)
    @board
  !(board[index].nil? || board[index] == " ")
end


    def valid_move?(position)
      #if less than 0 or greater than 8 is false
    if (position < 0) || (position > 8)
      return false
        #if index is between 0-8 return and the position is not taken, return true
      elsif (position.between?(0,8)) && !position_taken?(position)
        return true
        # if index is already included on board, return false or nil
    end
  end

  def turn_count
    @board
   count = 0
    board.each do |turn|
      if (turn == "X" || turn == "O")
     count += 1
      end
  # board.each{|turn| puts "#{turn}"}
    end
    return count
  end

    def current_player
    #  @board
      if turn_count.even? == false
        return "O"
      else
        turn_count.even? == true
        return "X"
      end
    end

    def turn
     @board
        puts "Please enter 1-9:"
#get input
    user_input = gets.strip

#convert input to index
    index = input_to_index(user_input)

#if index is valid, make the move. ask for input again after failed validation
      if valid_move?(board)
        move(board, index)
        display_board(board)
      else
        turn(board)
      end
    end

end
