class TicTacToe
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",] 
    end
    
    WIN_COMBINATIONS = [
        [0, 1, 2], #top row
        [3, 4, 5], #mid row
        [6, 7, 8], #bot row 
        [0, 3, 6], #1st col
        [1, 4, 7], #2nd col
        [2, 5, 8], #3rd col
        [0, 4, 8], #left diag
        [2, 4, 6]  #right diag
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------\n"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------\n"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index(input)
        position_index = input.to_i - 1
    end
    def move(index, player = "X")
        @board[index] = player
      end
      
    def position_taken?(location)
        @board[location] != " " && @board[location] != ""
    end
      
    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end 
      
    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
    end

    def turn_count
      counter = 0 
      @board.each do |move|
        if move =="X" || move =="O"
          counter +=1 
        end
    end
       counter
    end

    def current_player
        if turn_count.to_i.even?
          "X"
        else
          "O"
        end
    end

    def won? 
       WIN_COMBINATIONS.detect do |array|
         array.all? {|index| @board[index] == "X"} || array.all? {|index| @board[index] == "O"}
       end
     end
     
    def full?  
       @board.all? {|string| (string == "X" ||string == "O")} 
    end
     
    def draw? 
       if full? && !won?
         true
       end
    end

    def over? 
       if won? || draw? || full?
         true
       end
    end
    def winner 
      if won?
        winner = won?
       @board[winner[0]]
      else
        nil
      end
    end

    def play
       until over?
          turn
       end
       if won?
          puts "Congratulations #{winner}!"
       elsif draw?
          puts "Cat's Game!"
       end
    end
end
