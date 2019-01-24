class Datac_toe
	attr_accessor :hash_pl1, :hash_pl2, :busy_cells
	
	def initialize
		@hash_pl1 = { a1: false, a2: false, a3: false, b1: false, b2: false, b3: false, c1: false, c2: false, c3: false }
		@hash_pl2 = { a1: false, a2: false, a3: false, b1: false, b2: false, b3: false, c1: false, c2: false, c3: false }
		@busy_cells = { a1: false, a2: false, a3: false, b1: false, b2: false, b3: false, c1: false, c2: false, c3: false }
	end
	
end
