class TicTacToe
  
  attr_accessor :board
  
  # Define Winning Combinations Constant
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
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    return input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
     !(@board[index] == " " || board[index].nil?)
  end
  
  def valid_move?(index)
    if index.between?(0,8)
      return !(self.position_taken?(index))
    else
      nil
    end
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if self.valid_move?(index)
      self.move(index,self.current_player)
    else
      self.turn
    end
    self.display_board
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      result = win_combination
      win_index1 = win_combination[0]
      win_index2 = win_combination[1]
      win_index3 = win_combination[2]
      position_1 = @board[win_index1]
      position_2 = @board[win_index2]
      position_3 = @board[win_index3]
      if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index1)
        return result
      end
    end
    nil
  end
  
  def full?
    i = 0
    while i < 9
      if self.position_taken?(i)
      else
        return nil
      end
    i += 1
    end
    self.position_taken?(0)
  end
  
  def draw?
    if self.won?
      return nil
    elsif self.full?
      return true
    else
      return nil
    end
  end
  
  def over?
    if self.won? || self.draw? || self.full?
      return true
    else
      return nil
    end
  end

  def winner
    if self.won? 
      WIN_COMBINATIONS.each do |win_combination|
        win_index1 = win_combination[0]
        win_index2 = win_combination[1]
        win_index3 = win_combination[2]
        position_1 = @board[win_index1]
        position_2 = @board[win_index2]
        position_3 = @board[win_index3]
      if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index1)
        return position_1
      end
    end
  end
    
  end
  
  def play
    until self.over?
      self.turn
    end
  
    if self.won?
      puts "Congratulations " + self.winner + "!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end

end