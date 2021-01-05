class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[0,4,8],[2,4,6],[2,5,8]]
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
    index = input.to_i - 1
    #passes user input to choose the space of the array **remember - spaces 1-9, arrays start @0**
  end

  def move(input,player = "X")
    #takes in user's converted input and passes player token into the corresponding element of array
    @board[input] = player
  end

  def position_taken?(index)
    #returns true/false based on if the @board[index] is taken--> if it's not "X" or "O" then it's not taken.
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    #return true if BOTH position taken are false and the move is possible (1-9)
    index.to_i.between?(0,8) && !position_taken?(index.to_i)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts 'Please enter 1-9:'
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] && @board[combo[1]] != " "
      end
    end

    def full?
      @board.all?{|space| space != " " }
    end

    def draw?
      full? && !won?
    end

    def over?
      won? || draw?
    end

    def winner
      if !won?
        nil
      else
        @board[won?[2]]
      end
    end

    def play
      turn until over?
      puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end

end
