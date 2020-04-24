# spec/cell_spec.rb

#Start by testing that a Cell object that is instantiated with no arguments will have a default value equal to the empty string.
#Also add a test to the #initialize context block to make sure Cell can be initialized with “X”:

module TicTacToe
  describe Cell do
 
    context "#initialize" do
      it "is initialized with a value of '' by default" do
        cell = Cell.new
        expect(cell.value).to eq ''
      end
      it "can be initialized with a value of 'X'" do
  		cell = Cell.new("X")
  		expect(cell.value).to eq "X"
			end
    end
 
  end
end

