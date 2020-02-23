
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
attr_accessor :board
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
  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index =index.to_i
     index.to_i.between?(0,8) && !position_taken?(index)
   end

   def turn
         puts "Please enter 1-9:"
         user_input = gets.strip
         index = input_to_index(user_input)
         while valid_move?(index) == false do
           puts "Please enter 1-9:"
           user_input = gets.strip
           index = input_to_index(user_input)
           valid_move?(index)
       end
       move(index, current_player)
       display_board
     end

    def turn_count
      counter = 0
      @board.count {|token| token == "X" || token == "O"}
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def won?
       WIN_COMBINATIONS.each do |win_comb|
          if [@board[win_comb[0]], @board[win_comb[1]], @board[win_comb[2]]].all? {|i| i == @board[win_comb[0]]} && position_taken?(win_comb[0] )
           return win_comb
         end
       end
       false
    end

    def full?
      !(@board.any? {|i| [" ",""].include? i})
    end

    def draw?
      full? && !won?
    end

    def over?
      if draw? || won? || full?
        true
      end
    end

    def winner
      if won?
        return @board[won?[0]]
      end
    end

  def play
    until over? do
      turn
    end
    if draw?
        puts "Cat's Game!"
    else won?
      puts "Congratulations #{winner}!"
    end
  end
end
