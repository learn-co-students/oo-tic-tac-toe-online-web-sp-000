require 'pry'
class TicTacToe

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

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

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken? (index)
    if @board[index] == "X" || @board[index] == "O"
        true
    else
        false
    end
  end

  def valid_move?(index)
    if index.between?(0,8) == true && position_taken?(index) == false
            true
    else
        false
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    if turn_count.even?
        return "X"
    else
        return "O"
    end
end

  def turn
    puts "Please enter a number 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)

    if valid_move?(index)
        move(index, current_player)
        display_board
    else
        turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win|
        win_index_1 = win[0]
        win_index_2 = win[1]
        win_index_3 = win[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O" 
             return win
        end
    end
        false
  end

  def full?
    @board.all? do |x| 
       if x == "X" || x == "O" 
         true
       else
        false
        end
    end
end

    def draw?
        if full? && !won?
            true
        else
            false
        end
    end    

    def over?
        if won? || draw?
            true
        end
    end

    def winner
        if won? 
            index_1 = won?[0]
           @board[index_1]
        end
    end

    def play
       turn until over?
       if won?
            puts "Congratulations #{winner}!"
        else 
            puts "Cat's Game!"
        end
    end

end