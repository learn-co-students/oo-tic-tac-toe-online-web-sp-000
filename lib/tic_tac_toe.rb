class TicTacToe
    WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

    def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end
   
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
   
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end
   
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(index)
        index.to_i - 1
    end
    def move(place, player)
        @board[place] = player
    end
    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            true
        else
            false
        end
    end
    def valid_move?(index)
        if !position_taken?(index) && index.between?(0,8)
            true
        else
            false
        end
    end
    def turn
        puts "Please enter 1-9:"
        index = gets.strip.to_i
        index = input_to_index(index)
        if valid_move?(index) 

            move(index, current_player)
            display_board
        else
            turn
        end
    end
    def won?
        WIN_COMBINATIONS.each do |combination|
            win_index_1 = combination[0]
            win_index_2 = combination[1]
            win_index_3 = combination[2]
        
            position_1 = @board[win_index_1]
            position_2 = @board[win_index_2]
            position_3 = @board[win_index_3]
            #binding.pry
            if position_1 == "X" && position_2 == "X" && position_3 == "X"
              return combination
        
            elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
              return combination
            
              
            end
            
          end
          return false
    end
    def full?
        if @board.include?(" ")
            false
        else
            true
        end
    end
    def draw?
        if !won? && full?
            true
        else
            false
        end
    end
    def over?
        if won? || draw?
            true
        else
            false
        end
    end
    def winner
        if won?.kind_of?(Array)
            @board[won?[0]]
        else
            nil
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
        else
    
        end
        
    end
    
  end