class TicTacToe

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

  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index (user_input)
      user_input.to_i - 1
    end

    def move (index, player_token = "X")
      @board[index] = player_token
    end

    def position_taken? (position)
      @board[position] == "X" || @board[position] == "O"
    end

    def valid_move? (index)
      index.between?(0, 8) && !position_taken?(index)
    end

    def turn_count
      turn = 0
      @board.each do |index|
        if index == "X" || index == "O"
          turn += 1
        end
      end
      return turn
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
      puts "Please choose a number 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index)
        player_token = current_player
        move(index, player_token)
        display_board
      else
        turn
      end
    end

    def won?
      WIN_COMBINATIONS.each {|win_combo|
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
    @board.all? { |i| i == "X" || i =="O" }
  end

  def draw?
    !(won?) && (full?)
  end

  def over?
    won? || full? || draw?
  end

  def winner
    WIN_COMBINATIONS.detect do |win_combo|
          if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
            return "X"
          elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
            return "O"
          else
            nil
          end
    end
  end

  def play
   until over?
     turn
   end

   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
 end





end
