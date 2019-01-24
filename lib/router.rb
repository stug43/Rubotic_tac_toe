class Router
	attr_accessor :view, :game
	require 'view'
	require 'game'

	def initialize
		@view = View.new
	end

	def choice
		loop do	
			choice = @view.index
			case choice
				when 1
					@game = Game.new
					@game.perform
				when 2
					@view.rules
				when 3
					exit
			end
		end
	end

	def perform
		self.choice
	end

end	
