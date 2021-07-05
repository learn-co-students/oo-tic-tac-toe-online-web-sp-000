class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,4,8], #diag 1
  [2,4,6], #diag 2
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  ]

  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(user_input)
     index = user_input.to_i - 1
   end

   def move(spot, player = "X")
     @board[spot.to_i] = player
   end

   def position_taken?(index)
     if @board[index] == "X" || @board[index]  == "O"
       return true
     else  @board[index] == false
     end
   end

   def valid_move?(index)
     index.to_i
     if !position_taken?(index) && index.between?(0,8)
       return true
     else return false
     end
   end

   def turn_count
     counter = 0
     @board.each do |spot|
       if spot == "X" || spot =="O"
         counter += 1
       end
    end
    return counter
  end

  def current_player
    counter = turn_count
    if counter % 2 == 0
      return "X"
    else return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      player =  current_player
      move(index, player)
      display_board
    else
      return turn
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

        if ((position_1 == "X" && position_2 == "X" && position_3 == "X")  || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
        return win_combination
        else
        end
      end
      return false
    end

  def full?
    if @board.all? {|index| index == "X" || index == "O"}
      return true
    else return false
    end
  end

  def draw?
    if full? && !won?
      return true
    else return false
    end
  end

  def over?
    if full? || draw? || won?
      return true
    else return false
    end
  end

  def winner
    index = []
    index = won?
      if index == false
        return nil
      else
        if @board[index[0]] == "X"
          return "X"
      else return "O"
      end
    end
  end

  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
