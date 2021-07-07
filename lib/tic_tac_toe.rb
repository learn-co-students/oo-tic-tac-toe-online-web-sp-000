class TicTacToe
  attr_accessor :board

  def initialize(board = nil)
    @board = board || Array.new(9, " ")

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

  def input_to_index(user_input)

    user_input.to_i - 1

  end

  def move(index, token)
  @board[index] = token

  end

  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
  index.between?(0, 8) && !(position_taken?(index))

  end

  def turn_count
  a = 0
  @board.each do |spaces|
    if spaces == "X" || spaces == "O"
      a += 1
    end
  end
  a
end

        def current_player
        turn_count % 2 == 0? "X" : "O"
        end

        def turn
        puts "Please enter 1-9:"


        user_input = gets.strip

        index = input_to_index(user_input)
        token = current_player


        if valid_move?(index)
        puts 'valid move'
        move(index, token)
        display_board
        else
        puts 'try again'
        turn
        end
        :display_board
        end



        def won?
          # winner = nil
          WIN_COMBINATIONS.detect do |combo|
            if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
              return combo
            elsif
              (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
              return combo
            end
            false
          end
        end

        def full?
   @board.all? {|i| i == "X" || i == "O"}
        end

        def draw?

            if !won? && full?
                return true
              else
                    false
                  end

        end



        def over?
              if draw? || won? || full?
                  return true
                end
        end

        def winner
            if won?
                return @board[won?[0]]
              end
        end



          def play
              until over?
                      turn
                    end
                if won?
                         winner == "X" || winner == "O"
                       puts "Congratulations #{winner}!"
              elsif draw?
              puts "Cat's Game!"
               end
             end


end



# TicTacToe::Game.new

# game = TicTacToe.new
# game.play
