class TicTacToe
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
  
  def input_to_index(input)
    index = input.to_i - 1
  end


  #move
 
  def move(index,marker)
    @board[index]=marker
  end
 
 
  #position_taken?
 
  def position_taken?(index)
   if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end
 
 
  #valid_move?
 
  def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    true
  else
    false
   end
  end
 
 
  #turn
 
  def turn
    puts "Please enter 1-9:"
    input=gets.strip
    input=input_to_index(input)
    if valid_move?(input)== true
      move(input,current_player)
      display_board
      else
      puts "Invalid move, try again!"
      turn
    end
  end
 
  #turn_count
 
  def turn_count
    counter=0
      @board.each do |space|
      if space !=" "
        counter +=1
      end
   end
  counter
  end
 
 
  #current_player
 
  def current_player
    turns = turn_count
   if turns % 2 == 0
     return "X"
   else
     return "O"
   end
  end
 
 
  #won?
 
  def won?
     WIN_COMBINATIONS.each do |win_combination|
        if @board[win_combination[0]]==@board[win_combination[1]]&&@board[win_combination[0]]==@board[win_combination[2]]&&@board[win_combination[0]]!=" "
          return win_combination
        end
      end
      false
    end
 
 
  #full
 
  def full?
    @board.all? {|square| square == "X" || square == "O"}
  end
 
 
  #draw?
 
  def draw?
    !won? && full?
  end
 
 
  #over?
 
  def over?
    won? || draw?
  end
 
 
  #winner
 
  def winner
      who_wins = won?
      if who_wins
        @board[who_wins[0]]
      else
          nil
      end
  end


 
  #play
 
  def play
    while over? == false
      turn
    end
   
    if won?!= false
        winner
       puts "Congratulations #{winner}!"
      end
      if draw? == true
       puts "Cat's Game!"
     end
  end
end

