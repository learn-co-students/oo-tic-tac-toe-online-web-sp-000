class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS =
  [ [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2] ]

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

    def move(index, current_player = "X")
      @board[index] = current_player
    end

    def position_taken?(location)
      @board[location] != " " && @board[location] != ""
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
       else
          turn
     end
     display_board
 end

def turn_count
  turns = 0
  @board.each do |empty_spot|
  if empty_spot == "X" || empty_spot == "O"
    turns += 1
  end
end
return turns
end

def current_player
  #if the turn_count is even return "X" else return "O"
  turns = turn_count
  if turns.even?
    return "X"
    else
      return "O"
  end
end

def won?
  WIN_COMBINATIONS.each {|win_combination|
    index_0 = win_combination[0]
    index_1 = win_combination[1]
    index_2 = win_combination[2]

    pos_1 = @board[index_0]
    pos_2 = @board[index_1]
    pos_3 = @board[index_2]

    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      return win_combination
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      return win_combination
    end
  }
  return false
end

def full?
  @board.all? {|index| index == "X" || index == "O"}
end

def draw?
  if full? && !won?
    return true
  else return false
  end
end

def over?
  if draw? || (won? && full?) || (won? && !full?)
    return true
  end
end

def winner
  index = won?
   !index ? nil : @board[index[0]]
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
