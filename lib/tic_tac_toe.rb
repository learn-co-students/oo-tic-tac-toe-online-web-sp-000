class TicTacToe
  def initialize
    @board = Array.new(9," ")
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

  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end

  def move(index,player="X")
  @board[index] = player
end

def position_taken?(index)
  return !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
end

def valid_move?(index)
  return (index.between?(0,8) && !position_taken?(index))
end

def turn
  puts "Please enter 1-9:"
  input = input_to_index(gets.strip)
  if valid_move?(input)
    move(input,current_player)
  else
    turn
  end
  display_board
end

def turn_count
  counter = 0
  @board.each do |square|
    if square == "X" || square == "O"
      counter += 1
    else end
    end
    return counter
  end


  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |condition|
      if [@board[condition[0]],@board[condition[1]], @board[condition[2]]].all?("X") || [@board[condition[0]],@board[condition[1]], @board[condition[2]]].all?("O")
        return condition
        end
      end
      return false
  end


  def full?
    !@board.any?(" " || nil)
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play

    display_board
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else puts "Cat's Game!"
    end
  end


end
