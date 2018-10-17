class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]
    
  def initialize 
    @board = Array.new(9," ")
  end 

  def display_board
    board = @board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
    
  end 
  
  def input_to_index(move)
    index = move.to_i - 1
    index
  end 
  
  def move(index, current_player)
    @board[index] = current_player
  end
    
  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end
    
 def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      puts 'this is a valid move'
      return true
    else
      return false
    end
  end

  def turn_count
    counter = 0 
    @board.each do |spot| 
      if spot == "X" || spot == "O"
        counter += 1 
      end 
    end 
    return counter 
  end 
  
  def current_player 
    if turn_count % 2 == 0 
      current_player = "X"
    else 
      current_player = "O"
    end 
    return current_player
  end 
  
  
  def turn
    puts "Please enter 1-9:"
      user_input = gets.strip
    
    #input to index
    index = input_to_index(user_input)
    token = current_player
    
    #check for validation
    if valid_move?(index)
      puts 'valid move'
      move(index, token)
    else
      puts 'try again'
      turn
    end
    display_board
  end
  
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      pos1 = win_combo[0]
      pos2 = win_combo[1]
      pos3 = win_combo[2]
  
      position_1 = @board[pos1]
      position_2 = @board[pos2]
      position_3 = @board[pos3]
  
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    end 
    return false
  end
  
  def full? 
    if @board.include?(' ') || @board.include?('')
      return false 
    else 
      return true 
    end 
  end 
  
  
  def draw? 
    if !won? && full?
      return true 
    end 
  end 
  
  def over? 
    if won? || draw? || full? 
      return true 
    else 
      return false 
    end 
  end 
  
  def check_win_combination?(player, win_combo)
      win_combo.all? do |position|
      @board[position] == player
    end
  end
  
  def winner 
    if !won? 
      return nil 
    else WIN_COMBINATIONS.each do |win_combo| 
      if check_win_combination?('X', win_combo)
        return 'X'
      elsif check_win_combination?('O', win_combo)
        return 'O'
      end 
    end
    end
  end 
   
  def play
    until over? == true || won? != false
    puts 'turn'
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
      return nil
    end
  end
  

end #end of the class 