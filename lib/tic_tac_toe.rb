class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

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

  def move(index, player_token = "X")
    @board[index] = player_token
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
   @board.each do |element|
     if element == "X" || element == "O"
       counter += 1
     end
   end
   counter
  end

  def current_player
    turn_count%2 == 0 ? "X" : "O"
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
    WIN_COMBINATIONS.find do |combo_element|
     @board[combo_element[0]] == @board[combo_element[1]] &&
     @board[combo_element[1]] == @board[combo_element[2]] &&
     position_taken?(combo_element[0])
   end
  end

  def full?
    @board.all? do |letter|
      letter == "X" || letter == "O"
    end
  end

  def draw?
     if full? && !won?
       true
     end
  end


  def over?
    if full? || draw? || won?
      true
    end
  end


  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  def play
    turn until over?

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
    #puts winner ? "Congrats #{winner}!" : "Cat's Game!"
  end


end
