class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
  
  attr_accessor :board
  
  def initialize
    @board = Array.new(9, " ")
    @who_won = nil
  end
  
  def display_board
    puts <<~HEREDOC
     #{board[0]} | #{board[1]} | #{board[2]} 
    -----------
     #{board[3]} | #{board[4]} | #{board[5]} 
    -----------
     #{board[6]} | #{board[7]} | #{board[8]} 
    HEREDOC
  end
    
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, turn)
    @board[index] = turn
  end
  
  def position_taken?(index)
    (board[index] == 'X' or board[index] == 'O') ? true : false
  end
  
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      return true
    else
      return false
    end
  end
  
  def turn_count
    board.count { |b| b != " " }
  end
  
  def current_player
    turn_count.even? ? 'X' : 'O'
  end
  
  def turn
    puts 'Please enter 1-9:'
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts 'Invalid move'
      turn
    end
  end
  
  def won?
    x_arr = board.each_index.select { |x| board[x] == 'X' }
    o_arr = board.each_index.select { |o| board[o] == 'O' }
    
    combos = WIN_COMBINATIONS
    combos.map do |combo|
      if (combo & x_arr).length == 3
        @who_won = 'X'
        return combo
      elsif (combo & o_arr).length == 3
        @who_won = 'O'
        return combo
      end
    end
    false
  end
  
  def full?
    board.all? { |b| b == 'X' or b == 'O' }
  end
  
  def draw?
    !won? && full? ? true : false
  end
  
  def over?
    won? or draw? ? true : false
  end
  
  def winner
    won?
    return @who_won
  end
  
  def play
    until over?
      turn
    end
    
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end