class TicTacToe 
  
  def initialize
  @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
   
  def input_to_index(input)
  index = input.to_i - 1 
  end 
  
  def move(index,token = "X")
  @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] != " "
    true 
    else
    false
    end
  end
  
  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0,8)
    true
    else
    false
    end
  end

  def turn_count
    counter = 0 
    @board.each do |value|
      if value != " "
      counter += 1
      end
    end
  return counter
  end
  
  def current_player
    if turn_count.even?
    return "X"
    else turn_count.odd?
    return "O"
    end
  end 
  
  def turn
      puts "Please enter 1-9"
      input = gets.strip
      index = input_to_index(input)
      token = current_player
  
      if valid_move?(index)
          move(index, token)
          display_board
      else turn
      end
  end  
    
    def won?
  
    WIN_COMBINATIONS.each do |win_combination|
    
    win_index_1 = win_combination[0] 
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2] 
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combination
        else if position_1 == "O" && position_2 == "O" && position_3 == "O"
         return win_combination
        else
        false
        end
        end
        end
        false
    end

    def full?
      @board.all? do |value|
      value == "X" || value == "O"
      end
    end


    def draw?
      if full? == true && won? == false
        return true 
      end
    end

    def over?
      if won? != false || draw? == true || full? == true
      true
      else
      false
      end
    end
    
    def winner
        if won?
      won?.all? do |value|
        if @board[value] == "X"
                return "X"
                
        else if @board[value] == "O"
                return "O"
        end
        end
      end
      end 
    return nil
    end  
    
  def play
      until over?
      turn
      end
      if won?
      puts "Congratulations #{winner}!"
    
      else if draw?
      puts "Cat's Game!"
      end
      end
  end 
  
end