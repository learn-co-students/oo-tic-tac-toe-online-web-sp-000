class TicTacToe
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    lines = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts lines
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts lines
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, letter = "X")
    return @board[index] = letter.upcase
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(index) 
    if !position_taken?(index) && (0..8).cover?(index)
      return true
    else
      return nil
    end
  end

  def input_to_index(choice)
    return choice.to_i - 1
  end

  def turn_count
    @board.count {|letter| letter == "X" || letter == "O" }
  end

  def turn
    index = get_user_input      
    loop do
      if(valid_move?(index))
        move(index, current_player)
        display_board
        break
      else
        index = get_user_input
      end
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  
  def won?
    return WIN_COMBINATIONS.find {|combo| x_wins?(combo) || o_wins?(combo)} unless nil
  end

  #TRY TO USE REGEX
  def full?
   @board.all?{|element| element != " " && element != "" && element != nil }
  end

  def draw?
    if full? && !won?
      return true
    else
      return nil
    end
  end

  def over?
    return true if draw? || (won? && full?) || (won? && !full?)
  end

  def winner
   if x_wins?(won?) 
    return "X"
   elsif o_wins?(won?)
    return "O"
   else
    return won?
   end
  end

  def play
  until over?
    turn
  end
    if !draw?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
end



  private
  
  def get_user_input
    message = "Please enter 1-9:"
    puts message
    input = gets.strip.chomp
    return input_to_index(input)
  end


  #return true if all x's combination win
  def x_wins?(combo)
    if combo.nil?
      return nil
    else
      combo.all?{|index_combo| @board[index_combo.to_i] == "X"}
    end 
  end


  #return true if all o's combination win
  def o_wins?(combo)
    if combo.nil?
      return nil
    else
    combo.all?{|index_combo| @board[index_combo.to_i] == "O"}  
    end
  end

end#Tic_Tac_Toe ends here.





