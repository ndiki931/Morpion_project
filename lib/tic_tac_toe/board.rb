module TicTacToe
  class Board
    attr_reader :grid

    #set up the grid and filled up it with an 9 empty cell 
    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
    end

    def formatted_grid
      grid.each do |row|
        puts row.map { |cell| cell.value.empty? ? " ○ " : cell.value }.join("║")
      end
    end

    #this will update the value of a Cell object
		def set_cell(x, y, value)
  		get_cell(x, y).value = value
		end

		# this will show if the game is ended with victory, ongoing game or equality score
		def game_over
  		return :winner if winner?
  		return :draw if draw?
  		false
		end

		#to ask a board object for the value at a given (x,y)
    def get_cell(x, y)
  		grid[y][x]
		end

		## Pour déterminer un gagnant, on cherche à savoir si il y a 3 cases consécutives non vides avec le même symbole
		def winner?
  		winning_positions.each do |winning_position|
    	next if winning_position_values(winning_position).all_empty?
    	return true if winning_position_values(winning_position).all_same?
  		end
  		false
		end

		def draw?
  		grid.flatten.map { |cell| cell.value }.none_empty? #convert in array and do the none empty check
		end

		def winning_positions
  		grid + # rows
  		grid.transpose + # columns
  		diagonals # two diagonals
		end
 
		def diagonals
  		[
    		[get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
    		[get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
  		]
		end

	
 
		def winning_position_values(winning_position)
 	 		winning_position.map { |cell| cell.value }
		end

 
    private
 
    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end

    
  end
end


