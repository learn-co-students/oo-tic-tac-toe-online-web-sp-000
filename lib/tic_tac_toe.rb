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

    attr_reader :board

    def initialize
      @board = Array.new(9," ")
    end

    def display_board
      puts " #{board[0]} | #{board[1]} | #{board[2]} "
      puts "-----------"
      puts " #{board[3]} | #{board[4]} | #{board[5]} "
      puts "-----------"
      puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(user_input)
      user_input.to_i-1
    end

    def move(index, token)
      board[index] = token
    end

    def position_taken?(index)
      if (board[index] == "X") || (board[index] == "O")
        true
      elsif board[index] == " " || "" || nil
        false
    end
  end

  def valid_move?(index)
      index.to_i-1
    if index.between?(0,8) && !position_taken?(index)
      true
    else
      false
    end
  end

  def turn_count
    9 - board.count(" ")
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
    index = gets.strip
    index = input_to_index(index)

    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      board[win_combo[0] ] == board[win_combo[1] ] &&
      board[win_combo[1] ] == board[win_combo[2] ] &&
      position_taken?(win_combo[0])
      end
    end

  def full?
      board.none? do |input|
      input == " "
    end
  end

  def draw?
    if won? || !full?
      false
    else
      true
    end
  end

  def over?
    if won? || full? || draw?
      true
    else
      false
    end
  end

  def winner
    if won?
      board[won?[0]]
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
