class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input = input.to_i
    input = input - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(input)
    if @board[input] == "X" || @board[input] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(input)
    if position_taken?(input) || input > 8 || input < 0
      return false
    else
      return true
    end
  end

  def turn_count
    @count = 0

    @board.each do |space|
      if space == "X" || space == "O"
        @count += 1
      end
    end

    return @count

  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end

  end

  def turn
    @input = input_to_index(gets.strip)

    if valid_move?(@input)
      @board[@input] = current_player
      display_board
    else
      puts "I'm sorry, that input was invalid. Please input another number:"
      turn
    end
  end

  def full?
    if turn_count == 9
      return true
    else
      return false
    end

  end

  def winningCombo(player)
    playerWon = false
    combo = nil


    WIN_COMBINATIONS.each do |array|
      playerWon = array.all? do |element|
        @board[element] == player
      end
      if playerWon
        combo = array
        return combo
      end
    end

    return combo
  end

  def won?
    if winningCombo("X") == nil && winningCombo("O") == nil
      return false
    elsif winningCombo("X") == nil
      return winningCombo("O")
    elsif winningCombo("O") == nil
      return winningCombo("X")
    end

  end

  def draw?
    if won?
      return false
    elsif full?
      return true
    else
      return false
    end

  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end

  end

  def winner
    if won?
      if winningCombo("X") == nil
        return @board[winningCombo("O")[0]]
      elsif winningCombo("O") == nil
        return @board[winningCombo("X")[0]]
      end

    else
      return nil
    end


  end

  def play
    loop do

      if !over?
        puts "Please input a number from 1 to 10:"
        turn
      else
        if draw?
          puts "Cat's Game!"
        elsif won?
          puts "Congratulations #{winner}!"
        end
        break
      end
    end

  end

end
