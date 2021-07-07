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
    [6,4,2]
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

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0;
    @board.each do |token|
      if token == "X" || token == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      position_1 = @board[win_combo[0]]
      position_2 = @board[win_combo[1]]
      position_3 = @board[win_combo[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && 
        position_3 == "O"
        return win_combo 
      end
    end
    return false
  end

  def full?
    @board.all? {|i| i != " "}
  end

  def draw?
    if !won? && full?
      return true
    end    
  end

  def over?
    if won? || draw? || full?
      return true
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    counter = 0
    until over?
      turn
      counter += 1
    end
    if won? 
      winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end
end

end