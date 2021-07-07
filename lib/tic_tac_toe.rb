class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2], 
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [6,4,2],
        [0,4,8]  
      ]


    def initialize(board=nil)
        @board = Array.new(9," ")
    end

    def board
        @board
      end


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

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
        move(index,current_player)
      display_board
    else
      turn
    end
  end


    def turn_count
    counter = 0
    @board.each do |token|
    if token == "X" || token == "O"
      counter += 1
      ##binding.pry
    end
end
counter
end


def current_player
    if turn_count % 2 == 0
     "X"
      else 
      "O" 
    end
 end

 def won?
    WIN_COMBINATIONS.detect do |win_combination|

  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  
  if @board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X"
    return win_combination # return the win_combination indexes that won.

  elsif @board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O"
    win_combination # return the win_combination indexes that won.
  else false
end
end
end


def full?
     @board.all?{|var| var!=" "}
  end

  def draw?
    full? && !won?
  end



  def over?
    if draw? || won? 
       true
    elsif full?
       false
    end
  end



  def winner
    if !won?
       nil
      else
         win_combination = won?
  
       index1=win_combination[0]
       index2=win_combination[1]
       index3=win_combination[2]

       if @board[index1]=="X"&&@board[index2]=="X"&&@board[index1]=="X"
          "X"
       elsif  @board[index1]=="O"&&@board[index2]=="O"&&@board[index1]=="O"
              "O"
        end
      end
  end


  def play
    until over?
      turn 
    end
    if won?
      winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat\'s Game!"
    end
  end
end

