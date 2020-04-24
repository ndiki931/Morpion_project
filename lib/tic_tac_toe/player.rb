# This class Player hold the palyer's name and if he/she will play "X" or "O"
# lib/tic_tac_toe/player.rb
module TicTacToe
  class Player
    attr_reader :color, :name
    def initialize(input)
      @color = input.fetch(:color)
      @name = input.fetch(:name)
    end
  end
end