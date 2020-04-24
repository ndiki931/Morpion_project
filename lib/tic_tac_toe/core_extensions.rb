class Array
  def all_empty?
    self.all? { |element| element.to_s.empty? }
  end

  def all_same?
  	self.all? { |element| element == self[0] }
	end

	def any_empty?
  	self.any? { |element| element.to_s.empty? }
	end

	def none_empty?
  	!any_empty?
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

	## Pour déterminer un gagnant, on cherche à savoir si il y a 3 cases consécutives non vides avec le même symbole
	def winner?
  	winning_positions.each do |winning_position|
    next if winning_position_values(winning_position).all_empty?
    return true if winning_position_values(winning_position).all_same?
  	end
  	false
	end
 
	def winning_position_values(winning_position)
 	 winning_position.map { |cell| cell.value }
	end



end

