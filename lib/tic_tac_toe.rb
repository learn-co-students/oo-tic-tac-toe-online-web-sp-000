class TicTacToe

  def initialize
    @board = Array.new(9) {" "}
    #@board = ["X","","","","","","","",""]
  end

  WIN_COMBINATIONS = [[0,1,2],
  [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end





  def position_taken?(index)
    if @board[index].include?("X") || @board[index].include?("O")
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    # !(@board[index] == nil || position_taken?(index))
     index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|x| x == "X" || x == "O"}
  end
#this might be broken
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index,token = "X")
    @board[index] = token
  end

  def turn
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      puts "invalid"
      turn
    end
  end

  def won?
    winner = nil
    WIN_COMBINATIONS.each do |combo|
      combo1 = combo[0]
      combo2 = combo[1]
      combo3 = combo[2]
      board1 = @board[combo1]
      board2 = @board[combo2]
      board3 = @board[combo3]
      if ((board1 == board2) && (board1 == board3)) && (board1.include?("X") || board1.include?("O"))
        winner = combo
      end
    end
    winner
  end

  def full?
    !(@board.include?(" ")||@board.include?(""))
  end

  def draw?
    if self.full? && !self.won?
      return true
    else
      return  false
    end
  end

  def over?
    self.full? || self.won?
  end

  def winner
    if self.won?
      combo = self.won?[1]
      @board[combo]
    else
      nil
    end
  end

  def play
    until self.over? || self.draw?
      turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end

end

#this = TicTacToe.new
#this.play
