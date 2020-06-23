class TicTacToe

  attr_accessor :board

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

WIN_COMBINATIONS = [
    [0,1,2],  # Top row
    [3,4,5],  # Middle row (horizontal)
    [6,7,8],  # Bottom row
    [0,3,6],  # Left Column
    [1,4,7],  # Middle Column
    [2,5,8],  # Right Column
    [0,4,8],  # Diagonal 1 (negative slope)
    [2,4,6]   # Diagonal 2 (positive slope)
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
    return index
  end

  def move(index, char = "X")
    @board[index] = char
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = input_to_index(gets.strip)

    if (input == -1) || (input > 9)
      puts "Invalid input---input must contain an integer, 1-9."
      turn
    elsif !valid_move?(input)
      puts "The location you entered is already occupied."
      turn
    else
      move(input, current_player)
      display_board
    end
  end

  def turn_count
    count = 0
    @board.each do |space|
      if (space == "X") || (space == "O")
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count.even?
    #if (turn_count(board) % 2) == 0
      return "X"
    elsif turn_count.odd?
    #elsif (turn_count(board) % 2) != 0
      return "O"
    end
  end

  def won?

    exes = @board.each_index.select{ |i| @board[i] == "X"}
    ohs = @board.each_index.select{ |i| @board[i] == "O"}

    experms = exes.permutation(3).to_a
    ohperms = ohs.permutation(3).to_a
    x_winning_index = WIN_COMBINATIONS.detect{ |win_combo| experms.include?(win_combo) }
    o_winning_index = WIN_COMBINATIONS.detect{ |win_combo| ohperms.include?(win_combo) }


    if (!!x_winning_index && !!o_winning_index)
      return false
    elsif x_winning_index
         return x_winning_index
    elsif o_winning_index
         return o_winning_index
      end
    end



def full?
  @board.none? {|i| (i == " ") || (i == "")}
end


def draw?
  if full? && !won?
    return true
  else
    return false
  end
end

def over?
if full? || won? || draw?
  return true
else
  return false
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
  count = 0
 while ((count < 9) && !over?)
   turn
   count += 1
end
  if draw?
    puts "Cat's Game!"
 elsif won?
   puts "Congratulations #{winner}!"
end
end

end
