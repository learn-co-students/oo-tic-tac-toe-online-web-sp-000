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
    [6,4,2]]

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index (input)
      input.to_i - 1
    end

    def move (index, token = "X")
      @board[index] = token
    end

    def position_taken? (location)
      @board[location] != " " && @board[location] != ""
    end

    def valid_move? (position)
      position.between?(0,8) && !position_taken?(position)
    end

    def turn_count
      count = 0
      @board.each do |x|
        if x == "X" || x == "O"
          count +=1
        end
      end
      count
    end

    def current_player
      if turn_count % 2 == 0
        "X"
      else
        "O"
      end
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

    def won?
      WIN_COMBINATIONS.each {|n|
        index1 = n[0]
        index2 = n[1]
        index3 = n[2]

        position1 = @board[index1]
        position2 = @board[index2]
        position3 = @board[index3]

        if position1 == "X" && position2 == "X" && position3 == "X"
          return n
        elsif position1 == "O" && position2 == "O" && position3 == "O"
          return n
        end
      }
      return false
    end

    def full?
      @board.all? { |i| i == "X" || i == "O"}
    end

    def draw?
      full? && !won?
    end

    def over?
    if draw?
      return true
    elsif won? && full?
      return true
    elsif won? && !full?
      return true
      end
    end

    def winner
    win = []
    win = won?
    if win == false
        return nil
    else
    if @board[win[0]] == "X"
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
