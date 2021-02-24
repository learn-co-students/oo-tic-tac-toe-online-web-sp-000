class TicTacToe
  @board = []
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
 
]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
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

  def move(index, player)
    @board[index] = player
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    counter = 0;
    
    @board.each {|spot|
      if spot == "X" || spot == "O"
        counter += 1
      end
    }
    return counter
  end
  
  def current_player
    turn = turn_count
    
    if turn % 2 == 0 
      return "X"
    else
      return "O"
    end
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
   # Check if board is empty. Skip all if it is
   is_empty = @board.all? do |cell|
    if cell == " "
        true
      else
        false
      end
    end 
    
    if is_empty == false 
      
      # Iterate through winning combos  
      WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
      
        if (position_taken?(win_index_1) && position_taken?(win_index_2) && position_taken?(win_index_3))
         
          positions = [@board[win_index_1], @board[win_index_2], @board[win_index_3]]
          
          all_x = positions.all? do |position|
            if position == "X"
              true
            else
              false
            end
          end 
          
          all_o = positions.all? do |position|
            if position == "O"
              true
            else
              false
            end
          end 
          
          # return winning combo if all the pieces match
          if all_x || all_o
            return win_combo
          end
        end
      end
      
      # If no winning combo, return false (for draw)
      is_draw = @board.none? do |cell|
        if cell == " "
            true
          else
            false
          end
        end
        
      if is_draw
        return false
      end
    else
      return false
    end
  end
  
  def full?
    is_full = @board.none? do |cell|
    
    if cell == " "
        true
      else
        false
      end
    end 
    
    return is_full
  end

  def draw?
   is_full = full?
   is_won = won?
   
   if is_full == true && is_won == false
     return true
   else
     return false
   end
  end
  
  def over?
   is_full = full?
   is_won = won?
   is_draw = draw?
   
   if is_full || is_won || is_draw
     return true
   else
     return false
   end
  end
  
  def winner
   if (over? == false)
     return nil
   else
     win_combo = won?
     
     all_x = win_combo.all? do |cell|
          if @board[cell] == "X"
            true
          else
            false
          end
      end 
      
      if all_x
        return "X"
      else
        return "O"
      end
   end
  end
  
  def play
  
    until over?
      turn
    end
    
    if draw?
      puts "Cat's Game!"
    elsif won?
        puts "Congratulations #{winner}!"
  end

end
  
end