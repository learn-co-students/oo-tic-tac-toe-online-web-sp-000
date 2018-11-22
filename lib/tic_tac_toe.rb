class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    @index = user_input.to_i - 1
  end

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?(index)
    !(@board[index] == nil || @board[index] == " ")
  end

  def valid_move?(index)
    position_taken?(index) == false && index.between?(0, 8) == true
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    @player = turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    while valid_move?(index) == false
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
    end
    player = current_player
    move(index, player)
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if position_taken?(win_combination[0]) == true
        if @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[0]] == @board[win_combination[2]]
          return win_combination
        end
      end
    end
    false
  end

  def full?
    @board.all?{|position| position == "X" || position == "O"}
  end

  def draw?
    won? == false && full? == true
  end

  def over?
    !won? == false || draw? == true
  end

  def winner
    if win = won?
      return @board[win.first]
    end
  end

  def play
    while over? == false do
      turn
    end
    if draw? == true
      puts "Cat's Game!"
    elsif !won? == false
      winner_player = winner
      puts "Congratulations #{winner_player}!"
    end
  end

end
