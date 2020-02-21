require 'pry'

class TicTacToe

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
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

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

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    !(@board[index] == "" || @board[index] == " ")
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    turn = 0
    for index in 0..8 do
      turn += 1 if position_taken?(index)
    end
    turn
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    x = gets.strip
    index = input_to_index(x)
    if valid_move?(index)
      move(index, current_player)
    else
      puts "Invalid Move, try again"
      turn
    end
    display_board
  end

  def won?
    winning_combo = []
    WIN_COMBINATIONS.each do |combo|
      first = @board[combo[0]]
      second = @board[combo[1]]
      third = @board[combo[2]]
      winning_combo = combo if (first != " " && first == second && second == third)
    end
    winning_combo == [] ? false : winning_combo
  end

  def full?
    for x in 0..8 do
      return false if !position_taken?(x)
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    # full?
    !!won? || !!draw?
  end

  def winner
    if won?
      player = @board[won?[0]]
    end
    return nil if player == " "
    player
  end

  def play
    while !over?
        turn
        # binding.pry
        # if won? != false
        #   winner
        # end
    end

    # binding.pry
    if won?
      player = winner
      puts "Congratulations #{player}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end
end
