class TicTacToe
	WIN_COMBINATIONS = [
		[0, 1, 2],
		[3, 4, 5],
		[6, 7, 8],
		[0, 3, 6],
		[1, 4, 7],
		[2, 5, 8],
		[0, 4, 8],
		[2, 4, 6]
	]

	def initialize
		@board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end

	def display_board
		puts
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "-----------"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "-----------"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
		puts
	end

	def input_to_index(input)
		input.to_i - 1
	end

	def move(index, token = "X")
		@board[index] = token
	end

	def position_taken?(index)
		@board[index] != " "
	end

	def valid_move?(index)
		index.between?(0, 8) && !position_taken?(index)
	end

	def turn_count
		@board.count{|position| position != " "}
	end

	def current_player
		turn_count.odd? ? "O" : "X"
	end

	def turn
		print "Please enter 1-9: "
		index = input_to_index(gets.strip)

		if valid_move?(index)
			move(index, current_player)
			display_board
		else
			turn
		end
	end

	def won?
		WIN_COMBINATIONS.find{|combi| position_taken?(combi[0]) && @board[combi[0]] == @board[combi[1]] && @board[combi[0]] == @board[combi[2]]}
	end

	def full?
		@board.none?(" ")
	end

	def draw?
		full? && !won?
	end

	def over?
		won? || draw?
	end

	def winner
		won? && @board[won?[0]]
	end

	def play
		turn until over?
		puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
	end
end
