class TicTacToe
	attr_accessor :board

	WIN_COMBINATIONS = [
	  [0,1,2], # Top row
	  [3,4,5], # Middle row
	  [6,7,8],

	  [0,3,6],
	  [1,4,7],
	  [2,5,8],

	  [0,4,8],
	  [2,4,6]
	]

	def initialize
		@board = Array.new(9, ' ')
	end

	def display_board
	  square_size = Math.sqrt(@board.size)

	  if !(square_size % 1 > 0)
	    n_lines = @board.size / square_size
	    row_n = 0
	    rows = @board.each_slice(square_size).to_a

	    while row_n < square_size
	      space = 0
	      row = rows[row_n]

	      write_line(row)
	      if row_n < (square_size - 1)
	        write_hrule(square_size)
	      end

	      row_n += 1
	    end
	  else
	    puts '!! the board given is not squared !!'
	  end
	end

	def write_line(array)
	  place_i = 0
	  while place_i < array.size
	    symbol = array[place_i]
	    if !(symbol == 'X' || symbol == 'O' || symbol == ' ')
	      symbol = ' '
	    end
	    print " #{symbol} "
	    if place_i < (array.size - 1) 
	      print '|'
	    end
	    place_i += 1
	  end
	  puts ''
	end

	def write_hrule(spaces)
	  n = (spaces * 4) - 1
	  i = 0
	  while i < n
	    print '-'
	    i += 1
	  end
	  puts ''
	end

	def input_to_index(user_input)
	  user_input.to_i - 1
	end

	def move(index, current_player)
	  @board[index] = current_player
	end

	def position_taken?(location)
	  @board[location] != " "
	end

	def valid_move?(index)
	  (!position_taken?(index)) && index.between?(0, @board.size - 1)
	end

	def turn_count
	  counter = 0
	  @board.each do |place|
	    if place == 'X' || place == 'O'
	      counter += 1 
	    end
	  end
	  counter
	end

	def current_player
	  turn_count.even? ? 'X' : 'O' 
	end

	def turn
	  puts 'Please enter 1-9:'
	  index = input_to_index(gets.strip)
	  if valid_move?(index)
	    move(index, current_player)
	    display_board
	  else 
	    turn
	  end
	end

	def won?
		WIN_COMBINATIONS.find do |win|
			win.all? {|position| @board[position] == 'X'} || win.all? {|position| @board[position]  == 'O'}
		end
	end

	def full?
		@board.none? {|place| place == ' ' || place == '' || place == nil}
	end

	def draw?
		won? || !full? ? false : true
	end

	def over?
		won? || full? ? true : false
	end

	def winner
		won? ? @board[won?[0]] : nil
	end

	def play
  while !over? && !draw?
    turn
  end

  if winner
	    puts "Congratulations #{winner}!"
	  else
	    puts "Cat's Game!"
	  end
	end


end
