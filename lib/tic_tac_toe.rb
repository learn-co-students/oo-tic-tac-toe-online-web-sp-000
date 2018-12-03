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
  [2,4,6]
  ]
  #display board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #input to index
  def input_to_index(input)
  input.to_i - 1
  end

  #turn count
  def turn_count
  count = 0
    @board.each do|value|
    if value != " "
      count += 1
    end
  end
  count
  end
  ##current player
  def current_player
  count = turn_count
    count.odd? ? "O" : "X"
  end


  #move
  def move(index, current_player)
    @board[index] = current_player
  end


  #position_taken

  def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
  end

  #valid move
  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end
  #turn

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
     turn
    end
  end





  # won
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] &&
      @board[win_combo[1]] == @board[win_combo[2]] &&
      position_taken?(win_combo[0])
    end
  end


  #full
  def full?
  @board.none?{|value| value == " " }

  end


  #draw
  def draw?
     !won? && full?
  end


  #over
  def over?
  won? || draw?
  end

  #winner
  def winner
    if winning_combo = won?
      @board[winning_combo.first]

    else
      nil
    end
  end


  #play
  def play
     while !over?
       turn
      end
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
  end
end
