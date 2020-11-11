class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]


    def display_board
      print " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      print "-----------"
      print " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      print "-----------"
      print " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
      input.to_i - 1
    end

    def move(input, token = "X")
      @board[input] = token
    end

    def position_taken?(input)
      if @board[input] == " "
        return false
      else return true
      end
    end

    def valid_move?(input)
      input.between?(0,8) && !position_taken?(input)
    end

    def turn_count
      count = 0
      @board.each do |i|
        if i == "X" || i == "O"
          count += 1
        end
      end
        count
    end

    def current_player
      if turn_count.even?
        return "X"
      else return "O"
      end
    end

    def turn
      puts "Please enter your move between 1-9" #ask for input
      input = gets.strip #get input
      index = input_to_index(input)
      if valid_move?(index) == true
        @board[index] = current_player
        display_board
      else
      turn
    end
    end

    def won?
      WIN_COMBINATIONS.each do |win_combo|
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
      end
      return false
    end

    def full?
      !@board.include? (" ")
    end

    def draw?
      full? && !won?
    end

    def over?
      won? || full?
    end

    def winner
      if won?
        current_player == "X"? "O" : "X"
      end
    end


def play
  until won? || over? || draw?
    turn
  end

 if won?
   puts "Congratulations #{winner}!"
 else
   puts "Cat's Game!"
 end
end




end
