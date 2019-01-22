class TicTacToe
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


  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
  
  def input_to_index(user_input)
    @index = (user_input.to_i) - 1
    return @index
  end

  def move(index, token)
    @board[index] = token
  end


  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
      elsif @board[index] == "X" || @board[index] == "O"
      return true
    end
  end


  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      return true
      else
        return false
    end
  end


  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    token = current_player
  
    if valid_move?(index)
     move(index, token)
     display_board
  
  
    elsif valid_move?(index) == false
    turn
    end
  end
  
  
  def turn_count
   counter = 0
    @board.each do |game_space|
      if game_space == "X" || game_space == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def won?
  
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
  
        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]
  
        if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 =="O" && position_3 == "O"
          return win_combination
  
        end
      end
      else
          return false
    end


  def full?
    @board.all? do |i|
      i == "X" || i == "O"
    end
  end


  def draw?
    if full? && !won?
      return true
    end
  end


  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end


  def winner
  if won? != false
    winning_board = won?
      if @board[winning_board[0]] == "X"
      return "X"
      elsif @board[winning_board[0]] == "O"
      return "O"
      end
    else
      return nil
   end
  end


  def play
    until over? == true
    turn
    turn_count
    end
    if won?
      puts "Congratulations #{winner}!"
    else 
      puts  "Cat's Game!"
    end
  end
end