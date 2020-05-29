class TicTacToe
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  def initialize
    @board=[" "," "," "," "," "," "," "," "," "]
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(number)
    index=number.to_i-1
  end

  def move(index,token="X")
    @board[index]=token
  end

  def position_taken?(index)
    @board[index]=="X"||@board[index]=="O"
  end

  def valid_move?(index)
    !position_taken?(index)&&index<9&&index>=0
  end

  def turn_count
    @board.count {|x| x!=" "}
  end

  def current_player
    turn_count.even?? "X" : "O"
  end

  def turn
    index=input_to_index(gets)
    if valid_move?(index)
      @board[index]=current_player
      display_board
    else
      turn
    end
  end
#WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  def won?
    WIN_COMBINATIONS.find do |x|
      win_index_1=x[0]
      win_index_2=x[1]
      win_index_3=x[2]
      @board[win_index_1]==@board[win_index_2]&& @board[win_index_2]==@board[win_index_3]&&@board[win_index_1]!=" "
    end
end

  def full?
    @board.all? {|x| x!=" "}
  end

  def draw?
    full?&&!won?
  end

  def over?
    draw?||won?
  end

  def winner
    won?? @board[won?[0]] : nil

  end

  def play
    while !over?
      turn
    end

    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end



  end
