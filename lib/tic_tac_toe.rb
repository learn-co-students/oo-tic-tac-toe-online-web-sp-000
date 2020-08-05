class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " " ]
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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
    return index
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if (@board[index] == "X" || @board[index] == "O")
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if (position_taken?(index))
      return false
    else
      if (index > 8 || index < 0)
        return false
      else
        return true
      end
    end
  end

  def turn
    puts "Pick enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if (self.valid_move?(index))
      self.move(index, self.current_player)
      self.display_board
    else
      puts "Invalid move!"
      self.turn
    end
  end

  def turn_count
    turns = 0
    @board.each do | space |
      if (space == "X" || space == "O")
        turns += 1
      end
    end
    return turns
  end

   def current_player
     turns = self.turn_count
     if (turns % 2 == 0)
       return "X"
     else
       return "O"
     end
   end

   def won?
     WIN_COMBINATIONS.each do | testingArray |
      if (position_taken?(testingArray[0]) && @board[testingArray[0]] == @board[testingArray[1]] && @board[testingArray[1]] == @board[testingArray[2]])
        return testingArray
      end
    end
    return nil
  end



  def full?
     @board.each do | space |
       if (space == " ")
         return false
       end
     end
     return true
   end

   def draw?
     if (self.full?)
       if (self.won?)
         return false
       else
         return true
       end
     else
       return false
     end
   end

   def over?
     if ((self.won? != nil) || self.draw?)
       return true
     else
       return false
     end
   end

   def winner
     if (self.won?)
       winningArray = self.won?
       winner = @board[winningArray[0]]
       return winner
     else
       return nil
     end
   end

   def play
    until (self.over?)
      self.turn
    end
    if (self.won? != nil)
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end

 end
